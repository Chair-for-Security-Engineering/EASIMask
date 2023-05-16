-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : AES
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity SBox is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_sbox_in : in std_logic_vector(15 downto 0);
    io_mask : in std_logic_vector(37 downto 0);
    io_sbox_out : out std_logic_vector(15 downto 0)
  );
end SBox;

architecture arch of SBox is
  signal sb1_sbox_out : std_logic_vector(15 downto 0);

  component aes_sbox_wrapper is
    port( 
      clk : in std_logic;
      reset : in std_logic;
      sbox_in : in std_logic_vector;
      mask : in std_logic_vector;
      sbox_out : out std_logic_vector 
    );
  end component;
  

begin
  sb1 : aes_sbox_wrapper
    port map ( 
      clk => io_clk,
      reset => io_reset,
      sbox_in => io_sbox_in,
      mask => io_mask,
      sbox_out => sb1_sbox_out 
    );
  io_sbox_out <= sb1_sbox_out;
end arch;

