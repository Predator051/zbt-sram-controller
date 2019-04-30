LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL; 
				LIBRARY work;
		USE work.gen_utils.ALL;
                USE work.conversions.ALL;


entity main is
generic (
		FLOWTHROUGH	: integer := 0;		-- Pipelined if zero, Flowthrough if one
		ASIZE		: integer := 16;	-- address bus width
		DSIZE		: integer := 16;	-- data bus width
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
	
end main;


architecture RTL of main is


-- component declarations

component top

	generic (
		FLOWTHROUGH	: integer := 0;		-- Pipelined if zero, Flowthrough if one
		ASIZE		: integer := 16;	-- address bus width
		DSIZE		: integer := 16;	-- data bus width
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
end component;	

signal clkm: std_logic;

begin 
clkm <= clk;	
TOP_T : top 
	Generic MAP (
		FLOWTHROUGH => FLOWTHROUGH,
		ASIZE => ASIZE,
		DSIZE => DSIZE,
		BWSIZE => BWSIZE
	)
	PORT MAP (
		clk		=> clkm,
		RESET_N	=> RESET_N,
		
-- local bus interface
		ADDR	=> ADDR,
		DATA_IN	=> DATA_IN,
		DATA_OUT => DATA_OUT,
		RD_WR_N	 =>RD_WR_N,
		ADDR_ADV_LD_N	=> 		ADDR_ADV_LD_N,
		DM		=> DM,
	
-- SRAM interface
--		CLKOUT			:inout std_logic;				-- PLL output
		SA		=> SA,
		DQ		=> DQ,
		RW_N	=> RW_N,
		ADV_LD_N	=> ADV_LD_N,
		BW_N		=> BW_N
	); 
	end;
