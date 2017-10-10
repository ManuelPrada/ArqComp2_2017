
-- VHDL Instantiation Created from source file resgisterfile.vhd -- 13:19:24 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_resgisterfile: resgisterfile PORT MAP(
		rs1 => ,
		rs2 => ,
		rd => ,
		reset => ,
		dwr => ,
		rsalida1 => ,
		rsalida2 => 
	);


