----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:09 10/02/2017 
-- Design Name: 
-- Module Name:    sumador - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumador is
    Port ( EntradaA : in  STD_LOGIC_VECTOR (31 downto 0);
           EntradaB : in  STD_LOGIC_VECTOR (31 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture Behavioral of sumador is

begin
PROCESS (EntradaA, EntradaB)  
BEGIN
salida <= std_logic_vector(UNSIGNED(EntradaA) + UNSIGNED(EntradaB));
END PROCESS;

end Behavioral;

