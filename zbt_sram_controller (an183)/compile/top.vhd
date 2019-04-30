-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Controller
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\compile\top.vhd
-- Generated   : Mon Apr  8 15:38:03 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\src\top.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library an183;
        use an183.gen_utils.all;
        use an183.conversions.all;
library ieee;
        use ieee.std_logic_1164.all;
        use ieee.vital_timing.all;
        use ieee.vital_primitives.all;
        use an183.conversions.all;

entity top is
  generic(
       ASIZE:INTEGER:=16;
BWSIZE:INTEGER:=4;
DSIZE:INTEGER:=16;
FLOWTHROUGH:INTEGER:=0 
  );
  port(
       ADDR_ADV_LD_N : in std_logic;
       RD_WR_N : in std_logic;
       RESET_N : in std_logic;
       clk : in std_logic;
       ADDR : in std_logic_vector(ASIZE - 1 downto 0);
       DATA_IN : in std_logic_vector(DSIZE - 1 downto 0);
       DM : in std_logic_vector(BWSIZE - 1 downto 0);
       ADV_LD_N : out std_logic;
       RW_N : out std_logic;
       BW_N : out std_logic_vector(BWSIZE - 1 downto 0);
       DATA_OUT : out std_logic_vector(DSIZE - 1 downto 0);
       SA : out std_logic_vector(ASIZE - 1 downto 0);
       DQ : inout std_logic_vector(DSIZE - 1 downto 0)
  );
end top;

architecture RTL of top is

---- Component declarations -----

component idt71v3556
  generic(
       InstancePath : STRING := DefaultInstancePath;
       MsgOn : BOOLEAN := DefaultMsgOn;
       SeverityMode : SEVERITY_LEVEL := WARNING;
       TimingChecksOn : BOOLEAN := DefaultTimingChecks;
       TimingModel : STRING := DefaultTimingModel;
       XOn : BOOLEAN := DefaultXon;
       thold_A0_CLK : VitalDelayType := UnitDelay;
       thold_ADV_CLK : VitalDelayType := UnitDelay;
       thold_BWANeg_CLK : VitalDelayType := UnitDelay;
       thold_CE2_CLK : VitalDelayType := UnitDelay;
       thold_CLKENNeg_CLK : VitalDelayType := UnitDelay;
       thold_DQA0_CLK : VitalDelayType := UnitDelay;
       thold_R_CLK : VitalDelayType := UnitDelay;
       tipd_A0 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A1 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A10 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A11 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A12 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A13 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A14 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A15 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A2 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A3 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A4 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A5 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A6 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A7 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A8 : VitalDelayType01 := VitalZeroDelay01;
       tipd_A9 : VitalDelayType01 := VitalZeroDelay01;
       tipd_ADV : VitalDelayType01 := VitalZeroDelay01;
       tipd_BWANeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_BWBNeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_BWCNeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_BWDNeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_CE1Neg : VitalDelayType01 := VitalZeroDelay01;
       tipd_CE2 : VitalDelayType01 := VitalZeroDelay01;
       tipd_CE2Neg : VitalDelayType01 := VitalZeroDelay01;
       tipd_CLK : VitalDelayType01 := VitalZeroDelay01;
       tipd_CLKENNeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQA0 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQA1 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQA2 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQA3 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQB0 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQB1 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQB2 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQB3 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQC0 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQC1 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQC2 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQC3 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQD0 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQD1 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQD2 : VitalDelayType01 := VitalZeroDelay01;
       tipd_DQD3 : VitalDelayType01 := VitalZeroDelay01;
       tipd_LBONeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_OENeg : VitalDelayType01 := VitalZeroDelay01;
       tipd_R : VitalDelayType01 := VitalZeroDelay01;
       tpd_CLK_DQA0 : VitalDelayType01Z := UnitDelay01Z;
       tpd_OENeg_DQA0 : VitalDelayType01Z := UnitDelay01Z;
       tperiod_CLK_posedge : VitalDelayType := UnitDelay;
       tpw_CLK_negedge : VitalDelayType := UnitDelay;
       tpw_CLK_posedge : VitalDelayType := UnitDelay;
       tsetup_A0_CLK : VitalDelayType := UnitDelay;
       tsetup_ADV_CLK : VitalDelayType := UnitDelay;
       tsetup_BWANeg_CLK : VitalDelayType := UnitDelay;
       tsetup_CE2_CLK : VitalDelayType := UnitDelay;
       tsetup_CLKENNeg_CLK : VitalDelayType := UnitDelay;
       tsetup_DQA0_CLK : VitalDelayType := UnitDelay;
       tsetup_R_CLK : VitalDelayType := UnitDelay
  );
  port (
       A0 : in STD_LOGIC := 'U';
       A1 : in STD_LOGIC := 'U';
       A10 : in STD_LOGIC := 'U';
       A11 : in STD_LOGIC := 'U';
       A12 : in STD_LOGIC := 'U';
       A13 : in STD_LOGIC := 'U';
       A14 : in STD_LOGIC := 'U';
       A15 : in STD_LOGIC := 'U';
       A2 : in STD_LOGIC := 'U';
       A3 : in STD_LOGIC := 'U';
       A4 : in STD_LOGIC := 'U';
       A5 : in STD_LOGIC := 'U';
       A6 : in STD_LOGIC := 'U';
       A7 : in STD_LOGIC := 'U';
       A8 : in STD_LOGIC := 'U';
       A9 : in STD_LOGIC := 'U';
       ADV : in STD_LOGIC := 'U';
       BWANeg : in STD_LOGIC := 'U';
       BWBNeg : in STD_LOGIC := 'U';
       BWCNeg : in STD_LOGIC := 'U';
       BWDNeg : in STD_LOGIC := 'U';
       CE1Neg : in STD_LOGIC := 'U';
       CE2 : in STD_LOGIC := 'U';
       CE2Neg : in STD_LOGIC := 'U';
       CLK : in STD_LOGIC := 'U';
       CLKENNeg : in STD_LOGIC := 'U';
       LBONeg : in STD_LOGIC := '1';
       OENeg : in STD_LOGIC := 'U';
       R : in STD_LOGIC := 'U';
       DQA0 : inout STD_LOGIC := 'U';
       DQA1 : inout STD_LOGIC := 'U';
       DQA2 : inout STD_LOGIC := 'U';
       DQA3 : inout STD_LOGIC := 'U';
       DQB0 : inout STD_LOGIC := 'U';
       DQB1 : inout STD_LOGIC := 'U';
       DQB2 : inout STD_LOGIC := 'U';
       DQB3 : inout STD_LOGIC := 'U';
       DQC0 : inout STD_LOGIC := 'U';
       DQC1 : inout STD_LOGIC := 'U';
       DQC2 : inout STD_LOGIC := 'U';
       DQC3 : inout STD_LOGIC := 'U';
       DQD0 : inout STD_LOGIC := 'U';
       DQD1 : inout STD_LOGIC := 'U';
       DQD2 : inout STD_LOGIC := 'U';
       DQD3 : inout STD_LOGIC := 'U'
  );
end component;
component PLL1
  port (
       inclk0 : in STD_LOGIC := '0';
       c0 : out STD_LOGIC;
       locked : out STD_LOGIC
  );
end component;
component zbt_ctrl_top
  generic(
       ASIZE : INTEGER := 16;
       BWSIZE : INTEGER := 4;
       DSIZE : INTEGER := 16;
       FLOWTHROUGH : INTEGER := 0
  );
  port (
       ADDR : in STD_LOGIC_VECTOR(ASIZE-1 downto 0);
       ADDR_ADV_LD_N : in STD_LOGIC;
       DATA_IN : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       DM : in STD_LOGIC_VECTOR(BWSIZE-1 downto 0);
       RD_WR_N : in STD_LOGIC;
       RESET_N : in STD_LOGIC;
       clk : in STD_LOGIC;
       ADV_LD_N : out STD_LOGIC;
       BW_N : out STD_LOGIC_VECTOR(BWSIZE-1 downto 0);
       DATA_OUT : out STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       RW_N : out STD_LOGIC;
       SA : out STD_LOGIC_VECTOR(ASIZE-1 downto 0);
       DQ : inout STD_LOGIC_VECTOR(DSIZE-1 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal adv_ld_n_m : std_logic;
signal clkzbt : std_logic;
signal locked : std_logic;
signal PLL_clk : std_logic;
signal rw_n_m : std_logic;
signal bw_n_m : std_logic_vector (BWSIZE - 1 downto 0);
signal sat : std_logic_vector (ASIZE - 1 downto 0) := SA;

begin

---- User Signal Assignments ----
BW_N <= bw_n_m;
sat <= ADDR;

----  Component instantiations  ----

PLL1_inst : PLL1
  port map(
       c0 => PLL_clk,
       inclk0 => clk,
       locked => locked
  );

RW_N <= rw_n_m;

ADV_LD_N <= adv_ld_n_m;

idt71v3556p : idt71v3556
  port map(
       A0 => sat(0),
       A1 => sat(1),
       A10 => sat(10),
       A11 => sat(11),
       A12 => sat(12),
       A13 => sat(13),
       A14 => sat(14),
       A15 => sat(15),
       A2 => sat(2),
       A3 => sat(3),
       A4 => sat(4),
       A5 => sat(5),
       A6 => sat(6),
       A7 => sat(7),
       A8 => sat(8),
       A9 => sat(9),
       ADV => adv_ld_n_m,
       BWANeg => bw_n_m(0),
       BWBNeg => bw_n_m(1),
       BWCNeg => bw_n_m(2),
       BWDNeg => bw_n_m(3),
       CLK => clk,
       DQA0 => DQ(0),
       DQA1 => DQ(1),
       DQA2 => DQ(2),
       DQA3 => DQ(3),
       DQB0 => DQ(4),
       DQB1 => DQ(5),
       DQB2 => DQ(6),
       DQB3 => DQ(7),
       DQC0 => DQ(8),
       DQC1 => DQ(9),
       DQC2 => DQ(10),
       DQC3 => DQ(11),
       DQD0 => DQ(12),
       DQD1 => DQ(13),
       DQD2 => DQ(14),
       DQD3 => DQ(15),
       R => rw_n_m
  );

zbt_ctrl_top_inst1 : zbt_ctrl_top
  generic map (
       ASIZE => ASIZE,
       BWSIZE => BWSIZE,
       DSIZE => DSIZE,
       FLOWTHROUGH => FLOWTHROUGH
  )
  port map(
       ADDR => ADDR( ASIZE - 1 downto 0 ),
       ADDR_ADV_LD_N => ADDR_ADV_LD_N,
       ADV_LD_N => ADV_LD_N,
       BW_N => BW_N( BWSIZE - 1 downto 0 ),
       DATA_IN => DATA_IN( DSIZE - 1 downto 0 ),
       DATA_OUT => DATA_OUT( DSIZE - 1 downto 0 ),
       DM => DM( BWSIZE - 1 downto 0 ),
       DQ => DQ( DSIZE - 1 downto 0 ),
       RD_WR_N => RD_WR_N,
       RESET_N => RESET_N,
       RW_N => RW_N,
       SA => SA( ASIZE - 1 downto 0 ),
       clk => PLL_clk
  );


end RTL;
