
-- VHDL Instantiation Created from source file Alu.vhd -- 13:35:37 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Alu
	PORT(
		dato1 : IN std_logic_vector(31 downto 0);
		dato2 : IN std_logic_vector(31 downto 0);
		operacion : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Alu: Alu PORT MAP(
		dato1 => ,
		dato2 => ,
		operacion => ,
		salida => 
	);


