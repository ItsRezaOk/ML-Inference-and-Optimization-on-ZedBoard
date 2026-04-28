----------------------------------------------------------------------------------
-- Dequantization Unit
--
-- Gregory Ling, 2024
----------------------------------------------------------------------------------

library work;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dequantization is
    generic(
        C_DATA_WIDTH : integer := 32;   -- Width of MAC accumulator input
        C_TID_WIDTH  : integer := 1;    -- AXIS TID width
        C_OUT_WIDTH  : integer := 8;    -- Output width after re-quantization
        SCALE_FRACTIONAL_BITS : integer := 32 -- q_scale is interpreted as Q(32-SCALE_FRACTIONAL_BITS).SCALE_FRACTIONAL_BITS
    );
    port(
        S_AXIS_TREADY : out std_logic;
        S_AXIS_TDATA  : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);
        S_AXIS_TLAST  : in  std_logic;
        S_AXIS_TID    : in  std_logic_vector(C_TID_WIDTH-1 downto 0);
        S_AXIS_TVALID : in  std_logic;

        relu    : in std_logic;
        q_scale : in std_logic_vector(C_DATA_WIDTH-1 downto 0);
        q_zero  : in std_logic_vector(C_OUT_WIDTH-1 downto 0);

        M_AXIS_TREADY : in  std_logic;
        M_AXIS_TDATA  : out std_logic_vector(C_OUT_WIDTH-1 downto 0);
        M_AXIS_TLAST  : out std_logic;
        M_AXIS_TID    : out std_logic_vector(C_TID_WIDTH-1 downto 0);
        M_AXIS_TVALID : out std_logic;

        clk : in std_logic;
        rst : in std_logic
    );
end dequantization;

architecture Behavioral of dequantization is

    function signed_saturate(
        value : signed;
        width : integer
    ) return signed is
        variable max_val : signed(width-1 downto 0) := (others => '1');
        variable min_val : signed(width-1 downto 0) := (others => '0');
        variable max_ext : signed(value'length-1 downto 0);
        variable min_ext : signed(value'length-1 downto 0);
        variable result  : signed(width-1 downto 0);
    begin
        max_val(width-1) := '0';
        min_val(width-1) := '1';
        max_ext := resize(max_val, value'length);
        min_ext := resize(min_val, value'length);

        if value > max_ext then
            result := max_val;
        elsif value < min_ext then
            result := min_val;
        else
            result := resize(value, width);
        end if;

        return result;
    end function;

    function fixed_point_multiply(
        a : signed;
        b : signed;
        frac_bits : integer;
        result_width : integer
    ) return signed is
        variable product : signed(a'length + b'length - 1 downto 0);
        variable shifted : signed(a'length + b'length - 1 downto 0);
    begin
        product := a * b;
        shifted := shift_right(product, frac_bits);
        return resize(shifted, result_width);
    end function;

    signal s_axis_tready_i : std_logic;
    signal m_axis_tdata_r  : std_logic_vector(C_OUT_WIDTH-1 downto 0) := (others => '0');
    signal m_axis_tlast_r  : std_logic := '0';
    signal m_axis_tid_r    : std_logic_vector(C_TID_WIDTH-1 downto 0) := (others => '0');
    signal m_axis_tvalid_r : std_logic := '0';
    
    signal input_val_signal  : signed(C_DATA_WIDTH-1 downto 0);
    signal scale_val_signal  : signed(C_DATA_WIDTH-1 downto 0);
    signal zero_val_signal   : signed(C_OUT_WIDTH-1 downto 0);
    signal scaled_val_signal : signed(C_DATA_WIDTH-1 downto 0);
    signal relu_val_signal   : signed(C_DATA_WIDTH-1 downto 0);
    signal biased_val_signal : signed(C_DATA_WIDTH-1 downto 0);
    signal quant_val_signal  : signed(C_OUT_WIDTH-1 downto 0);

begin

    S_AXIS_TREADY <= s_axis_tready_i;
    M_AXIS_TDATA  <= m_axis_tdata_r;
    M_AXIS_TLAST  <= m_axis_tlast_r;
    M_AXIS_TID    <= m_axis_tid_r;
    M_AXIS_TVALID <= m_axis_tvalid_r;
    
    

    -- Back-pressure: accept a new sample when the output register is free or the downstream consumer is ready
    s_axis_tready_i <= '1' when (m_axis_tvalid_r = '0') or (M_AXIS_TREADY = '1') else '0';

    process(clk)
        variable input_val  : signed(C_DATA_WIDTH-1 downto 0);
        variable scale_val  : signed(C_DATA_WIDTH-1 downto 0);
        variable zero_val   : signed(C_OUT_WIDTH-1 downto 0);
        variable scaled_val : signed(C_DATA_WIDTH-1 downto 0);
        variable relu_val   : signed(C_DATA_WIDTH-1 downto 0);
        variable biased_val : signed(C_DATA_WIDTH-1 downto 0);
        variable quant_val  : signed(C_OUT_WIDTH-1 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                m_axis_tvalid_r <= '0';
                m_axis_tlast_r  <= '0';
                m_axis_tid_r    <= (others => '0');
                m_axis_tdata_r  <= (others => '0');
            else
                if s_axis_tready_i = '1' then
                    if S_AXIS_TVALID = '1' then
                        input_val := signed(S_AXIS_TDATA);
                        scale_val := signed(q_scale);
                        zero_val  := signed(q_zero);

                        scaled_val := fixed_point_multiply(input_val, scale_val, SCALE_FRACTIONAL_BITS, C_DATA_WIDTH);

                        if relu = '1' and scaled_val(scaled_val'high) = '1' then
                            relu_val := (others => '0');
                        else
                            relu_val := scaled_val;
                        end if;

                        biased_val := relu_val + resize(zero_val, relu_val'length);
                        quant_val  := signed_saturate(biased_val, C_OUT_WIDTH);

                        m_axis_tdata_r  <= std_logic_vector(quant_val);
                        m_axis_tlast_r  <= S_AXIS_TLAST;
                        m_axis_tid_r    <= S_AXIS_TID;
                        m_axis_tvalid_r <= '1';
                        
                        input_val_signal <= input_val; 
                        scale_val_signal <= scale_val;
                        zero_val_signal <= zero_val;
                        scaled_val_signal <= scaled_val;
                        relu_val_signal <= relu_val;
                        biased_val_signal <= biased_val;
                        quant_val_signal <= quant_val;
                        
                    elsif M_AXIS_TREADY = '1' then
                        m_axis_tvalid_r <= '0';
                    end if;
                elsif M_AXIS_TREADY = '1' then
                    m_axis_tvalid_r <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
