----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:44 10/02/2017 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
    Port ( mrs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           mrs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           mrd : in  STD_LOGIC_VECTOR (5 downto 0);
           datoEscribir : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           prs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           prs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

begin
 process(reset,mrs1,mrs2,mrd,datoEscribir)
	begin
	
			registro(0) <= x"0000000f";
			if(reset = '1')then
				prs1 <= (others=>'0');
				prs2 <= (others=>'0');
				registro <= (others => x"0000000f");
				
			else
				prs1 <= registro(conv_integer(mrs1));
				prs2 <= registro(conv_integer(mrs2));
				if(mrd /= "00000")then  
					registro(conv_integer(mrd)) <= datoEscribir;
				end if;
			end if;
			
	end process;

end Behavioral;

