----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2019 07:03:44 PM
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture db_tb of debounce_tb is

--declare debounce component------------------------------------
component debounce
    Port (clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic );
end component;
--end component-------------------------------------------------


--create intermediate signals and initialize them
signal clk: std_logic := '0';
signal btn: std_logic := '0';
signal dbnc: std_logic := '0';


begin

--set signals from design to signals in testbench
dut: debounce port map(clk => clk,
                       btn => btn,
                       dbnc => dbnc);
                       
                       
--declare process for the clock---------------------------------------
clk_process:  process
    begin

--8ns clock cycle = 125MHZ

--set high for half the period
      clk <= '1';
      wait for 4 ns;
--set low for half      
      clk <= '0';
      wait for 4 ns;
  
  end process;
 --end process--------------------------------------------------------- 
  
  
 --declare process for thr button
 btn_process: process 
    begin
    
    --initial wait
    btn <= '0';
    wait for 5ms;
    
   --turn the button on and off multiple times to simulate bounce
  
    btn <= '1';
    wait for 1000us;
    btn <= '0';
    wait for 1000us;
    btn <= '1';
    wait for 1000us;
    btn <= '0';
    wait for 1000us;
    
 
    
    --keep on for 21ms (to make it noticable)
    btn <= '1';
    wait for 21ms;
    
    --turn off and on to simulate bounce
    btn <= '0';
    wait for 1000us;
    btn <= '1';
    wait for 1000us;
    btn <= '0';
    wait for 1000us;
    btn <= '1';
    wait for 1000us;

    
    
   --initial wait
    btn <= '0';
    wait for 5ms;
    
   --turn the button on and off multiple times to simulate bounce
  
    btn <= '1';
    wait for 1000us;
    btn <= '0';
    wait for 1000us;
    btn <= '1';
    wait for 1000us;
    btn <= '0';
    wait for 1000us;
    
 
    
    --keep on for 30ms
    btn <= '1';
    wait for 30ms;
    
    --turn off and on to simulate bounce
    btn <= '0';
    wait for 1000us;
    btn <= '1';
    wait for 1000us;
    btn <= '0';
    wait for 1000us;
    btn <= '1';
    wait for 1000us;
    
    
    --no more button presses
    btn <= '0';
    wait;
    
        
    end process;


end db_tb;
