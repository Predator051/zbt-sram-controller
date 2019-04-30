-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : zaz
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : f:\my_design\zaza\zaz\compile\main.vhd
-- Generated   : Mon May  9 19:05:42 2016
-- From        : f:\my_design\zaza\zaz\src\main.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library zaz;
        use zaz.gen_utils.all;
        use zaz.conversions.all;
library ieee;
        use ieee.std_logic_1164.all;
        use ieee.vital_timing.all;
        use ieee.vital_primitives.all;
        use zaz.conversions.all;

entity main is
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
end main;

architecture RTL of main is

---- Component declarations -----

component top
  generic(
       ASIZE : INTEGER := 16;
       BWSIZE : INTEGER := 4;
       DSIZE : INTEGER := 32;
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

signal clkm : std_logic;

begin

----  Component instantiations  ----

TOP_T : top
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
       clk => clkm
  );


---- Terminal assignment ----

    -- Inputs terminals
	clkm <= clk;


end RTL;
