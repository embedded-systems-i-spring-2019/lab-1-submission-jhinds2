----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 08:36:40 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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
--using the template given in lab PDF

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock_div is
port (
  clk : in std_logic;
  div : out std_logic
);
end clock_div;

architecture clk_div of clock_div is
--use 26 bits to be able to count to 62.5MHZ
  signal count : std_logic_vector (25 downto 0) := (others => '0');
begin
  
--declare process  
  process(clk) begin
  --check on rising edge
    if rising_edge(clk) then
    --update counter while less than 62.5MHZ
        if(unsigned(count) < 62499999) then
        --while less than the desired count div = '0'
        div <= '0';
        --update counter
      count <= std_logic_vector( unsigned(count) + 1 );
        else
        --once you reach 62.5MHZ reset counter 
        count <= (others => '0');
        --to my understanding, we just want a single pulse to happen at a 2Hz rate
        div <= '1';
        end if;
    
    end if;
  end process;

end clk_div;













