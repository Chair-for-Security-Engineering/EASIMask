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


entity MaskedF is
  port(
    io_in1 : in std_logic_vector(3 downto 0);
    io_in2 : in std_logic_vector(3 downto 0);
    io_in3 : in std_logic_vector(3 downto 0);
    io_out1 : out std_logic_vector(3 downto 0);
    io_out2 : out std_logic_vector(3 downto 0);
    io_out3 : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end MaskedF;

architecture arch of MaskedF is

  signal dummy : std_logic;
  signal x1 : std_logic;
  signal x2 : std_logic;
  signal x3 : std_logic;
  signal y1 : std_logic;
  signal y2 : std_logic;
  signal y3 : std_logic;
  signal z1 : std_logic;
  signal z2 : std_logic;
  signal z3 : std_logic;
  signal w1 : std_logic;
  signal w2 : std_logic;
  signal w3 : std_logic;
  signal f13 : std_logic;
  signal f12 : std_logic;
  signal f11 : std_logic;
  signal f10 : std_logic;
  signal f23 : std_logic;
  signal f22 : std_logic;
  signal f21 : std_logic;
  signal f20 : std_logic;
  signal f33 : std_logic;
  signal f32 : std_logic;
  signal f31 : std_logic;
  signal f30 : std_logic;
begin
  x1 <= pkg_extract(io_in1,3);
  x2 <= pkg_extract(io_in2,3);
  x3 <= pkg_extract(io_in3,3);
  y1 <= pkg_extract(io_in1,2);
  y2 <= pkg_extract(io_in2,2);
  y3 <= pkg_extract(io_in3,2);
  z1 <= pkg_extract(io_in1,1);
  z2 <= pkg_extract(io_in2,1);
  z3 <= pkg_extract(io_in3,1);
  w1 <= pkg_extract(io_in1,0);
  w2 <= pkg_extract(io_in2,0);
  w3 <= pkg_extract(io_in3,0);
  f13 <= (((((y2 xor z2) xor w2) xor (x2 and w2)) xor (x2 and w3)) xor (x3 and w2));
  f12 <= (((x2 xor (z2 and w2)) xor (z2 and w3)) xor (z3 and w2));
  f11 <= ((((y2 xor z2) xor (x2 and w2)) xor (x2 and w3)) xor (x3 and w2));
  f10 <= (((z2 xor (y2 and w2)) xor (y2 and w3)) xor (y3 and w2));
  f23 <= (((((y3 xor z3) xor w3) xor (x3 and w3)) xor (x1 and w3)) xor (x3 and w1));
  f22 <= (((x3 xor (z3 and w3)) xor (z1 and w3)) xor (z3 and w1));
  f21 <= ((((y3 xor z3) xor (x3 and w3)) xor (x1 and w3)) xor (x3 and w1));
  f20 <= (((z3 xor (y3 and w3)) xor (y1 and w3)) xor (y3 and w1));
  f33 <= (((((y1 xor z1) xor w1) xor (x1 and w1)) xor (x1 and w2)) xor (x2 and w1));
  f32 <= (((x1 xor (z1 and w1)) xor (z1 and w2)) xor (z2 and w1));
  f31 <= ((((y1 xor z1) xor (x1 and w1)) xor (x1 and w2)) xor (x2 and w1));
  f30 <= (((z1 xor (y1 and w1)) xor (y1 and w2)) xor (y2 and w1));
  process(f13,f12,f11,f10)
  begin
    io_out1(3) <= f13;
    io_out1(2) <= f12;
    io_out1(1) <= f11;
    io_out1(0) <= f10;
  end process;

  process(f23,f22,f21,f20)
  begin
    io_out2(3) <= f23;
    io_out2(2) <= f22;
    io_out2(1) <= f21;
    io_out2(0) <= f20;
  end process;

  process(f33,f32,f31,f30)
  begin
    io_out3(3) <= f33;
    io_out3(2) <= f32;
    io_out3(1) <= f31;
    io_out3(0) <= f30;
  end process;

end arch;

