-- Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
-- Component : G16InvTIMaskedN
-- Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is

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


entity G4MulTIMaskedN is
  port(
    io_x_0 : in std_logic_vector(1 downto 0);
    io_x_1 : in std_logic_vector(1 downto 0);
    io_x_2 : in std_logic_vector(1 downto 0);
    io_y_0 : in std_logic_vector(1 downto 0);
    io_y_1 : in std_logic_vector(1 downto 0);
    io_y_2 : in std_logic_vector(1 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0);
    io_z_2 : out std_logic_vector(1 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G4MulTIMaskedN;

architecture arch of G4MulTIMaskedN is

  signal dummy : std_logic;
  signal a_0 : std_logic;
  signal a_1 : std_logic;
  signal a_2 : std_logic;
  signal b_0 : std_logic;
  signal b_1 : std_logic;
  signal b_2 : std_logic;
  signal c_0 : std_logic;
  signal c_1 : std_logic;
  signal c_2 : std_logic;
  signal d_0 : std_logic;
  signal d_1 : std_logic;
  signal d_2 : std_logic;
  signal e_0 : std_logic_vector(2 downto 0);
  signal e_1 : std_logic_vector(2 downto 0);
  signal e_2 : std_logic_vector(2 downto 0);
  signal f_0 : std_logic_vector(2 downto 0);
  signal f_1 : std_logic_vector(2 downto 0);
  signal f_2 : std_logic_vector(2 downto 0);
  signal ac_0 : std_logic;
  signal ac_1 : std_logic;
  signal ac_2 : std_logic;
  signal ac_3 : std_logic;
  signal ac_4 : std_logic;
  signal ac_5 : std_logic;
  signal ac_6 : std_logic;
  signal ac_7 : std_logic;
  signal ac_8 : std_logic;
  signal ad_0 : std_logic;
  signal ad_1 : std_logic;
  signal ad_2 : std_logic;
  signal ad_3 : std_logic;
  signal ad_4 : std_logic;
  signal ad_5 : std_logic;
  signal ad_6 : std_logic;
  signal ad_7 : std_logic;
  signal ad_8 : std_logic;
  signal bc_0 : std_logic;
  signal bc_1 : std_logic;
  signal bc_2 : std_logic;
  signal bc_3 : std_logic;
  signal bc_4 : std_logic;
  signal bc_5 : std_logic;
  signal bc_6 : std_logic;
  signal bc_7 : std_logic;
  signal bc_8 : std_logic;
  signal bd_0 : std_logic;
  signal bd_1 : std_logic;
  signal bd_2 : std_logic;
  signal bd_3 : std_logic;
  signal bd_4 : std_logic;
  signal bd_5 : std_logic;
  signal bd_6 : std_logic;
  signal bd_7 : std_logic;
  signal bd_8 : std_logic;
begin
  dummy <= pkg_toStdLogic(false);
  a_0 <= pkg_extract(io_x_0,1);
  b_0 <= pkg_extract(io_x_0,0);
  c_0 <= pkg_extract(io_y_0,1);
  d_0 <= pkg_extract(io_y_0,0);
  a_1 <= pkg_extract(io_x_1,1);
  b_1 <= pkg_extract(io_x_1,0);
  c_1 <= pkg_extract(io_y_1,1);
  d_1 <= pkg_extract(io_y_1,0);
  a_2 <= pkg_extract(io_x_2,1);
  b_2 <= pkg_extract(io_x_2,0);
  c_2 <= pkg_extract(io_y_2,1);
  d_2 <= pkg_extract(io_y_2,0);
  ac_0 <= (a_0 and c_0);
  ad_0 <= (a_0 and d_0);
  bc_0 <= (b_0 and c_0);
  bd_0 <= (b_0 and d_0);
  ac_1 <= (a_0 and c_1);
  ad_1 <= (a_0 and d_1);
  bc_1 <= (b_0 and c_1);
  bd_1 <= (b_0 and d_1);
  ac_2 <= (a_0 and c_2);
  ad_2 <= (a_0 and d_2);
  bc_2 <= (b_0 and c_2);
  bd_2 <= (b_0 and d_2);
  ac_3 <= (a_1 and c_0);
  ad_3 <= (a_1 and d_0);
  bc_3 <= (b_1 and c_0);
  bd_3 <= (b_1 and d_0);
  ac_4 <= (a_1 and c_1);
  ad_4 <= (a_1 and d_1);
  bc_4 <= (b_1 and c_1);
  bd_4 <= (b_1 and d_1);
  ac_5 <= (a_1 and c_2);
  ad_5 <= (a_1 and d_2);
  bc_5 <= (b_1 and c_2);
  bd_5 <= (b_1 and d_2);
  ac_6 <= (a_2 and c_0);
  ad_6 <= (a_2 and d_0);
  bc_6 <= (b_2 and c_0);
  bd_6 <= (b_2 and d_0);
  ac_7 <= (a_2 and c_1);
  ad_7 <= (a_2 and d_1);
  bc_7 <= (b_2 and c_1);
  bd_7 <= (b_2 and d_1);
  ac_8 <= (a_2 and c_2);
  ad_8 <= (a_2 and d_2);
  bc_8 <= (b_2 and c_2);
  bd_8 <= (b_2 and d_2);
  process(bc_0,ad_0,bd_0,bc_4,ad_4,bd_4,bc_8,ad_8,bd_8)
  begin
    e_0(2) <= ((bc_0 xor ad_0) xor bd_0);
    e_0(0) <= ((bc_4 xor ad_4) xor bd_4);
    e_0(1) <= ((bc_8 xor ad_8) xor bd_8);
  end process;

  process(bc_0,ad_0,ac_0,bc_4,ad_4,ac_4,bc_8,ad_8,ac_8)
  begin
    f_0(2) <= ((bc_0 xor ad_0) xor ac_0);
    f_0(0) <= ((bc_4 xor ad_4) xor ac_4);
    f_0(1) <= ((bc_8 xor ad_8) xor ac_8);
  end process;

  process(e_0,bc_5,ad_5,bd_5,bc_2,ad_2,bd_2,bc_1,ad_1,bd_1)
  begin
    e_1(0) <= (((pkg_extract(e_0,0) xor bc_5) xor ad_5) xor bd_5);
    e_1(1) <= (((pkg_extract(e_0,1) xor bc_2) xor ad_2) xor bd_2);
    e_1(2) <= (((pkg_extract(e_0,2) xor bc_1) xor ad_1) xor bd_1);
  end process;

  process(f_0,bc_5,ad_5,ac_5,bc_2,ad_2,ac_2,bc_1,ad_1,ac_1)
  begin
    f_1(0) <= (((pkg_extract(f_0,0) xor bc_5) xor ad_5) xor ac_5);
    f_1(1) <= (((pkg_extract(f_0,1) xor bc_2) xor ad_2) xor ac_2);
    f_1(2) <= (((pkg_extract(f_0,2) xor bc_1) xor ad_1) xor ac_1);
  end process;

  process(e_1,bc_7,ad_7,bd_7,bc_6,ad_6,bd_6,bc_3,ad_3,bd_3)
  begin
    e_2(0) <= (((pkg_extract(e_1,0) xor bc_7) xor ad_7) xor bd_7);
    e_2(1) <= (((pkg_extract(e_1,1) xor bc_6) xor ad_6) xor bd_6);
    e_2(2) <= (((pkg_extract(e_1,2) xor bc_3) xor ad_3) xor bd_3);
  end process;

  process(f_1,bc_7,ad_7,ac_7,bc_6,ad_6,ac_6,bc_3,ad_3,ac_3)
  begin
    f_2(0) <= (((pkg_extract(f_1,0) xor bc_7) xor ad_7) xor ac_7);
    f_2(1) <= (((pkg_extract(f_1,1) xor bc_6) xor ad_6) xor ac_6);
    f_2(2) <= (((pkg_extract(f_1,2) xor bc_3) xor ad_3) xor ac_3);
  end process;

  io_z_0 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_2,0)),pkg_toStdLogicVector(pkg_extract(f_2,0)));
  io_z_1 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_2,1)),pkg_toStdLogicVector(pkg_extract(f_2,1)));
  io_z_2 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_2,2)),pkg_toStdLogicVector(pkg_extract(f_2,2)));
end arch;


--G4MulTIMaskedN_1 replaced by G4MulTIMaskedN


--G4MulTIMaskedN_2 replaced by G4MulTIMaskedN

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G4Sq is
  port(
    io_t : in std_logic_vector(1 downto 0);
    io_x : out std_logic_vector(1 downto 0)
  );
end G4Sq;

architecture arch of G4Sq is

begin
  io_x <= pkg_cat(pkg_toStdLogicVector(pkg_extract(io_t,0)),pkg_toStdLogicVector(pkg_extract(io_t,1)));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G4ScaleN is
  port(
    io_t : in std_logic_vector(1 downto 0);
    io_x : out std_logic_vector(1 downto 0)
  );
end G4ScaleN;

architecture arch of G4ScaleN is

begin
  io_x <= pkg_cat(pkg_toStdLogicVector(pkg_extract(io_t,0)),pkg_toStdLogicVector((pkg_extract(io_t,1) xor pkg_extract(io_t,0))));
end arch;


--G4Sq_1 replaced by G4Sq


--G4ScaleN_1 replaced by G4ScaleN


--G4Sq_2 replaced by G4Sq


--G4ScaleN_2 replaced by G4ScaleN


--G4Sq_3 replaced by G4Sq


--G4Sq_4 replaced by G4Sq


--G4Sq_5 replaced by G4Sq

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16InvTIMaskedN is
  port(
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_x_2 : in std_logic_vector(3 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0);
    io_z_2 : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G16InvTIMaskedN;

architecture arch of G16InvTIMaskedN is
  signal g4Sq_9_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_10_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_11_io_t : std_logic_vector(1 downto 0);
  signal mul1_io_z_0 : std_logic_vector(1 downto 0);
  signal mul1_io_z_1 : std_logic_vector(1 downto 0);
  signal mul1_io_z_2 : std_logic_vector(1 downto 0);
  signal mul2_io_z_0 : std_logic_vector(1 downto 0);
  signal mul2_io_z_1 : std_logic_vector(1 downto 0);
  signal mul2_io_z_2 : std_logic_vector(1 downto 0);
  signal mul3_io_z_0 : std_logic_vector(1 downto 0);
  signal mul3_io_z_1 : std_logic_vector(1 downto 0);
  signal mul3_io_z_2 : std_logic_vector(1 downto 0);
  signal g4Sq_6_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_3_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_7_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_4_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_8_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_5_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_9_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_10_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_11_io_x : std_logic_vector(1 downto 0);

  signal dummy : std_logic;
  signal a_0 : std_logic_vector(1 downto 0);
  signal a_1 : std_logic_vector(1 downto 0);
  signal a_2 : std_logic_vector(1 downto 0);
  signal b_0 : std_logic_vector(1 downto 0);
  signal b_1 : std_logic_vector(1 downto 0);
  signal b_2 : std_logic_vector(1 downto 0);
  signal c_0 : std_logic_vector(1 downto 0);
  signal c_1 : std_logic_vector(1 downto 0);
  signal c_2 : std_logic_vector(1 downto 0);
  signal d_0 : std_logic_vector(1 downto 0);
  signal d_1 : std_logic_vector(1 downto 0);
  signal d_2 : std_logic_vector(1 downto 0);
  signal e_0 : std_logic_vector(1 downto 0);
  signal e_1 : std_logic_vector(1 downto 0);
  signal e_2 : std_logic_vector(1 downto 0);
  signal f_0 : std_logic_vector(1 downto 0);
  signal f_1 : std_logic_vector(1 downto 0);
  signal f_2 : std_logic_vector(1 downto 0);
  signal p_0 : std_logic_vector(1 downto 0);
  signal p_1 : std_logic_vector(1 downto 0);
  signal p_2 : std_logic_vector(1 downto 0);
  signal q_0 : std_logic_vector(1 downto 0);
  signal q_1 : std_logic_vector(1 downto 0);
  signal q_2 : std_logic_vector(1 downto 0);
begin
  mul1 : entity work.G4MulTIMaskedN
    port map ( 
      io_x_0 => a_0,
      io_x_1 => a_1,
      io_x_2 => a_2,
      io_y_0 => b_0,
      io_y_1 => b_1,
      io_y_2 => b_2,
      io_z_0 => mul1_io_z_0,
      io_z_1 => mul1_io_z_1,
      io_z_2 => mul1_io_z_2,
      clk => clk,
      reset => reset 
    );
  mul2 : entity work.G4MulTIMaskedN
    port map ( 
      io_x_0 => e_0,
      io_x_1 => e_1,
      io_x_2 => e_2,
      io_y_0 => b_0,
      io_y_1 => b_1,
      io_y_2 => b_2,
      io_z_0 => mul2_io_z_0,
      io_z_1 => mul2_io_z_1,
      io_z_2 => mul2_io_z_2,
      clk => clk,
      reset => reset 
    );
  mul3 : entity work.G4MulTIMaskedN
    port map ( 
      io_x_0 => e_0,
      io_x_1 => e_1,
      io_x_2 => e_2,
      io_y_0 => a_0,
      io_y_1 => a_1,
      io_y_2 => a_2,
      io_z_0 => mul3_io_z_0,
      io_z_1 => mul3_io_z_1,
      io_z_2 => mul3_io_z_2,
      clk => clk,
      reset => reset 
    );
  g4Sq_6 : entity work.G4Sq
    port map ( 
      io_t => f_0,
      io_x => g4Sq_6_io_x 
    );
  g4ScaleN_3 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_6_io_x,
      io_x => g4ScaleN_3_io_x 
    );
  g4Sq_7 : entity work.G4Sq
    port map ( 
      io_t => f_1,
      io_x => g4Sq_7_io_x 
    );
  g4ScaleN_4 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_7_io_x,
      io_x => g4ScaleN_4_io_x 
    );
  g4Sq_8 : entity work.G4Sq
    port map ( 
      io_t => f_2,
      io_x => g4Sq_8_io_x 
    );
  g4ScaleN_5 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_8_io_x,
      io_x => g4ScaleN_5_io_x 
    );
  g4Sq_9 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_9_io_t,
      io_x => g4Sq_9_io_x 
    );
  g4Sq_10 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_10_io_t,
      io_x => g4Sq_10_io_x 
    );
  g4Sq_11 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_11_io_t,
      io_x => g4Sq_11_io_x 
    );
  dummy <= pkg_toStdLogic(false);
  a_0 <= pkg_extract(io_x_0,3,2);
  b_0 <= pkg_extract(io_x_0,1,0);
  a_1 <= pkg_extract(io_x_1,3,2);
  b_1 <= pkg_extract(io_x_1,1,0);
  a_2 <= pkg_extract(io_x_2,3,2);
  b_2 <= pkg_extract(io_x_2,1,0);
  f_0 <= (a_0 xor b_0);
  f_1 <= (a_1 xor b_1);
  f_2 <= (a_2 xor b_2);
  d_0 <= mul1_io_z_0;
  d_1 <= mul1_io_z_1;
  d_2 <= mul1_io_z_2;
  c_0 <= g4ScaleN_3_io_x;
  c_1 <= g4ScaleN_4_io_x;
  c_2 <= g4ScaleN_5_io_x;
  g4Sq_9_io_t <= (c_0 xor d_0);
  e_0 <= g4Sq_9_io_x;
  g4Sq_10_io_t <= (c_1 xor d_1);
  e_1 <= g4Sq_10_io_x;
  g4Sq_11_io_t <= (c_2 xor d_2);
  e_2 <= g4Sq_11_io_x;
  p_0 <= mul2_io_z_0;
  p_1 <= mul2_io_z_1;
  p_2 <= mul2_io_z_2;
  q_0 <= mul3_io_z_0;
  q_1 <= mul3_io_z_1;
  q_2 <= mul3_io_z_2;
  io_z_0 <= pkg_cat(p_0,q_0);
  io_z_1 <= pkg_cat(p_1,q_1);
  io_z_2 <= pkg_cat(p_2,q_2);
end arch;

