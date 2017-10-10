
-- VHDL Instantiation Created from source file Mux.vhd -- 13:29:58 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Mux
	PORT(
		i : IN std_logic;
		Crs2 : IN std_logic_vector(31 downto 0);
		E_seu : IN std_logic_vector(31 downto 0);          
		S_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Mux: Mux PORT MAP(
		i => ,
		Crs2 => ,
		E_seu => ,
		S_mux => 
	);


