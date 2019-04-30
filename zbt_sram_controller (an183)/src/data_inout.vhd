--						 
--  LOGIC CORE:          ZBT Controller Data Input/Output Module
--  MODULE NAME:         data_inout()
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
--  Data input/output module.
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
                                         
entity data_inout is

	generic (
		DSIZE	: integer := 16;	-- data bus width
		BWSIZE	: integer := 4		-- byte enable bus width
	);

	port (
	clk		: in std_logic;
--	clken		: in std_logic;
	
	reset		: in std_logic;
	
	ctrl_in_rw_n	: in std_logic_vector(DSIZE - 1 downto 0);	-- delayed read/write signal
	data_in		: in std_logic_vector(DSIZE - 1 downto 0);	-- input data to RAM
	dq		: inout std_logic_vector(DSIZE - 1 downto 0);	-- bi-directional to/from RAM
	read_data	: out std_logic_vector(DSIZE - 1 downto 0)	-- data from RAM
	);
end data_inout;


architecture RTL of data_inout is

-- signal declarations

signal tri_r_n_w	: std_logic_vector(DSIZE - 1 downto 0);
signal write_data	: std_logic_vector(DSIZE - 1 downto 0);

--attribute syn_preserve of tri_r_n_w : signal is true;


begin

-- tri-state output bus
-- assume there are 4 segments of the DQ bus, assign a separate tri-state enable to each of them

	--	gen:	for i in DSIZE - 1 downto 0 generate
				dq(0) <= write_data(0) when tri_r_n_w(0) = '1' else  'Z';
				dq(1) <= write_data(1) when tri_r_n_w(1) = '1' else  'Z';
				dq(2) <= write_data(2) when tri_r_n_w(2) = '1' else  'Z';
				dq(3) <= write_data(3) when tri_r_n_w(3) = '1' else  'Z';
				dq(4) <= write_data(4) when tri_r_n_w(4) = '1' else  'Z';
				dq(5) <= write_data(5) when tri_r_n_w(5) = '1' else  'Z';
				dq(6) <= write_data(6) when tri_r_n_w(6) = '1' else  'Z';
				dq(7) <= write_data(7) when tri_r_n_w(7) = '1' else  'Z';
				dq(8) <= write_data(8) when tri_r_n_w(8) = '1' else  'Z';
				dq(9) <= write_data(9) when tri_r_n_w(9) = '1' else  'Z';
				dq(10) <= write_data(10) when tri_r_n_w(10) = '1' else  'Z';
				dq(11) <= write_data(11) when tri_r_n_w(11) = '1' else  'Z';
				dq(12) <= write_data(12) when tri_r_n_w(12) = '1' else  'Z';
				dq(13) <= write_data(13) when tri_r_n_w(13) = '1' else   'Z';
				dq(14) <= write_data(14) when tri_r_n_w(14) = '1' else  'Z';
				dq(15) <= write_data(15) when tri_r_n_w(15) = '1' else  'Z';
				--dq(16) <= write_data(16) when tri_r_n_w(16) = '1' else  'Z';
--				dq(17) <= write_data(17) when tri_r_n_w(17) = '1' else  'Z';
--				dq(18) <= write_data(18) when tri_r_n_w(18) = '1' else  'Z';
--				dq(19) <= write_data(19) when tri_r_n_w(19) = '1' else  'Z';
--				dq(20) <= write_data(20) when tri_r_n_w(20) = '1' else  'Z';
--				dq(21) <= write_data(21) when tri_r_n_w(21) = '1' else  'Z';
--				dq(22) <= write_data(22) when tri_r_n_w(22) = '1' else  'Z';
--				dq(23) <= write_data(23) when tri_r_n_w(23) = '1' else  'Z';
--				dq(24) <= write_data(24) when tri_r_n_w(24) = '1' else  'Z';
--				dq(25) <= write_data(25) when tri_r_n_w(25) = '1' else  'Z';
--				dq(26) <= write_data(26) when tri_r_n_w(26) = '1' else  'Z';
--				dq(27) <= write_data(27) when tri_r_n_w(27) = '1' else  'Z';
--				dq(28) <= write_data(28) when tri_r_n_w(28) = '1' else  'Z';
--				dq(29) <= write_data(29) when tri_r_n_w(29) = '1' else  'Z';
--				dq(30) <= write_data(30) when tri_r_n_w(30) = '1' else  'Z';
--				dq(31) <= write_data(31) when tri_r_n_w(31) = '1' else  'Z';
				--dq(32) <= write_data(32) when tri_r_n_w(32) = '1' else  'Z';
--				dq(33) <= write_data(33) when tri_r_n_w(33) = '1' else  'Z';
--				dq(34) <= write_data(34) when tri_r_n_w(34) = '1' else  'Z';
--				dq(35) <= write_data(35) when tri_r_n_w(35) = '1' else  'Z';


			--if tri_r_n_w(i) = '1' then 
				--dq(i) <= write_data(i);
			--	elsif tri_r_n_w(i) = '0'  
			--	dq(i) <= 'Z';
			--	end if;
			--end generate;
		

	--dq((DSIZE / BWSIZE) + (0 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 0) <= write_data((DSIZE / BWSIZE) + (0 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 0) when tri_r_n_w(0) = '1' else (others => 'Z');
	--dq((DSIZE / BWSIZE) + (1 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 1) <= write_data((DSIZE / BWSIZE) + (1 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 1) when tri_r_n_w(1) = '1' else (others => 'Z');
	--dq((DSIZE / BWSIZE) + (2 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 2) <= write_data((DSIZE / BWSIZE) + (2 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 2) when tri_r_n_w(2) = '1' else (others => 'Z');
	--dq((DSIZE / BWSIZE) + (3 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 3) <= write_data((DSIZE / BWSIZE) + (3 * DSIZE / BWSIZE) - 1 downto DSIZE / BWSIZE * 3) when tri_r_n_w(3) = '1' else (others => 'Z');
	
	
	read_data <= dq;


-- register data_in and tri-state control signal
	process (clk, reset)
		begin
			if (reset = '1') then
				tri_r_n_w <= (others => '0');
				write_data <= (others => '0');
			end if;
				if (clk = '1') then
					tri_r_n_w <=  not ctrl_in_rw_n;
					write_data <= data_in;
				
			end if;
		end process;






end RTL;





