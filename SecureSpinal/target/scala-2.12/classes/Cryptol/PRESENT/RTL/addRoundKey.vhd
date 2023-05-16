-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : present_wrapper
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity addRoundKey is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_key : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end addRoundKey;

architecture arch of addRoundKey is

begin
  io_stateOut <= (io_stateIn xor io_key);
end arch;

