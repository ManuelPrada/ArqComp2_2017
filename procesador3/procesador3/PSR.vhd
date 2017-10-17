----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:07 10/16/2017 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           icc_PSRmd : in  STD_LOGIC_VECTOR (3 downto 0);
           Alu_acarreo : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin

process(rst, clk, icc_PSRmd)

		begin

			if (rst = '1') then 		

				 Alu_acarreo <= '0';

			elsif (rising_edge(clk)) then

				 Alu_acarreo <= icc_PSRmd(0);
				 
         end if;
end process;
end Behavioral;

