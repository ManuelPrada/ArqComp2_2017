
-- VHDL Instantiation Created from source file U_control.vhd -- 12:27:24 10/10/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT U_control
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		Salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_U_control: U_control PORT MAP(
		op => ,
		op3 => ,
		Salida => 
	);


