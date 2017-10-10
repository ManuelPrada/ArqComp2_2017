--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:00:08 10/02/2017
-- Design Name:   
-- Module Name:   F:/procesador1/tb_resgisterfile.vhd
-- Project Name:  procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: resgisterfile
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
 
ENTITY tb_resgisterfile IS
END tb_resgisterfile;
 
ARCHITECTURE behavior OF tb_resgisterfile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT resgisterfile
    PORT(
         
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         rst : IN  std_logic;
			dwr : IN  std_logic_vector(31 downto 0);
         rsalida1 : OUT  std_logic_vector(31 downto 0);
         rsalida2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rsalida1 : std_logic_vector(31 downto 0);
   signal rsalida2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: resgisterfile PORT MAP (
          
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          rst => rst,
			 dwr => dwr,
          rsalida1 => rsalida1,
          rsalida2 => rsalida2
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
     rs1<="00001";
	  rs1<="00010";
	  rd <="00011";
	  rst<='0';	
	  dwr<=x"00000004";
      wait for 100 ns;	
	  
     rs2<="00001";
	  rs2<="00010";
	  rd <="00011";
	  rst<='1';
	  dwr<=x"00000004";

     
wait;
      -- hold reset state for 100 ns.
      wait for 100 ns;	



      wait;
   end process;

END;
