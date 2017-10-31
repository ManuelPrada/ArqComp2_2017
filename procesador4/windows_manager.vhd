----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:59 10/23/2017 
-- Design Name: 
-- Module Name:    windows_manager - Behavioral 
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

use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using

-- arithmetic functions with Signed or Unsigned values

--use IEEE.NUMERIC_STD.ALL;



-- Uncomment the following library declaration if instantiating

-- any Xilinx primitives in this code.

--library UNISIM;

--use UNISIM.VComponents.all;



entity winmanager is

    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (1 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out    STD_LOGIC_VECTOR (1 downto 0):="00");


end winmanager;


architecture Behavioral of winmanager is


signal Rs1Int,Rs2Int,RdInt: integer range 0 to 39:=0;


begin

process(cwp,op,op3,rs1,rs2,rd)

	begin

		if(op = "10") then

			if(op3 = "111100")then--SAVE

				ncwp<=conv_std_logic_vector(conv_integer(cwp) - 1,2);





			elsif(op3 = "111101")then--RESTORE

				ncwp<=conv_std_logic_vector(conv_integer(cwp)+ 1,2);



			else

				ncwp<=cwp;

			end if;

		else

			ncwp<=cwp;

		end if;



		if(rs1>="11000" and rs1<="11111") then--Si es un registro de entrada (r[24] - r[31])

				Rs1Int <= conv_integer(rs1)-(conv_integer(cwp)*16);

		elsif(rs1>="10000" and rs1<="10111") then--Si es un registro de local (r[16] - r[23])

				Rs1Int <= conv_integer(rs1)+(conv_integer(cwp)*16);

		elsif(rs1>="01000" and rs1<="01111") then--Si es un registro de salida (r[8] - r[15])

				Rs1Int <= conv_integer(rs1)+ (conv_integer(cwp)*16);

		elsif(rs1>="00000" and rs1<="00111") then--Si es un registro global (r[0] - r[7])

				Rs1Int <= conv_integer(rs1);

		end if;

		

		if(rs2>="11000" and rs2<="11111") then--Si es un registro de entrada (r[24] - r[31])

				Rs2Int <= conv_integer(rs2)-(conv_integer(cwp)*16);

		elsif(rs2>="10000" and rs2<="10111") then--Si es un registro de local (r[16] - r[23])

				Rs2Int <= conv_integer(rs2)+(conv_integer(cwp)*16);

		elsif(rs2>="01000" and rs2<="01111") then--Si es un registro de salida (r[8] - r[15])

				Rs2Int <= conv_integer(rs2)+ (conv_integer(cwp)*16);

		elsif(rs2>="00000" and rs2<="00111") then--Si es un registro global (r[0] - r[7])

				Rs2Int <= conv_integer(rs2);

		end if;

		

		if(rd>="11000" and rd<="11111") then--Si es un registro de entrada (r[24] - r[31])

				RdInt<= conv_integer(rd)-(conv_integer(cwp)*16);

		elsif(rd>="10000" and rd<="10111") then--Si es un registro de local (r[16] - r[23])

				RdInt<= conv_integer(rd)+(conv_integer(cwp)*16);

		elsif(rd>="01000" and rd<="01111") then--Si es un registro de salida (r[8] - r[15])

				RdInt <= conv_integer(rd)+ (conv_integer(cwp)*16);

		elsif(rd>="00000" and rd<="00111") then--Si es un registro global (r[0] - r[7])

				RdInt <= conv_integer(rd);

		end if;

			

end process;

nrs1 <= conv_std_logic_vector(Rs1Int, 6);

nrs2 <= conv_std_logic_vector(Rs2Int, 6);

nrd <= conv_std_logic_vector(RdInt, 6);



	

end Behavioral;