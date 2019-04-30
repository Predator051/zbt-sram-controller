--						 
--  LOGIC CORE:          ZBT Controller Pipe Stage Module
--  MODULE NAME:         pipe_stage()
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
--  Register level for getting signals on/off chip fast (not needed if controller is
--  interfaced with another design on chip).
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

                                         
entity pipe_stage is 

	generic (
		DSIZE	: integer := 17;	-- data bus width
		ASIZE	: integer := 36;	-- address bus width
		BWSIZE	: integer := 4		-- byte enable bus width
	);

	port (
		clk			: in std_logic;
--		clken			: in std_logic;
	
		reset			: in std_logic;
	
		addr			: in std_logic_vector(ASIZE - 1 downto 0);		
		data_in			: in std_logic_vector(DSIZE - 1 downto 0);
		data_out		: in std_logic_vector(DSIZE - 1 downto 0);
		rd_wr_n			: in std_logic;					-- active LOW write
		addr_adv_ld_n		: in std_logic;					-- advance/load address (active LOW load)
		dm			: in std_logic_vector(BWSIZE - 1 downto 0);	-- data mask bits                   

		addr_reg		: out std_logic_vector(ASIZE - 1 downto 0);
		data_in_reg		: out std_logic_vector(DSIZE - 1 downto 0);
		data_out_reg		: out std_logic_vector(DSIZE - 1 downto 0);
		rd_wr_n_reg		: out std_logic;
		addr_adv_ld_n_reg	: out std_logic;
		dm_reg			: out std_logic_vector(BWSIZE - 1 downto 0)
	);
end pipe_stage;



architecture RTL of pipe_stage is

begin

-- register all signals

	process(clk, reset)
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

