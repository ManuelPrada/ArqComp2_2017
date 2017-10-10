----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:20 10/10/2017 
-- Design Name: 
-- Module Name:    procesador2 - Behavioral 
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

entity procesador2 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           RFprocesador : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture Behavioral of procesador2 is

COMPONENT sumador
	PORT(
		entradaA : IN std_logic_vector(31 downto 0);
		entradaB : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	COMPONENT nextProgramCounter
	PORT(
		clk : IN std_logic;
		entrada : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

		
	COMPONENT U_control
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		Salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

COMPONENT resgisterfile
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;		
		dwr : IN std_logic_vector(31 downto 0);          
		rsalida1 : OUT std_logic_vector(31 downto 0);
		rsalida2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


COMPONENT MUX
	PORT(
		I : IN std_logic;
		salseu : IN std_logic_vector(31 downto 0);
		salrs2 : IN std_logic_vector(31 downto 0);          
		salmux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT SEU
	PORT(
		Imm : IN std_logic_vector(12 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT Alu
	PORT(
		dato1 : IN std_logic_vector(31 downto 0);
		dato2 : IN std_logic_vector(31 downto 0);
		operacion : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal  sumadorToNPC, npcToPC, pcToIM, imToURS, aluresult, rfToALU1, rfToMUX, seuToMUX, muxToALU:STD_LOGIC_VECTOR (31 downto 0);
signal aluop1: STD_LOGIC_VECTOR (5 downto 0);
begin
Inst_sumador: sumador PORT MAP(
		entradaA => x"00000001",
		entradaB => npcToPC,
		resultado =>sumadorToNPC
		);

Inst_nextProgramCounter: nextProgramCounter PORT MAP(
		clk => clk,
		entrada => sumadorToNPC,
		salida => npcToPC,
		rst => rst
	);

Inst_PC: nextProgramCounter PORT MAP(
		clk => clk,
		entrada => npcToPC,
		salida => pcToIM,
		rst => rst
	);

Inst_instructionMemory: instructionMemory PORT MAP(
		address => pcToIM,
		rst => rst,
		outInstruction => imToURS
	);
	
Inst_U_control: U_control PORT MAP(
		op => imToURS(31 downto 30),
		op3 => imToURS(24 downto 19),
		Salida => aluop1 
	);
	
Inst_resgisterfile: resgisterfile PORT MAP(
		rs1 => imToURS(18 downto 14),
		rs2 => imToURS(4 downto 0),
		rd => imToURS(29 downto 25),
		rst => rst,
		dwr => aluresult,
		rsalida1 => rfToALU1,
		rsalida2 => rfToMUX 
	);

Inst_MUX: MUX PORT MAP(
		I => imToURS(13),
		salseu => seuToMUX,
		salrs2 => rfToMUX,
		salmux => muxToALU
	);

Inst_SEU: SEU PORT MAP(
		Imm => imToURS(12 downto 0),
		Salida => seuToMUX
	);
	
	
Inst_Alu: Alu PORT MAP(
		dato1 => rfToALU1,
		dato2 => muxToALU,
		operacion => aluop1,
		salida => aluresult
	);
	
	RFprocesador<=aluresult; 

end Behavioral;

