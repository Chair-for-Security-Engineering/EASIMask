library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.interfaces.all;

entity dut is
  port (
    clk       : in std_logic;
    rst       : in std_logic;
    rst_full  : in std_logic;
    start     : in std_logic;
    shares_in : in shares_plain_t;
    key_in    : in shares_key_t;
    result    : out shares_cipher_t;
    conf      :     std_logic_vector(31 downto 0);
    done      : out std_logic
  );
end entity;