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
         clk : IN  std_logic;
         rst : IN  std_logic;
         icc_PSRmd : IN  std_logic_vector(3 downto 0);
         Alu_acarreo : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal icc_PSRmd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Alu_acarreo : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          rst => rst,
          icc_PSRmd => icc_PSRmd,
          Alu_acarreo => Alu_acarreo
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		reset<='1';
		wait for 100 ns;
                reset<='0';
		          icc_PSRM <=  "1111"; 

      wait;
   end process;

END;
