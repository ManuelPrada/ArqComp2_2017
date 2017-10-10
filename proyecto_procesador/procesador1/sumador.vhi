
-- VHDL Instantiation Created from source file sumador.vhd -- 09:57:41 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sumador
	PORT(
		EntradaA : IN std_logic_vector(31 downto 0);
		EntradaB : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_sumador: sumador PORT MAP(
		EntradaA => ,
		EntradaB => ,
		Salida => 
	);


