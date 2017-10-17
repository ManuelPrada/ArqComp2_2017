--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:38:18 10/10/2017
-- Design Name:   
-- Module Name:   C:/Users/manuel/Desktop/ArqComp2-2017/ArqComp2_2017/procesador1/tb_MUX.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_MUX IS
END tb_MUX;
 
ARCHITECTURE behavior OF tb_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         I : IN  std_logic;
         salseu : IN  std_logic_vector(31 downto 0);
         salrs2 : IN  std_logic_vector(31 downto 0);
         salmux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic := '0';
   signal salseu : std_logic_vector(31 downto 0) := (others => '0');
   signal salrs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salmux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          I => I,
          salseu => salseu,
          salrs2 => salrs2,
          salmux => salmux
        );

   -- Clock process definitions
   -- Stimulus process
   stim_proc: process
   begin		
		I <='1';
		salseu <= x"00000006";
      salrs2 <= x"00000005";
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	



      -- insert stimulus here 

      wait;
   end process;

END;
