--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:55:14 10/16/2017
-- Design Name:   
-- Module Name:   C:/Users/manuel/Desktop/ArqComp2-2017/ArqComp2_2017/procesador3/procesador3/tb_PSRmd.vhd
-- Project Name:  procesador3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSRmd
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
 
ENTITY tb_PSRmd IS
END tb_PSRmd;
 
ARCHITECTURE behavior OF tb_PSRmd IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRmd
    PORT(
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         aluop1 : IN  std_logic_vector(5 downto 0);
         aluresult : IN  std_logic_vector(31 downto 0);
         icc_PSR : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal aluop1 : std_logic_vector(5 downto 0) := (others => '0');
   signal aluresult : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal icc_PSR : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRmd PORT MAP (
          crs1 => crs1,
          crs2 => crs2,
          rst => rst,
          aluop1 => aluop1,
          aluresult => aluresult,
          icc_PSR => icc_PSR
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
	      rst <= '1';
      wait for 100 ns;

			rst <='0';
			aluop1 <= "000101";
			crs1 <= x"00010000";
			crs2 <= x"00010001";
			aluresult<="11111111111111111111111111110011";

			

      wait;
   end process;

END;
