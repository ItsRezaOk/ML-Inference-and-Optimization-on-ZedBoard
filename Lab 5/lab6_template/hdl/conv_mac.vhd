----------------------------------------------------------------------------------
-- Convolutional MAC Unit
--
-- Gregory Ling, 2024
----------------------------------------------------------------------------------

-- THIS IS NOT THE FILE WE NEED TO MODIFY FOR THE LAB 3 MAC!!! DAMN!!!

library work;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity conv_mac is
  generic(
      C_DATA_WIDTH : integer := 32;
      C_OUTPUT_DATA_WIDTH : integer := 32
    );
    port (  
        S_AXIS_TREADY : out std_logic;
        S_AXIS_TDATA  : in  std_logic_vector(C_DATA_WIDTH*2-1 downto 0);
        S_AXIS_TLAST  : in  std_logic;
        S_AXIS_TVALID : in  std_logic;

        bias : in std_logic_vector(C_OUTPUT_DATA_WIDTH-1 downto 0);

        M_AXIS_TREADY : in  std_logic;
        M_AXIS_TDATA  : out std_logic_vector(C_OUTPUT_DATA_WIDTH-1 downto 0);
        M_AXIS_TLAST  : out std_logic;
        M_AXIS_TVALID : out std_logic;

        rst : in std_logic;
        clk : in std_logic
    );

end conv_mac;


architecture behavioral of conv_mac is -- behavioral means we use process signals!!!

signal multiply_out : std_logic_vector(C_DATA_WIDTH*2-1 downto 0); -- confirm width
signal weight : std_logic_vector(C_DATA_WIDTH-1 downto 0); -- input for weight Multiply
signal input_data : std_logic_vector(C_DATA_WIDTH-1 downto 0); -- input for input_data Multiply
signal acc_out : std_logic_vector(C_OUTPUT_DATA_WIDTH-1 downto 0); -- output of accumulator, this will work effectively like a register...
signal acc_in : std_logic_vector(C_OUTPUT_DATA_WIDTH-1 downto 0);


begin

  

-- multiply and accumulate
-- Need to confirm if the handshake is corect
-- This is a simple one-step MAC, which is much easier than pipelined (which i almost accidentally did)
process(clk, rst) is
begin
  if rising_edge(clk) then
    if rst = '1' then
      multiply_out <= (others => '0');
      acc_out <= (others => '0');
      M_AXIS_TDATA <= (others => '0');
      M_AXIS_TVALID <= '0';
      M_AXIS_TLAST <= '0';
      S_AXIS_TREADY <= '1'; -- ready to accept data
    else
      if S_AXIS_TVALID = '1' and M_AXIS_TREADY = '1' then
        -- input data
        weight <= S_AXIS_TDATA(C_DATA_WIDTH*2-1 downto C_DATA_WIDTH);
        input_data <= S_AXIS_TDATA(C_DATA_WIDTH-1 downto 0);
        
        -- perform multiplication
        multiply_out := std_logic_vector(signed(weight) * signed(input_data));
        
        -- perform accumulation
        acc_in := std_logic_vector(signed(acc_out) + resize(signed(multiply_out), C_OUTPUT_DATA_WIDTH));
        acc_out <= acc_in;
        
        -- output result when last signal is high (confirm this is proper behavior)
        if S_AXIS_TLAST = '1' then
          M_AXIS_TDATA <= std_logic_vector(signed(acc_out) + signed(bias));
          M_AXIS_TVALID <= '1';
          M_AXIS_TLAST <= '1';
          acc_out <= (others => '0'); -- reset accumulator after output
        else
          M_AXIS_TVALID <= '0';
          M_AXIS_TLAST <= '0';
        end if;
      else
        M_AXIS_TVALID <= '0';
        M_AXIS_TLAST <= '0';
      end if;
      
      -- this is likely wrong, we should be using the inputs to determine when we are ready
      if M_AXIS_TVALID = '1' and M_AXIS_TREADY = '1' then
        S_AXIS_TREADY <= '1'; -- ready for next input after output is accepted
      else
        S_AXIS_TREADY <= '0'; -- not ready if output is not accepted yet
      end if;
    end if;
  end if;
  
  
end process;

end architecture behavioral;
