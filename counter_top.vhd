----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2019 09:18:58 AM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

--declare full entity-----------------------------------------------------
entity counter_top is
  Port (btn : in std_logic_vector(3 downto 0);
        clk: in std_logic;
        sw: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0));
end counter_top;
--end entity--------------------------------------------------------------

architecture my_ct of counter_top is

--declare components

--debouncer component-----------------------------------------------------
component debounce
  Port (clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic );
end component;
--end debounce------------------------------------------------------------

--clock divider component-------------------------------------------------
component clock_div
port (
  clk : in std_logic;
  div : out std_logic);
end component;
--end clock divider-------------------------------------------------------


--fancy counter component-------------------------------------------------
component fancy_counter
  Port (clk, clk_en, dir, en, ld, rst, updn: in std_logic;
        val: in std_logic_vector(3 downto 0);
         cnt: out std_logic_vector(3 downto 0));
end component;
--end fancy counter-------------------------------------------------------


--declare intermediate signals
signal U1_out, U2_out, U3_out, U4_out, U5_out: std_logic := '0';

begin


--declare port maps-------------------------------------------------------

U1: debounce port map(btn => btn(0),
                      clk => clk,
                      dbnc => U1_out);
                      
U2: debounce port map(btn => btn(1),
                      clk => clk,
                      dbnc => U2_out);
                      
U3: debounce port map(btn => btn(2),
                      clk => clk,
                      dbnc => U3_out);

U4: debounce port map(btn => btn(3),
                      clk => clk,
                      dbnc => U4_out);
                      
U5: clock_div port map(clk => clk,
                       div => U5_out);
                       
U6: fancy_counter port map(clk => clk,
                           clk_en => U5_out,
                           dir => sw(0),
                           en => U2_out,
                           ld => U4_out,
                           rst => U1_out,
                           updn => U3_out,
                           val => sw,
                           cnt => led);
--end port maps-----------------------------------------------------------
                      
                      



end my_ct;
