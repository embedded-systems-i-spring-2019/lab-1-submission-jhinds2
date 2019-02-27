----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2019 08:19:07 AM
-- Design Name: 
-- Module Name: fc_tb - Behavioral
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

entity fc_tb is
--  Port ( );
end fc_tb;

architecture Behavioral of fc_tb is

--create component
component fancy_counter
      Port (clk, clk_en, dir, en, ld, rst, updn: in std_logic;
            val: in std_logic_vector(3 downto 0);
            cnt: out std_logic_vector(3 downto 0));
end component;

--create intermediate signals
signal clk, clk_en, en, dir, ld, rst, updn : std_logic := '0';
signal val: std_logic_vector(3 downto 0) := (others => '0');
signal cnt: std_logic_vector(3 downto 0) := (others => '0');


begin

--create port map-------------------------------------------------
dut: fancy_counter port map(clk => clk,
                            clk_en => clk_en,
                            en => en,
                            dir => dir,
                            ld => ld,
                            rst => rst,
                            updn => updn,
                            val => val,
                            cnt => cnt);
--end port map----------------------------------------------------



--create 125MHZ clock---------------------------------------------
    process
        begin
        --8ns clock cycle = 125MHZ

--set high for half the period
      wait for 4 ns;
      clk <= '1';
--set low for half      
      wait for 4 ns;
      clk <= '0';
  
  end process;
  --end clock process---------------------------------------------
  
  
  --run simulation process----------------------------------------
    process
        begin
        
        --initial wait
        wait for 5ms;
  
        --first lets try to break it
        --unless en = '1' nothing will change the circuit
        en <= '0';
        clk_en <= '1';
        dir <= '1';
        ld <= '1';
        val <= "1001";
        updn <= '1';
        rst <= '0';
        wait for 10ms;
        --so here, nothing should have happened
        
        --even if en = '1' if clk_en is '0' only rst can change the circuit
        en <= '1';
        clk_en <= '0';
        ld <= '1';
        val <= "1001";
        updn <= '1';
        --rst should set the output to '0'
        rst <= '1';
        wait for 5ms;
        
        rst <= '0';
        wait for 1ms;
        
        --now lets try to count up
        en <= '1';
        clk_en <= '1';
        dir <= '1';
        ld <= '1';
        val <= "1001";
        updn <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        
        
        
        wait for 20ms;
        
       
        
        --now lets try to count down
        en <= '1';
        clk_en <= '1';
        dir <= '0';
        ld <= '0';
        val <= "1001";
        updn <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 8ns;
        clk_en <= '1';
        wait for 8ns;
        clk_en <= '0';
        wait for 10ms;
        
        
        
        --reset output
        rst <= '1';
        clk_en <= '0';
        dir <= '0';
        ld <= '0';
        val <= "0000";
        updn <= '0';
        wait;
end process;
--end simulation process------------------------------------------------
        
       
end Behavioral;
