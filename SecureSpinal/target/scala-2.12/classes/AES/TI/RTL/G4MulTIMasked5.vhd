-- Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
-- Component : G4MulTIMasked5
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


entity G4MulTIMasked5 is
  port(
    io_x_0 : in std_logic_vector(1 downto 0);
    io_x_1 : in std_logic_vector(1 downto 0);
    io_x_2 : in std_logic_vector(1 downto 0);
    io_x_3 : in std_logic_vector(1 downto 0);
    io_x_4 : in std_logic_vector(1 downto 0);
    io_y_0 : in std_logic_vector(1 downto 0);
    io_y_1 : in std_logic_vector(1 downto 0);
    io_y_2 : in std_logic_vector(1 downto 0);
    io_y_3 : in std_logic_vector(1 downto 0);
    io_y_4 : in std_logic_vector(1 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0);
    io_z_2 : out std_logic_vector(1 downto 0);
    io_z_3 : out std_logic_vector(1 downto 0);
    io_z_4 : out std_logic_vector(1 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G4MulTIMasked5;

architecture arch of G4MulTIMasked5 is

  signal dummy : std_logic;
  signal a_0 : std_logic;
  signal a_1 : std_logic;
  signal a_2 : std_logic;
  signal a_3 : std_logic;
  signal a_4 : std_logic;
  signal b_0 : std_logic;
  signal b_1 : std_logic;
  signal b_2 : std_logic;
  signal b_3 : std_logic;
  signal b_4 : std_logic;
  signal c_0 : std_logic;
  signal c_1 : std_logic;
  signal c_2 : std_logic;
  signal c_3 : std_logic;
  signal c_4 : std_logic;
  signal d_0 : std_logic;
  signal d_1 : std_logic;
  signal d_2 : std_logic;
  signal d_3 : std_logic;
  signal d_4 : std_logic;
  signal e_0 : std_logic;
  signal e_1 : std_logic;
  signal e_2 : std_logic;
  signal e_3 : std_logic;
  signal e_4 : std_logic;
  signal f_0 : std_logic;
  signal f_1 : std_logic;
  signal f_2 : std_logic;
  signal f_3 : std_logic;
  signal f_4 : std_logic;
  signal ac_0 : std_logic;
  signal ac_1 : std_logic;
  signal ac_2 : std_logic;
  signal ac_3 : std_logic;
  signal ac_4 : std_logic;
  signal ac_5 : std_logic;
  signal ac_6 : std_logic;
  signal ac_7 : std_logic;
  signal ac_8 : std_logic;
  signal ac_9 : std_logic;
  signal ac_10 : std_logic;
  signal ac_11 : std_logic;
  signal ac_12 : std_logic;
  signal ac_13 : std_logic;
  signal ac_14 : std_logic;
  signal ac_15 : std_logic;
  signal ac_16 : std_logic;
  signal ac_17 : std_logic;
  signal ac_18 : std_logic;
  signal ac_19 : std_logic;
  signal ac_20 : std_logic;
  signal ac_21 : std_logic;
  signal ac_22 : std_logic;
  signal ac_23 : std_logic;
  signal ac_24 : std_logic;
  signal ad_0 : std_logic;
  signal ad_1 : std_logic;
  signal ad_2 : std_logic;
  signal ad_3 : std_logic;
  signal ad_4 : std_logic;
  signal ad_5 : std_logic;
  signal ad_6 : std_logic;
  signal ad_7 : std_logic;
  signal ad_8 : std_logic;
  signal ad_9 : std_logic;
  signal ad_10 : std_logic;
  signal ad_11 : std_logic;
  signal ad_12 : std_logic;
  signal ad_13 : std_logic;
  signal ad_14 : std_logic;
  signal ad_15 : std_logic;
  signal ad_16 : std_logic;
  signal ad_17 : std_logic;
  signal ad_18 : std_logic;
  signal ad_19 : std_logic;
  signal ad_20 : std_logic;
  signal ad_21 : std_logic;
  signal ad_22 : std_logic;
  signal ad_23 : std_logic;
  signal ad_24 : std_logic;
  signal bc_0 : std_logic;
  signal bc_1 : std_logic;
  signal bc_2 : std_logic;
  signal bc_3 : std_logic;
  signal bc_4 : std_logic;
  signal bc_5 : std_logic;
  signal bc_6 : std_logic;
  signal bc_7 : std_logic;
  signal bc_8 : std_logic;
  signal bc_9 : std_logic;
  signal bc_10 : std_logic;
  signal bc_11 : std_logic;
  signal bc_12 : std_logic;
  signal bc_13 : std_logic;
  signal bc_14 : std_logic;
  signal bc_15 : std_logic;
  signal bc_16 : std_logic;
  signal bc_17 : std_logic;
  signal bc_18 : std_logic;
  signal bc_19 : std_logic;
  signal bc_20 : std_logic;
  signal bc_21 : std_logic;
  signal bc_22 : std_logic;
  signal bc_23 : std_logic;
  signal bc_24 : std_logic;
  signal bd_0 : std_logic;
  signal bd_1 : std_logic;
  signal bd_2 : std_logic;
  signal bd_3 : std_logic;
  signal bd_4 : std_logic;
  signal bd_5 : std_logic;
  signal bd_6 : std_logic;
  signal bd_7 : std_logic;
  signal bd_8 : std_logic;
  signal bd_9 : std_logic;
  signal bd_10 : std_logic;
  signal bd_11 : std_logic;
  signal bd_12 : std_logic;
  signal bd_13 : std_logic;
  signal bd_14 : std_logic;
  signal bd_15 : std_logic;
  signal bd_16 : std_logic;
  signal bd_17 : std_logic;
  signal bd_18 : std_logic;
  signal bd_19 : std_logic;
  signal bd_20 : std_logic;
  signal bd_21 : std_logic;
  signal bd_22 : std_logic;
  signal bd_23 : std_logic;
  signal bd_24 : std_logic;
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
  a_3 <= pkg_extract(io_x_3,1);
  b_3 <= pkg_extract(io_x_3,0);
  c_3 <= pkg_extract(io_y_3,1);
  d_3 <= pkg_extract(io_y_3,0);
  a_4 <= pkg_extract(io_x_4,1);
  b_4 <= pkg_extract(io_x_4,0);
  c_4 <= pkg_extract(io_y_4,1);
  d_4 <= pkg_extract(io_y_4,0);
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
  ac_3 <= (a_0 and c_3);
  ad_3 <= (a_0 and d_3);
  bc_3 <= (b_0 and c_3);
  bd_3 <= (b_0 and d_3);
  ac_4 <= (a_0 and c_4);
  ad_4 <= (a_0 and d_4);
  bc_4 <= (b_0 and c_4);
  bd_4 <= (b_0 and d_4);
  ac_5 <= (a_1 and c_0);
  ad_5 <= (a_1 and d_0);
  bc_5 <= (b_1 and c_0);
  bd_5 <= (b_1 and d_0);
  ac_6 <= (a_1 and c_1);
  ad_6 <= (a_1 and d_1);
  bc_6 <= (b_1 and c_1);
  bd_6 <= (b_1 and d_1);
  ac_7 <= (a_1 and c_2);
  ad_7 <= (a_1 and d_2);
  bc_7 <= (b_1 and c_2);
  bd_7 <= (b_1 and d_2);
  ac_8 <= (a_1 and c_3);
  ad_8 <= (a_1 and d_3);
  bc_8 <= (b_1 and c_3);
  bd_8 <= (b_1 and d_3);
  ac_9 <= (a_1 and c_4);
  ad_9 <= (a_1 and d_4);
  bc_9 <= (b_1 and c_4);
  bd_9 <= (b_1 and d_4);
  ac_10 <= (a_2 and c_0);
  ad_10 <= (a_2 and d_0);
  bc_10 <= (b_2 and c_0);
  bd_10 <= (b_2 and d_0);
  ac_11 <= (a_2 and c_1);
  ad_11 <= (a_2 and d_1);
  bc_11 <= (b_2 and c_1);
  bd_11 <= (b_2 and d_1);
  ac_12 <= (a_2 and c_2);
  ad_12 <= (a_2 and d_2);
  bc_12 <= (b_2 and c_2);
  bd_12 <= (b_2 and d_2);
  ac_13 <= (a_2 and c_3);
  ad_13 <= (a_2 and d_3);
  bc_13 <= (b_2 and c_3);
  bd_13 <= (b_2 and d_3);
  ac_14 <= (a_2 and c_4);
  ad_14 <= (a_2 and d_4);
  bc_14 <= (b_2 and c_4);
  bd_14 <= (b_2 and d_4);
  ac_15 <= (a_3 and c_0);
  ad_15 <= (a_3 and d_0);
  bc_15 <= (b_3 and c_0);
  bd_15 <= (b_3 and d_0);
  ac_16 <= (a_3 and c_1);
  ad_16 <= (a_3 and d_1);
  bc_16 <= (b_3 and c_1);
  bd_16 <= (b_3 and d_1);
  ac_17 <= (a_3 and c_2);
  ad_17 <= (a_3 and d_2);
  bc_17 <= (b_3 and c_2);
  bd_17 <= (b_3 and d_2);
  ac_18 <= (a_3 and c_3);
  ad_18 <= (a_3 and d_3);
  bc_18 <= (b_3 and c_3);
  bd_18 <= (b_3 and d_3);
  ac_19 <= (a_3 and c_4);
  ad_19 <= (a_3 and d_4);
  bc_19 <= (b_3 and c_4);
  bd_19 <= (b_3 and d_4);
  ac_20 <= (a_4 and c_0);
  ad_20 <= (a_4 and d_0);
  bc_20 <= (b_4 and c_0);
  bd_20 <= (b_4 and d_0);
  ac_21 <= (a_4 and c_1);
  ad_21 <= (a_4 and d_1);
  bc_21 <= (b_4 and c_1);
  bd_21 <= (b_4 and d_1);
  ac_22 <= (a_4 and c_2);
  ad_22 <= (a_4 and d_2);
  bc_22 <= (b_4 and c_2);
  bd_22 <= (b_4 and d_2);
  ac_23 <= (a_4 and c_3);
  ad_23 <= (a_4 and d_3);
  bc_23 <= (b_4 and c_3);
  bd_23 <= (b_4 and d_3);
  ac_24 <= (a_4 and c_4);
  ad_24 <= (a_4 and d_4);
  bc_24 <= (b_4 and c_4);
  bd_24 <= (b_4 and d_4);
  e_0 <= ((((((((((((((bc_6 xor ad_6) xor bd_6) xor bc_7) xor ad_7) xor bd_7) xor bc_11) xor ad_11) xor bd_11) xor bc_16) xor ad_16) xor bd_16) xor bc_21) xor ad_21) xor bd_21);
  e_1 <= ((((((((((((((bc_2 xor ad_2) xor bd_2) xor bc_10) xor ad_10) xor bd_10) xor bc_12) xor ad_12) xor bd_12) xor bc_15) xor ad_15) xor bd_15) xor bc_20) xor ad_20) xor bd_20);
  e_2 <= ((((((((((((((bc_1 xor ad_1) xor bd_1) xor bc_5) xor ad_5) xor bd_5) xor bc_18) xor ad_18) xor bd_18) xor bc_19) xor ad_19) xor bd_19) xor bc_23) xor ad_23) xor bd_23);
  e_3 <= ((((((((((((((bc_4 xor ad_4) xor bd_4) xor bc_9) xor ad_9) xor bd_9) xor bc_14) xor ad_14) xor bd_14) xor bc_22) xor ad_22) xor bd_22) xor bc_24) xor ad_24) xor bd_24);
  e_4 <= ((((((((((((((bc_0 xor ad_0) xor bd_0) xor bc_3) xor ad_3) xor bd_3) xor bc_8) xor ad_8) xor bd_8) xor bc_13) xor ad_13) xor bd_13) xor bc_17) xor ad_17) xor bd_17);
  f_0 <= ((((((((((((((bc_6 xor ad_6) xor ac_6) xor bc_7) xor ad_7) xor ac_7) xor bc_11) xor ad_11) xor ac_11) xor bc_16) xor ad_16) xor ac_16) xor bc_21) xor ad_21) xor ac_21);
  f_1 <= ((((((((((((((bc_2 xor ad_2) xor ac_2) xor bc_10) xor ad_10) xor ac_10) xor bc_12) xor ad_12) xor ac_12) xor bc_15) xor ad_15) xor ac_15) xor bc_20) xor ad_20) xor ac_20);
  f_2 <= ((((((((((((((bc_1 xor ad_1) xor ac_1) xor bc_5) xor ad_5) xor ac_5) xor bc_18) xor ad_18) xor ac_18) xor bc_19) xor ad_19) xor ac_19) xor bc_23) xor ad_23) xor ac_23);
  f_3 <= ((((((((((((((bc_4 xor ad_4) xor ac_4) xor bc_9) xor ad_9) xor ac_9) xor bc_14) xor ad_14) xor ac_14) xor bc_22) xor ad_22) xor ac_22) xor bc_24) xor ad_24) xor ac_24);
  f_4 <= ((((((((((((((bc_0 xor ad_0) xor ac_0) xor bc_3) xor ad_3) xor ac_3) xor bc_8) xor ad_8) xor ac_8) xor bc_13) xor ad_13) xor ac_13) xor bc_17) xor ad_17) xor ac_17);
  process(e_0,f_0)
  begin
    io_z_0(1) <= e_0;
    io_z_0(0) <= f_0;
  end process;

  process(e_1,f_1)
  begin
    io_z_1(1) <= e_1;
    io_z_1(0) <= f_1;
  end process;

  process(e_2,f_2)
  begin
    io_z_2(1) <= e_2;
    io_z_2(0) <= f_2;
  end process;

  process(e_3,f_3)
  begin
    io_z_3(1) <= e_3;
    io_z_3(0) <= f_3;
  end process;

  process(e_4,f_4)
  begin
    io_z_4(1) <= e_4;
    io_z_4(0) <= f_4;
  end process;

end arch;

