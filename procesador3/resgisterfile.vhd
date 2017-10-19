----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:02 10/02/2017 
-- Design Name: 
-- Module Name:    resgisterfile - Behavioral 
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

entity resgisterfile is
Port ( 
           
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  rst : in  STD_LOGIC;
           dwr : in STD_LOGIC_VECTOR (31 downto 0);
           rsalida1 : out  STD_LOGIC_VECTOR (31 downto 0);
           rsalida2 : out  STD_LOGIC_VECTOR (31 downto 0));
end resgisterfile;

architecture Behavioral of resgisterfile is

type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal rgs : ram_type :=(others => x"00000000");

begin

process(rst,rs1,rs2,rd,dwr)
	begin
	
			if(rst = '1')then
				rsalida1 <= (others=>'0');
				rsalida2 <= (others=>'0');

				rgs <= (others => x"00000000");
			else
				rsalida1 <= rgs(conv_integer(rs1));
				rsalida2 <= rgs(conv_integer(rs2));
				if(rd /= "000000")then
					rgs(conv_integer(rd)) <= dwr;
				end if;
			end if;

end process;


end Behavioral;

