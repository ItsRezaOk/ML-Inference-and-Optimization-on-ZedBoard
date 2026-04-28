----------------------------------------------------------------------------------
-- Output Storage Unit
--
-- Gregory Ling, 2024
----------------------------------------------------------------------------------

library work;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity output_storage is
    generic(
        DATA_WIDTH : integer := 32;
        BRAM_DATA_WIDTH : integer := 32;
        ADDR_WIDTH : integer := 32;
        BRAM_ADDR_WIDTH : integer := 32;
        DIM_WIDTH : integer := 8;
        C_TID_WIDTH : integer := 2
    );
    port(
        S_AXIS_TREADY : out std_logic;
        S_AXIS_TDATA  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        S_AXIS_TLAST  : in  std_logic;
        S_AXIS_TID    : in  std_logic_vector(C_TID_WIDTH-1 downto 0);
        S_AXIS_TVALID : in  std_logic;

        BRAM_addr : out std_logic_vector(32-1 downto 0);
        BRAM_din : out std_logic_vector(BRAM_DATA_WIDTH-1 downto 0);
        BRAM_dout : in std_logic_vector(BRAM_DATA_WIDTH-1 downto 0);
        BRAM_en : out std_logic;
        BRAM_we : out std_logic_vector((BRAM_DATA_WIDTH/8)-1 downto 0);
        BRAM_rst : out std_logic;
        BRAM_clk : out std_logic;

        max_pooling : in std_logic;
        elements_per_channel : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        output_w : in std_logic_vector(DIM_WIDTH-1 downto 0);
        output_h : in std_logic_vector(DIM_WIDTH-1 downto 0);
        initial_offset : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        
        conv_complete : out std_logic;
        conv_idle : in std_logic;
        clk : in std_logic;
        rst : in std_logic
    );
end output_storage;

architecture Behavioral of output_storage is

    type STATE_TYPE is (WAIT_FOR_VALUES, READBRAM, WRITEBRAM);
    signal currentState : STATE_TYPE := WAIT_FOR_VALUES;
    signal nextState : STATE_TYPE := WAIT_FOR_VALUES;

    signal cnt_ox, cnt_oy, cnt_c : unsigned(DIM_WIDTH-1 downto 0) := (others => '0');
    signal calculatated_bram_addr : std_logic_vector(32-1 downto 0) := (others => '0');

    -- Internal signals for intermediate results
    signal product1 : unsigned(31 downto 0) := (others => '0');
    signal product2 : unsigned(31 downto 0) := (others => '0');
    signal product2_max : unsigned(31 downto 0) := (others => '0');
    signal final_sum : unsigned(31 downto 0) := (others => '0');
    signal final_sum_max : unsigned(31 downto 0) := (others => '0');

    signal value1 : signed(7 downto 0 ) := (others => '0');
    signal value2 : signed(7 downto 0) := (others => '0');
    
    signal convolutionComplete : std_logic := '0';
    signal is_last_transaction : std_logic := '0';
    signal is_odd_row : std_logic := '1';
    signal is_odd_column : std_logic := '1';
    signal offset : unsigned(1 downto 0) := (others => '0');

begin

    product1 <= unsigned(resize(unsigned(S_AXIS_TID) * unsigned(elements_per_channel), 32));
    product2 <= unsigned(resize(unsigned(cnt_oy) * unsigned(output_w), 32));
    product2_max <= unsigned(resize(unsigned(cnt_oy) * shift_right(unsigned(output_w), 1), 32));
    
    final_sum <= unsigned(initial_offset) + product1 + product2 + unsigned(cnt_ox);
    final_sum_max <= unsigned(initial_offset) + product1 + product2_max + unsigned(cnt_ox);
    
    value1 <= signed(BRAM_dout(7 DOWNTO 0));
    value2 <= signed(S_AXIS_TDATA(7 DOWNTO 0));
    
    BRAM_clk <= clk;
    
    process(final_sum, max_pooling, rst, final_sum_max) is 
        begin 
            if(rst = '0') then 
                if(max_pooling = '1') then
                    calculatated_bram_addr(31 DOWNTO 2) <= std_logic_vector(final_sum_max(31 DOWNTO 2));
                    calculatated_bram_addr(1 DOWNTO 0) <= "00";
                    offset <= final_sum_max(1 DOWNTO 0); 
                else 
                    calculatated_bram_addr(31 DOWNTO 2) <= std_logic_vector(final_sum(31 DOWNTO 2));
                    calculatated_bram_addr(1 DOWNTO 0) <= "00";
                    offset <= final_sum(1 DOWNTO 0);
                end if;
            else
                calculatated_bram_addr <= (others => '0');
            end if;
                
    end process;
    
    process(S_AXIS_TVALID, BRAM_dout, convolutionComplete) is   
       begin
           case currentState is -- State
                -- Wait here until we receive values
                when WAIT_FOR_VALUES =>
                    if (S_AXIS_TVALID = '1') then
                        if(convolutionComplete = '0') then
                            nextState <= READBRAM;  
                        else
                            nextState <= WAIT_FOR_VALUES;
                        end if;
                    else 
                        nextState <= WAIT_FOR_VALUES;
                    end if;
                
                when READBRAM =>
                    nextState <= WRITEBRAM; 
                when WRITEBRAM =>
                    nextState <= WAIT_FOR_VALUES;
                when others =>
                    nextState <= WAIT_FOR_VALUES;
                    -- Not really important, this case should never happen
                    -- Needed for proper synthisis         
            end case; -- State
    end process;

    process (clk, rst) is
begin
    BRAM_rst <= rst; -- Typically tied to the system reset logic
    
    -- Reset values if reset is low
    if rst = '1' or conv_idle = '1' then -- Asynchronous Reset
        currentState <= WAIT_FOR_VALUES;
        conv_complete <= '0';
        convolutionComplete <= '0';
        S_AXIS_TREADY <= '1';
        BRAM_addr <= (others => '0');
        BRAM_din <= (others => '0');
        cnt_c <= (others => '0');
        cnt_oy <= (others => '0');
        cnt_ox <= (others => '0');
        BRAM_en <= '0';
        is_last_transaction <= '0';
        is_odd_row <= '1';
        is_odd_column <= '1';
        
    elsif falling_edge(clk) then -- Synchronous logic on Rising Edge
        -- Handle state transitions and logic
        case currentState is
            when WAIT_FOR_VALUES =>
                BRAM_we <= "0000";
                
                case nextState is
                    when WAIT_FOR_VALUES => 
                        currentState <= WAIT_FOR_VALUES;
                    when READBRAM => 
--                            -- Logic for transitioning to the next state
--                            BRAM_addr <= calculatated_bram_addr;
--                            BRAM_en <= '1';
                            if(max_pooling = '1') then 
                                if (cnt_c = 3 and cnt_ox = unsigned(output_w) + unsigned(output_w) - 1 and cnt_oy = unsigned(output_h) + unsigned(output_h) - 1) then
                                    is_last_transaction <= '1';
                                end if;
                            else
                                if (cnt_c = 3 and cnt_ox = shift_right(unsigned(output_w), 1) - 1 and cnt_oy = shift_right(unsigned(output_h), 1) - 1) then
                                    is_last_transaction <= '1';
                                end if;
                            end if;
                                


                            BRAM_addr <= calculatated_bram_addr;
                            S_AXIS_TREADY <= '0';  
                        currentState <= nextState;
                    when WRITEBRAM => 
                    when others =>
                        currentState <= WAIT_FOR_VALUES;
                    end case;

            when READBRAM =>
                if(offset = 0) then  
                    value1 <= signed(BRAM_dout(7 DOWNTO 0));
                    value2 <= signed(S_AXIS_TDATA(7 DOWNTO 0));
                elsif (offset = 1) then 
                    value1 <= signed(BRAM_dout(15 DOWNTO 8));
                    value2 <= signed(S_AXIS_TDATA(7 DOWNTO 0));
                elsif (offset = 2) then 
                    value1 <= signed(BRAM_dout(23 DOWNTO 16));
                    value2 <= signed(S_AXIS_TDATA(7 DOWNTO 0));
                else 
                    value1 <= signed(BRAM_dout(31 DOWNTO 24));
                    value2 <= signed(S_AXIS_TDATA(7 DOWNTO 0));
                end if;
                
                currentState <= WRITEBRAM;
                BRAM_en <= '0';

            when WRITEBRAM =>
                BRAM_we <= "1111";
                BRAM_en <= '1';

                if(is_x(BRAM_dout)) then 
                    if (max_pooling = '1' and value1 > value2 and (is_odd_row = '0' or is_odd_column = '0')) then
                        if(offset = 0) then
                            BRAM_din(7 DOWNTO 0) <= std_logic_vector(value1);
                            BRAM_din(31 DOWNTO 8) <= "000000000000000000000000";   
                        elsif (offset = 1) then
                            BRAM_din(15 DOWNTO 8) <= std_logic_vector(value1);
                            BRAM_din(7 DOWNTO 0) <= "00000000";
                            BRAM_din(31 DOWNTO 16) <= "0000000000000000";      
                        elsif (offset = 2) then
                            BRAM_din(23 DOWNTO 16) <= std_logic_vector(value1);
                            BRAM_din(15 DOWNTO 0) <= "0000000000000000";
                            BRAM_din(31 DOWNTO 24) <= "00000000";  
                        else 
                            BRAM_din(31 DOWNTO 24) <= std_logic_vector(value1);
                            BRAM_din(23 DOWNTO 0) <= "000000000000000000000000";   
                        end if;
                    else
                        if(offset = 0) then
                            BRAM_din(7 DOWNTO 0) <= std_logic_vector(value2);
                            BRAM_din(31 DOWNTO 8) <= "000000000000000000000000";   
                        elsif (offset = 1) then
                            BRAM_din(15 DOWNTO 8) <= std_logic_vector(value2);
                            BRAM_din(7 DOWNTO 0) <= "00000000";
                            BRAM_din(31 DOWNTO 16) <= "0000000000000000";      
                        elsif (offset = 2) then
                            BRAM_din(23 DOWNTO 16) <= std_logic_vector(value2);
                            BRAM_din(15 DOWNTO 0) <= "0000000000000000";
                            BRAM_din(31 DOWNTO 24) <= "00000000";  
                        else 
                            BRAM_din(31 DOWNTO 24) <= std_logic_vector(value2);
                            BRAM_din(23 DOWNTO 0) <= "000000000000000000000000";   
                        end if;
                    end if;
                else
                    if (max_pooling = '1' and value1 > value2 and (is_odd_row = '0' or is_odd_column = '0')) then
                        if(offset = 0) then
                            BRAM_din(7 DOWNTO 0) <= std_logic_vector(value1);
                            BRAM_din(31 DOWNTO 8) <= BRAM_dout(31 DOWNTO 8);   
                        elsif (offset = 1) then
                            BRAM_din(15 DOWNTO 8) <= std_logic_vector(value1);
                            BRAM_din(7 DOWNTO 0) <= BRAM_dout(7 DOWNTO 0);
                            BRAM_din(31 DOWNTO 16) <= BRAM_dout(31 DOWNTO 16);      
                        elsif (offset = 2) then
                            BRAM_din(23 DOWNTO 16) <= std_logic_vector(value1);
                            BRAM_din(15 DOWNTO 0) <= BRAM_dout(15 DOWNTO 0);
                            BRAM_din(31 DOWNTO 24) <= BRAM_dout(31 DOWNTO 24);  
                        else 
                            BRAM_din(31 DOWNTO 24) <= std_logic_vector(value1);
                            BRAM_din(23 DOWNTO 0) <= BRAM_dout(23 DOWNTO 0);   
                        end if;
                    else
                        if(offset = 0) then
                            BRAM_din(7 DOWNTO 0) <= std_logic_vector(value2);
                            BRAM_din(31 DOWNTO 8) <= BRAM_dout(31 DOWNTO 8);   
                        elsif (offset = 1) then
                            BRAM_din(15 DOWNTO 8) <= std_logic_vector(value2);
                            BRAM_din(7 DOWNTO 0) <= BRAM_dout(7 DOWNTO 0);
                            BRAM_din(31 DOWNTO 16) <= BRAM_dout(31 DOWNTO 16);      
                        elsif (offset = 2) then
                            BRAM_din(23 DOWNTO 16) <= std_logic_vector(value2);
                            BRAM_din(15 DOWNTO 0) <= BRAM_dout(15 DOWNTO 0);
                            BRAM_din(31 DOWNTO 24) <= BRAM_dout(31 DOWNTO 24);  
                        else 
                            BRAM_din(31 DOWNTO 24) <= std_logic_vector(value2);
                            BRAM_din(23 DOWNTO 0) <= BRAM_dout(23 DOWNTO 0);   
                        end if;
                    end if;
                end if; 
                
                if(S_AXIS_TLAST = '1' and is_last_transaction = '1') then
                    convolutionComplete <= '1';
                    conv_complete <= '1';
                end if;
                
                if (S_AXIS_TVALID = '1' and convolutionComplete = '0') then       
                    if(max_pooling = '0') then
                        if (cnt_c = 3 and cnt_ox = unsigned(output_w) - 1 and cnt_oy = unsigned(output_h) - 1) then
                            is_last_transaction <= '1';
                        end if;
                        
                        if cnt_c = 3 then
                            cnt_c <= (others => '0');
                            if cnt_ox = unsigned(output_w) - 1 then
                                cnt_ox <= (others => '0');
                                if cnt_oy = unsigned(output_h) - 1 then
                                    cnt_oy <= (others => '0');
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
                        if cnt_c = 3 then 
                            cnt_c <= (others => '0');
                            
                            if(is_odd_column = '1') then 
                                is_odd_column <= '0';
                            else 
                                is_odd_column <= '1';
                                
                                if cnt_ox = shift_right(unsigned(output_w), 1) - 1 then
                                    cnt_ox <= (others => '0');
                                    
                                    if(is_odd_row = '1') then 
                                        is_odd_row <= '0';
                                    else 
                                        is_odd_row <= '1';
                                        
                                        if cnt_oy = shift_right(unsigned(output_h), 1) - 1 then
                                            cnt_oy <= (others => '0');
                                        else
                                            cnt_oy <= cnt_oy + 1;
                                        end if;
                                    end if;
                                else
                                    cnt_ox <= cnt_ox + 1;
                                end if;
                            end if;
                        else
                            cnt_c <= cnt_c + 1;
                        end if;
                      
                     end if; 
                end if; 
                
                currentState <= WAIT_FOR_VALUES;
                S_AXIS_TREADY <= '1';  

            when others =>
                currentState <= WAIT_FOR_VALUES;
        end case;
    end if;
end process;

end Behavioral;

