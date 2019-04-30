--
--						 
--  LOGIC CORE:          ZBT Controller Top level Module
--  MODULE NAME:         zbt_ctrl_top()
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
--  Top level module for ZBT SRAM controller.
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


entity zbt_ctrl_top is

	generic (
		FLOWTHROUGH	: integer := 0;		-- Pipelined if zero, Flowthrough if one
		ASIZE		: integer := 17;	-- address bus width
		DSIZE		: integer := 36;	-- data bus width
		BWSIZE		: integer := 4		-- byte enable bus width
	);
	
	port (

		clk			: in std_logic;
		
		RESET_N			: in std_logic;		-- active LOW asynchronous reset
		
-- local bus interface
		ADDR			: in std_logic_vector(ASIZE - 1 downto 0);
		DATA_IN			: in std_logic_vector(DSIZE - 1 downto 0);
		DATA_OUT		: out std_logic_vector(DSIZE - 1 downto 0);
		RD_WR_N			: in std_logic;					-- active LOW write
		ADDR_ADV_LD_N		: in std_logic;					-- advance/load address (active LOW load)
		DM			: in std_logic_vector(BWSIZE - 1 downto 0); 	-- data mask bits                   
	
-- SRAM interface
--		CLKOUT			:inout std_logic;				-- PLL output
		SA			: out std_logic_vector(ASIZE - 1 downto 0);	-- address bus to RAM	
		DQ			: inout	std_logic_vector(DSIZE - 1 downto 0);	-- data to/from RAM
		RW_N			: out std_logic;				-- active LOW write
		ADV_LD_N		: out std_logic;				-- active LOW load
		BW_N			: out std_logic_vector(BWSIZE - 1 downto 0)	-- active LOW byte enables
	);
end zbt_ctrl_top;





architecture RTL of zbt_ctrl_top is

-- component declarations

--component clk_ctrl

--	port (
--		clkin		: in std_logic;
--	
--		clkout		: out std_logic;
--		locked		: out std_logic                    
--	);
--end component;


component pipe_stage

	generic (
		DSIZE	: integer := 36;	-- data bus width
		ASIZE	: integer := 17;	-- address bus width
		BWSIZE	: integer := 4		-- byte enable bus width
	);

	port (
		clk			: in std_logic;
--	clken			: in std_logic;
	
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
end component;


component addr_ctrl_out

	generic (
		ASIZE	: integer := 17;	-- address bus width
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
end component;


component pipe_delay 

	generic (
		FLOWTHROUGH	: integer := 0;		-- Pipelined if zero, Flowthrough if one
		DSIZE		: integer := 17;	-- bit width of data
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
end component;


component data_inout

	generic (
		DSIZE	: integer := 17;	-- data bus width
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
end component;


-- signal declarations

signal reset_t	: std_logic;
signal clkt	: std_logic;
signal delay_rw_n : std_logic_vector(DSIZE - 1 downto 0);
signal delay_data_in, read_data	: std_logic_vector(DSIZE - 1 downto 0);

signal data_in_reg, lb_data_out	: std_logic_vector(DSIZE - 1 downto 0);
signal addr_reg	: std_logic_vector(ASIZE - 1 downto 0);
signal dm_reg	: std_logic_vector(BWSIZE - 1 downto 0);
signal rd_wr_n_reg, addr_adv_ld_n_reg	: std_logic;

--signal clken : std_logic := '1';
begin

-- invert reset_n
	reset_t <= not RESET_N;
	clkt <= clk;

-- instantiate lower level modules

--	clk_ctrl1 : clk_ctrl
--		port map (
--			clkin => CLKIN,
			
--			clkout => CLKOUT,
--			locked => OPEN                    
--		);


-- This module is ONLY needed if using the controller in a "stand-alone" situation.
--   If interfacing the controller to another module in the chip, bypass this module
--   and wire the signals through to the next modules.


	pipe_stage1 : pipe_stage 
		generic map (
			ASIZE => ASIZE,
			DSIZE => DSIZE,
			BWSIZE => BWSIZE
		)
		port map (
			clk => clkt,
--			clken => clken,			-- always enabled
			
			reset => reset_t,
			
			addr => ADDR,		
			data_in => DATA_IN,
			data_out => lb_data_out,
			rd_wr_n => RD_WR_N,
			addr_adv_ld_n => ADDR_ADV_LD_N,
			dm => DM,                  
		
			addr_reg => addr_reg,
			data_in_reg => data_in_reg,
			data_out_reg => DATA_OUT,
			rd_wr_n_reg => rd_wr_n_reg,
			addr_adv_ld_n_reg => addr_adv_ld_n_reg,
			dm_reg => dm_reg
		);



	addr_ctrl_out1 : addr_ctrl_out
		generic map (
			ASIZE => ASIZE,
			BWSIZE => BWSIZE
		)
		port map (
			clk => clkt,
--			clken => clken,			-- always enabled
			
			reset => reset_t,
			
			lb_addr => addr_reg,
			ram_addr => SA,		
			lb_rw_n => rd_wr_n_reg,	
			ram_rw_n => RW_N,	
			lb_adv_ld_n => addr_adv_ld_n_reg,
			ram_adv_ld_n => ADV_LD_N,	
			lb_bw => dm_reg,			
			ram_bw_n => BW_N			
		);



	pipe_delay1 : pipe_delay
		generic map (
			FLOWTHROUGH => FLOWTHROUGH,
			DSIZE => DSIZE,
			BWSIZE => BWSIZE
		)
		port map (
			clk => clkt,
--			clken => clken,			-- always enabled
			
			reset => reset_t,
			
			lb_rw_n => rd_wr_n_reg,
			delay_rw_n => delay_rw_n,	
			
			lb_data_in => data_in_reg,
			delay_data_in => delay_data_in,
			
			lb_data_out => lb_data_out,	
			ram_data_out => read_data	
		);



	data_inout1 : data_inout
		generic map (
			DSIZE => DSIZE,
			BWSIZE => BWSIZE
		)
		port map (
			clk => clkt,
--			clken => clken,			-- always enabled
			
			reset => reset_t,
			
			ctrl_in_rw_n => delay_rw_n,
			data_in => delay_data_in,
			dq => DQ,			
			read_data => read_data	
		);




end RTL;



