----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:30:08 10/16/2017 
-- Design Name: 
-- Module Name:    PSRmd - Behavioral 
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

entity PSRmd is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           aluop1 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc_psr : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRmd;

architecture Behavioral of PSRmd is

begin
process (rst, aluop1, aluresult, crs1, crs2 )

		begin

			if rst = '1' then 

				nzvc_psr <= "0000";

			else

				-- ANDcc or ANDNcc or ORcc or ORNcc or XORcc or XNORcc

				if aluop1 = "001011" or aluop1 = "001100" or aluop1 = "001001" or aluop1 = "001010" or aluop1 = "001101" or aluop1 = "001110" then 
               nzvc_psr(3) <= aluresult(31); -- El signo que traiga.

            if aluresult = "00000000000000000000000000000000" then 
            nzvc_psr(2) <= '1'; -- Porque el resultado da cero.

					else

						nzvc_psr(2) <= '0';

					end if;

					nzvc_psr(1) <= '0'; -- Los operadores logicos no generan overflow ni carry.
               nzvc_psr(0) <= '0';

				end if;

				

				-- ADDcc or ADDxcc

				if aluop1 = "001011" or aluop1 = "001111" then

					nzvc_psr(3) <= aluresult(31);

					if aluresult = "00000000000000000000000000000000" then 
						nzvc_psr(2) <= '1';
						
					else
						nzvc_psr(2) <= '0';

					end if;

					nzvc_psr(1) <= (crs1(31) and crs2(31) and (not aluresult(31))) or ((not crs1(31)) and (not crs2(31)) and aluresult(31));
					nzvc_psr(0) <= (crs1(31) and crs2(31)) or ((not aluresult(31)) and (crs1(31) or crs2(31)));

				end if;

				

				--SUBcc or SUBxcc

				if aluop1 = "001000" or aluop1 = "010000" then
				   nzvc_psr(3) <= aluresult(31);

					if aluop1 = "00000000000000000000000000000000" then 
						nzvc_psr(2) <= '1';
					else
                   nzvc_psr(2) <= '0';
					end if;

					nzvc_psr(1) <= (crs1(31) and (not crs2(31)) and (not aluresult(31))) or ((not crs1(31)) and crs2(31) and aluresult(31));
					nzvc_psr(0) <= ((not crs1(31)) and crs2(31)) or (aluresult(31) and ((not crs1(31)) or crs2(31)));

				end if;

			end if;
				
end process;

end Behavioral;

