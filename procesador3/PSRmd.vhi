
-- VHDL Instantiation Created from source file PSRmd.vhd -- 06:14:15 10/17/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSRmd
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		aluop1 : IN std_logic_vector(5 downto 0);
		aluresult : IN std_logic_vector(31 downto 0);          
		nzvc_psr : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_PSRmd: PSRmd PORT MAP(
		crs1 => ,
		crs2 => ,
		rst => ,
		aluop1 => ,
		aluresult => ,
		nzvc_psr => 
	);


