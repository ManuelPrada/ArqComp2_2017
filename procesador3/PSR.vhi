
-- VHDL Instantiation Created from source file PSR.vhd -- 06:08:14 10/17/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSR
	PORT(
		rst : IN std_logic;
		nzvc_psr : IN std_logic_vector(3 downto 0);          
		Alu_acarreo : OUT std_logic
		);
	END COMPONENT;

	Inst_PSR: PSR PORT MAP(
		rst => ,
		nzvc_psr => ,
		Alu_acarreo => 
	);


