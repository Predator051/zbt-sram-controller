-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Controller
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\compile\idt71v3556.vhd
-- Generated   : Mon Apr  8 15:37:59 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\src\idt71v3556.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library controller;
        use controller.gen_utils.all;
        use controller.conversions.all;
library ieee;
        use ieee.std_logic_1164.all;
        use ieee.vital_timing.all;
        use ieee.vital_primitives.all;
        use controller.conversions.all;

entity idt71v3556 is
  generic(
       InstancePath:STRING:=DefaultInstancePath;
MsgOn:BOOLEAN:=DefaultMsgOn;
SeverityMode:SEVERITY_LEVEL:=WARNING;
thold_A0_CLK:VitalDelayType:=UnitDelay;
thold_ADV_CLK:VitalDelayType:=UnitDelay;
thold_BWANeg_CLK:VitalDelayType:=UnitDelay;
thold_CE2_CLK:VitalDelayType:=UnitDelay;
thold_CLKENNeg_CLK:VitalDelayType:=UnitDelay;
thold_DQA0_CLK:VitalDelayType:=UnitDelay;
thold_R_CLK:VitalDelayType:=UnitDelay;
TimingChecksOn:BOOLEAN:=DefaultTimingChecks;
TimingModel:STRING:=DefaultTimingModel;
tipd_A0:VitalDelayType01:=VitalZeroDelay01;
tipd_A1:VitalDelayType01:=VitalZeroDelay01;
tipd_A10:VitalDelayType01:=VitalZeroDelay01;
tipd_A11:VitalDelayType01:=VitalZeroDelay01;
tipd_A12:VitalDelayType01:=VitalZeroDelay01;
tipd_A13:VitalDelayType01:=VitalZeroDelay01;
tipd_A14:VitalDelayType01:=VitalZeroDelay01;
tipd_A15:VitalDelayType01:=VitalZeroDelay01;
tipd_A2:VitalDelayType01:=VitalZeroDelay01;
tipd_A3:VitalDelayType01:=VitalZeroDelay01;
tipd_A4:VitalDelayType01:=VitalZeroDelay01;
tipd_A5:VitalDelayType01:=VitalZeroDelay01;
tipd_A6:VitalDelayType01:=VitalZeroDelay01;
tipd_A7:VitalDelayType01:=VitalZeroDelay01;
tipd_A8:VitalDelayType01:=VitalZeroDelay01;
tipd_A9:VitalDelayType01:=VitalZeroDelay01;
tipd_ADV:VitalDelayType01:=VitalZeroDelay01;
tipd_BWANeg:VitalDelayType01:=VitalZeroDelay01;
tipd_BWBNeg:VitalDelayType01:=VitalZeroDelay01;
tipd_BWCNeg:VitalDelayType01:=VitalZeroDelay01;
tipd_BWDNeg:VitalDelayType01:=VitalZeroDelay01;
tipd_CE1Neg:VitalDelayType01:=VitalZeroDelay01;
tipd_CE2:VitalDelayType01:=VitalZeroDelay01;
tipd_CE2Neg:VitalDelayType01:=VitalZeroDelay01;
tipd_CLK:VitalDelayType01:=VitalZeroDelay01;
tipd_CLKENNeg:VitalDelayType01:=VitalZeroDelay01;
tipd_DQA0:VitalDelayType01:=VitalZeroDelay01;
tipd_DQA1:VitalDelayType01:=VitalZeroDelay01;
tipd_DQA2:VitalDelayType01:=VitalZeroDelay01;
tipd_DQA3:VitalDelayType01:=VitalZeroDelay01;
tipd_DQB0:VitalDelayType01:=VitalZeroDelay01;
tipd_DQB1:VitalDelayType01:=VitalZeroDelay01;
tipd_DQB2:VitalDelayType01:=VitalZeroDelay01;
tipd_DQB3:VitalDelayType01:=VitalZeroDelay01;
tipd_DQC0:VitalDelayType01:=VitalZeroDelay01;
tipd_DQC1:VitalDelayType01:=VitalZeroDelay01;
tipd_DQC2:VitalDelayType01:=VitalZeroDelay01;
tipd_DQC3:VitalDelayType01:=VitalZeroDelay01;
tipd_DQD0:VitalDelayType01:=VitalZeroDelay01;
tipd_DQD1:VitalDelayType01:=VitalZeroDelay01;
tipd_DQD2:VitalDelayType01:=VitalZeroDelay01;
tipd_DQD3:VitalDelayType01:=VitalZeroDelay01;
tipd_LBONeg:VitalDelayType01:=VitalZeroDelay01;
tipd_OENeg:VitalDelayType01:=VitalZeroDelay01;
tipd_R:VitalDelayType01:=VitalZeroDelay01;
tpd_CLK_DQA0:VitalDelayType01Z:=UnitDelay01Z;
tpd_OENeg_DQA0:VitalDelayType01Z:=UnitDelay01Z;
tperiod_CLK_posedge:VitalDelayType:=UnitDelay;
tpw_CLK_negedge:VitalDelayType:=UnitDelay;
tpw_CLK_posedge:VitalDelayType:=UnitDelay;
tsetup_A0_CLK:VitalDelayType:=UnitDelay;
tsetup_ADV_CLK:VitalDelayType:=UnitDelay;
tsetup_BWANeg_CLK:VitalDelayType:=UnitDelay;
tsetup_CE2_CLK:VitalDelayType:=UnitDelay;
tsetup_CLKENNeg_CLK:VitalDelayType:=UnitDelay;
tsetup_DQA0_CLK:VitalDelayType:=UnitDelay;
tsetup_R_CLK:VitalDelayType:=UnitDelay;
XOn:BOOLEAN:=DefaultXon 
  );
  port(
       A0 : in std_logic := 'U';
       A1 : in std_logic := 'U';
       A10 : in std_logic := 'U';
       A11 : in std_logic := 'U';
       A12 : in std_logic := 'U';
       A13 : in std_logic := 'U';
       A14 : in std_logic := 'U';
       A15 : in std_logic := 'U';
       A2 : in std_logic := 'U';
       A3 : in std_logic := 'U';
       A4 : in std_logic := 'U';
       A5 : in std_logic := 'U';
       A6 : in std_logic := 'U';
       A7 : in std_logic := 'U';
       A8 : in std_logic := 'U';
       A9 : in std_logic := 'U';
       ADV : in std_logic := 'U';
       BWANeg : in std_logic := 'U';
       BWBNeg : in std_logic := 'U';
       BWCNeg : in std_logic := 'U';
       BWDNeg : in std_logic := 'U';
       CE1Neg : in std_logic := 'U';
       CE2 : in std_logic := 'U';
       CE2Neg : in std_logic := 'U';
       CLK : in std_logic := 'U';
       CLKENNeg : in std_logic := 'U';
       LBONeg : in std_logic := '1';
       OENeg : in std_logic := 'U';
       R : in std_logic := 'U';
       DQA0 : inout std_logic := 'U';
       DQA1 : inout std_logic := 'U';
       DQA2 : inout std_logic := 'U';
       DQA3 : inout std_logic := 'U';
       DQB0 : inout std_logic := 'U';
       DQB1 : inout std_logic := 'U';
       DQB2 : inout std_logic := 'U';
       DQB3 : inout std_logic := 'U';
       DQC0 : inout std_logic := 'U';
       DQC1 : inout std_logic := 'U';
       DQC2 : inout std_logic := 'U';
       DQC3 : inout std_logic := 'U';
       DQD0 : inout std_logic := 'U';
       DQD1 : inout std_logic := 'U';
       DQD2 : inout std_logic := 'U';
       DQD3 : inout std_logic := 'U'
  );
-- Entity declarations --
attribute VITAL_LEVEL0 of idt71v3556 : entity is TRUE;

end idt71v3556;

architecture rtl of idt71v3556 is

---- Architecture declarations -----
attribute VITAL_LEVEL0 of rtl : architecture is TRUE;
constant partID : STRING := "idt71v3156";


---- Signal declarations used on the diagram ----

signal A0_ipd : std_ulogic := 'U';
signal A10_ipd : std_ulogic := 'U';
signal A11_ipd : std_ulogic := 'U';
signal A12_ipd : std_ulogic := 'U';
signal A13_ipd : std_ulogic := 'U';
signal A14_ipd : std_ulogic := 'U';
signal A1_ipd : std_ulogic := 'U';
signal A2_ipd : std_ulogic := 'U';
signal A3_ipd : std_ulogic := 'U';
signal A4_ipd : std_ulogic := 'U';
signal A5_ipd : std_ulogic := 'U';
signal A6_ipd : std_ulogic := 'U';
signal A7_ipd : std_ulogic := 'U';
signal A8_ipd : std_ulogic := 'U';
signal A9_ipd : std_ulogic := 'U';
signal ADV_ipd : std_ulogic := 'U';
signal BWANeg_ipd : std_ulogic := 'U';
signal BWBNeg_ipd : std_ulogic := 'U';
signal BWCNeg_ipd : std_ulogic := 'U';
signal BWDNeg_ipd : std_ulogic := 'U';
signal CE1Neg_ipd : std_ulogic := 'U';
signal CE2Neg_ipd : std_ulogic := 'U';
signal CE2_ipd : std_ulogic := 'U';
signal CLKENNeg_ipd : std_ulogic := 'U';
signal CLK_ipd : std_ulogic := 'U';
signal DQA0_ipd : std_ulogic := 'U';
signal DQA1_ipd : std_ulogic := 'U';
signal DQA2_ipd : std_ulogic := 'U';
signal DQB0_ipd : std_ulogic := 'U';
signal DQB1_ipd : std_ulogic := 'U';
signal DQB2_ipd : std_ulogic := 'U';
signal DQC0_ipd : std_ulogic := 'U';
signal DQC1_ipd : std_ulogic := 'U';
signal DQC2_ipd : std_ulogic := 'U';
signal DQD0_ipd : std_ulogic := 'U';
signal DQD1_ipd : std_ulogic := 'U';
signal DQD2_ipd : std_ulogic := 'U';
signal LBONeg_ipd : std_ulogic := '1';
signal OENeg_ipd : std_ulogic := 'U';
signal R_ipd : std_ulogic := 'U';

begin

---- User Signal Assignments ----
Behavior: block is
                         port (BWDNIn : IN std_ulogic := 'U';
                               BWCNIn : IN std_ulogic := 'U';
                               BWBNIn : IN std_ulogic := 'U';
                               BWANIn : IN std_ulogic := 'U';
                               DatDIn : IN std_logic_vector(3 downto 0);
                               DatCIn : IN std_logic_vector(3 downto 0);
                               DatBIn : IN std_logic_vector(3 downto 0);
                               DatAIn : IN std_logic_vector(3 downto 0);
                               DataOut : OUT std_logic_vector(15 downto 0) := (others => 'Z');
                               CLKIn : IN std_ulogic := 'U';
                               CKENIn : IN std_ulogic := 'U';
                               AddressIn : IN std_logic_vector(15 downto 0);
                               OENegIn : IN std_ulogic := 'U';
                               RIn : IN std_ulogic := 'U';
                               ADVIn : IN std_ulogic := 'U';
                               CE2In : IN std_ulogic := 'U';
                               LBONegIn : IN std_ulogic := '1';
                               CE1NegIn : IN std_ulogic := 'U';
                               CE2NegIn : IN std_ulogic := 'U');
                         port map (BWDNIn => BWDNeg_ipd,
                                   BWCNIn => BWCNeg_ipd,
                                   BWBNIn => BWBNeg_ipd,
                                   BWANIn => BWANeg_ipd,
                                   CLKIn => CLK_ipd,
                                   CKENIn => CLKENNeg_ipd,
                                   OENegIn => OENeg_ipd,
                                   RIn => R_ipd,
                                   ADVIn => ADV_ipd,
                                   CE2In => CE2_ipd,
                                   LBONegIn => LBONeg_ipd,
                                   CE1NegIn => CE1Neg_ipd,
                                   CE2NegIn => CE2Neg_ipd,
                                   DataOut(0) => DQA0,
                                   DataOut(1) => DQA1,
                                   DataOut(2) => DQA2,
                                   DataOut(3) => DQA3,
                                   DataOut(4) => DQB0,
                                   DataOut(5) => DQB1,
                                   DataOut(6) => DQB2,
                                   DataOut(7) => DQB3,
                                   DataOut(8) => DQC0,
                                   DataOut(9) => DQC1,
                                   DataOut(10) => DQC2,
                                   DataOut(11) => DQC3,
                                   DataOut(12) => DQD0,
                                   DataOut(13) => DQD1,
                                   DataOut(14) => DQD2,
                                   DataOut(15) => DQD3,
                                   DatAIn(0) => DQA0_ipd,
                                   DatAIn(1) => DQA1_ipd,
                                   DatAIn(2) => DQA2_ipd,
                                   DatAIn(3) => DQA3_ipd,
                                   DatBIn(0) => DQB0_ipd,
                                   DatBIn(1) => DQB1_ipd,
                                   DatBIn(2) => DQB2_ipd,
                                   DatBIn(3) => DQB3_ipd,
                                   DatCIn(0) => DQC0_ipd,
                                   DatCIn(1) => DQC1_ipd,
                                   DatCIn(2) => DQC2_ipd,
                                   DatCIn(3) => DQC3_ipd,
                                   DatDIn(0) => DQD0_ipd,
                                   DatDIn(1) => DQD1_ipd,
                                   DatDIn(2) => DQD2_ipd,
                                   DatDIn(3) => DQD3_ipd,
                                   AddressIn(0) => A0_ipd,
                                   AddressIn(1) => A1_ipd,
                                   AddressIn(2) => A2_ipd,
                                   AddressIn(3) => A3_ipd,
                                   AddressIn(4) => A4_ipd,
                                   AddressIn(5) => A5_ipd,
                                   AddressIn(6) => A6_ipd,
                                   AddressIn(7) => A7_ipd,
                                   AddressIn(8) => A8_ipd,
                                   AddressIn(9) => A9_ipd,
                                   AddressIn(10) => A10_ipd,
                                   AddressIn(11) => A11_ipd,
                                   AddressIn(12) => A12_ipd,
                                   AddressIn(13) => A13_ipd,
                                   AddressIn(14) => A14_ipd,
                                   AddressIn(15) => A15_ipd);
                         type mem_state is (desel, begin_rd, begin_wr, burst_rd, burst_wr);
                         signal state : mem_state;
                         type sequence is array (0 to 3) of INTEGER range - 3 to 3;
                         type seqtab is array (0 to 3) of sequence;
                         constant il0 : sequence := (0,1,2,3);
                         constant il1 : sequence := (0,- 1,2,1);
                         constant il2 : sequence := (0,1,- 2,- 1);
                         constant il3 : sequence := (0,- 1,- 2,- 3);
                         constant il : seqtab := (il0,il1,il2,il3);
                         constant ln0 : sequence := (0,1,2,3);
                         constant ln1 : sequence := (0,1,2,- 1);
                         constant ln2 : sequence := (0,1,- 2,- 1);
                         constant ln3 : sequence := (0,- 3,- 2,- 1);
                         constant ln : seqtab := (ln0,ln1,ln2,ln3);
                         signal Burst_Seq : seqtab;
                         signal D_zd : std_logic_vector(15 downto 0);
                       begin
                         Burst_Setup : process
                         begin
                           if (LBONegIn = '1') then
                              Burst_Seq <= il;
                           else 
                              Burst_Seq <= ln;
                           end if;
                           wait;
                         end process;
                         Behavior : process (BWDNIn,BWCNIn,BWBNIn,BWANIn,DatDIn,DatCIn,DatBIn,DatAIn,CLKIn,CKENIn,AddressIn,RIn,OENegIn,ADVIn,CE2In,CE1NegIn,CE2NegIn)
                           type command_type is (ds, burst, read, write);
                           variable Tviol_BWDN_CLK : X01 := '0';
                           variable TD_BWDN_CLK : VitalTimingDataType;
                           variable Tviol_BWCN_CLK : X01 := '0';
                           variable TD_BWCN_CLK : VitalTimingDataType;
                           variable Tviol_BWBN_CLK : X01 := '0';
                           variable TD_BWBN_CLK : VitalTimingDataType;
                           variable Tviol_BWAN_CLK : X01 := '0';
                           variable TD_BWAN_CLK : VitalTimingDataType;
                           variable Tviol_CKENIn_CLK : X01 := '0';
                           variable TD_CKENIn_CLK : VitalTimingDataType;
                           variable Tviol_ADVIn_CLK : X01 := '0';
                           variable TD_ADVIn_CLK : VitalTimingDataType;
                           variable Tviol_CE1NegIn_CLK : X01 := '0';
                           variable TD_CE1NegIn_CLK : VitalTimingDataType;
                           variable Tviol_CE2NegIn_CLK : X01 := '0';
                           variable TD_CE2NegIn_CLK : VitalTimingDataType;
                           variable Tviol_CE2In_CLK : X01 := '0';
                           variable TD_CE2In_CLK : VitalTimingDataType;
                           variable Tviol_RIn_CLK : X01 := '0';
                           variable TD_RIn_CLK : VitalTimingDataType;
                           variable Tviol_DatDIn_CLK : X01 := '0';
                           variable TD_DatDIn_CLK : VitalTimingDataType;
                           variable Tviol_DatCIn_CLK : X01 := '0';
                           variable TD_DatCIn_CLK : VitalTimingDataType;
                           variable Tviol_DatBIn_CLK : X01 := '0';
                           variable TD_DatBIn_CLK : VitalTimingDataType;
                           variable Tviol_DatAIn_CLK : X01 := '0';
                           variable TD_DatAIn_CLK : VitalTimingDataType;
                           variable Tviol_AddressIn_CLK : X01 := '0';
                           variable TD_AddressIn_CLK : VitalTimingDataType;
                           variable Pviol_CLK : X01 := '0';
                           variable PD_CLK : VitalPeriodDataType := VitalPeriodDataInit;
                           type MemStore is array (0 to 64726) of INTEGER range - 2 to 511;
                           variable MemDataA : MemStore;
                           variable MemDataB : MemStore;
                           variable MemDataC : MemStore;
                           variable MemDataD : MemStore;
                           variable MemAddr : NATURAL range 0 to 64726;
                           variable MemAddr1 : NATURAL range 0 to 64726;
                           variable startaddr : NATURAL range 0 to 64726;
                           variable Burst_Cnt : NATURAL range 0 to 4 := 0;
                           variable memstart : NATURAL range 0 to 3 := 0;
                           variable offset : INTEGER range - 3 to 3 := 0;
                           variable command : command_type;
                           variable BWD1 : UX01;
                           variable BWC1 : UX01;
                           variable BWB1 : UX01;
                           variable BWA1 : UX01;
                           variable BWD2 : UX01;
                           variable BWC2 : UX01;
                           variable BWB2 : UX01;
                           variable BWA2 : UX01;
                           variable wr1 : BOOLEAN := false;
                           variable wr2 : BOOLEAN := false;
                           variable wr3 : BOOLEAN := false;
                           variable Violation : X01 := '0';
                           variable OBuf1 : std_logic_vector(15 downto 0) := (others => 'Z');
                           variable OBuf2 : std_logic_vector(15 downto 0) := (others => 'Z');
                         begin
                           if (TimingChecksOn) then
                              VitalSetupHoldCheck(TestSignal => BWDNIn,TestSignalName => "BWD",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_BWANeg_CLK,SetupLow => tsetup_BWANeg_CLK,HoldHigh => thold_BWANeg_CLK,HoldLow => thold_BWANeg_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_BWDN_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_BWDN_CLK);
                              VitalSetupHoldCheck(TestSignal => BWCNIn,TestSignalName => "BWC",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_BWANeg_CLK,SetupLow => tsetup_BWANeg_CLK,HoldHigh => thold_BWANeg_CLK,HoldLow => thold_BWANeg_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_BWCN_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_BWCN_CLK);
                              VitalSetupHoldCheck(TestSignal => BWBNIn,TestSignalName => "BWB",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_BWANeg_CLK,SetupLow => tsetup_BWANeg_CLK,HoldHigh => thold_BWANeg_CLK,HoldLow => thold_BWANeg_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_BWBN_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_BWBN_CLK);
                              VitalSetupHoldCheck(TestSignal => BWANIn,TestSignalName => "BWA",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_BWANeg_CLK,SetupLow => tsetup_BWANeg_CLK,HoldHigh => thold_BWANeg_CLK,HoldLow => thold_BWANeg_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_BWAN_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_BWAN_CLK);
                              VitalSetupHoldCheck(TestSignal => CKENIn,TestSignalName => "CLKENNeg",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_CLKENNeg_CLK,SetupLow => tsetup_CLKENNeg_CLK,HoldHigh => thold_CLKENNeg_CLK,HoldLow => thold_CLKENNeg_CLK,CheckEnabled => TRUE,RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_CKENIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_CKENIn_CLK);
                              VitalSetupHoldCheck(TestSignal => ADVIn,TestSignalName => "ADV",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_ADV_CLK,SetupLow => tsetup_ADV_CLK,HoldHigh => thold_ADV_CLK,HoldLow => thold_ADV_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_ADVIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_ADVIn_CLK);
                              VitalSetupHoldCheck(TestSignal => CE1NegIn,TestSignalName => "CE1Neg",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_CE2_CLK,SetupLow => tsetup_CE2_CLK,HoldHigh => thold_CE2_CLK,HoldLow => thold_CE2_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_CE1NegIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_CE1NegIn_CLK);
                              VitalSetupHoldCheck(TestSignal => CE2NegIn,TestSignalName => "CE2Neg",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_CE2_CLK,SetupLow => tsetup_CE2_CLK,HoldHigh => thold_CE2_CLK,HoldLow => thold_CE2_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_CE2NegIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_CE2NegIn_CLK);
                              VitalSetupHoldCheck(TestSignal => CE2In,TestSignalName => "CE2",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_CE2_CLK,SetupLow => tsetup_CE2_CLK,HoldHigh => thold_CE2_CLK,HoldLow => thold_CE2_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_CE2In_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_CE2In_CLK);
                              VitalSetupHoldCheck(TestSignal => RIn,TestSignalName => "R",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_R_CLK,SetupLow => tsetup_R_CLK,HoldHigh => thold_R_CLK,HoldLow => thold_R_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_RIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_RIn_CLK);
                              VitalSetupHoldCheck(TestSignal => AddressIn,TestSignalName => "Address",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_A0_CLK,SetupLow => tsetup_A0_CLK,HoldHigh => thold_A0_CLK,HoldLow => thold_A0_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_AddressIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_AddressIn_CLK);
                              VitalSetupHoldCheck(TestSignal => DatDIn,TestSignalName => "DatD",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_DQA0_CLK,SetupLow => tsetup_DQA0_CLK,HoldHigh => thold_DQA0_CLK,HoldLow => thold_DQA0_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_DatDIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_DatDIn_CLK);
                              VitalSetupHoldCheck(TestSignal => DatCIn,TestSignalName => "DatC",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_DQA0_CLK,SetupLow => tsetup_DQA0_CLK,HoldHigh => thold_DQA0_CLK,HoldLow => thold_DQA0_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_DatCIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_DatCIn_CLK);
                              VitalSetupHoldCheck(TestSignal => DatBIn,TestSignalName => "DatB",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_DQA0_CLK,SetupLow => tsetup_DQA0_CLK,HoldHigh => thold_DQA0_CLK,HoldLow => thold_DQA0_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_DatBIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_DatBIn_CLK);
                              VitalSetupHoldCheck(TestSignal => DatAIn,TestSignalName => "DatA",RefSignal => CLKIn,RefSignalName => "CLK",SetupHigh => tsetup_DQA0_CLK,SetupLow => tsetup_DQA0_CLK,HoldHigh => thold_DQA0_CLK,HoldLow => thold_DQA0_CLK,CheckEnabled => (CKENIn = '0'),RefTransition => '/',HeaderMsg => InstancePath & partID,TimingData => TD_DatAIn_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Tviol_DatAIn_CLK);
                              VitalPeriodPulseCheck(TestSignal => CLKIn,TestSignalName => "CLK",Period => tperiod_CLK_posedge,PulseWidthLow => tpw_CLK_negedge,PulseWidthHigh => tpw_CLK_posedge,PeriodData => PD_CLK,XOn => XOn,MsgOn => MsgOn,Violation => Pviol_CLK,HeaderMsg => InstancePath & partID,CheckEnabled => (CKENIn = '0'));
                              Violation := Pviol_CLK or Tviol_DatAIn_CLK or Tviol_DatBIn_CLK or Tviol_DatCIn_CLK or Tviol_DatDIn_CLK or Tviol_AddressIn_CLK or Tviol_RIn_CLK or Tviol_CE2In_CLK or Tviol_CE2NegIn_CLK or Tviol_CE1NegIn_CLK or Tviol_ADVIn_CLK or Tviol_CKENIn_CLK or Tviol_BWAN_CLK or Tviol_BWBN_CLK or Tviol_BWCN_CLK or Tviol_BWDN_CLK;
                              assert Violation = '0' report InstancePath & partID & ": simulation may be" & " inaccurate due to timing violations" severity SeverityMode;
                           end if;
                           if (rising_edge(CLKIn) and CKENIn = '0') then
                              assert (not (Is_X(BWDNIn))) report InstancePath & partID & ": Unusable value for BWDN" severity SeverityMode;
                              assert (not (Is_X(BWCNIn))) report InstancePath & partID & ": Unusable value for BWCN" severity SeverityMode;
                              assert (not (Is_X(BWBNIn))) report InstancePath & partID & ": Unusable value for BWBN" severity SeverityMode;
                              assert (not (Is_X(BWANIn))) report InstancePath & partID & ": Unusable value for BWAN" severity SeverityMode;
                              assert (not (Is_X(RIn))) report InstancePath & partID & ": Unusable value for R" severity SeverityMode;
                              assert (not (Is_X(ADVIn))) report InstancePath & partID & ": Unusable value for ADV" severity SeverityMode;
                              assert (not (Is_X(CE2In))) report InstancePath & partID & ": Unusable value for CE2" severity SeverityMode;
                              assert (not (Is_X(CE1NegIn))) report InstancePath & partID & ": Unusable value for CE1Neg" severity SeverityMode;
                              assert (not (Is_X(CE2NegIn))) report InstancePath & partID & ": Unusable value for CE2Neg" severity SeverityMode;
                              if ((ADVIn = '0') and (CE1NegIn = '1' or CE2NegIn = '1' or CE2In = '0')) then
                                 command := ds;
                              elsif (CE1NegIn = '0' and CE2NegIn = '0' and CE2In = '1' and ADVIn = '0') then
                                 if (RIn = '1') then
                                    command := read;
                                 else 
                                    command := write;
                                 end if;
                              elsif (ADVIn = '1') and (CE1NegIn = '0' and CE2NegIn = '0' and CE2In = '1') then
                                 command := burst;
                              else 
                                 assert false report InstancePath & partID & ": Could not decode " & "command." severity SeverityMode;
                              end if;
                              wr3 := wr2;
                              wr2 := wr1;
                              wr1 := false;
                              if (wr3) then
                                 if (BWA2 = '0') then
                                    if Violation = 'X' then
                                       MemDataA(MemAddr1) := - 1;
                                    else 
                                       MemDataA(MemAddr1) := to_nat(DatAIn);
                                    end if;
                                 end if;
                                 if (BWB2 = '0') then
                                    if Violation = 'X' then
                                       MemDataB(MemAddr1) := - 1;
                                    else 
                                       MemDataB(MemAddr1) := to_nat(DatBIn);
                                    end if;
                                 end if;
                                 if (BWC2 = '0') then
                                    if Violation = 'X' then
                                       MemDataC(MemAddr1) := - 1;
                                    else 
                                       MemDataC(MemAddr1) := to_nat(DatCIn);
                                    end if;
                                 end if;
                                 if (BWD2 = '0') then
                                    if Violation = 'X' then
                                       MemDataD(MemAddr1) := - 1;
                                    else 
                                       MemDataD(MemAddr1) := to_nat(DatDIn);
                                    end if;
                                 end if;
                              end if;
                              MemAddr1 := MemAddr;
                              OBuf2 := OBuf1;
                              case state is 
                                when desel => 
                                   case command is 
                                     when ds => 
                                        OBuf1 := (others => 'Z');
                                     when read => 
                                        state <= begin_rd;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                     when write => 
                                        state <= begin_wr;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        OBuf1 := (others => 'Z');
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                     when burst => 
                                        OBuf1 := (others => 'Z');
                                   end case;
                                when begin_rd => 
                                   Burst_Cnt := 0;
                                   case command is 
                                     when ds => 
                                        state <= desel;
                                        OBuf1 := (others => 'Z');
                                     when read => 
                                        state <= begin_rd;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                     when write => 
                                        state <= begin_wr;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        OBuf1 := (others => 'Z');
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                     when burst => 
                                        state <= burst_rd;
                                        Burst_Cnt := Burst_Cnt + 1;
                                        if (Burst_Cnt = 4) then
                                           Burst_Cnt := 0;
                                        end if;
                                        offset := Burst_Seq(memstart)(Burst_Cnt);
                                        MemAddr := startaddr + offset;
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                   end case;
                                when begin_wr => 
                                   BWA2 := BWA1;
                                   BWB2 := BWB1;
                                   BWC2 := BWC1;
                                   BWD2 := BWD1;
                                   Burst_Cnt := 0;
                                   case command is 
                                     when ds => 
                                        state <= desel;
                                        OBuf1 := (others => 'Z');
                                     when read => 
                                        state <= begin_rd;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                     when write => 
                                        state <= begin_wr;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        OBuf1 := (others => 'Z');
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                     when burst => 
                                        state <= burst_wr;
                                        Burst_Cnt := Burst_Cnt + 1;
                                        if (Burst_Cnt = 4) then
                                           Burst_Cnt := 0;
                                        end if;
                                        offset := Burst_Seq(memstart)(Burst_Cnt);
                                        MemAddr := startaddr + offset;
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                   end case;
                                when burst_rd => 
                                   case command is 
                                     when ds => 
                                        state <= desel;
                                        OBuf1 := (others => 'Z');
                                     when read => 
                                        state <= begin_rd;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                     when write => 
                                        state <= begin_wr;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        OBuf1 := (others => 'Z');
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                     when burst => 
                                        Burst_Cnt := Burst_Cnt + 1;
                                        if (Burst_Cnt = 4) then
                                           Burst_Cnt := 0;
                                        end if;
                                        offset := Burst_Seq(memstart)(Burst_Cnt);
                                        MemAddr := startaddr + offset;
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                   end case;
                                when burst_wr => 
                                   case command is 
                                     when ds => 
                                        state <= desel;
                                        OBuf1 := (others => 'Z');
                                     when read => 
                                        state <= begin_rd;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        if MemDataA(MemAddr) = - 2 then
                                           OBuf1(3 downto 0) := (others => 'U');
                                        elsif MemDataA(MemAddr) = - 1 then
                                           OBuf1(3 downto 0) := (others => 'X');
                                        else 
                                           OBuf1(3 downto 0) := to_slv(MemDataA(MemAddr),9);
                                        end if;
                                        if MemDataB(MemAddr) = - 2 then
                                           OBuf1(7 downto 4) := (others => 'U');
                                        elsif MemDataB(MemAddr) = - 1 then
                                           OBuf1(7 downto 4) := (others => 'X');
                                        else 
                                           OBuf1(7 downto 4) := to_slv(MemDataB(MemAddr),9);
                                        end if;
                                        if MemDataC(MemAddr) = - 2 then
                                           OBuf1(11 downto 8) := (others => 'U');
                                        elsif MemDataC(MemAddr) = - 1 then
                                           OBuf1(11 downto 8) := (others => 'X');
                                        else 
                                           OBuf1(11 downto 8) := to_slv(MemDataC(MemAddr),9);
                                        end if;
                                        if MemDataD(MemAddr) = - 2 then
                                           OBuf1(15 downto 12) := (others => 'U');
                                        elsif MemDataD(MemAddr) = - 1 then
                                           OBuf1(15 downto 12) := (others => 'X');
                                        else 
                                           OBuf1(15 downto 12) := to_slv(MemDataD(MemAddr),9);
                                        end if;
                                     when write => 
                                        state <= begin_wr;
                                        MemAddr := to_nat(AddressIn);
                                        startaddr := MemAddr;
                                        memstart := to_nat(AddressIn(1 downto 0));
                                        OBuf1 := (others => 'Z');
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                     when burst => 
                                        Burst_Cnt := Burst_Cnt + 1;
                                        if (Burst_Cnt = 4) then
                                           Burst_Cnt := 0;
                                        end if;
                                        offset := Burst_Seq(memstart)(Burst_Cnt);
                                        MemAddr := startaddr + offset;
                                        BWA1 := BWANIn;
                                        BWB1 := BWBNIn;
                                        BWC1 := BWCNIn;
                                        BWD1 := BWDNIn;
                                        wr1 := TRUE;
                                   end case;
                              end case;
                              if (OENegIn = '0') then
                                 D_zd <= (others => 'Z'), OBuf2 after 1ns;
                              end if;
                           end if;
                           if (OENegIn = '1') then
                              D_zd <= (others => 'Z');
                           else 
                              D_zd <= OBuf2;
                           end if;
                         end process;
                         DataOutBlk : for i in 15 downto 0 generate
                             DataOut_Delay : process (D_zd(i))
                               variable D_GlitchData : VitalGlitchDataArrayType(15 downto 0);
                             begin
                               VitalPathDelay01Z(OutSignal => DataOut(i),OutSignalName => "Data",OutTemp => D_zd(i),Mode => VitalTransport,GlitchData => D_GlitchData(i),Paths => (1 => (InputChangeTime => CLKIn'LAST_EVENT,PathDelay => tpd_CLK_DQA0,PathCondition => OENegIn = '0'),2 => (InputChangeTime => OENegIn'LAST_EVENT,PathDelay => tpd_OENeg_DQA0,PathCondition => TRUE)));
                             end process;
                         end generate DataOutBlk;
                       end block Behavior;                      
WireDelay: block is
                       begin
                         w_1 : VitalWireDelay(A0_ipd,A0,tipd_A0);
                         w_2 : VitalWireDelay(A1_ipd,A1,tipd_A1);
                         w_3 : VitalWireDelay(A2_ipd,A2,tipd_A2);
                         w_4 : VitalWireDelay(A3_ipd,A3,tipd_A3);
                         w_5 : VitalWireDelay(A4_ipd,A4,tipd_A4);
                         w_6 : VitalWireDelay(A5_ipd,A5,tipd_A5);
                         w_7 : VitalWireDelay(A6_ipd,A6,tipd_A6);
                         w_8 : VitalWireDelay(A7_ipd,A7,tipd_A7);
                         w_9 : VitalWireDelay(A8_ipd,A8,tipd_A8);
                         w_10 : VitalWireDelay(A9_ipd,A9,tipd_A9);
                         w_11 : VitalWireDelay(A10_ipd,A10,tipd_A10);
                         w_12 : VitalWireDelay(A11_ipd,A11,tipd_A11);
                         w_13 : VitalWireDelay(A12_ipd,A12,tipd_A12);
                         w_14 : VitalWireDelay(A13_ipd,A13,tipd_A13);
                         w_15 : VitalWireDelay(A14_ipd,A14,tipd_A14);
                         w_16 : VitalWireDelay(A15_ipd,A15,tipd_A15);
                         w_21 : VitalWireDelay(DQA0_ipd,DQA0,tipd_DQA0);
                         w_22 : VitalWireDelay(DQA1_ipd,DQA1,tipd_DQA1);
                         w_23 : VitalWireDelay(DQA2_ipd,DQA2,tipd_DQA2);
                         w_24 : VitalWireDelay(DQA3_ipd,DQA3,tipd_DQA3);
                         w_31 : VitalWireDelay(DQB0_ipd,DQB0,tipd_DQB0);
                         w_32 : VitalWireDelay(DQB1_ipd,DQB1,tipd_DQB1);
                         w_33 : VitalWireDelay(DQB2_ipd,DQB2,tipd_DQB2);
                         w_34 : VitalWireDelay(DQB3_ipd,DQB3,tipd_DQB3);
                         w_41 : VitalWireDelay(DQC0_ipd,DQC0,tipd_DQC0);
                         w_42 : VitalWireDelay(DQC1_ipd,DQC1,tipd_DQC1);
                         w_43 : VitalWireDelay(DQC2_ipd,DQC2,tipd_DQC2);
                         w_44 : VitalWireDelay(DQC3_ipd,DQC3,tipd_DQC3);
                         w_51 : VitalWireDelay(DQD0_ipd,DQD0,tipd_DQD0);
                         w_52 : VitalWireDelay(DQD1_ipd,DQD1,tipd_DQD1);
                         w_53 : VitalWireDelay(DQD2_ipd,DQD2,tipd_DQD2);
                         w_54 : VitalWireDelay(DQD3_ipd,DQD3,tipd_DQD3);
                         w_61 : VitalWireDelay(ADV_ipd,ADV,tipd_ADV);
                         w_62 : VitalWireDelay(R_ipd,R,tipd_R);
                         w_63 : VitalWireDelay(CLKENNeg_ipd,CLKENNeg,tipd_CLKENNeg);
                         w_64 : VitalWireDelay(BWDNeg_ipd,BWDNeg,tipd_BWDNeg);
                         w_65 : VitalWireDelay(BWCNeg_ipd,BWCNeg,tipd_BWCNeg);
                         w_66 : VitalWireDelay(BWBNeg_ipd,BWBNeg,tipd_BWBNeg);
                         w_67 : VitalWireDelay(BWANeg_ipd,BWANeg,tipd_BWANeg);
                         w_68 : VitalWireDelay(CE1Neg_ipd,CE1Neg,tipd_CE1Neg);
                         w_69 : VitalWireDelay(CE2Neg_ipd,CE2Neg,tipd_CE2Neg);
                         w_70 : VitalWireDelay(CE2_ipd,CE2,tipd_CE2);
                         w_71 : VitalWireDelay(CLK_ipd,CLK,tipd_CLK);
                         w_72 : VitalWireDelay(LBONeg_ipd,LBONeg,tipd_LBONeg);
                         w_73 : VitalWireDelay(OENeg_ipd,OENeg,tipd_OENeg);
                       end block WireDelay;                      

end rtl;
