--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:04:57 09/28/2017
-- Design Name:   
-- Module Name:   D:/arquivdhl/procesador1/tb_sumador.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
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
 
ENTITY tb_sumador IS
END tb_sumador;
 
ARCHITECTURE behavior OF tb_sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         op2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          op2 => op2,
          result => result
        );


   -- Stimulus process
   stim_proc: process
   begin		
     
     op2<=x"0000000F"; wait for 100 ns;	

   

      wait;
   end process;

END;
