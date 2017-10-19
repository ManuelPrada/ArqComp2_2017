--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:12:11 10/16/2017
-- Design Name:   
-- Module Name:   C:/Users/manuel/Desktop/ArqComp2-2017/ArqComp2_2017/procesador3/procesador3/tb_PSR.vhd
-- Project Name:  procesador3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY tb_PSR IS
END tb_PSR;
 
ARCHITECTURE behavior OF tb_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         rst : IN  std_logic;
         nzvc_psr : IN  std_logic_vector(3 downto 0);
         Alu_acarreo : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal nzvc_psr : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Alu_acarreo : std_logic;

 
BEGIN
 
   -- Stimulus process
   stim_proc: process
   begin		
	
		rst<='1';
		wait for 100 ns;
                rst<='0';
		          nzvc_psr <=  "1111"; 

      wait;
   end process;

END;
