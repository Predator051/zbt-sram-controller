-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Controller
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\compile\pipe_stage.vhd
-- Generated   : Mon Apr  8 15:38:02 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller\Controller\src\pipe_stage.bde
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

entity pipe_stage is
  generic(
       ASIZE:INTEGER:=16;
BWSIZE:INTEGER:=4;
DSIZE:INTEGER:=16 
  );
  port(
       addr_adv_ld_n : in std_logic;
       clk : in std_logic;
       rd_wr_n : in std_logic;
       reset : in std_logic;
       addr : in std_logic_vector(ASIZE - 1 downto 0);
       data_in : in std_logic_vector(DSIZE - 1 downto 0);
       data_out : in std_logic_vector(DSIZE - 1 downto 0);
       dm : in std_logic_vector(BWSIZE - 1 downto 0);
       addr_adv_ld_n_reg : out std_logic;
       rd_wr_n_reg : out std_logic;
       addr_reg : out std_logic_vector(ASIZE - 1 downto 0);
       data_in_reg : out std_logic_vector(DSIZE - 1 downto 0);
       data_out_reg : out std_logic_vector(DSIZE - 1 downto 0);
       dm_reg : out std_logic_vector(BWSIZE - 1 downto 0)
  );
end pipe_stage;

architecture RTL of pipe_stage is

begin

---- Processes ----

process (clk,reset)
                       begin
                         if (reset = '1') then
                            addr_reg <= (others => '0');
                            data_in_reg <= (others => '0');
                            data_out_reg <= (others => '0');
                            rd_wr_n_reg <= '0';
                            addr_adv_ld_n_reg <= '0';
                            dm_reg <= (others => '0');
                         end if;
                         if (clk = '1') then
                            addr_reg <= addr;
                            data_in_reg <= data_in;
                            data_out_reg <= data_out;
                            rd_wr_n_reg <= rd_wr_n;
                            addr_adv_ld_n_reg <= addr_adv_ld_n;
                            dm_reg <= dm;
                         end if;
                       end process;                      

end RTL;
