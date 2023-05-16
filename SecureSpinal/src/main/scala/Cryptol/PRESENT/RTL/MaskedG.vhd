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


entity MaskedG is
  port(
    io_in1 : in std_logic_vector(3 downto 0);
    io_in2 : in std_logic_vector(3 downto 0);
    io_in3 : in std_logic_vector(3 downto 0);
    io_out1 : out std_logic_vector(3 downto 0);
    io_out2 : out std_logic_vector(3 downto 0);
    io_out3 : out std_logic_vector(3 downto 0)
  );
end MaskedG;

architecture arch of MaskedG is
  signal zz_g10 : std_logic;
  signal zz_g10_1 : std_logic;
  signal zz_g20 : std_logic;

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
  signal g13 : std_logic;
  signal g12 : std_logic;
  signal g11 : std_logic;
  signal g10 : std_logic;
  signal g23 : std_logic;
  signal g22 : std_logic;
  signal g21 : std_logic;
  signal g20 : std_logic;
  signal g33 : std_logic;
  signal g32 : std_logic;
  signal g31 : std_logic;
  signal g30 : std_logic;
begin
  zz_g10 <= (pkg_toStdLogic(true) xor w2);
  zz_g10_1 <= (x2 and y2);
  zz_g20 <= (x3 and y3);
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
  g13 <= ((y2 xor z2) xor w2);
  g12 <= ((pkg_toStdLogic(true) xor y2) xor z2);
  g11 <= ((((((((pkg_toStdLogic(true) xor x2) xor z2) xor (y2 and w2)) xor (y2 and w3)) xor (y3 and w2)) xor (z2 and w2)) xor (z2 and w3)) xor (z3 and w2));
  g10 <= (((((((((zz_g10 xor zz_g10_1) xor (x2 and y3)) xor (x3 and y2)) xor (x2 and z2)) xor (x2 and z3)) xor (x3 and z2)) xor (y2 and z2)) xor (y2 and z3)) xor (y3 and z2));
  g23 <= ((y3 xor z3) xor w3);
  g22 <= (y3 xor z3);
  g21 <= (((((((x3 xor z3) xor (y3 and w3)) xor (y1 and w3)) xor (y3 and w1)) xor (z3 and w3)) xor (z1 and w3)) xor (z3 and w1));
  g20 <= (((((((((w3 xor zz_g20) xor (x1 and y3)) xor (x3 and y1)) xor (x3 and z3)) xor (x1 and z3)) xor (x3 and z1)) xor (y3 and z3)) xor (y1 and z3)) xor (y3 and z1));
  g33 <= ((y1 xor z1) xor w1);
  g32 <= (y1 xor z1);
  g31 <= (((((((x1 xor z1) xor (y1 and w1)) xor (y1 and w2)) xor (y2 and w1)) xor (z1 and w1)) xor (z1 and w2)) xor (z2 and w1));
  g30 <= (((((((((w1 xor (x1 and y1)) xor (x1 and y2)) xor (x2 and y1)) xor (x1 and z1)) xor (x1 and z2)) xor (x2 and z1)) xor (y1 and z1)) xor (y1 and z2)) xor (y2 and z1));
  process(g13,g12,g11,g10)
  begin
    io_out1(3) <= g13;
    io_out1(2) <= g12;
    io_out1(1) <= g11;
    io_out1(0) <= g10;
  end process;

  process(g23,g22,g21,g20)
  begin
    io_out2(3) <= g23;
    io_out2(2) <= g22;
    io_out2(1) <= g21;
    io_out2(0) <= g20;
  end process;

  process(g33,g32,g31,g30)
  begin
    io_out3(3) <= g33;
    io_out3(2) <= g32;
    io_out3(1) <= g31;
    io_out3(0) <= g30;
  end process;

end arch;

