-- megafunction wizard: %ALTCLKLOCK%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altpll 

-- ============================================================
-- File Name: PLL1.vhd
-- Megafunction Name(s):
-- 			altpll
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
-- ************************************************************


--Copyright (C) 1991-2003 Altera Corporation
--Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
--support information,  device programming or simulation file,  and any other
--associated  documentation or information  provided by  Altera  or a partner
--under  Altera's   Megafunction   Partnership   Program  may  be  used  only
--to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
--other  use  of such  megafunction  design,  netlist,  support  information,
--device programming or simulation file,  or any other  related documentation
--or information  is prohibited  for  any  other purpose,  including, but not
--limited to  modification,  reverse engineering,  de-compiling, or use  with
--any other  silicon devices,  unless such use is  explicitly  licensed under
--a separate agreement with  Altera  or a megafunction partner.  Title to the
--intellectual property,  including patents,  copyrights,  trademarks,  trade
--secrets,  or maskworks,  embodied in any such megafunction design, netlist,
--support  information,  device programming or simulation file,  or any other
--related documentation or information provided by  Altera  or a megafunction
--partner, remains with Altera, the megafunction partner, or their respective
--licensors. No other licenses, including any licenses needed under any third
--party's intellectual property, are provided herein.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY PLL1 IS
	PORT
	(
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
END PLL1;


ARCHITECTURE SYN OF pll1 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC ;
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3_bv	: BIT_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire5_bv	: BIT_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire5	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire6	: STD_LOGIC ;
	SIGNAL sub_wire7	: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL sub_wire8	: STD_LOGIC_VECTOR (3 DOWNTO 0);



	COMPONENT altpll
	GENERIC (
		bandwidth_type		: STRING;
		clk0_duty_cycle		: NATURAL;
		lpm_type		: STRING;
		clk0_multiply_by		: NATURAL;
		lock_low		: NATURAL;
		invalid_lock_multiplier		: NATURAL;
		inclk0_input_frequency		: NATURAL;
		gate_lock_signal		: STRING;
		clk0_divide_by		: NATURAL;
		pll_type		: STRING;
		valid_lock_multiplier		: NATURAL;
		clk0_time_delay		: STRING;
		spread_frequency		: NATURAL;
		intended_device_family		: STRING;
		operation_mode		: STRING;
		lock_high		: NATURAL;
		compensate_clock		: STRING;
		clk0_phase_shift		: STRING
	);
	PORT (
			clkena	: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			inclk	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			extclkena	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			locked	: OUT STD_LOGIC ;
			clk	: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	sub_wire3_bv(0 DOWNTO 0) <= "0";
	sub_wire3    <= To_stdlogicvector(sub_wire3_bv);
	sub_wire5_bv(0 DOWNTO 0) <= "0";
	sub_wire5    <= NOT(To_stdlogicvector(sub_wire5_bv));
	sub_wire1    <= sub_wire0(0);
	c0    <= sub_wire1;
	locked    <= sub_wire2;
	sub_wire4    <= sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0) & sub_wire5(0 DOWNTO 0);
	sub_wire6    <= inclk0;
	sub_wire7    <= sub_wire3(0 DOWNTO 0) & sub_wire6;
	sub_wire8    <= sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0) & sub_wire3(0 DOWNTO 0);

	altpll_component : altpll
	GENERIC MAP (
		bandwidth_type => "AUTO",
		clk0_duty_cycle => 50,
		lpm_type => "altpll",
		clk0_multiply_by => 6,
		lock_low => 5,
		invalid_lock_multiplier => 5,
		inclk0_input_frequency => 30303,
		gate_lock_signal => "NO",
		clk0_divide_by => 1,
		pll_type => "ENHANCED",
		valid_lock_multiplier => 1,
		clk0_time_delay => "0",
		spread_frequency => 0,
		intended_device_family => "Stratix",
		operation_mode => "NORMAL",
		lock_high => 1,
		compensate_clock => "CLK0",
		clk0_phase_shift => "300"
	)
	PORT MAP (
		clkena => sub_wire4,
		inclk => sub_wire7,
		extclkena => sub_wire8,
		clk => sub_wire0,
		locked => sub_wire2
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: OUTPUT_FREQ4 STRING "100.000"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT0 STRING "MHz"
-- Retrieval info: PRIVATE: SPREAD_FEATURE_ENABLED STRING "1"
-- Retrieval info: PRIVATE: GLOCKED_COUNTER_EDIT_CHANGED STRING "1"
-- Retrieval info: PRIVATE: USING_PROGRAMMABLE_PHASE_SHIFT NUMERIC "1"
-- Retrieval info: PRIVATE: DIV_FACTOR9 NUMERIC "1"
-- Retrieval info: PRIVATE: USE_CLKENA2 STRING "0"
-- Retrieval info: PRIVATE: MIRROR_CLK0 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT0 STRING "ps"
-- Retrieval info: PRIVATE: INCLK1_FREQ_UNIT_COMBO STRING "MHz"
-- Retrieval info: PRIVATE: SPREAD_USE STRING "0"
-- Retrieval info: PRIVATE: GLOCK_COUNTER_EDIT NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ5 STRING "100.000"
-- Retrieval info: PRIVATE: MIRROR_CLK1 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT1 STRING "MHz"
-- Retrieval info: PRIVATE: USE_CLKENA3 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT1 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE0 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT0 STRING "300.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR0 NUMERIC "6"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE0 STRING "0"
-- Retrieval info: PRIVATE: SPREAD_PERCENT STRING "0.500"
-- Retrieval info: PRIVATE: LOCKED_OUTPUT_CHECK STRING "1"
-- Retrieval info: PRIVATE: PLL_ARESET_CHECK STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ6 STRING "100.000"
-- Retrieval info: PRIVATE: MIRROR_CLK2 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT2 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE0 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK0 STRING "1"
-- Retrieval info: PRIVATE: USE_CLKENA4 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT2 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE1 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT1 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR1 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE1 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT0 STRING "0.00000000"
-- Retrieval info: PRIVATE: BANDWIDTH STRING "0.000"
-- Retrieval info: PRIVATE: BANDWIDTH_USE_CUSTOM STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ7 STRING "100.000"
-- Retrieval info: PRIVATE: MIRROR_CLK3 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT3 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE1 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK1 STRING "0"
-- Retrieval info: PRIVATE: BANDWIDTH_FEATURE_ENABLED STRING "1"
-- Retrieval info: PRIVATE: USE_CLKENA5 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT3 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE2 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT2 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR2 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE2 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT1 STRING "0.00000000"
-- Retrieval info: PRIVATE: SPREAD_FREQ STRING "50.000"
-- Retrieval info: PRIVATE: LONG_SCAN_RADIO STRING "1"
-- Retrieval info: PRIVATE: PLL_ENHPLL_CHECK NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ8 STRING "100.000"
-- Retrieval info: PRIVATE: MIRROR_CLK4 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT4 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE2 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK2 STRING "0"
-- Retrieval info: PRIVATE: SCAN_FEATURE_ENABLED STRING "1"
-- Retrieval info: PRIVATE: PHASE_UNIT NUMERIC "1"
-- Retrieval info: PRIVATE: USE_CLKENA6 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT4 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE3 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT3 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR3 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE3 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT2 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK0 STRING "1"
-- Retrieval info: PRIVATE: INCLK1_FREQ_EDIT_CHANGED STRING "1"
-- Retrieval info: PRIVATE: ZERO_DELAY_RADIO STRING "0"
-- Retrieval info: PRIVATE: PLL_PFDENA_CHECK STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ9 STRING "100.000"
-- Retrieval info: PRIVATE: MIRROR_CLK5 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT5 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE3 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK3 STRING "0"
-- Retrieval info: PRIVATE: FEEDBACK_SOURCE NUMERIC "1"
-- Retrieval info: PRIVATE: USE_CLKENA7 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT5 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE4 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT4 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR4 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE4 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT3 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK1 STRING "0"
-- Retrieval info: PRIVATE: CREATE_CLKBAD_CHECK STRING "0"
-- Retrieval info: PRIVATE: INCLK1_FREQ_EDIT STRING "0.000"
-- Retrieval info: PRIVATE: CUR_DEDICATED_CLK STRING ""
-- Retrieval info: PRIVATE: PLL_FASTPLL_CHECK NUMERIC "0"
-- Retrieval info: PRIVATE: MIRROR_CLK6 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT6 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE4 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK4 STRING "0"
-- Retrieval info: PRIVATE: USE_CLKENA8 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT6 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE5 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT5 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR5 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE5 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT4 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK2 STRING "0"
-- Retrieval info: PRIVATE: ACTIVECLK_CHECK STRING "0"
-- Retrieval info: PRIVATE: BANDWIDTH_FREQ_UNIT STRING "MHz"
-- Retrieval info: PRIVATE: INCLK0_FREQ_UNIT_COMBO STRING "MHz"
-- Retrieval info: PRIVATE: MIRROR_CLK7 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT7 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE5 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK5 STRING "0"
-- Retrieval info: PRIVATE: USE_CLKENA9 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT7 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE6 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT6 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR6 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE6 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT5 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK3 STRING "0"
-- Retrieval info: PRIVATE: GLOCKED_MODE_CHECK STRING "0"
-- Retrieval info: PRIVATE: CUR_FBIN_CLK STRING ""
-- Retrieval info: PRIVATE: NORMAL_MODE_RADIO STRING "1"
-- Retrieval info: PRIVATE: MIRROR_CLK8 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT8 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE6 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK6 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT8 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE7 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT7 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR7 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE7 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT6 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK4 STRING "0"
-- Retrieval info: PRIVATE: DIV_FACTOR0 NUMERIC "1"
-- Retrieval info: PRIVATE: INCLK1_FREQ_UNIT_CHANGED STRING "1"
-- Retrieval info: PRIVATE: EXT_FEEDBACK_RADIO STRING "0"
-- Retrieval info: PRIVATE: PLL_AUTOPLL_CHECK NUMERIC "0"
-- Retrieval info: PRIVATE: MIRROR_CLK9 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_UNIT9 STRING "MHz"
-- Retrieval info: PRIVATE: JUMP2PAGE7 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK7 STRING "0"
-- Retrieval info: PRIVATE: PHASE_SHIFT_UNIT9 STRING "ps"
-- Retrieval info: PRIVATE: DUTY_CYCLE8 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT8 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR8 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE8 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT7 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK5 STRING "0"
-- Retrieval info: PRIVATE: DIV_FACTOR1 NUMERIC "1"
-- Retrieval info: PRIVATE: CLKLOSS_CHECK STRING "0"
-- Retrieval info: PRIVATE: BANDWIDTH_USE_AUTO STRING "1"
-- Retrieval info: PRIVATE: SHORT_SCAN_RADIO STRING "0"
-- Retrieval info: PRIVATE: JUMP2PAGE8 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK8 STRING "0"
-- Retrieval info: PRIVATE: DUTY_CYCLE9 STRING "50.00000000"
-- Retrieval info: PRIVATE: PHASE_SHIFT9 STRING "0.00000000"
-- Retrieval info: PRIVATE: MULT_FACTOR9 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ_MODE9 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT8 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK6 STRING "0"
-- Retrieval info: PRIVATE: DIV_FACTOR2 NUMERIC "1"
-- Retrieval info: PRIVATE: CLKSWITCH_CHECK STRING "0"
-- Retrieval info: PRIVATE: SPREAD_FREQ_UNIT STRING "KHz"
-- Retrieval info: PRIVATE: PLL_ENA_CHECK STRING "0"
-- Retrieval info: PRIVATE: INCLK0_FREQ_EDIT STRING "33.000"
-- Retrieval info: PRIVATE: JUMP2PAGE9 STRING "General/Modes"
-- Retrieval info: PRIVATE: STICKY_CLK9 STRING "0"
-- Retrieval info: PRIVATE: TIME_SHIFT9 STRING "0.00000000"
-- Retrieval info: PRIVATE: USE_CLK7 STRING "0"
-- Retrieval info: PRIVATE: DIV_FACTOR3 NUMERIC "1"
-- Retrieval info: PRIVATE: CNX_NO_COMPENSATE_RADIO STRING "0"
-- Retrieval info: PRIVATE: INT_FEEDBACK__MODE_RADIO STRING "1"
-- Retrieval info: PRIVATE: JUMP2PAGE STRING "Clock switchover"
-- Retrieval info: PRIVATE: USE_CLK8 STRING "0"
-- Retrieval info: PRIVATE: DIV_FACTOR4 NUMERIC "1"
-- Retrieval info: PRIVATE: OUTPUT_FREQ0 STRING "100.000"
-- Retrieval info: PRIVATE: DEV_FAMILY STRING "Stratix"
-- Retrieval info: PRIVATE: USE_CLK9 STRING "0"
-- Retrieval info: PRIVATE: DIV_FACTOR5 NUMERIC "1"
-- Retrieval info: PRIVATE: PRIMARY_CLK_COMBO STRING "inclk0"
-- Retrieval info: PRIVATE: CREATE_INCLK1_CHECK STRING "0"
-- Retrieval info: PRIVATE: SACN_INPUTS_CHECK STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ1 STRING "100.000"
-- Retrieval info: PRIVATE: SWITCHOVER_FEATURE_ENABLED STRING "1"
-- Retrieval info: PRIVATE: GLOCKED_FEATURE_ENABLED STRING "1"
-- Retrieval info: PRIVATE: USING_FREQUENCY NUMERIC "0"
-- Retrieval info: PRIVATE: DIV_FACTOR6 NUMERIC "1"
-- Retrieval info: PRIVATE: SWITCHOVER_COUNT_EDIT NUMERIC "1"
-- Retrieval info: PRIVATE: BANDWIDTH_PRESET STRING "Low"
-- Retrieval info: PRIVATE: OUTPUT_FREQ2 STRING "100.000"
-- Retrieval info: PRIVATE: DISPLAY_FREQUENCY STRING "33"
-- Retrieval info: PRIVATE: DIV_FACTOR7 NUMERIC "1"
-- Retrieval info: PRIVATE: USE_CLKENA0 STRING "0"
-- Retrieval info: PRIVATE: OUTPUT_FREQ3 STRING "100.000"
-- Retrieval info: PRIVATE: DEVICE_FAMILY NUMERIC "9"
-- Retrieval info: PRIVATE: DIV_FACTOR8 NUMERIC "1"
-- Retrieval info: PRIVATE: USE_CLKENA1 STRING "0"
-- Retrieval info: PRIVATE: CLKBAD_SWITCHOVER_CHECK STRING "0"
-- Retrieval info: PRIVATE: BANDWIDTH_USE_PRESET STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: BANDWIDTH_TYPE STRING "AUTO"
-- Retrieval info: CONSTANT: CLK0_DUTY_CYCLE NUMERIC "50"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altpll"
-- Retrieval info: CONSTANT: CLK0_MULTIPLY_BY NUMERIC "6"
-- Retrieval info: CONSTANT: LOCK_LOW NUMERIC "5"
-- Retrieval info: CONSTANT: INVALID_LOCK_MULTIPLIER NUMERIC "5"
-- Retrieval info: CONSTANT: INCLK0_INPUT_FREQUENCY NUMERIC "30303"
-- Retrieval info: CONSTANT: GATE_LOCK_SIGNAL STRING "NO"
-- Retrieval info: CONSTANT: CLK0_DIVIDE_BY NUMERIC "1"
-- Retrieval info: CONSTANT: PLL_TYPE STRING "ENHANCED"
-- Retrieval info: CONSTANT: VALID_LOCK_MULTIPLIER NUMERIC "1"
-- Retrieval info: CONSTANT: CLK0_TIME_DELAY STRING "0"
-- Retrieval info: CONSTANT: SPREAD_FREQUENCY NUMERIC "0"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix"
-- Retrieval info: CONSTANT: OPERATION_MODE STRING "NORMAL"
-- Retrieval info: CONSTANT: LOCK_HIGH NUMERIC "1"
-- Retrieval info: CONSTANT: COMPENSATE_CLOCK STRING "CLK0"
-- Retrieval info: CONSTANT: CLK0_PHASE_SHIFT STRING "300"
-- Retrieval info: USED_PORT: c0 0 0 0 0 OUTPUT VCC "c0"
-- Retrieval info: USED_PORT: @clk 0 0 6 0 OUTPUT VCC "@clk[5..0]"
-- Retrieval info: USED_PORT: inclk0 0 0 0 0 INPUT GND "inclk0"
-- Retrieval info: USED_PORT: locked 0 0 0 0 OUTPUT GND "locked"
-- Retrieval info: USED_PORT: @extclk 0 0 4 0 OUTPUT VCC "@extclk[3..0]"
-- Retrieval info: USED_PORT: @inclk 0 0 2 0 INPUT VCC "@inclk[1..0]"
-- Retrieval info: CONNECT: locked 0 0 0 0 @locked 0 0 0 0
-- Retrieval info: CONNECT: @inclk 0 0 1 0 inclk0 0 0 0 0
-- Retrieval info: CONNECT: @extclkena 0 0 1 1 GND 0 0 0 0
-- Retrieval info: CONNECT: @clkena 0 0 1 4 GND 0 0 0 0
-- Retrieval info: CONNECT: @clkena 0 0 1 1 GND 0 0 0 0
-- Retrieval info: CONNECT: c0 0 0 0 0 @clk 0 0 1 0
-- Retrieval info: CONNECT: @extclkena 0 0 1 2 GND 0 0 0 0
-- Retrieval info: CONNECT: @clkena 0 0 1 5 GND 0 0 0 0
-- Retrieval info: CONNECT: @clkena 0 0 1 2 GND 0 0 0 0
-- Retrieval info: CONNECT: @clkena 0 0 1 0 VCC 0 0 0 0
-- Retrieval info: CONNECT: @inclk 0 0 1 1 GND 0 0 0 0
-- Retrieval info: CONNECT: @extclkena 0 0 1 3 GND 0 0 0 0
-- Retrieval info: CONNECT: @extclkena 0 0 1 0 GND 0 0 0 0
-- Retrieval info: CONNECT: @clkena 0 0 1 3 GND 0 0 0 0
