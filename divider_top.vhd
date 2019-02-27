----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2019 01:41:16 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

--create entity
entity divider_top is
  Port ( clk: in std_logic;
         led0: out std_logic);
end divider_top;

--create architecture
architecture Behavioral of divider_top is

--declare clock divider component-----------------------------------------
component clock_div
    port(clk: in std_logic;
         div: out std_logic);
end component;
--end clock divider component---------------------------------------------

--declare intermediate signals
signal led: std_logic := '0';
signal div_CE: std_logic := '0';

begin

--declare clock divider port map
U1: clock_div port map(clk => clk,
                       div => div_CE);
                       
                       
--declare process---------------------------------------------------------
--this will create the led_reg
--clk => C
--div => CE through div_CE
--not led => D from output of Led_reg
process(clk)
    begin
    --on rising edge of the clock
        if(clk'event and clk = '1') then
        --if div signal is high invert led signal
            if(div_CE = '1') then
                led <= not led;
            end if;
        end if;
    
    --set led0 to led signal
    led0 <= led;
end process;
--end process------------------------------------------------------------


end Behavioral;
