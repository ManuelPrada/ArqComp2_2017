
-- VHDL Instantiation Created from source file ProgramCounter.vhd -- 12:18:12 10/10/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ProgramCounter
	PORT(
		clk : IN std_logic;
		entrada : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_ProgramCounter: ProgramCounter PORT MAP(
		clk => ,
		entrada => ,
		salida => ,
		rst => 
	);


