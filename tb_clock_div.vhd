----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 08:53:30 PM
-- Design Name: 
-- Module Name: tb_clock_div - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

entity tb_clock_div is
end tb_clock_div;

architecture clk_tb of tb_clock_div is

--create component of clock divider design
  component clock_div
  port (
    clk : in std_logic;
    div : out std_logic
  );
  end component;

--create intermediate signals/initialize them
  signal clk : std_logic := '0';
  signal div : std_logic := '0';

  
begin

--set signals from design to signals declared in testbench
  dut: clock_div port map(clk => clk, 
                          div => div);

--declare process
  process begin

--8ns clock cycle = 125MHZ

--set high for half the period
      clk <= '1';
      wait for 4 ns;
--set low for half      
      clk <= '0';
      wait for 4 ns;
  
  end process;
  
end clk_tb;

