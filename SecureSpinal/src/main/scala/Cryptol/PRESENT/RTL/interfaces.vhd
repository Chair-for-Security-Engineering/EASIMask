library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.ceil;
--use work.config.all;

package config is
  constant width_plain : integer := 64;
  constant shares_plain : integer := 3;  
  constant width_key : integer := 80;
  constant shares_key : integer := 3;
  constant width_cipher : integer := 64;
  constant shares_cipher : integer := 3;
end config;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.ceil;
use work.config.all;

package interfaces is


  type target_in_t is
    record
    clk		: STD_LOGIC;
    enable	: STD_LOGIC;
    wr_en	: std_logic;
    rst 	: std_logic;
  end record;

  type target_out_t is
    record
    rd_en	: std_logic;
    ready	: STD_LOGIC;
    busy	: STD_LOGIC;
  end record;

  type target_inout_t is
    record		
    data	: std_logic_vector(31 downto 0);
    addr	: std_logic_vector(7 downto 0);
  end record;


  type trigger_in_t is
    record
    start				: std_logic;
    cont				: std_logic;
  end record;

  type trigger_out_t is
    record
    pin 		: STD_LOGIC;
    ready		: STD_LOGIC;
    downclock		: STD_LOGIC;
  end record;


  type uart_out_t is
    record
    data	: std_logic_vector(7 downto 0);
    empty	: std_logic;
    full	: std_logic;
  end record;

  type uart_in_t is
    record
    data	: std_logic_vector(7 downto 0);
    wr_en	: std_logic;
    rd_en	: std_logic;
  end record;

  type mem_port32_in_t is
    record
    en : std_logic;
    we : std_logic;
    addr : std_logic_vector(13 downto 0);
    data_in : std_logic_vector(31 downto 0);
  end record;

  type mem_port8_in_t is
    record
    en : std_logic;
    we : std_logic;
    addr : std_logic_vector(15 downto 0);
    data_in : std_logic_vector(7 downto 0);
  end record;


  -- TODO: generic width of 2nd dimension
  type rand_texts_t is array(natural range <>) of std_logic_vector(width_plain-1 downto 0);	


  -- 'mem' adresses on target
  constant target_addr_key : unsigned(7 downto 0) := to_unsigned(16#00#, 8);
  constant target_addr_plain : unsigned(7 downto 0) := to_unsigned(16#01#, 8);
  constant target_addr_conf : std_logic_vector(7 downto 0) := x"80";
  constant target_addr_repeat : std_logic_vector(7 downto 0) := x"84";

  type target_addr_masks_t is array (0 to 5) of unsigned(7 downto 0);  
  constant target_addr_masks : target_addr_masks_t := (X"80", X"90", X"a0", X"b0", X"c0", X"d0");

  -- delay on target 
  constant target_pre_delay : unsigned(7 downto 0) := to_unsigned(10, 8);

  -- Array for shares, used in target
  --type shares_t is array (0 to shares-1) of std_logic_vector(width-1 downto 0);
  type shares_cipher_t is array (0 to shares_cipher-1) of std_logic_vector(width_cipher-1 downto 0);
  type shares_plain_t is array (0 to shares_plain-1) of std_logic_vector(width_plain-1 downto 0);
  type shares_key_t is array (0 to shares_key-1) of std_logic_vector(width_key-1 downto 0);
  
  -- 'mem' adresses on ctrl
  constant byte_width_cipher : natural := natural((width_cipher + 32-1) / 32)*4;
  constant word_width_cipher : natural := natural((width_cipher + 32-1) / 32);
  
  constant byte_width_plain : natural  := natural((width_plain + 32-1) / 32)*4;
  constant word_width_plain : natural  := natural((width_plain + 32-1) / 32);
  
  constant byte_width_key : natural    := natural((width_key + 32-1) / 32)*4;
  constant word_width_key : natural    := natural((width_key + 32-1) / 32);
  
  
  -- how wide is a group of shares (eg plain1.1, plain1.2, plain1.3 for 3 shares)
  constant group_byte_width_cipher : natural := shares_cipher * byte_width_cipher;
  constant group_word_width_cipher : natural := shares_cipher * word_width_cipher;
  
  constant group_byte_width_key : natural    := shares_key * byte_width_key;
  constant group_word_width_key : natural    := shares_key * word_width_key;
  
  constant group_byte_width_plain : natural  := shares_plain * byte_width_plain;
  constant group_word_width_plain : natural  := shares_plain * word_width_plain;    

  -- 8bit mem port adresses
  constant reg_mode	     : std_logic_vector(15 downto 0) := x"0000";
  constant reg_clk_div	     : std_logic_vector(15 downto 0) := x"0001";
  constant reg_measures	     : std_logic_vector(15 downto 0) := x"0004";
  constant reg_target_conf   : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_measures) + 4);
  
  constant reg_repeat        : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_target_conf) + 4);

  constant reg_seed1	     : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_repeat) + 4);
  constant reg_seed2	     : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_seed1) + (64 / 8));
  constant reg_output_hash   : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_seed2) + (64 / 8));  

  constant reg_key           : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_output_hash) + (32 / 8));   
  constant reg_plain1        : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_key) + group_byte_width_key);
  constant reg_plain2        : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_plain1) + group_byte_width_plain);
  constant reg_cipher        : std_logic_vector(15 downto 0) := std_logic_vector(unsigned(reg_plain2) + group_byte_width_plain);

  -- 32bit mem port adresses
  constant reg32_conf        : std_logic_vector(13 downto 0) := "00000000000000";
  constant reg32_mode        : std_logic_vector(13 downto 0) := "00000000000000";
  constant reg32_measures    : std_logic_vector(13 downto 0) := "00000000000001";
  constant reg32_target_conf : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_measures) + 1);

  constant reg32_repeat      : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_target_conf) + 1);

  constant reg32_seed1       : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_repeat) + 1);
  constant reg32_seed2       : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_seed1) + (64 / 32));
  constant reg32_output_hash : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_seed2) + (64 / 32));
  
  constant reg32_key         : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_output_hash) + (32 / 32));  
  constant reg32_plain1      : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_key)    + group_word_width_key);
  constant reg32_plain2      : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_plain1) + group_word_width_plain);
  constant reg32_cipher      : std_logic_vector(13 downto 0) := std_logic_vector(unsigned(reg32_plain2) + group_word_width_plain);
  
end interfaces;

