----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:04 10/09/2017 
-- Design Name: 
-- Module Name:    Procesador2 - arq_procesador2 
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

entity Procesador2 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           RF_prosedador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador2;

architecture arq_procesador2 of Procesador2 is
COMPONENT sumador
	PORT(
		EntradaA : IN std_logic_vector(31 downto 0);
		EntradaB : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
		
		END COMPONENT;
		
	COMPONENT ProgramCounter
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
		reset : IN std_logic;          
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
		reset : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		rsalida1 : OUT std_logic_vector(31 downto 0);
		rsalida2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
COMPONENT Mux
	PORT(
		i : IN std_logic;
		Crs2 : IN std_logic_vector(31 downto 0);
		E_seu : IN std_logic_vector(31 downto 0);          
		S_mux : OUT std_logic_vector(31 downto 0)
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

	

signal sumadorToNCP, ncpToPC, pcToIM, imToURS, aluResult,rfToALU1, rfToMUX, seuToMUX, muxToALU:STD_LOGIC_VECTOR (31 downto 0);
signal aluop1 : STD_LOGIC_VECTOR (5 downto 0);
begin

Inst_sumador: sumador PORT MAP(
		EntradaA => x"00000001",
		EntradaB => ncpToPC,
		Salida => sumadorToNCP
	);

Inst_ProgramCounter: ProgramCounter PORT MAP(
		clk => clk,
		entrada => sumadorToNCP,
		salida => ncpToPC,
		rst => rst
	);
	
Inst_PCounter: ProgramCounter PORT MAP(
		clk => clk,
		entrada => ncpToPC,
		salida => pcToIM,
		rst => rst
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => pctoIM,
		reset => rst,
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
		reset => rst,
		dwr => aluResult,
		rsalida1 => rfToALU1,
		rsalida2 => rfToMUX
	);
	
Inst_Mux: Mux PORT MAP(
		i => imToURS(13),
		Crs2 => rfToMUX,
		E_seu => seuToMUX,
		S_mux => muxToALU
	);


Inst_SEU: SEU PORT MAP(
		Imm => imToURS(12 downto 0),
		Salida => seuToMUX
	);


Inst_Alu: Alu PORT MAP(
		dato1 => rfToALU1,
		dato2 => muxToALU,
		operacion => aluop1,
		salida => aluResult
	);

RF_prosedador<=aluResult;

end arq_procesador2;

