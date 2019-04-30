-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Controller
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\compile\zbt_ctrl_top.vhd
-- Generated   : Mon Apr  8 15:38:05 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\src\zbt_ctrl_top.bde
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

entity zbt_ctrl_top is
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
end zbt_ctrl_top;

architecture RTL of zbt_ctrl_top is

---- Component declarations -----

component addr_ctrl_out
  generic(
       ASIZE : INTEGER := 16;
       BWSIZE : INTEGER := 4
  );
  port (
       clk : in STD_LOGIC;
       lb_addr : in STD_LOGIC_VECTOR(ASIZE-1 downto 0);
       lb_adv_ld_n : in STD_LOGIC;
       lb_bw : in STD_LOGIC_VECTOR(BWSIZE-1 downto 0);
       lb_rw_n : in STD_LOGIC;
       reset : in STD_LOGIC;
       ram_addr : out STD_LOGIC_VECTOR(ASIZE-1 downto 0);
       ram_adv_ld_n : out STD_LOGIC;
       ram_bw_n : out STD_LOGIC_VECTOR(BWSIZE-1 downto 0);
       ram_rw_n : out STD_LOGIC
  );
end component;
component data_inout
  generic(
       BWSIZE : INTEGER := 4;
       DSIZE : INTEGER := 16
  );
  port (
       clk : in STD_LOGIC;
       ctrl_in_rw_n : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       data_in : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       reset : in STD_LOGIC;
       read_data : out STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       dq : inout STD_LOGIC_VECTOR(DSIZE-1 downto 0)
  );
end component;
component pipe_delay
  generic(
       BWSIZE : INTEGER := 4;
       DSIZE : INTEGER := 16;
       FLOWTHROUGH : INTEGER := 0
  );
  port (
       clk : in STD_LOGIC;
       lb_data_in : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       lb_rw_n : in STD_LOGIC;
       ram_data_out : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       reset : in STD_LOGIC;
       delay_data_in : out STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       delay_rw_n : out STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       lb_data_out : out STD_LOGIC_VECTOR(DSIZE-1 downto 0)
  );
end component;
component pipe_stage
  generic(
       ASIZE : INTEGER := 16;
       BWSIZE : INTEGER := 4;
       DSIZE : INTEGER := 16
  );
  port (
       addr : in STD_LOGIC_VECTOR(ASIZE-1 downto 0);
       addr_adv_ld_n : in STD_LOGIC;
       clk : in STD_LOGIC;
       data_in : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       data_out : in STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       dm : in STD_LOGIC_VECTOR(BWSIZE-1 downto 0);
       rd_wr_n : in STD_LOGIC;
       reset : in STD_LOGIC;
       addr_adv_ld_n_reg : out STD_LOGIC;
       addr_reg : out STD_LOGIC_VECTOR(ASIZE-1 downto 0);
       data_in_reg : out STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       data_out_reg : out STD_LOGIC_VECTOR(DSIZE-1 downto 0);
       dm_reg : out STD_LOGIC_VECTOR(BWSIZE-1 downto 0);
       rd_wr_n_reg : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal addr_adv_ld_n_reg : std_logic;
signal clkt : std_logic;
signal rd_wr_n_reg : std_logic;
signal reset_t : std_logic;
signal addr_reg : std_logic_vector (ASIZE - 1 downto 0);
signal data_in_reg : std_logic_vector (DSIZE - 1 downto 0);
signal delay_data_in : std_logic_vector (DSIZE - 1 downto 0);
signal delay_rw_n : std_logic_vector (DSIZE - 1 downto 0);
signal dm_reg : std_logic_vector (BWSIZE - 1 downto 0);
signal lb_data_out : std_logic_vector (DSIZE - 1 downto 0);
signal read_data : std_logic_vector (DSIZE - 1 downto 0);

begin

----  Component instantiations  ----

addr_ctrl_out1 : addr_ctrl_out
  generic map (
       ASIZE => ASIZE,
       BWSIZE => BWSIZE
  )
  port map(
       clk => clkt,
       lb_addr => addr_reg( ASIZE - 1 downto 0 ),
       lb_adv_ld_n => addr_adv_ld_n_reg,
       lb_bw => dm_reg( BWSIZE - 1 downto 0 ),
       lb_rw_n => rd_wr_n_reg,
       ram_addr => SA( ASIZE - 1 downto 0 ),
       ram_adv_ld_n => ADV_LD_N,
       ram_bw_n => BW_N( BWSIZE - 1 downto 0 ),
       ram_rw_n => RW_N,
       reset => reset_t
  );

reset_t <= not(RESET_N);

data_inout1 : data_inout
  generic map (
       BWSIZE => BWSIZE,
       DSIZE => DSIZE
  )
  port map(
       clk => clkt,
       ctrl_in_rw_n => delay_rw_n( DSIZE - 1 downto 0 ),
       data_in => delay_data_in( DSIZE - 1 downto 0 ),
       dq => DQ( DSIZE - 1 downto 0 ),
       read_data => read_data( DSIZE - 1 downto 0 ),
       reset => reset_t
  );

pipe_delay1 : pipe_delay
  generic map (
       BWSIZE => BWSIZE,
       DSIZE => DSIZE,
       FLOWTHROUGH => FLOWTHROUGH
  )
  port map(
       clk => clkt,
       delay_data_in => delay_data_in( DSIZE - 1 downto 0 ),
       delay_rw_n => delay_rw_n( DSIZE - 1 downto 0 ),
       lb_data_in => data_in_reg( DSIZE - 1 downto 0 ),
       lb_data_out => lb_data_out( DSIZE - 1 downto 0 ),
       lb_rw_n => rd_wr_n_reg,
       ram_data_out => read_data( DSIZE - 1 downto 0 ),
       reset => reset_t
  );

pipe_stage1 : pipe_stage
  generic map (
       ASIZE => ASIZE,
       BWSIZE => BWSIZE,
       DSIZE => DSIZE
  )
  port map(
       addr => ADDR( ASIZE - 1 downto 0 ),
       addr_adv_ld_n => ADDR_ADV_LD_N,
       addr_adv_ld_n_reg => addr_adv_ld_n_reg,
       addr_reg => addr_reg( ASIZE - 1 downto 0 ),
       clk => clkt,
       data_in => DATA_IN( DSIZE - 1 downto 0 ),
       data_in_reg => data_in_reg( DSIZE - 1 downto 0 ),
       data_out => lb_data_out( DSIZE - 1 downto 0 ),
       data_out_reg => DATA_OUT( DSIZE - 1 downto 0 ),
       dm => DM( BWSIZE - 1 downto 0 ),
       dm_reg => dm_reg( BWSIZE - 1 downto 0 ),
       rd_wr_n => RD_WR_N,
       rd_wr_n_reg => rd_wr_n_reg,
       reset => reset_t
  );


---- Terminal assignment ----

    -- Inputs terminals
	clkt <= clk;


end RTL;
