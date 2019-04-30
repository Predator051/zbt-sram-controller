-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : zaz
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\compile\pll1.vhd
-- Generated   : Tue Apr 30 12:20:36 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\src\pll1.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
        use ieee.std_logic_1164.all;
library altera_mf;
        use altera_mf.altera_mf_components.all;

-- other libraries declarations
library ALTERA_MF;

entity pll1 is
  port(
       inclk0 : in std_logic := '0';
       c0 : out std_logic;
       locked : out std_logic
  );
end pll1;

architecture SYN of pll1 is

---- Component declarations -----

component altpll
  generic(
       bandwidth : NATURAL := 0;
       bandwidth_type : STRING := "UNUSED";
       c0_high : NATURAL := 1;
       c0_initial : NATURAL := 1;
       c0_low : NATURAL := 1;
       c0_mode : STRING := "bypass";
       c0_ph : NATURAL := 0;
       c0_test_source : INTEGER := 5;
       c1_high : NATURAL := 1;
       c1_initial : NATURAL := 1;
       c1_low : NATURAL := 1;
       c1_mode : STRING := "bypass";
       c1_ph : NATURAL := 0;
       c1_test_source : INTEGER := 5;
       c1_use_casc_in : STRING := "off";
       c2_high : NATURAL := 1;
       c2_initial : NATURAL := 1;
       c2_low : NATURAL := 1;
       c2_mode : STRING := "bypass";
       c2_ph : NATURAL := 0;
       c2_test_source : INTEGER := 5;
       c2_use_casc_in : STRING := "off";
       c3_high : NATURAL := 1;
       c3_initial : NATURAL := 1;
       c3_low : NATURAL := 1;
       c3_mode : STRING := "bypass";
       c3_ph : NATURAL := 0;
       c3_test_source : INTEGER := 5;
       c3_use_casc_in : STRING := "off";
       c4_high : NATURAL := 1;
       c4_initial : NATURAL := 1;
       c4_low : NATURAL := 1;
       c4_mode : STRING := "bypass";
       c4_ph : NATURAL := 0;
       c4_test_source : INTEGER := 5;
       c4_use_casc_in : STRING := "off";
       c5_high : NATURAL := 1;
       c5_initial : NATURAL := 1;
       c5_low : NATURAL := 1;
       c5_mode : STRING := "bypass";
       c5_ph : NATURAL := 0;
       c5_test_source : INTEGER := 5;
       c5_use_casc_in : STRING := "off";
       charge_pump_current : NATURAL := 2;
       clk0_counter : STRING := "g0";
       clk0_divide_by : POSITIVE := 1;
       clk0_duty_cycle : NATURAL := 50;
       clk0_multiply_by : POSITIVE := 1;
       clk0_output_frequency : NATURAL := 0;
       clk0_phase_shift : STRING := "0";
       clk0_time_delay : STRING := "0";
       clk1_counter : STRING := "g1";
       clk1_divide_by : POSITIVE := 1;
       clk1_duty_cycle : NATURAL := 50;
       clk1_multiply_by : POSITIVE := 1;
       clk1_output_frequency : NATURAL := 0;
       clk1_phase_shift : STRING := "0";
       clk1_time_delay : STRING := "0";
       clk2_counter : STRING := "g2";
       clk2_divide_by : POSITIVE := 1;
       clk2_duty_cycle : NATURAL := 50;
       clk2_multiply_by : POSITIVE := 1;
       clk2_output_frequency : NATURAL := 0;
       clk2_phase_shift : STRING := "0";
       clk2_time_delay : STRING := "0";
       clk3_counter : STRING := "g3";
       clk3_divide_by : POSITIVE := 1;
       clk3_duty_cycle : NATURAL := 50;
       clk3_multiply_by : POSITIVE := 1;
       clk3_phase_shift : STRING := "0";
       clk3_time_delay : STRING := "0";
       clk4_counter : STRING := "l0";
       clk4_divide_by : POSITIVE := 1;
       clk4_duty_cycle : NATURAL := 50;
       clk4_multiply_by : POSITIVE := 1;
       clk4_phase_shift : STRING := "0";
       clk4_time_delay : STRING := "0";
       clk5_counter : STRING := "l1";
       clk5_divide_by : POSITIVE := 1;
       clk5_duty_cycle : NATURAL := 50;
       clk5_multiply_by : POSITIVE := 1;
       clk5_phase_shift : STRING := "0";
       clk5_time_delay : STRING := "0";
       compensate_clock : STRING := "CLK0";
       down_spread : STRING := "0.0";
       e0_high : NATURAL := 1;
       e0_initial : NATURAL := 1;
       e0_low : NATURAL := 1;
       e0_mode : STRING := "bypass";
       e0_ph : NATURAL := 0;
       e0_time_delay : NATURAL := 0;
       e1_high : NATURAL := 1;
       e1_initial : NATURAL := 1;
       e1_low : NATURAL := 1;
       e1_mode : STRING := "bypass";
       e1_ph : NATURAL := 0;
       e1_time_delay : NATURAL := 0;
       e2_high : NATURAL := 1;
       e2_initial : NATURAL := 1;
       e2_low : NATURAL := 1;
       e2_mode : STRING := "bypass";
       e2_ph : NATURAL := 0;
       e2_time_delay : NATURAL := 0;
       e3_high : NATURAL := 1;
       e3_initial : NATURAL := 1;
       e3_low : NATURAL := 1;
       e3_mode : STRING := "bypass";
       e3_ph : NATURAL := 0;
       e3_time_delay : NATURAL := 0;
       enable0_counter : STRING := "l0";
       enable1_counter : STRING := "l0";
       enable_switch_over_counter : STRING := "OFF";
       extclk0_counter : STRING := "e0";
       extclk0_divide_by : POSITIVE := 1;
       extclk0_duty_cycle : NATURAL := 50;
       extclk0_multiply_by : POSITIVE := 1;
       extclk0_phase_shift : STRING := "0";
       extclk0_time_delay : STRING := "0";
       extclk1_counter : STRING := "e1";
       extclk1_divide_by : POSITIVE := 1;
       extclk1_duty_cycle : NATURAL := 50;
       extclk1_multiply_by : POSITIVE := 1;
       extclk1_phase_shift : STRING := "0";
       extclk1_time_delay : STRING := "0";
       extclk2_counter : STRING := "e2";
       extclk2_divide_by : POSITIVE := 1;
       extclk2_duty_cycle : NATURAL := 50;
       extclk2_multiply_by : POSITIVE := 1;
       extclk2_phase_shift : STRING := "0";
       extclk2_time_delay : STRING := "0";
       extclk3_counter : STRING := "e3";
       extclk3_divide_by : POSITIVE := 1;
       extclk3_duty_cycle : NATURAL := 50;
       extclk3_multiply_by : POSITIVE := 1;
       extclk3_phase_shift : STRING := "0";
       extclk3_time_delay : STRING := "0";
       feedback_source : STRING := "EXTCLK0";
       g0_high : NATURAL := 1;
       g0_initial : NATURAL := 1;
       g0_low : NATURAL := 1;
       g0_mode : STRING := "bypass";
       g0_ph : NATURAL := 0;
       g0_time_delay : NATURAL := 0;
       g1_high : NATURAL := 1;
       g1_initial : NATURAL := 1;
       g1_low : NATURAL := 1;
       g1_mode : STRING := "bypass";
       g1_ph : NATURAL := 0;
       g1_time_delay : NATURAL := 0;
       g2_high : NATURAL := 1;
       g2_initial : NATURAL := 1;
       g2_low : NATURAL := 1;
       g2_mode : STRING := "bypass";
       g2_ph : NATURAL := 0;
       g2_time_delay : NATURAL := 0;
       g3_high : NATURAL := 1;
       g3_initial : NATURAL := 1;
       g3_low : NATURAL := 1;
       g3_mode : STRING := "bypass";
       g3_ph : NATURAL := 0;
       g3_time_delay : NATURAL := 0;
       gate_lock_counter : INTEGER := 0;
       gate_lock_signal : STRING := "NO";
       inclk0_input_frequency : POSITIVE;
       inclk1_input_frequency : NATURAL := 0;
       intended_device_family : STRING := "Stratix";
       invalid_lock_multiplier : NATURAL := 5;
       l0_high : NATURAL := 1;
       l0_initial : NATURAL := 1;
       l0_low : NATURAL := 1;
       l0_mode : STRING := "bypass";
       l0_ph : NATURAL := 0;
       l0_time_delay : NATURAL := 0;
       l1_high : NATURAL := 1;
       l1_initial : NATURAL := 1;
       l1_low : NATURAL := 1;
       l1_mode : STRING := "bypass";
       l1_ph : NATURAL := 0;
       l1_time_delay : NATURAL := 0;
       lock_high : NATURAL := 1;
       lock_low : NATURAL := 5;
       loop_filter_c : NATURAL := 5;
       loop_filter_r : STRING := " 1.000000";
       lpm_hint : STRING := "UNUSED";
       lpm_type : STRING := "altpll";
       m : NATURAL := 0;
       m2 : NATURAL := 1;
       m_initial : NATURAL := 1;
       m_ph : NATURAL := 0;
       m_test_source : INTEGER := 5;
       m_time_delay : NATURAL := 0;
       n : NATURAL := 1;
       n2 : NATURAL := 1;
       n_time_delay : NATURAL := 0;
       operation_mode : STRING := "NORMAL";
       pfd_max : NATURAL := 0;
       pfd_min : NATURAL := 0;
       pll_type : STRING := "AUTO";
       port_activeclock : STRING := "PORT_CONNECTIVITY";
       port_areset : STRING := "PORT_CONNECTIVITY";
       port_clk0 : STRING := "PORT_CONNECTIVITY";
       port_clk1 : STRING := "PORT_CONNECTIVITY";
       port_clk2 : STRING := "PORT_CONNECTIVITY";
       port_clk3 : STRING := "PORT_CONNECTIVITY";
       port_clk4 : STRING := "PORT_CONNECTIVITY";
       port_clk5 : STRING := "PORT_CONNECTIVITY";
       port_clkbad0 : STRING := "PORT_CONNECTIVITY";
       port_clkbad1 : STRING := "PORT_CONNECTIVITY";
       port_clkena0 : STRING := "PORT_CONNECTIVITY";
       port_clkena1 : STRING := "PORT_CONNECTIVITY";
       port_clkena2 : STRING := "PORT_CONNECTIVITY";
       port_clkena3 : STRING := "PORT_CONNECTIVITY";
       port_clkena4 : STRING := "PORT_CONNECTIVITY";
       port_clkena5 : STRING := "PORT_CONNECTIVITY";
       port_clkloss : STRING := "PORT_CONNECTIVITY";
       port_clkswitch : STRING := "PORT_CONNECTIVITY";
       port_enable0 : STRING := "PORT_CONNECTIVITY";
       port_enable1 : STRING := "PORT_CONNECTIVITY";
       port_extclk0 : STRING := "PORT_CONNECTIVITY";
       port_extclk1 : STRING := "PORT_CONNECTIVITY";
       port_extclk2 : STRING := "PORT_CONNECTIVITY";
       port_extclk3 : STRING := "PORT_CONNECTIVITY";
       port_extclkena0 : STRING := "PORT_CONNECTIVITY";
       port_extclkena1 : STRING := "PORT_CONNECTIVITY";
       port_extclkena2 : STRING := "PORT_CONNECTIVITY";
       port_extclkena3 : STRING := "PORT_CONNECTIVITY";
       port_fbin : STRING := "PORT_CONNECTIVITY";
       port_inclk0 : STRING := "PORT_CONNECTIVITY";
       port_inclk1 : STRING := "PORT_CONNECTIVITY";
       port_pfdena : STRING := "PORT_CONNECTIVITY";
       port_pllena : STRING := "PORT_CONNECTIVITY";
       port_scanaclr : STRING := "PORT_CONNECTIVITY";
       port_scanclk : STRING := "PORT_CONNECTIVITY";
       port_scandata : STRING := "PORT_CONNECTIVITY";
       port_scandataout : STRING := "PORT_CONNECTIVITY";
       port_scandone : STRING := "PORT_CONNECTIVITY";
       port_scanread : STRING := "PORT_CONNECTIVITY";
       port_scanwrite : STRING := "PORT_CONNECTIVITY";
       port_sclkout0 : STRING := "PORT_CONNECTIVITY";
       port_sclkout1 : STRING := "PORT_CONNECTIVITY";
       primary_clock : STRING := "inclk0";
       qualify_conf_done : STRING := "OFF";
       scan_chain : STRING := "LONG";
       sclkout0_phase_shift : STRING := "0";
       sclkout1_phase_shift : STRING := "0";
       self_reset_on_gated_loss_lock : STRING := "OFF";
       simulation_type : STRING := "functional";
       skip_vco : STRING := "off";
       source_is_pll : STRING := "off";
       spread_frequency : NATURAL := 0;
       ss : NATURAL := 0;
       switch_over_counter : NATURAL := 0;
       switch_over_on_gated_lock : STRING := "OFF";
       switch_over_on_lossclk : STRING := "OFF";
       switch_over_type : STRING := "AUTO";
       valid_lock_multiplier : NATURAL := 1;
       vco_center : NATURAL := 0;
       vco_divide_by : INTEGER := 0;
       vco_max : NATURAL := 0;
       vco_min : NATURAL := 0;
       vco_multiply_by : INTEGER := 0;
       vco_post_scale : NATURAL := 0
  );
  port (
       areset : in STD_LOGIC := '0';
       clkena : in STD_LOGIC_VECTOR(5 downto 0) := (others => '1');
       clkswitch : in STD_LOGIC := '0';
       comparator : in STD_LOGIC := '0';
       extclkena : in STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
       fbin : in STD_LOGIC := '1';
       inclk : in STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
       pfdena : in STD_LOGIC := '1';
       pllena : in STD_LOGIC := '1';
       scanaclr : in STD_LOGIC := '0';
       scanclk : in STD_LOGIC := '0';
       scandata : in STD_LOGIC := '0';
       scanread : in STD_LOGIC := '0';
       scanwrite : in STD_LOGIC := '0';
       activeclock : out STD_LOGIC;
       clk : out STD_LOGIC_VECTOR(5 downto 0);
       clkbad : out STD_LOGIC_VECTOR(1 downto 0);
       clkloss : out STD_LOGIC;
       enable0 : out STD_LOGIC;
       enable1 : out STD_LOGIC;
       extclk : out STD_LOGIC_VECTOR(3 downto 0);
       locked : out STD_LOGIC;
       scandataout : out STD_LOGIC;
       scandone : out STD_LOGIC;
       sclkout0 : out STD_LOGIC;
       sclkout1 : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal sub_wire1 : std_logic;
signal sub_wire2 : std_logic;
signal sub_wire6 : std_logic;
signal sub_wire0 : std_logic_vector (5 downto 0);
signal sub_wire3 : std_logic_vector (0 downto 0);
signal sub_wire3_bv : BIT_VECTOR (0 downto 0);
signal sub_wire4 : std_logic_vector (5 downto 0);
signal sub_wire5 : std_logic_vector (0 downto 0);
signal sub_wire5_bv : BIT_VECTOR (0 downto 0);
signal sub_wire7 : std_logic_vector (1 downto 0);
signal sub_wire8 : std_logic_vector (3 downto 0);

---- Configuration specifications for declared components 

for altpll_component : altpll use entity altera_mf.altpll;

begin

---- User Signal Assignments ----
sub_wire1 <= sub_wire0(0);
sub_wire3_bv(0 downto 0) <= "0";
sub_wire3 <= To_stdlogicvector(sub_wire3_bv);
sub_wire5_bv(0 downto 0) <= "0";
sub_wire5 <= not (To_stdlogicvector(sub_wire5_bv));
sub_wire4 <= sub_wire3(0 downto 0) & sub_wire3(0 downto 0) & sub_wire3(0 downto 0) & sub_wire3(0 downto 0) & sub_wire3(0 downto 0) & sub_wire5(0 downto 0);
sub_wire7 <= sub_wire3(0 downto 0) & sub_wire6;
sub_wire8 <= sub_wire3(0 downto 0) & sub_wire3(0 downto 0) & sub_wire3(0 downto 0) & sub_wire3(0 downto 0);

----  Component instantiations  ----

altpll_component : altpll
  generic map (
       bandwidth_type => "AUTO",
       clk0_divide_by => 1,
       clk0_duty_cycle => 50,
       clk0_multiply_by => 6,
       clk0_phase_shift => "300",
       clk0_time_delay => "0",
       compensate_clock => "CLK0",
       gate_lock_signal => "NO",
       inclk0_input_frequency => 30303,
       intended_device_family => "Stratix",
       invalid_lock_multiplier => 5,
       lock_high => 1,
       lock_low => 5,
       lpm_type => "altpll",
       operation_mode => "NORMAL",
       pll_type => "ENHANCED",
       spread_frequency => 0,
       valid_lock_multiplier => 1
  )
  port map(
       clk => sub_wire0,
       clkena => sub_wire4,
       extclkena => sub_wire8,
       inclk => sub_wire7,
       locked => sub_wire2
  );


---- Terminal assignment ----

    -- Inputs terminals
	sub_wire6 <= inclk0;

    -- Output\buffer terminals
	c0 <= sub_wire1;
	locked <= sub_wire2;


end SYN;
