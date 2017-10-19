--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:29:32 10/02/2017
-- Design Name:   
-- Module Name:   F:/procesador1/tb_Alu.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Alu IS
END tb_Alu;
 
ARCHITECTURE behavior OF tb_Alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         dato1 : IN  std_logic_vector(31 downto 0);
         dato2 : IN  std_logic_vector(31 downto 0);
         operacion : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dato1 : std_logic_vector(31 downto 0) := (others => '0');
   signal dato2 : std_logic_vector(31 downto 0) := (others => '0');
   signal operacion : std_logic_vector(5 downto 0) := (others => '0');
   signal salida : std_logic_vector(31 downto 0);
  
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          dato1 => dato1,
          dato2 => dato2,
          operacion => operacion,
          salida => salida
        );

   -- Clock process definitions
   
		
   -- Stimulus process
   stim_proc: process
   begin
	
	 dato1<=x"0000000F";
    dato2<=x"0000000C";
	 operacion<="000000";
   
	 -- hold reset state for 100 ns.
      wait for 100 ns;	
    dato1<=x"0000002F";
    dato2<=x"0000000F";
	 operacion<="000001"; 
	 
	 wait for 100 ns;	
	 dato1<=x"0000000A";
    dato2<=x"0000000B";
	 operacion<="000110";


      --insert stimulus here 

      wait;
   end process;

END;
