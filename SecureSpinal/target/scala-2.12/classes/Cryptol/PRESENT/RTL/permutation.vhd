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


entity permutation is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end permutation;

architecture arch of permutation is

begin
  process(io_stateIn)
  begin
    io_stateOut(0) <= pkg_extract(io_stateIn,0);
    io_stateOut(16) <= pkg_extract(io_stateIn,1);
    io_stateOut(32) <= pkg_extract(io_stateIn,2);
    io_stateOut(48) <= pkg_extract(io_stateIn,3);
    io_stateOut(1) <= pkg_extract(io_stateIn,4);
    io_stateOut(17) <= pkg_extract(io_stateIn,5);
    io_stateOut(33) <= pkg_extract(io_stateIn,6);
    io_stateOut(49) <= pkg_extract(io_stateIn,7);
    io_stateOut(2) <= pkg_extract(io_stateIn,8);
    io_stateOut(18) <= pkg_extract(io_stateIn,9);
    io_stateOut(34) <= pkg_extract(io_stateIn,10);
    io_stateOut(50) <= pkg_extract(io_stateIn,11);
    io_stateOut(3) <= pkg_extract(io_stateIn,12);
    io_stateOut(19) <= pkg_extract(io_stateIn,13);
    io_stateOut(35) <= pkg_extract(io_stateIn,14);
    io_stateOut(51) <= pkg_extract(io_stateIn,15);
    io_stateOut(4) <= pkg_extract(io_stateIn,16);
    io_stateOut(20) <= pkg_extract(io_stateIn,17);
    io_stateOut(36) <= pkg_extract(io_stateIn,18);
    io_stateOut(52) <= pkg_extract(io_stateIn,19);
    io_stateOut(5) <= pkg_extract(io_stateIn,20);
    io_stateOut(21) <= pkg_extract(io_stateIn,21);
    io_stateOut(37) <= pkg_extract(io_stateIn,22);
    io_stateOut(53) <= pkg_extract(io_stateIn,23);
    io_stateOut(6) <= pkg_extract(io_stateIn,24);
    io_stateOut(22) <= pkg_extract(io_stateIn,25);
    io_stateOut(38) <= pkg_extract(io_stateIn,26);
    io_stateOut(54) <= pkg_extract(io_stateIn,27);
    io_stateOut(7) <= pkg_extract(io_stateIn,28);
    io_stateOut(23) <= pkg_extract(io_stateIn,29);
    io_stateOut(39) <= pkg_extract(io_stateIn,30);
    io_stateOut(55) <= pkg_extract(io_stateIn,31);
    io_stateOut(8) <= pkg_extract(io_stateIn,32);
    io_stateOut(24) <= pkg_extract(io_stateIn,33);
    io_stateOut(40) <= pkg_extract(io_stateIn,34);
    io_stateOut(56) <= pkg_extract(io_stateIn,35);
    io_stateOut(9) <= pkg_extract(io_stateIn,36);
    io_stateOut(25) <= pkg_extract(io_stateIn,37);
    io_stateOut(41) <= pkg_extract(io_stateIn,38);
    io_stateOut(57) <= pkg_extract(io_stateIn,39);
    io_stateOut(10) <= pkg_extract(io_stateIn,40);
    io_stateOut(26) <= pkg_extract(io_stateIn,41);
    io_stateOut(42) <= pkg_extract(io_stateIn,42);
    io_stateOut(58) <= pkg_extract(io_stateIn,43);
    io_stateOut(11) <= pkg_extract(io_stateIn,44);
    io_stateOut(27) <= pkg_extract(io_stateIn,45);
    io_stateOut(43) <= pkg_extract(io_stateIn,46);
    io_stateOut(59) <= pkg_extract(io_stateIn,47);
    io_stateOut(12) <= pkg_extract(io_stateIn,48);
    io_stateOut(28) <= pkg_extract(io_stateIn,49);
    io_stateOut(44) <= pkg_extract(io_stateIn,50);
    io_stateOut(60) <= pkg_extract(io_stateIn,51);
    io_stateOut(13) <= pkg_extract(io_stateIn,52);
    io_stateOut(29) <= pkg_extract(io_stateIn,53);
    io_stateOut(45) <= pkg_extract(io_stateIn,54);
    io_stateOut(61) <= pkg_extract(io_stateIn,55);
    io_stateOut(14) <= pkg_extract(io_stateIn,56);
    io_stateOut(30) <= pkg_extract(io_stateIn,57);
    io_stateOut(46) <= pkg_extract(io_stateIn,58);
    io_stateOut(62) <= pkg_extract(io_stateIn,59);
    io_stateOut(15) <= pkg_extract(io_stateIn,60);
    io_stateOut(31) <= pkg_extract(io_stateIn,61);
    io_stateOut(47) <= pkg_extract(io_stateIn,62);
    io_stateOut(63) <= pkg_extract(io_stateIn,63);
  end process;

end arch;

