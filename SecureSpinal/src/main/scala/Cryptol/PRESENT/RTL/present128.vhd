-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : present128
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type States is (sIdle,sExecute,sDone);

  function pkg_mux (sel : std_logic; one : States; zero : States) return States;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector;
  function pkg_toStates_native (value : std_logic_vector(1 downto 0)) return States;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : States; zero : States) return States is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toStates_native (value : std_logic_vector(1 downto 0)) return States is
  begin
    case value is
      when "00" => return sIdle;
      when "01" => return sExecute;
      when "10" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector is
  begin
    case value is
      when sIdle => return "00";
      when sExecute => return "01";
      when sDone => return "10";
      when others => return "00";
    end case;
  end;
end pkg_enum;


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_not (value : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_not (value : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;
  function pkg_not (value : signed) return signed;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed;

  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned (value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : unsigned) return unsigned is
    variable ret : unsigned(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : signed; bitId : integer) return std_logic is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : signed) return signed is
    variable ret : signed(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;


  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    if size >= that'length then
      return "";
    else
      ret := shift_right(that,size);
      return ret(that'length-1-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    ret := shift_right(that,to_integer(size));
    return ret;
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;

  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed is
  begin
    return shift_left(resize(that,w),to_integer(size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed is
    variable ret : signed(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    alias ret : std_logic_vector(lit'length-1 downto 0) is lit;
  begin
    return ret;
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    alias ret : unsigned(lit'length-1 downto 0) is lit;
  begin
    return ret;
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    alias ret : signed(lit'length-1 downto 0) is lit;
  begin
    return ret;
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;

  function pkg_resize (that : unsigned; width : integer) return unsigned is
    variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
  function pkg_resize (that : signed; width : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
    variable ret : signed(width-1 downto 0);
  begin
    if temp'length = 0 then
       ret := (others => '0');
    elsif temp'length >= width then
       ret := temp(width-1 downto 0);
    else
       ret := resize(temp,width);
    end if;
    return ret;
  end pkg_resize;
end pkg_scala2hdl;


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


--MaskedG_1 replaced by MaskedG


--MaskedF_1 replaced by MaskedF


--MaskedG_2 replaced by MaskedG


--MaskedF_2 replaced by MaskedF


--MaskedG_3 replaced by MaskedG


--MaskedF_3 replaced by MaskedF


--MaskedG_4 replaced by MaskedG


--MaskedF_4 replaced by MaskedF


--MaskedG_5 replaced by MaskedG


--MaskedF_5 replaced by MaskedF


--MaskedG_6 replaced by MaskedG


--MaskedF_6 replaced by MaskedF


--MaskedG_7 replaced by MaskedG


--MaskedF_7 replaced by MaskedF


--MaskedG_8 replaced by MaskedG


--MaskedF_8 replaced by MaskedF


--MaskedG_9 replaced by MaskedG


--MaskedF_9 replaced by MaskedF


--MaskedG_10 replaced by MaskedG


--MaskedF_10 replaced by MaskedF


--MaskedG_11 replaced by MaskedG


--MaskedF_11 replaced by MaskedF


--MaskedG_12 replaced by MaskedG


--MaskedF_12 replaced by MaskedF


--MaskedG_13 replaced by MaskedG


--MaskedF_13 replaced by MaskedF


--MaskedG_14 replaced by MaskedG


--MaskedF_14 replaced by MaskedF


--MaskedG_15 replaced by MaskedG


--MaskedF_15 replaced by MaskedF


--MaskedG_16 replaced by MaskedG


--MaskedF_16 replaced by MaskedF


--MaskedG_17 replaced by MaskedG


--MaskedF_17 replaced by MaskedF

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MaskedSBox is
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
end MaskedSBox;

architecture arch of MaskedSBox is
  signal G_io_out1 : std_logic_vector(3 downto 0);
  signal G_io_out2 : std_logic_vector(3 downto 0);
  signal G_io_out3 : std_logic_vector(3 downto 0);
  signal F_io_out1 : std_logic_vector(3 downto 0);
  signal F_io_out2 : std_logic_vector(3 downto 0);
  signal F_io_out3 : std_logic_vector(3 downto 0);

  signal GOut1 : std_logic_vector(3 downto 0);
  signal GOut2 : std_logic_vector(3 downto 0);
  signal GOut3 : std_logic_vector(3 downto 0);
  signal dummy : std_logic;
begin
  G : entity work.MaskedG
    port map ( 
      io_in1 => io_in1,
      io_in2 => io_in2,
      io_in3 => io_in3,
      io_out1 => G_io_out1,
      io_out2 => G_io_out2,
      io_out3 => G_io_out3 
    );
  F : entity work.MaskedF
    port map ( 
      io_in1 => GOut1,
      io_in2 => GOut2,
      io_in3 => GOut3,
      io_out1 => F_io_out1,
      io_out2 => F_io_out2,
      io_out3 => F_io_out3,
      clk => clk,
      reset => reset 
    );
  io_out1 <= F_io_out1;
  io_out2 <= F_io_out2;
  io_out3 <= F_io_out3;
  process(clk, reset)
  begin
    if reset = '1' then
      GOut1 <= pkg_stdLogicVector("0000");
      GOut2 <= pkg_stdLogicVector("0000");
      GOut3 <= pkg_stdLogicVector("0000");
    elsif rising_edge(clk) then
      GOut1 <= G_io_out1;
      GOut2 <= G_io_out2;
      GOut3 <= G_io_out3;
    end if;
  end process;

end arch;


--MaskedSBox_1 replaced by MaskedSBox


--MaskedSBox_2 replaced by MaskedSBox


--MaskedSBox_3 replaced by MaskedSBox


--MaskedSBox_4 replaced by MaskedSBox


--MaskedSBox_5 replaced by MaskedSBox


--MaskedSBox_6 replaced by MaskedSBox


--MaskedSBox_7 replaced by MaskedSBox


--MaskedSBox_8 replaced by MaskedSBox


--MaskedSBox_9 replaced by MaskedSBox


--MaskedSBox_10 replaced by MaskedSBox


--MaskedSBox_11 replaced by MaskedSBox


--MaskedSBox_12 replaced by MaskedSBox


--MaskedSBox_13 replaced by MaskedSBox


--MaskedSBox_14 replaced by MaskedSBox


--MaskedSBox_15 replaced by MaskedSBox


--MaskedSBox_16 replaced by MaskedSBox


--MaskedSBox_17 replaced by MaskedSBox

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


--addRoundKey_1 replaced by addRoundKey


--addRoundKey_2 replaced by addRoundKey

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity updateKey128Shared is
  port(
    io_keyIn1 : in std_logic_vector(127 downto 0);
    io_keyIn2 : in std_logic_vector(127 downto 0);
    io_keyIn3 : in std_logic_vector(127 downto 0);
    io_round : in std_logic_vector(4 downto 0);
    io_keyOut1 : out std_logic_vector(127 downto 0);
    io_keyOut2 : out std_logic_vector(127 downto 0);
    io_keyOut3 : out std_logic_vector(127 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end updateKey128Shared;

architecture arch of updateKey128Shared is
  signal sbox1_io_in1 : std_logic_vector(3 downto 0);
  signal sbox1_io_in2 : std_logic_vector(3 downto 0);
  signal sbox1_io_in3 : std_logic_vector(3 downto 0);
  signal sbox2_io_in1 : std_logic_vector(3 downto 0);
  signal sbox2_io_in2 : std_logic_vector(3 downto 0);
  signal sbox2_io_in3 : std_logic_vector(3 downto 0);
  signal sbox1_io_out1 : std_logic_vector(3 downto 0);
  signal sbox1_io_out2 : std_logic_vector(3 downto 0);
  signal sbox1_io_out3 : std_logic_vector(3 downto 0);
  signal sbox2_io_out1 : std_logic_vector(3 downto 0);
  signal sbox2_io_out2 : std_logic_vector(3 downto 0);
  signal sbox2_io_out3 : std_logic_vector(3 downto 0);

  signal k11 : std_logic_vector(127 downto 0);
  signal k12 : std_logic_vector(127 downto 0);
  signal k13 : std_logic_vector(127 downto 0);
  signal k21 : std_logic_vector(127 downto 0);
  signal k22 : std_logic_vector(127 downto 0);
  signal k23 : std_logic_vector(127 downto 0);
  signal k31 : std_logic_vector(127 downto 0);
  signal k32 : std_logic_vector(127 downto 0);
  signal k33 : std_logic_vector(127 downto 0);
  signal k11Reg : std_logic_vector(127 downto 0);
  signal k12Reg : std_logic_vector(127 downto 0);
  signal k13Reg : std_logic_vector(127 downto 0);
begin
  sbox1 : entity work.MaskedSBox
    port map ( 
      io_in1 => sbox1_io_in1,
      io_in2 => sbox1_io_in2,
      io_in3 => sbox1_io_in3,
      io_out1 => sbox1_io_out1,
      io_out2 => sbox1_io_out2,
      io_out3 => sbox1_io_out3,
      clk => clk,
      reset => reset 
    );
  sbox2 : entity work.MaskedSBox
    port map ( 
      io_in1 => sbox2_io_in1,
      io_in2 => sbox2_io_in2,
      io_in3 => sbox2_io_in3,
      io_out1 => sbox2_io_out1,
      io_out2 => sbox2_io_out2,
      io_out3 => sbox2_io_out3,
      clk => clk,
      reset => reset 
    );
  sbox1_io_in1 <= pkg_extract(k11,127,124);
  sbox1_io_in2 <= pkg_extract(k12,127,124);
  sbox1_io_in3 <= pkg_extract(k13,127,124);
  sbox2_io_in1 <= pkg_extract(k11,123,120);
  sbox2_io_in2 <= pkg_extract(k12,123,120);
  sbox2_io_in3 <= pkg_extract(k13,123,120);
  k11 <= pkg_cat(pkg_extract(io_keyIn1,66,0),pkg_extract(io_keyIn1,127,67));
  k12 <= pkg_cat(pkg_extract(io_keyIn2,66,0),pkg_extract(io_keyIn2,127,67));
  k13 <= pkg_cat(pkg_extract(io_keyIn3,66,0),pkg_extract(io_keyIn3,127,67));
  k21 <= pkg_cat(pkg_cat(sbox1_io_out1,sbox2_io_out1),pkg_extract(k11Reg,119,0));
  k22 <= pkg_cat(pkg_cat(sbox1_io_out2,sbox2_io_out2),pkg_extract(k12Reg,119,0));
  k23 <= pkg_cat(pkg_cat(sbox1_io_out3,sbox2_io_out3),pkg_extract(k13Reg,119,0));
  k31 <= pkg_cat(pkg_cat(pkg_extract(k21,127,67),(pkg_extract(k21,66,62) xor io_round)),pkg_extract(k21,61,0));
  k32 <= pkg_cat(pkg_cat(pkg_extract(k22,127,67),pkg_extract(k22,66,62)),pkg_extract(k22,61,0));
  k33 <= pkg_cat(pkg_cat(pkg_extract(k23,127,67),pkg_extract(k23,66,62)),pkg_extract(k23,61,0));
  io_keyOut1 <= k31;
  io_keyOut2 <= k32;
  io_keyOut3 <= k33;
  process(clk)
  begin
    if rising_edge(clk) then
      k11Reg <= k11;
      k12Reg <= k12;
      k13Reg <= k13;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity sboxLayerShared is
  port(
    io_stateIn1 : in std_logic_vector(63 downto 0);
    io_stateIn2 : in std_logic_vector(63 downto 0);
    io_stateIn3 : in std_logic_vector(63 downto 0);
    io_stateOut1 : out std_logic_vector(63 downto 0);
    io_stateOut2 : out std_logic_vector(63 downto 0);
    io_stateOut3 : out std_logic_vector(63 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end sboxLayerShared;

architecture arch of sboxLayerShared is
  signal maskedSBox_18_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_out3 : std_logic_vector(3 downto 0);

begin
  maskedSBox_18 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_18_io_in1,
      io_in2 => maskedSBox_18_io_in2,
      io_in3 => maskedSBox_18_io_in3,
      io_out1 => maskedSBox_18_io_out1,
      io_out2 => maskedSBox_18_io_out2,
      io_out3 => maskedSBox_18_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_19 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_19_io_in1,
      io_in2 => maskedSBox_19_io_in2,
      io_in3 => maskedSBox_19_io_in3,
      io_out1 => maskedSBox_19_io_out1,
      io_out2 => maskedSBox_19_io_out2,
      io_out3 => maskedSBox_19_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_20 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_20_io_in1,
      io_in2 => maskedSBox_20_io_in2,
      io_in3 => maskedSBox_20_io_in3,
      io_out1 => maskedSBox_20_io_out1,
      io_out2 => maskedSBox_20_io_out2,
      io_out3 => maskedSBox_20_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_21 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_21_io_in1,
      io_in2 => maskedSBox_21_io_in2,
      io_in3 => maskedSBox_21_io_in3,
      io_out1 => maskedSBox_21_io_out1,
      io_out2 => maskedSBox_21_io_out2,
      io_out3 => maskedSBox_21_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_22 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_22_io_in1,
      io_in2 => maskedSBox_22_io_in2,
      io_in3 => maskedSBox_22_io_in3,
      io_out1 => maskedSBox_22_io_out1,
      io_out2 => maskedSBox_22_io_out2,
      io_out3 => maskedSBox_22_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_23 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_23_io_in1,
      io_in2 => maskedSBox_23_io_in2,
      io_in3 => maskedSBox_23_io_in3,
      io_out1 => maskedSBox_23_io_out1,
      io_out2 => maskedSBox_23_io_out2,
      io_out3 => maskedSBox_23_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_24 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_24_io_in1,
      io_in2 => maskedSBox_24_io_in2,
      io_in3 => maskedSBox_24_io_in3,
      io_out1 => maskedSBox_24_io_out1,
      io_out2 => maskedSBox_24_io_out2,
      io_out3 => maskedSBox_24_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_25 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_25_io_in1,
      io_in2 => maskedSBox_25_io_in2,
      io_in3 => maskedSBox_25_io_in3,
      io_out1 => maskedSBox_25_io_out1,
      io_out2 => maskedSBox_25_io_out2,
      io_out3 => maskedSBox_25_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_26 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_26_io_in1,
      io_in2 => maskedSBox_26_io_in2,
      io_in3 => maskedSBox_26_io_in3,
      io_out1 => maskedSBox_26_io_out1,
      io_out2 => maskedSBox_26_io_out2,
      io_out3 => maskedSBox_26_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_27 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_27_io_in1,
      io_in2 => maskedSBox_27_io_in2,
      io_in3 => maskedSBox_27_io_in3,
      io_out1 => maskedSBox_27_io_out1,
      io_out2 => maskedSBox_27_io_out2,
      io_out3 => maskedSBox_27_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_28 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_28_io_in1,
      io_in2 => maskedSBox_28_io_in2,
      io_in3 => maskedSBox_28_io_in3,
      io_out1 => maskedSBox_28_io_out1,
      io_out2 => maskedSBox_28_io_out2,
      io_out3 => maskedSBox_28_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_29 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_29_io_in1,
      io_in2 => maskedSBox_29_io_in2,
      io_in3 => maskedSBox_29_io_in3,
      io_out1 => maskedSBox_29_io_out1,
      io_out2 => maskedSBox_29_io_out2,
      io_out3 => maskedSBox_29_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_30 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_30_io_in1,
      io_in2 => maskedSBox_30_io_in2,
      io_in3 => maskedSBox_30_io_in3,
      io_out1 => maskedSBox_30_io_out1,
      io_out2 => maskedSBox_30_io_out2,
      io_out3 => maskedSBox_30_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_31 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_31_io_in1,
      io_in2 => maskedSBox_31_io_in2,
      io_in3 => maskedSBox_31_io_in3,
      io_out1 => maskedSBox_31_io_out1,
      io_out2 => maskedSBox_31_io_out2,
      io_out3 => maskedSBox_31_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_32 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_32_io_in1,
      io_in2 => maskedSBox_32_io_in2,
      io_in3 => maskedSBox_32_io_in3,
      io_out1 => maskedSBox_32_io_out1,
      io_out2 => maskedSBox_32_io_out2,
      io_out3 => maskedSBox_32_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_33 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_33_io_in1,
      io_in2 => maskedSBox_33_io_in2,
      io_in3 => maskedSBox_33_io_in3,
      io_out1 => maskedSBox_33_io_out1,
      io_out2 => maskedSBox_33_io_out2,
      io_out3 => maskedSBox_33_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_18_io_in1 <= pkg_extract(io_stateIn1,3,0);
  maskedSBox_18_io_in2 <= pkg_extract(io_stateIn2,3,0);
  maskedSBox_18_io_in3 <= pkg_extract(io_stateIn3,3,0);
  process(maskedSBox_18_io_out1,maskedSBox_19_io_out1,maskedSBox_20_io_out1,maskedSBox_21_io_out1,maskedSBox_22_io_out1,maskedSBox_23_io_out1,maskedSBox_24_io_out1,maskedSBox_25_io_out1,maskedSBox_26_io_out1,maskedSBox_27_io_out1,maskedSBox_28_io_out1,maskedSBox_29_io_out1,maskedSBox_30_io_out1,maskedSBox_31_io_out1,maskedSBox_32_io_out1,maskedSBox_33_io_out1)
  begin
    io_stateOut1(3 downto 0) <= maskedSBox_18_io_out1;
    io_stateOut1(7 downto 4) <= maskedSBox_19_io_out1;
    io_stateOut1(11 downto 8) <= maskedSBox_20_io_out1;
    io_stateOut1(15 downto 12) <= maskedSBox_21_io_out1;
    io_stateOut1(19 downto 16) <= maskedSBox_22_io_out1;
    io_stateOut1(23 downto 20) <= maskedSBox_23_io_out1;
    io_stateOut1(27 downto 24) <= maskedSBox_24_io_out1;
    io_stateOut1(31 downto 28) <= maskedSBox_25_io_out1;
    io_stateOut1(35 downto 32) <= maskedSBox_26_io_out1;
    io_stateOut1(39 downto 36) <= maskedSBox_27_io_out1;
    io_stateOut1(43 downto 40) <= maskedSBox_28_io_out1;
    io_stateOut1(47 downto 44) <= maskedSBox_29_io_out1;
    io_stateOut1(51 downto 48) <= maskedSBox_30_io_out1;
    io_stateOut1(55 downto 52) <= maskedSBox_31_io_out1;
    io_stateOut1(59 downto 56) <= maskedSBox_32_io_out1;
    io_stateOut1(63 downto 60) <= maskedSBox_33_io_out1;
  end process;

  process(maskedSBox_18_io_out2,maskedSBox_19_io_out2,maskedSBox_20_io_out2,maskedSBox_21_io_out2,maskedSBox_22_io_out2,maskedSBox_23_io_out2,maskedSBox_24_io_out2,maskedSBox_25_io_out2,maskedSBox_26_io_out2,maskedSBox_27_io_out2,maskedSBox_28_io_out2,maskedSBox_29_io_out2,maskedSBox_30_io_out2,maskedSBox_31_io_out2,maskedSBox_32_io_out2,maskedSBox_33_io_out2)
  begin
    io_stateOut2(3 downto 0) <= maskedSBox_18_io_out2;
    io_stateOut2(7 downto 4) <= maskedSBox_19_io_out2;
    io_stateOut2(11 downto 8) <= maskedSBox_20_io_out2;
    io_stateOut2(15 downto 12) <= maskedSBox_21_io_out2;
    io_stateOut2(19 downto 16) <= maskedSBox_22_io_out2;
    io_stateOut2(23 downto 20) <= maskedSBox_23_io_out2;
    io_stateOut2(27 downto 24) <= maskedSBox_24_io_out2;
    io_stateOut2(31 downto 28) <= maskedSBox_25_io_out2;
    io_stateOut2(35 downto 32) <= maskedSBox_26_io_out2;
    io_stateOut2(39 downto 36) <= maskedSBox_27_io_out2;
    io_stateOut2(43 downto 40) <= maskedSBox_28_io_out2;
    io_stateOut2(47 downto 44) <= maskedSBox_29_io_out2;
    io_stateOut2(51 downto 48) <= maskedSBox_30_io_out2;
    io_stateOut2(55 downto 52) <= maskedSBox_31_io_out2;
    io_stateOut2(59 downto 56) <= maskedSBox_32_io_out2;
    io_stateOut2(63 downto 60) <= maskedSBox_33_io_out2;
  end process;

  process(maskedSBox_18_io_out3,maskedSBox_19_io_out3,maskedSBox_20_io_out3,maskedSBox_21_io_out3,maskedSBox_22_io_out3,maskedSBox_23_io_out3,maskedSBox_24_io_out3,maskedSBox_25_io_out3,maskedSBox_26_io_out3,maskedSBox_27_io_out3,maskedSBox_28_io_out3,maskedSBox_29_io_out3,maskedSBox_30_io_out3,maskedSBox_31_io_out3,maskedSBox_32_io_out3,maskedSBox_33_io_out3)
  begin
    io_stateOut3(3 downto 0) <= maskedSBox_18_io_out3;
    io_stateOut3(7 downto 4) <= maskedSBox_19_io_out3;
    io_stateOut3(11 downto 8) <= maskedSBox_20_io_out3;
    io_stateOut3(15 downto 12) <= maskedSBox_21_io_out3;
    io_stateOut3(19 downto 16) <= maskedSBox_22_io_out3;
    io_stateOut3(23 downto 20) <= maskedSBox_23_io_out3;
    io_stateOut3(27 downto 24) <= maskedSBox_24_io_out3;
    io_stateOut3(31 downto 28) <= maskedSBox_25_io_out3;
    io_stateOut3(35 downto 32) <= maskedSBox_26_io_out3;
    io_stateOut3(39 downto 36) <= maskedSBox_27_io_out3;
    io_stateOut3(43 downto 40) <= maskedSBox_28_io_out3;
    io_stateOut3(47 downto 44) <= maskedSBox_29_io_out3;
    io_stateOut3(51 downto 48) <= maskedSBox_30_io_out3;
    io_stateOut3(55 downto 52) <= maskedSBox_31_io_out3;
    io_stateOut3(59 downto 56) <= maskedSBox_32_io_out3;
    io_stateOut3(63 downto 60) <= maskedSBox_33_io_out3;
  end process;

  maskedSBox_19_io_in1 <= pkg_extract(io_stateIn1,7,4);
  maskedSBox_19_io_in2 <= pkg_extract(io_stateIn2,7,4);
  maskedSBox_19_io_in3 <= pkg_extract(io_stateIn3,7,4);
  maskedSBox_20_io_in1 <= pkg_extract(io_stateIn1,11,8);
  maskedSBox_20_io_in2 <= pkg_extract(io_stateIn2,11,8);
  maskedSBox_20_io_in3 <= pkg_extract(io_stateIn3,11,8);
  maskedSBox_21_io_in1 <= pkg_extract(io_stateIn1,15,12);
  maskedSBox_21_io_in2 <= pkg_extract(io_stateIn2,15,12);
  maskedSBox_21_io_in3 <= pkg_extract(io_stateIn3,15,12);
  maskedSBox_22_io_in1 <= pkg_extract(io_stateIn1,19,16);
  maskedSBox_22_io_in2 <= pkg_extract(io_stateIn2,19,16);
  maskedSBox_22_io_in3 <= pkg_extract(io_stateIn3,19,16);
  maskedSBox_23_io_in1 <= pkg_extract(io_stateIn1,23,20);
  maskedSBox_23_io_in2 <= pkg_extract(io_stateIn2,23,20);
  maskedSBox_23_io_in3 <= pkg_extract(io_stateIn3,23,20);
  maskedSBox_24_io_in1 <= pkg_extract(io_stateIn1,27,24);
  maskedSBox_24_io_in2 <= pkg_extract(io_stateIn2,27,24);
  maskedSBox_24_io_in3 <= pkg_extract(io_stateIn3,27,24);
  maskedSBox_25_io_in1 <= pkg_extract(io_stateIn1,31,28);
  maskedSBox_25_io_in2 <= pkg_extract(io_stateIn2,31,28);
  maskedSBox_25_io_in3 <= pkg_extract(io_stateIn3,31,28);
  maskedSBox_26_io_in1 <= pkg_extract(io_stateIn1,35,32);
  maskedSBox_26_io_in2 <= pkg_extract(io_stateIn2,35,32);
  maskedSBox_26_io_in3 <= pkg_extract(io_stateIn3,35,32);
  maskedSBox_27_io_in1 <= pkg_extract(io_stateIn1,39,36);
  maskedSBox_27_io_in2 <= pkg_extract(io_stateIn2,39,36);
  maskedSBox_27_io_in3 <= pkg_extract(io_stateIn3,39,36);
  maskedSBox_28_io_in1 <= pkg_extract(io_stateIn1,43,40);
  maskedSBox_28_io_in2 <= pkg_extract(io_stateIn2,43,40);
  maskedSBox_28_io_in3 <= pkg_extract(io_stateIn3,43,40);
  maskedSBox_29_io_in1 <= pkg_extract(io_stateIn1,47,44);
  maskedSBox_29_io_in2 <= pkg_extract(io_stateIn2,47,44);
  maskedSBox_29_io_in3 <= pkg_extract(io_stateIn3,47,44);
  maskedSBox_30_io_in1 <= pkg_extract(io_stateIn1,51,48);
  maskedSBox_30_io_in2 <= pkg_extract(io_stateIn2,51,48);
  maskedSBox_30_io_in3 <= pkg_extract(io_stateIn3,51,48);
  maskedSBox_31_io_in1 <= pkg_extract(io_stateIn1,55,52);
  maskedSBox_31_io_in2 <= pkg_extract(io_stateIn2,55,52);
  maskedSBox_31_io_in3 <= pkg_extract(io_stateIn3,55,52);
  maskedSBox_32_io_in1 <= pkg_extract(io_stateIn1,59,56);
  maskedSBox_32_io_in2 <= pkg_extract(io_stateIn2,59,56);
  maskedSBox_32_io_in3 <= pkg_extract(io_stateIn3,59,56);
  maskedSBox_33_io_in1 <= pkg_extract(io_stateIn1,63,60);
  maskedSBox_33_io_in2 <= pkg_extract(io_stateIn2,63,60);
  maskedSBox_33_io_in3 <= pkg_extract(io_stateIn3,63,60);
end arch;

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


--permutation_1 replaced by permutation


--permutation_2 replaced by permutation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity present128 is
  port(
    io_enable : in std_logic;
    io_plaintext1 : in std_logic_vector(63 downto 0);
    io_plaintext2 : in std_logic_vector(63 downto 0);
    io_plaintext3 : in std_logic_vector(63 downto 0);
    io_key1 : in std_logic_vector(127 downto 0);
    io_key2 : in std_logic_vector(127 downto 0);
    io_key3 : in std_logic_vector(127 downto 0);
    io_ciphertext1 : out std_logic_vector(63 downto 0);
    io_ciphertext2 : out std_logic_vector(63 downto 0);
    io_ciphertext3 : out std_logic_vector(63 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end present128;

architecture arch of present128 is
  signal updatekeyshared_io_round : std_logic_vector(4 downto 0);
  signal addroundkey1_io_stateOut : std_logic_vector(63 downto 0);
  signal addroundkey2_io_stateOut : std_logic_vector(63 downto 0);
  signal addroundkey3_io_stateOut : std_logic_vector(63 downto 0);
  signal updatekeyshared_io_keyOut1 : std_logic_vector(127 downto 0);
  signal updatekeyshared_io_keyOut2 : std_logic_vector(127 downto 0);
  signal updatekeyshared_io_keyOut3 : std_logic_vector(127 downto 0);
  signal sboxlayershared_1_io_stateOut1 : std_logic_vector(63 downto 0);
  signal sboxlayershared_1_io_stateOut2 : std_logic_vector(63 downto 0);
  signal sboxlayershared_1_io_stateOut3 : std_logic_vector(63 downto 0);
  signal permutation1_io_stateOut : std_logic_vector(63 downto 0);
  signal permutation2_io_stateOut : std_logic_vector(63 downto 0);
  signal permutation3_io_stateOut : std_logic_vector(63 downto 0);

  signal state1 : std_logic_vector(63 downto 0);
  signal state2 : std_logic_vector(63 downto 0);
  signal state3 : std_logic_vector(63 downto 0);
  signal keyReg1 : std_logic_vector(127 downto 0);
  signal keyReg2 : std_logic_vector(127 downto 0);
  signal keyReg3 : std_logic_vector(127 downto 0);
  signal roundKey1 : std_logic_vector(63 downto 0);
  signal roundKey2 : std_logic_vector(63 downto 0);
  signal roundKey3 : std_logic_vector(63 downto 0);
  signal ctr_willIncrement : std_logic;
  signal ctr_willClear : std_logic;
  signal ctr_valueNext : unsigned(4 downto 0);
  signal ctr_value : unsigned(4 downto 0);
  signal ctr_willOverflowIfInc : std_logic;
  signal ctr_willOverflow : std_logic;
  signal smallCtr_willIncrement : std_logic;
  signal smallCtr_willClear : std_logic;
  signal smallCtr_valueNext : unsigned(0 downto 0);
  signal smallCtr_value : unsigned(0 downto 0);
  signal smallCtr_willOverflowIfInc : std_logic;
  signal smallCtr_willOverflow : std_logic;
  signal presentState : States;
begin
  addroundkey1 : entity work.addRoundKey
    port map ( 
      io_stateIn => state1,
      io_key => roundKey1,
      io_stateOut => addroundkey1_io_stateOut 
    );
  addroundkey2 : entity work.addRoundKey
    port map ( 
      io_stateIn => state2,
      io_key => roundKey2,
      io_stateOut => addroundkey2_io_stateOut 
    );
  addroundkey3 : entity work.addRoundKey
    port map ( 
      io_stateIn => state3,
      io_key => roundKey3,
      io_stateOut => addroundkey3_io_stateOut 
    );
  updatekeyshared : entity work.updateKey128Shared
    port map ( 
      io_keyIn1 => keyReg1,
      io_keyIn2 => keyReg2,
      io_keyIn3 => keyReg3,
      io_round => updatekeyshared_io_round,
      io_keyOut1 => updatekeyshared_io_keyOut1,
      io_keyOut2 => updatekeyshared_io_keyOut2,
      io_keyOut3 => updatekeyshared_io_keyOut3,
      clk => clk,
      reset => reset 
    );
  sboxlayershared_1 : entity work.sboxLayerShared
    port map ( 
      io_stateIn1 => addroundkey1_io_stateOut,
      io_stateIn2 => addroundkey2_io_stateOut,
      io_stateIn3 => addroundkey3_io_stateOut,
      io_stateOut1 => sboxlayershared_1_io_stateOut1,
      io_stateOut2 => sboxlayershared_1_io_stateOut2,
      io_stateOut3 => sboxlayershared_1_io_stateOut3,
      clk => clk,
      reset => reset 
    );
  permutation1 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayershared_1_io_stateOut1,
      io_stateOut => permutation1_io_stateOut 
    );
  permutation2 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayershared_1_io_stateOut2,
      io_stateOut => permutation2_io_stateOut 
    );
  permutation3 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayershared_1_io_stateOut3,
      io_stateOut => permutation3_io_stateOut 
    );
  process(presentState,addroundkey1_io_stateOut)
  begin
    io_ciphertext1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_ciphertext1 <= addroundkey1_io_stateOut;
    end case;
  end process;

  process(presentState,addroundkey2_io_stateOut)
  begin
    io_ciphertext2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_ciphertext2 <= addroundkey2_io_stateOut;
    end case;
  end process;

  process(presentState,addroundkey3_io_stateOut)
  begin
    io_ciphertext3 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_ciphertext3 <= addroundkey3_io_stateOut;
    end case;
  end process;

  process(presentState)
  begin
    io_done <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  process(presentState,smallCtr_willOverflow)
  begin
    ctr_willIncrement <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        if smallCtr_willOverflow = '1' then
          ctr_willIncrement <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(presentState)
  begin
    ctr_willClear <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
        ctr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  ctr_willOverflowIfInc <= pkg_toStdLogic(ctr_value = pkg_unsigned("11111"));
  ctr_willOverflow <= (ctr_willOverflowIfInc and ctr_willIncrement);
  process(ctr_willOverflow,ctr_value,ctr_willIncrement,ctr_willClear)
  begin
    if ctr_willOverflow = '1' then
      ctr_valueNext <= pkg_unsigned("00001");
    else
      ctr_valueNext <= (ctr_value + pkg_resize(unsigned(pkg_toStdLogicVector(ctr_willIncrement)),5));
    end if;
    if ctr_willClear = '1' then
      ctr_valueNext <= pkg_unsigned("00001");
    end if;
  end process;

  process(presentState)
  begin
    smallCtr_willIncrement <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        smallCtr_willIncrement <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(presentState)
  begin
    smallCtr_willClear <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
        smallCtr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  smallCtr_willOverflowIfInc <= pkg_toStdLogic(smallCtr_value = pkg_unsigned("1"));
  smallCtr_willOverflow <= (smallCtr_willOverflowIfInc and smallCtr_willIncrement);
  process(smallCtr_value,smallCtr_willIncrement,smallCtr_willClear)
  begin
    smallCtr_valueNext <= (smallCtr_value + unsigned(pkg_toStdLogicVector(smallCtr_willIncrement)));
    if smallCtr_willClear = '1' then
      smallCtr_valueNext <= pkg_unsigned("0");
    end if;
  end process;

  roundKey1 <= pkg_extract(keyReg1,127,64);
  roundKey2 <= pkg_extract(keyReg2,127,64);
  roundKey3 <= pkg_extract(keyReg3,127,64);
  updatekeyshared_io_round <= std_logic_vector(ctr_value);
  process(clk, reset)
  begin
    if reset = '1' then
      state1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      state2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      state3 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      keyReg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyReg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyReg3 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ctr_value <= pkg_unsigned("00001");
      smallCtr_value <= pkg_unsigned("0");
      presentState <= pkg_enum.sIdle;
    elsif rising_edge(clk) then
      ctr_value <= ctr_valueNext;
      smallCtr_value <= smallCtr_valueNext;
      keyReg1 <= updatekeyshared_io_keyOut1;
      keyReg2 <= updatekeyshared_io_keyOut2;
      keyReg3 <= updatekeyshared_io_keyOut3;
      state1 <= permutation1_io_stateOut;
      state2 <= permutation2_io_stateOut;
      state3 <= permutation3_io_stateOut;
      case presentState is
        when pkg_enum.sIdle =>
          presentState <= pkg_enum.sIdle;
          if io_enable = '1' then
            presentState <= pkg_enum.sExecute;
            state1 <= io_plaintext1;
            state2 <= io_plaintext2;
            state3 <= io_plaintext3;
            keyReg1 <= io_key1;
            keyReg2 <= io_key2;
            keyReg3 <= io_key3;
          end if;
        when pkg_enum.sExecute =>
          presentState <= pkg_enum.sExecute;
          if ctr_willOverflow = '1' then
            presentState <= pkg_enum.sDone;
          end if;
        when others =>
      end case;
    end if;
  end process;

end arch;

