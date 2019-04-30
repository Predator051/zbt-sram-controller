-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : zaz
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\compile\addr_ctrl_out.vhd
-- Generated   : Tue Apr 30 12:20:31 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\src\addr_ctrl_out.bde
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

entity addr_ctrl_out is
  generic(
       ASIZE:INTEGER:=17;
BWSIZE:INTEGER:=4 
  );
  port(
       clk : in std_logic;
       lb_adv_ld_n : in std_logic;
       lb_rw_n : in std_logic;
       reset : in std_logic;
       lb_addr : in std_logic_vector(ASIZE - 1 downto 0);
       lb_bw : in std_logic_vector(BWSIZE - 1 downto 0);
       ram_adv_ld_n : out std_logic;
       ram_rw_n : out std_logic;
       ram_addr : out std_logic_vector(ASIZE - 1 downto 0);
       ram_bw_n : out std_logic_vector(BWSIZE - 1 downto 0)
  );
end addr_ctrl_out;

architecture RTL of addr_ctrl_out is

---- Signal declarations used on the diagram ----

signal lb_bw_n : std_logic_vector (BWSIZE - 1 downto 0);

begin

---- Processes ----

process (clk,reset)
                       begin
                         if (reset = '1') then
                            ram_addr <= (others => '0');
                            ram_rw_n <= '0';
                            ram_adv_ld_n <= '0';
                            ram_bw_n <= (others => '0');
                         elsif rising_edge(clk) then
                            ram_addr <= lb_addr;
                            ram_rw_n <= lb_rw_n;
                            ram_adv_ld_n <= lb_adv_ld_n;
                            ram_bw_n <= lb_bw_n;
                         end if;
                       end process;                      

---- User Signal Assignments ----
lb_bw_n <= not lb_bw;

end RTL;
