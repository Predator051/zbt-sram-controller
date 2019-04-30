-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : zaz
-- Author      : ParazZzit
-- Company     : admin
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\compile\pipe_delay.vhd
-- Generated   : Tue Apr 30 12:20:36 2019
-- From        : C:\Users\ZpmPower\Desktop\kursovaya\ZBT_SRAM_Controller AN203\zaz\src\pipe_delay.bde
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

entity pipe_delay is
  generic(
       BWSIZE:INTEGER:=4;
DSIZE:INTEGER:=36;
FLOWTHROUGH:INTEGER:=0 
  );
  port(
       clk : in std_logic;
       lb_rw_n : in std_logic;
       reset : in std_logic;
       lb_data_in : in std_logic_vector(DSIZE - 1 downto 0);
       ram_data_out : in std_logic_vector(DSIZE - 1 downto 0);
       delay_data_in : out std_logic_vector(DSIZE - 1 downto 0);
       delay_rw_n : out std_logic_vector(DSIZE - 1 downto 0);
       lb_data_out : out std_logic_vector(DSIZE - 1 downto 0)
  );
end pipe_delay;

architecture RTL of pipe_delay is

---- Architecture declarations -----
--Added by Active-HDL. Do not change code inside this section.
type my_array is array (1 downto 0) of std_logic_vector(DSIZE - 1 downto 0);
--End of extra code.


---- Signal declarations used on the diagram ----

signal data_in_pipe : my_array (1 downto 0);
signal rw_n_pipe : std_logic_vector (2 downto 0);

begin

---- Processes ----

process (clk,reset)
                       begin
                         if (reset = '1') then
                            rw_n_pipe <= (others => '0');
                            data_in_pipe(0) <= (others => '0');
                            data_in_pipe(1) <= (others => '0');
                         elsif rising_edge(clk) then
                            if (clk = '1') then
                               rw_n_pipe(0) <= lb_rw_n;
                               rw_n_pipe(2 downto 1) <= rw_n_pipe(1 downto 0);
                               data_in_pipe(0) <= lb_data_in;
                               data_in_pipe(1) <= data_in_pipe(0);
                            end if;
                         end if;
                       end process;                      

process (clk,reset)
                       begin
                         if (reset = '1') then
                            lb_data_out <= (others => '0');
                         elsif rising_edge(clk) then
                            if (rw_n_pipe(2 - FLOWTHROUGH) = '1') then
                               lb_data_out <= ram_data_out;
                            end if;
                         end if;
                       end process;                      

process (rw_n_pipe(0),rw_n_pipe(1),rw_n_pipe(2))
                       begin
                         delay_rw_n(DSIZE - 1) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 2) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 3) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 4) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 5) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 6) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 7) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 8) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 9) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 10) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 11) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 12) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 13) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 14) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 15) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 16) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 17) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 18) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 19) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 20) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 21) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 22) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 23) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 24) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 25) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 26) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 27) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 28) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 29) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 30) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 31) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 32) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 33) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 34) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 35) <= rw_n_pipe(1 - FLOWTHROUGH);
                         delay_rw_n(DSIZE - 36) <= rw_n_pipe(1 - FLOWTHROUGH);
                       end process;                      

---- User Signal Assignments ----
delay_data_in <= data_in_pipe(1 - FLOWTHROUGH);

end RTL;
