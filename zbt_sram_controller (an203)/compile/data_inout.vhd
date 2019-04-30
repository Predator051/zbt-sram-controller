-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : zaz
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\compile\data_inout.vhd
-- Generated   : Tue Apr 30 12:20:31 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\src\data_inout.bde
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

entity data_inout is
  generic(
       BWSIZE:INTEGER:=4;
DSIZE:INTEGER:=36 
  );
  port(
       clk : in std_logic;
       reset : in std_logic;
       ctrl_in_rw_n : in std_logic_vector(DSIZE - 1 downto 0);
       data_in : in std_logic_vector(DSIZE - 1 downto 0);
       read_data : out std_logic_vector(DSIZE - 1 downto 0);
       dq : inout std_logic_vector(DSIZE - 1 downto 0)
  );
end data_inout;

architecture RTL of data_inout is

---- Signal declarations used on the diagram ----

signal tri_r_n_w : std_logic_vector (DSIZE - 1 downto 0);
signal write_data : std_logic_vector (DSIZE - 1 downto 0);

begin

---- Processes ----

process (clk,reset)
                       begin
                         if (reset = '1') then
                            tri_r_n_w <= (others => '0');
                            write_data <= (others => '0');
                         end if;
                         if (clk = '1') then
                            tri_r_n_w <= not ctrl_in_rw_n;
                            write_data <= data_in;
                         end if;
                       end process;                      

---- User Signal Assignments ----
dq(18) <= write_data(18) when tri_r_n_w(18) = '1' else 'Z';
dq(19) <= write_data(19) when tri_r_n_w(19) = '1' else 'Z';
dq(20) <= write_data(20) when tri_r_n_w(20) = '1' else 'Z';
dq(21) <= write_data(21) when tri_r_n_w(21) = '1' else 'Z';
dq(22) <= write_data(22) when tri_r_n_w(22) = '1' else 'Z';
dq(23) <= write_data(23) when tri_r_n_w(23) = '1' else 'Z';
dq(24) <= write_data(24) when tri_r_n_w(24) = '1' else 'Z';
dq(25) <= write_data(25) when tri_r_n_w(25) = '1' else 'Z';
dq(26) <= write_data(26) when tri_r_n_w(26) = '1' else 'Z';
dq(27) <= write_data(27) when tri_r_n_w(27) = '1' else 'Z';
dq(28) <= write_data(28) when tri_r_n_w(28) = '1' else 'Z';
dq(29) <= write_data(29) when tri_r_n_w(29) = '1' else 'Z';
dq(30) <= write_data(30) when tri_r_n_w(30) = '1' else 'Z';
dq(31) <= write_data(31) when tri_r_n_w(31) = '1' else 'Z';
dq(32) <= write_data(32) when tri_r_n_w(32) = '1' else 'Z';
dq(33) <= write_data(33) when tri_r_n_w(33) = '1' else 'Z';
dq(34) <= write_data(34) when tri_r_n_w(34) = '1' else 'Z';
dq(35) <= write_data(35) when tri_r_n_w(35) = '1' else 'Z';
read_data <= dq;
dq(0) <= write_data(0) when tri_r_n_w(0) = '1' else 'Z';
dq(1) <= write_data(1) when tri_r_n_w(1) = '1' else 'Z';
dq(2) <= write_data(2) when tri_r_n_w(2) = '1' else 'Z';
dq(3) <= write_data(3) when tri_r_n_w(3) = '1' else 'Z';
dq(4) <= write_data(4) when tri_r_n_w(4) = '1' else 'Z';
dq(5) <= write_data(5) when tri_r_n_w(5) = '1' else 'Z';
dq(6) <= write_data(6) when tri_r_n_w(6) = '1' else 'Z';
dq(7) <= write_data(7) when tri_r_n_w(7) = '1' else 'Z';
dq(8) <= write_data(8) when tri_r_n_w(8) = '1' else 'Z';
dq(9) <= write_data(9) when tri_r_n_w(9) = '1' else 'Z';
dq(10) <= write_data(10) when tri_r_n_w(10) = '1' else 'Z';
dq(11) <= write_data(11) when tri_r_n_w(11) = '1' else 'Z';
dq(12) <= write_data(12) when tri_r_n_w(12) = '1' else 'Z';
dq(13) <= write_data(13) when tri_r_n_w(13) = '1' else 'Z';
dq(14) <= write_data(14) when tri_r_n_w(14) = '1' else 'Z';
dq(15) <= write_data(15) when tri_r_n_w(15) = '1' else 'Z';
dq(16) <= write_data(16) when tri_r_n_w(16) = '1' else 'Z';
dq(17) <= write_data(17) when tri_r_n_w(17) = '1' else 'Z';

end RTL;
