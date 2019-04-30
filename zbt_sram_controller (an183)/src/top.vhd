LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL; 
                LIBRARY work;
        USE work.gen_utils.ALL;
                USE work.conversions.ALL;


entity top is

    generic (
        FLOWTHROUGH : integer := 0;     -- Pipelined if zero, Flowthrough if one
        ASIZE       : integer := 16;    -- address bus width
        DSIZE       : integer := 16;    -- data bus width
        BWSIZE      : integer := 4      -- byte enable bus width
    );
    
    port (

        clk         : in std_logic;
        
        RESET_N         : in std_logic;     -- active LOW asynchronous reset
        
-- local bus interface
        ADDR            : in std_logic_vector(ASIZE - 1 downto 0);
        DATA_IN         : in std_logic_vector(DSIZE - 1 downto 0);
        DATA_OUT        : out std_logic_vector(DSIZE - 1 downto 0);
        RD_WR_N         : in std_logic;                 -- active LOW write
        ADDR_ADV_LD_N       : in std_logic;                 -- advance/load address (active LOW load)
        DM          : in std_logic_vector(BWSIZE - 1 downto 0);     -- data mask bits                   
    
-- SRAM interface
--      CLKOUT          :inout std_logic;               -- PLL output
        SA          : out std_logic_vector(ASIZE - 1 downto 0); -- address bus to RAM   
        DQ          : inout std_logic_vector(DSIZE - 1 downto 0);   -- data to/from RAM
        RW_N            : out std_logic;                -- active LOW write
        ADV_LD_N        : out std_logic;                -- active LOW load
        BW_N            : out std_logic_vector(BWSIZE - 1 downto 0) -- active LOW byte enables
    );
end top;





architecture RTL of top is


-- component declarations

component PLL1

    port (
        inclk0      : in std_logic;
    
        c0          : out std_logic;
        locked      : out std_logic                    
    );
end component;

component zbt_ctrl_top

    generic (
        FLOWTHROUGH : integer := 0;     -- Pipelined if zero, Flowthrough if one
        ASIZE       : integer := 16;    -- address bus width
        DSIZE       : integer := 16;    -- data bus width
        BWSIZE      : integer := 4      -- byte enable bus width
    );
    
    port (

        clk         : in std_logic;     
        RESET_N     : in std_logic;     -- active LOW asynchronous reset
        
-- local bus interface
        ADDR            : in std_logic_vector(ASIZE - 1 downto 0);
        DATA_IN         : in std_logic_vector(DSIZE - 1 downto 0);
        DATA_OUT        : out std_logic_vector(DSIZE - 1 downto 0);
        RD_WR_N         : in std_logic;                 -- active LOW write
        ADDR_ADV_LD_N       : in std_logic;                 -- advance/load address (active LOW load)
        DM          : in std_logic_vector(BWSIZE - 1 downto 0);     -- data mask bits                   
    
-- SRAM interface
--      CLKOUT          :inout std_logic;               -- PLL output
        SA          : out std_logic_vector(ASIZE - 1 downto 0); -- address bus to RAM   
        DQ          : inout std_logic_vector(DSIZE - 1 downto 0);   -- data to/from RAM
        RW_N            : out std_logic;                -- active LOW write
        ADV_LD_N        : out std_logic;                -- active LOW load
        BW_N            : out std_logic_vector(BWSIZE - 1 downto 0) -- active LOW byte enables
    );
end component;

component idt71v3556 
    generic (
            tipd_A0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A8                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A9                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A10                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A11                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A12                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A13                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A14                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A15                 : VitalDelayType01 := VitalZeroDelay01;
        --tipd_A16                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQA0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQA1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQA2                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQA3                : VitalDelayType01 := VitalZeroDelay01;
        --tipd_DQA4                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQA5                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQA6                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQA7                : VitalDelayType01 := VitalZeroDelay01;
        --tipd_DQA8                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQB0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQB1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQB2                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQB3                : VitalDelayType01 := VitalZeroDelay01;
        --tipd_DQB4                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQB5                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQB6                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQB7                : VitalDelayType01 := VitalZeroDelay01;
        --tipd_DQB8                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQC0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQC1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQC2                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQC3                : VitalDelayType01 := VitalZeroDelay01;
        --tipd_DQC4                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQC5                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQC6                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQC7                : VitalDelayType01 := VitalZeroDelay01;
        --tipd_DQC8                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQD0                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQD1                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQD2                : VitalDelayType01 := VitalZeroDelay01;
        tipd_DQD3                : VitalDelayType01 := VitalZeroDelay01
        --tipd_DQD4                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQD5                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQD6                : VitalDelayType01 := VitalZeroDelay01;
--        tipd_DQD7                : VitalDelayType01 := VitalZeroDelay01;
--tipd_DQD8                : VitalDelayType01 := VitalZeroDelay01;
);
    port (
       -- Dq                    : inout std_logic_vector (31 downto 0);      
       -- Addr                  : in    std_logic_vector (15 downto 0);      
       -- Lbo_n                 : in    std_logic := '0';                                                      
       -- Clk                   : in    std_logic;                           
       -- Cke_n                 : in    std_logic := '0';                                                      
       -- Ld_n                  : in    std_logic;                           
       -- Bwa_n                 : in    std_logic;                           
       -- Bwb_n                 : in    std_logic;                           
       -- Bwc_n                 : in    std_logic;                           
       -- Bwd_n                 : in    std_logic;                           
       -- Rw_n                  : in    std_logic;                           
       -- Oe_n                  : in    std_logic := '0';                                                      
       -- Ce_n                  : in    std_logic := '0';                                                      
       -- Ce2_n                 : in    std_logic := '0';                                                      
       -- Ce2                   : in    std_logic := '1';                                                   
       -- Zz                    : in    std_logic := '0';

      A0              : IN    std_logic := 'U';
        A1              : IN    std_logic := 'U';
        A2              : IN    std_logic := 'U';
        A3              : IN    std_logic := 'U';
        A4              : IN    std_logic := 'U';
        A5              : IN    std_logic := 'U';
        A6              : IN    std_logic := 'U';
        A7              : IN    std_logic := 'U';
        A8              : IN    std_logic := 'U';
        A9              : IN    std_logic := 'U';
        A10             : IN    std_logic := 'U';
        A11             : IN    std_logic := 'U';
        A12             : IN    std_logic := 'U';
        A13             : IN    std_logic := 'U';
        A14             : IN    std_logic := 'U';
        A15             : IN    std_logic := 'U';
        --A16             : IN    std_logic := 'U';
        DQA0            : INOUT std_logic := 'U';
        DQA1            : INOUT std_logic := 'U';
        DQA2            : INOUT std_logic := 'U';
        DQA3            : INOUT std_logic := 'U';
        --DQA4            : INOUT std_logic := 'U';
--        DQA5            : INOUT std_logic := 'U';
--        DQA6            : INOUT std_logic := 'U';
--        DQA7            : INOUT std_logic := 'U';
        --DQA8            : INOUT std_logic := 'U';
        DQB0            : INOUT std_logic := 'U';
        DQB1            : INOUT std_logic := 'U';
        DQB2            : INOUT std_logic := 'U';
        DQB3            : INOUT std_logic := 'U';
       -- DQB4            : INOUT std_logic := 'U';
--        DQB5            : INOUT std_logic := 'U';
--        DQB6            : INOUT std_logic := 'U';
--        DQB7            : INOUT std_logic := 'U';
        --DQB8            : INOUT std_logic := 'U';
        DQC0            : INOUT std_logic := 'U';
        DQC1            : INOUT std_logic := 'U';
        DQC2            : INOUT std_logic := 'U';
        DQC3            : INOUT std_logic := 'U';
        --DQC4            : INOUT std_logic := 'U';
--        DQC5            : INOUT std_logic := 'U';
--        DQC6            : INOUT std_logic := 'U';
--        DQC7            : INOUT std_logic := 'U';
        ---DQC8            : INOUT std_logic := 'U';
        DQD0            : INOUT std_logic := 'U';
        DQD1            : INOUT std_logic := 'U';
        DQD2            : INOUT std_logic := 'U';
        DQD3            : INOUT std_logic := 'U';
        --DQD4            : INOUT std_logic := 'U';
--        DQD5            : INOUT std_logic := 'U';
--        DQD6            : INOUT std_logic := 'U';
--        DQD7            : INOUT std_logic := 'U';
        --DQD8            : INOUT std_logic := 'U';
        ADV             : IN    std_logic := 'U';
        R               : IN    std_logic := 'U';
        CLKENNeg        : IN    std_logic := 'U';
        BWDNeg          : IN    std_logic := 'U';
        BWCNeg          : IN    std_logic := 'U';
        BWBNeg          : IN    std_logic := 'U';
        BWANeg          : IN    std_logic := 'U';
        CE1Neg          : IN    std_logic := 'U';
        CE2Neg          : IN    std_logic := 'U';
        CE2             : IN    std_logic := 'U';
        CLK             : IN    std_logic := 'U';
        LBONeg          : IN    std_logic := '1';
        OENeg           : IN    std_logic := 'U'
                                                      
    );
end component;

signal PLL_clk, locked: std_logic;
signal sat : std_logic_vector(ASIZE - 1 downto 0) := sa;
signal clkzbt             : std_logic;
signal adv_ld_n_m           : std_logic;
signal rw_n_m               : std_logic;
signal bw_n_m               : std_logic_vector(BWSIZE - 1 downto 0);
begin
bw_n <= bw_n_m;
rw_n <= rw_n_m;
adv_ld_n <= adv_ld_n_m;
sat <= addr;
PLL1_inst : PLL1 PORT MAP (
        inclk0   => clk,
        locked   => locked,
        c0   => PLL_clk
    );
    
zbt_ctrl_top_inst1 : zbt_ctrl_top 
    Generic MAP (
        FLOWTHROUGH => FLOWTHROUGH,
        ASIZE => ASIZE,
        DSIZE => DSIZE,
        BWSIZE => BWSIZE
    )
    PORT MAP (
        clk     => PLL_clk,
        RESET_N => RESET_N,
        
-- local bus interface
        ADDR    => ADDR,
        DATA_IN => DATA_IN,
        DATA_OUT => DATA_OUT,
        RD_WR_N  =>RD_WR_N,
        ADDR_ADV_LD_N   =>      ADDR_ADV_LD_N,
        DM      => DM,
    
-- SRAM interface
--      CLKOUT          :inout std_logic;               -- PLL output
        SA      => SA,
        DQ      => DQ,
        RW_N    => RW_N,
        ADV_LD_N    => ADV_LD_N,
        BW_N        => BW_N
    ); 
idt71v3556p:idt71v3556
                   
        port map ( 
          --  Dq    => dq,    
          --  Addr  => sa,  
          --  Clk   => clkzbt,   
          --  Ld_n  => adv_ld_n,  
          --  Bwa_n => bw_n(0), 
          --  Bwb_n => bw_n(1), 
          --  Bwc_n => bw_n(2), 
          --  Bwd_n => bw_n(3), 
          --  Rw_n  => rw_n,  
           
      A0        => SAt(0),            
        A1      => SAt(1),           
        A2      => SAt(2),           
        A3      => SAt(3),           
        A4      => SAt(4),           
        A5      => SAt(5),           
        A6      => SAt(6),           
        A7      => SAt(7),           
        A8      => SAt(8),           
        A9      => SAt(9),                      
        A10     => SAt(10),                      
        A11     => SAt(11),                      
        A12     => SAt(12),                      
        A13     => SAt(13),                      
        A14     => SAt(14),                      
        A15     => SAt(15),                      
         -- A16     => SAt(16),                      
        DQA0      => dq(0),                            
        DQA1      => dq(1),                                 
        DQA2      => dq(2),                                  
        DQA3      => dq(3),                                 
        --DQA4      => dq(4),                                  
--        DQA5      => dq(5),                                 
--        DQA6      => dq(6),                                  
--        DQA7      => dq(7),                                  
        --DQA8      => dq(8),                                  
        DQB0      => dq(4),                                 
        DQB1      => dq(5),                                  
        DQB2      => dq(6),                                  
        DQB3      => dq(7),                                  
        --DQB4      => dq(12),                                  
--        DQB5      => dq(13),                                 
--        DQB6      => dq(14),                                  
--        DQB7      => dq(15),                                  
        --DQB8      => dq17),                                  
        DQC0      => dq(8),                                  
        DQC1      => dq(9),                                  
        DQC2      => dq(10),                                
        DQC3      => dq(11),                                 
        --DQC4      => dq(20),                                  
--        DQC5      => dq(21),                                  
--        DQC6      => dq(22),                                  
--        DQC7      => dq(23),                                  
        --DQC8      => dq(26),                                  
        DQD0      => dq(12),                                  
        DQD1      => dq(13),                                  
        DQD2      => dq(14),                                  
        DQD3      => dq(15),                               
        --DQD4      => dq(28),                                  
--        DQD5      => dq(29),                                  
--        DQD6      => dq(30),                                  
--        DQD7      => dq(31),                                  
        --DQD8      => dq(35),                                  
        ADV       => adv_ld_n_m,      
        R         => rw_n_m,      
      --  CLKENNeg        : IN    std_logic := 'U';
        BWDNeg    => bw_n_m(3),      
        BWCNeg    => bw_n_m(2),    
        BWBNeg    => bw_n_m(1),    
        BWANeg    => bw_n_m(0),      
      --  CE1Neg          : IN    std_logic := 'U';
      --  CE2Neg          : IN    std_logic := 'U';
      --  CE2             : IN    std_logic := 'U';
        CLK       => clk 
      --  LBONeg          : IN    std_logic := '1';
      --  OENeg           : IN    std_logic := 'U';
  
           
           
      
        );
    
end;