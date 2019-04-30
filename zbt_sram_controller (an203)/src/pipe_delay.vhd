--						 
--  LOGIC CORE:          ZBT Controller Pipeline delay Module
--  MODULE NAME:         pipe_delay()
--  COMPANY:             Northwest Logic, Inc.
--  CLIENT:		Altera, Inc.	
--                              
--  REVISION HISTORY:                 
--                              
--    Revision 1.0                    
--    Description: Initial Release.   
--                              
--                              
--  FUNCTIONAL DESCRIPTION:           
--                              
--  Pipeline delay module for flowthrough and pipelined ZBT SRAM.
--                                                                      
--                                                                      
--  Copyright © 2000 Northwest Logic, Inc. All rights reserved.  
--  Altera products are protected under numerous U.S. and foreign patents, maskwork 
--  rights, copyrights and other intellectual property laws.  
--
--  This reference design file, and your use thereof, is subject to and governed by 
--  the terms and conditions of the applicable Altera Reference Design License 
--  Agreement (either as signed by you or found at www.altera.com).  By using this 
--  reference design file, you indicate your acceptance of such terms and conditions 
--  between you and Altera Corporation.  In the event that you do not agree with such 
--  terms and conditions, you may not use the reference design file and please 
--  promptly destroy any copies you have made.
--
--  This reference design file is being provided on an “as-is” basis and as an 
--  accommodation and therefore all warranties, representations or guarantees of any 
--  kind (whether express, implied or statutory) including, without limitation, 
--  warranties of merchantability, non-infringement, or fitness for a particular 
--  purpose, are specifically disclaimed.  By making this reference design file 
--  available, Altera expressly does not recommend, suggest or require that this 
--  reference design file be used in combination with any other product not provided 
--  by Altera.   
--                                                                      
--                                                                       

library ieee;
use ieee.std_logic_1164.all;
--use synplify.attributes.all;

                                         
entity pipe_delay is 

	generic (
		FLOWTHROUGH	: integer := 0;		-- Pipelined if zero, Flowthrough if one
		DSIZE		: integer := 36;	-- bit width of data
		BWSIZE		: integer := 4		-- byte enable bus width
	);

	port (
	clk		: in std_logic;
--	clken		: in std_logic;
	
	reset		: in std_logic;
	
	lb_rw_n		: in std_logic;					-- local bus read/write signal
	delay_rw_n	: out std_logic_vector(DSIZE - 1 downto 0);	-- read/write to tri-state enable
	
	lb_data_in	: in std_logic_vector(DSIZE - 1 downto 0);	-- data from local bus
	delay_data_in	: out std_logic_vector(DSIZE - 1 downto 0);	-- data to RAM
	
	lb_data_out	: out std_logic_vector(DSIZE - 1 downto 0);	-- data to local bus
	ram_data_out	: in std_logic_vector(DSIZE - 1 downto 0)	-- data from RAM
	);

--attribute syn_preserve of delay_rw_n : signal is true;

end pipe_delay;



architecture RTL of pipe_delay is

-- signal declarations
signal rw_n_pipe		: std_logic_vector(2 downto 0);

type my_array is array(1 downto 0) of std_logic_vector(DSIZE - 1 downto 0);

signal data_in_pipe 		: my_array;


begin

	delay_data_in <= data_in_pipe(1 - FLOWTHROUGH);

-- fan out rw_n_pipe
		process (rw_n_pipe(0), rw_n_pipe(1), rw_n_pipe(2))
		begin
			--for i in BWSIZE - 1 downto 0 loop
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

			
			--end loop;
		end process;


-- pipeline read/write signal and data
	process (clk, reset)
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


	process (clk, reset)
		begin
			if (reset = '1') then
				lb_data_out <= (others => '0');
			elsif rising_edge(clk) then
				if (rw_n_pipe(2 - FLOWTHROUGH) = '1') then
					lb_data_out <= ram_data_out;
				end if;
			end if;
		end process;




end RTL;





