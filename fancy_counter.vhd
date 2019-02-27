----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2019 09:21:51 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
  Port (clk, clk_en, dir, en, ld, rst, updn: in std_logic;
        val: in std_logic_vector(3 downto 0);
        cnt: out std_logic_vector(3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
--intermediate signals

--need a 4 bit counter
signal counter: std_logic_vector(3 downto 0) := (others => '0');
signal value: std_logic_vector(3 downto 0) := (others => '0'); 
signal direction : std_logic := '0';

begin
--begin process
    process(clk, clk_en)
        begin
        
        --unless en = '1' do nothing
        if(en = '1') then
        --on the clock rising edge and rst is asserted reset count
            if(rising_edge(clk)) then
                if(rst = '1') then
                counter <= (others => '0');
                --this sets output to 0
                cnt <= counter;
                --beside rst, unless clk_en is '1' nothing can be implemented
                elsif(clk_en = '1') then
                --if clk_en is 1 and ld is 1
                --the value at "val" will be loaded in to value register
                    if(ld = '1') then
                    value <= val;
                    end if;
                    --if clk_en = '1' and updn = '1'
                    --change the direction of counting depending on dir value
                    if(updn = '1') then
                    direction <= dir;
                    end if;
                    --count up
                        if(direction = '1') then
                        --it counts up to number stored in value
                           if(unsigned(counter) < unsigned(value)) then
                               counter <= std_logic_vector(unsigned(counter) + 1);
                               --once reached reset back to 0000
                               --set output to value in counter
                                cnt <= counter;
                           else
                               counter <= (others => '0');
                               --set output to value in counter
                               cnt <= counter;
                           end if;
                        --if direction is '0'
                        else
                        --count down from current value in counter
                            if(unsigned(counter) > "0000") then
                                counter <= std_logic_vector(unsigned(counter) - 1);
                                --set output to value in counter
                                cnt <= counter;
                            --if it reaches 0000 set to val    
                            else
                            counter <= value;
                            --set output to value in counter
                            cnt <= counter;
                            end if;
                        end if;
                 end if;
            end if;
      end if;
                 
   end process;

end Behavioral;
