----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:11 10/02/2017 
-- Design Name: 
-- Module Name:    U_control - Behavioral 
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

entity U_control is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Salida : out  STD_LOGIC_VECTOR (5 downto 0));
end U_control;

architecture Behavioral of U_control is

begin
process(op,op3)
begin
  if(op="10")then
  case op3 is
  when "000000" =>salida<="000000";--add
  when "000100" =>salida<="000001";--sub
  when "000010" =>salida<="000010";--or
  when "000110" =>salida<="000011";--orn
  when "000001" =>salida<="000100";--and
  when "000101" =>salida<="000101";--andn
  when "000011" =>salida<="000110";--xor
  when "000111" =>salida<="000111";--xnor
  when "010000" =>salida<="001000";--addcc
  when "010100" =>salida<="001001";--subcc
  when "010010" =>salida<="001010";--orcc
  when "010110" =>salida<="001011";--orncc
  when "010001" =>salida<="001100";--andcc
  when "010101" =>salida<="001101";--andncc
  when "010011" =>salida<="001110";--xorcc
  when "010111" =>salida<="001111";--xnorcc
  when "011000" =>salida<="010000";--addxcc
  when "011100" =>salida<="010001";--subxcc

  when others=>salida<="111111";
  
  end case;
  end if;

end process;
end Behavioral;

