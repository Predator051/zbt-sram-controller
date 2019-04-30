--						 
--  LOGIC CORE:          ZBT Controller Address and Control Output Module
--  MODULE NAME:         addr_ctrl_out()
--  COMPANY:             Northwest Logic, Inc.
--  CLIENT:		 Altera, Inc.	
--                              
--  REVISION HISTORY:                 
--                              
--    Revision 1.0                    
--    Description: Initial Release.   
--                              
--                              
--  FUNCTIONAL DESCRIPTION:           
--                              
--  Address and control bits output module.
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

entity addr_ctrl_out is

	generic (
		ASIZE	: integer := 16;	-- address bus width
		BWSIZE	: integer := 4		-- byte enable bus width
	);
		
	port (
		clk		: in	std_logic;
--		clken		: in	std_logic;
	
		reset		: in	std_logic;
	
		lb_addr		: in	std_logic_vector(ASIZE - 1 downto 0);	-- local bus addr input
		ram_addr	: out	std_logic_vector(ASIZE - 1 downto 0);	-- addr to RAM
		lb_rw_n		: in	std_logic;				-- local bus read/write signal
		ram_rw_n	: out	std_logic;				-- read/write to RAM
		lb_adv_ld_n	: in	std_logic;				-- local bus advance/load signal
		ram_adv_ld_n	: out	std_logic;				-- advance/load to RAM
		lb_bw		: in	std_logic_vector(BWSIZE - 1 downto 0);	-- local bus byte write selects
		ram_bw_n	: out	std_logic_vector(BWSIZE - 1 downto 0)	-- byte write selects to RAM
	);
end addr_ctrl_out;
		
		                                         

architecture RTL of addr_ctrl_out is

-- signal declarations

signal	lb_bw_n		: std_logic_vector(BWSIZE - 1 downto 0);


begin

	lb_bw_n <=  NOT lb_bw;


-- register output signals

	process (clk, reset)
		begin
			if (reset = '1') then
				ram_addr <= (others => '0');
				ram_rw_n <= '0';
				ram_adv_ld_n <= '0';	
				ram_bw_n <= (others => '0');
			elsif rising_edge(clk) then
--				if (clken = '1') then
					ram_addr <= lb_addr;
					ram_rw_n <= lb_rw_n;
					ram_adv_ld_n <= lb_adv_ld_n;
					ram_bw_n <= lb_bw_n;
--				end if;
			end if;
		end process;
	


end RTL;

