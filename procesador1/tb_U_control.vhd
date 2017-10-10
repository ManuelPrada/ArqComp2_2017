--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:59:00 10/09/2017
-- Design Name:   
-- Module Name:   C:/Users/manuel/Desktop/proyecto_procesador/procesador1/tb_U_control.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: U_control
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
 
ENTITY tb_U_control IS
END tb_U_control;
 
ARCHITECTURE behavior OF tb_U_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT U_control
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         Salida : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Salida : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: U_control PORT MAP (
          op => op,
          op3 => op3,
          Salida => Salida
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
	
	  op<="10";
	  op3<="000011";
	  wait for 100 ns;
     op<="10";
	  op3<="000000";	  

      -- hold reset state for 100 ns.
      wait for 100 ns;	



      wait;
   end process;

END;
