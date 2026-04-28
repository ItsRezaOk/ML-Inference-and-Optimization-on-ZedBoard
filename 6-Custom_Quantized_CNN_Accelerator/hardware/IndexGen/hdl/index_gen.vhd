----------------------------------------------------------------------------------
-- Input & Filter Index Generator
--
-- Gregory Ling, 2024
----------------------------------------------------------------------------------
library work;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity index_gen is
generic(
        DIM_WIDTH : integer := 32;
        INPUT_ADDR_WIDTH : integer := 32;
        FILTER_ADDR_WIDTH : integer := 32;
        OUTPUT_ADDR_WIDTH : integer := 32
);
port(
        filter_w : in std_logic_vector(DIM_WIDTH-1 downto 0); -- Filter dimension width (Filter width)
        filter_h : in std_logic_vector(DIM_WIDTH-1 downto 0); -- Filter dimension height (Filter height)
        filter_c : in std_logic_vector(DIM_WIDTH-1 downto 0); -- Filter dimension channels (Filter channels == Input channels)
        output_w : in std_logic_vector(DIM_WIDTH-1 downto 0); -- Output dimension width (Output width)
        output_h : in std_logic_vector(DIM_WIDTH-1 downto 0); -- Output dimension height (Output height)
        input_end_diff_fw : in std_logic_vector(INPUT_ADDR_WIDTH-1 downto 0); -- Amount to add to addr when completing a filter row
        input_end_diff_fh : in std_logic_vector(INPUT_ADDR_WIDTH-1 downto 0); -- Amount to add to addr when completing a filter column
        input_end_diff_fc : in std_logic_vector(INPUT_ADDR_WIDTH-1 downto 0); -- Amount to add to addr when completing a filter channel
        input_end_diff_ow : in std_logic_vector(INPUT_ADDR_WIDTH-1 downto 0); -- Amount to add to addr when completing an output row
        M_AXIS_TREADY : in std_logic;
        M_AXIS_TDATA_input_addr : out std_logic_vector(INPUT_ADDR_WIDTH-1 downto 0);
        M_AXIS_TDATA_filter_addr : out std_logic_vector(FILTER_ADDR_WIDTH-1 downto 0);
        M_AXIS_TLAST : out std_logic;
        M_AXIS_TVALID : out std_logic;
        conv_idle : in std_logic; -- When the convolution is idle, reset the index generator. Starts counting on falling edge
        rst : in std_logic;
        clk : in std_logic
);
end index_gen;
architecture Behavioral of index_gen is
signal cnt_s, cnt_r, cnt_c, cnt_ox, cnt_oy : unsigned(DIM_WIDTH-1 downto 0) := (others => '0');
signal input_addr : signed(INPUT_ADDR_WIDTH-1 downto 0) := (others => '0');
signal filter_addr : signed(FILTER_ADDR_WIDTH-1 downto 0) := (others => '0');
signal state : std_logic := '0';
signal conv_idle_reg : std_logic := '0';
signal is_last : std_logic;
begin
M_AXIS_TVALID <= state;
M_AXIS_TDATA_input_addr <= std_logic_vector(input_addr);
M_AXIS_TDATA_filter_addr <= std_logic_vector(filter_addr);
M_AXIS_TLAST <= is_last;

process(clk)
begin
    if rst = '1' then
        state <= '0';
        conv_idle_reg <= '0';
        input_addr <= (others => '0');
        filter_addr <= (others => '0');
        cnt_s <= (others => '0');
        cnt_r <= (others => '0');
        cnt_c <= (others => '0');
        cnt_ox <= (others => '0');
        cnt_oy <= (others => '0');
    elsif rising_edge(clk) then
        conv_idle_reg <= conv_idle;
        if state = '0' then
            if conv_idle_reg = '1' and conv_idle = '0' then
                state <= '1';
                input_addr <= (others => '0');
                filter_addr <= (others => '0');
                cnt_s <= (others => '0');
                cnt_r <= (others => '0');
                cnt_c <= (others => '0');
                cnt_ox <= (others => '0');
                cnt_oy <= (others => '0');
            end if;
        else
            if M_AXIS_TREADY = '1' then
                if cnt_s = unsigned(filter_w) - 1 then
                    cnt_s <= (others => '0');
                    input_addr <= input_addr + signed(input_end_diff_fw);
                    filter_addr <= filter_addr + to_signed(1, FILTER_ADDR_WIDTH);
                    if cnt_r = unsigned(filter_h) - 1 then
                        cnt_r <= (others => '0');
                        input_addr <= input_addr + signed(input_end_diff_fh);
                        filter_addr <= filter_addr + to_signed(1, FILTER_ADDR_WIDTH);
                        if cnt_c = unsigned(filter_c) - 1 then
                            cnt_c <= (others => '0');
                            input_addr <= input_addr + signed(input_end_diff_fc);
                            filter_addr <= (others => '0');
                            is_last <= '1';
                            if cnt_ox = unsigned(output_w) - 1 then
                                cnt_ox <= (others => '0');
                                input_addr <= input_addr + signed(input_end_diff_ow);
                                filter_addr <= (others => '0');
                                if cnt_oy = unsigned(output_h) - 1 then
                                    state <= '0';
                                else
                                    cnt_oy <= cnt_oy + 1;
                                end if;
                            else
                                cnt_ox <= cnt_ox + 1;
                            end if;
                        else
                            cnt_c <= cnt_c + 1;
                        end if;
                    else
                        cnt_r <= cnt_r + 1;
                    end if;
                else
                    is_last <= '0';
                    cnt_s <= cnt_s + 1;
                    input_addr <= input_addr + to_signed(1, INPUT_ADDR_WIDTH);
                    filter_addr <= filter_addr + to_signed(1, FILTER_ADDR_WIDTH);
                end if;
            end if;
        end if;
    end if;
end process;
end Behavioral;
