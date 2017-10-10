--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:30:48 10/09/2017
-- Design Name:   
-- Module Name:   C:/Users/manuel/Desktop/proyecto_procesador/procesador1/tb_Mux.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux
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
 
ENTITY tb_Mux IS
END tb_Mux;
 
ARCHITECTURE behavior OF tb_Mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         i : IN  std_logic;
         Crs2 : IN  std_logic_vector(31 downto 0);
         E_seu : IN  std_logic_vector(31 downto 0);
         S_mux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal E_seu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal S_mux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          i => i,
          Crs2 => Crs2,
          E_seu => E_seu,
          S_mux => S_mux
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
		i <='1';
		E_seu <= x"00000006";
      Crs2 <= x"00000009";
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

   

      -- insert stimulus here 

      wait;
   end process;

END;
