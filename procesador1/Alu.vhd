----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:36:43 10/02/2017 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( dato1 : in  STD_LOGIC_VECTOR (31 downto 0);
           dato2 : in  STD_LOGIC_VECTOR (31 downto 0);
           operacion : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
         
end Alu;

architecture Behavioral of Alu is

begin
process(dato1,dato2,operacion)
	begin
	case (operacion) is
	when "000000" =>salida<=dato1+dato2; --add
	when "000001" =>salida<=dato1-dato2; --sub
	when "000010" =>salida<=dato1 or dato2;
	when "000011" =>salida<=dato1 nor dato2;
   when "000100" =>salida<=dato1 and dato2;
	when "000101" =>salida<=dato1 nand dato2;
	when "000110" =>salida<=dato1 xor dato2;
	when "000111" =>salida<=dato1  xnor dato2;
	when others => 
   salida <= (others=>'0'); 

	end case;
	end process;
 

end Behavioral;

