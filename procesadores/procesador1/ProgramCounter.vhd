----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:07 10/02/2017 
-- Design Name: 
-- Module Name:    ProgramCounter - Behavioral 
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

entity ProgramCounter is
    Port ( clk : in  STD_LOGIC;
           entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC);
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
process (clk, rst, entrada)
	begin
		if (rst = '1') then
			salida <= (others => '0');
		else
			if(rising_edge(clk)) then
				salida <= entrada;
			end if;
		end if;
end process;

end Behavioral;

