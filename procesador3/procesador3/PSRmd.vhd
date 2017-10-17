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
           icc_PSR : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRmd;

architecture Behavioral of PSRmd is

begin


end Behavioral;

