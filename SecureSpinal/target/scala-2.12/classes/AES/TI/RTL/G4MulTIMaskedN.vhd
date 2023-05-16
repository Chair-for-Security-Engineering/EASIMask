-- Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
-- Component : G4MulTIMaskedN
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
    io_x_3 : in std_logic_vector(1 downto 0);
    io_x_4 : in std_logic_vector(1 downto 0);
    io_x_5 : in std_logic_vector(1 downto 0);
    io_x_6 : in std_logic_vector(1 downto 0);
    io_x_7 : in std_logic_vector(1 downto 0);
    io_x_8 : in std_logic_vector(1 downto 0);
    io_y_0 : in std_logic_vector(1 downto 0);
    io_y_1 : in std_logic_vector(1 downto 0);
    io_y_2 : in std_logic_vector(1 downto 0);
    io_y_3 : in std_logic_vector(1 downto 0);
    io_y_4 : in std_logic_vector(1 downto 0);
    io_y_5 : in std_logic_vector(1 downto 0);
    io_y_6 : in std_logic_vector(1 downto 0);
    io_y_7 : in std_logic_vector(1 downto 0);
    io_y_8 : in std_logic_vector(1 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0);
    io_z_2 : out std_logic_vector(1 downto 0);
    io_z_3 : out std_logic_vector(1 downto 0);
    io_z_4 : out std_logic_vector(1 downto 0);
    io_z_5 : out std_logic_vector(1 downto 0);
    io_z_6 : out std_logic_vector(1 downto 0);
    io_z_7 : out std_logic_vector(1 downto 0);
    io_z_8 : out std_logic_vector(1 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G4MulTIMaskedN;

architecture arch of G4MulTIMaskedN is

  signal dummy : std_logic;
  signal a_0 : std_logic;
  signal a_1 : std_logic;
  signal a_2 : std_logic;
  signal a_3 : std_logic;
  signal a_4 : std_logic;
  signal a_5 : std_logic;
  signal a_6 : std_logic;
  signal a_7 : std_logic;
  signal a_8 : std_logic;
  signal b_0 : std_logic;
  signal b_1 : std_logic;
  signal b_2 : std_logic;
  signal b_3 : std_logic;
  signal b_4 : std_logic;
  signal b_5 : std_logic;
  signal b_6 : std_logic;
  signal b_7 : std_logic;
  signal b_8 : std_logic;
  signal c_0 : std_logic;
  signal c_1 : std_logic;
  signal c_2 : std_logic;
  signal c_3 : std_logic;
  signal c_4 : std_logic;
  signal c_5 : std_logic;
  signal c_6 : std_logic;
  signal c_7 : std_logic;
  signal c_8 : std_logic;
  signal d_0 : std_logic;
  signal d_1 : std_logic;
  signal d_2 : std_logic;
  signal d_3 : std_logic;
  signal d_4 : std_logic;
  signal d_5 : std_logic;
  signal d_6 : std_logic;
  signal d_7 : std_logic;
  signal d_8 : std_logic;
  signal e_0 : std_logic_vector(8 downto 0);
  signal e_1 : std_logic_vector(8 downto 0);
  signal e_2 : std_logic_vector(8 downto 0);
  signal e_3 : std_logic_vector(8 downto 0);
  signal e_4 : std_logic_vector(8 downto 0);
  signal e_5 : std_logic_vector(8 downto 0);
  signal e_6 : std_logic_vector(8 downto 0);
  signal e_7 : std_logic_vector(8 downto 0);
  signal e_8 : std_logic_vector(8 downto 0);
  signal f_0 : std_logic_vector(8 downto 0);
  signal f_1 : std_logic_vector(8 downto 0);
  signal f_2 : std_logic_vector(8 downto 0);
  signal f_3 : std_logic_vector(8 downto 0);
  signal f_4 : std_logic_vector(8 downto 0);
  signal f_5 : std_logic_vector(8 downto 0);
  signal f_6 : std_logic_vector(8 downto 0);
  signal f_7 : std_logic_vector(8 downto 0);
  signal f_8 : std_logic_vector(8 downto 0);
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
  signal ac_25 : std_logic;
  signal ac_26 : std_logic;
  signal ac_27 : std_logic;
  signal ac_28 : std_logic;
  signal ac_29 : std_logic;
  signal ac_30 : std_logic;
  signal ac_31 : std_logic;
  signal ac_32 : std_logic;
  signal ac_33 : std_logic;
  signal ac_34 : std_logic;
  signal ac_35 : std_logic;
  signal ac_36 : std_logic;
  signal ac_37 : std_logic;
  signal ac_38 : std_logic;
  signal ac_39 : std_logic;
  signal ac_40 : std_logic;
  signal ac_41 : std_logic;
  signal ac_42 : std_logic;
  signal ac_43 : std_logic;
  signal ac_44 : std_logic;
  signal ac_45 : std_logic;
  signal ac_46 : std_logic;
  signal ac_47 : std_logic;
  signal ac_48 : std_logic;
  signal ac_49 : std_logic;
  signal ac_50 : std_logic;
  signal ac_51 : std_logic;
  signal ac_52 : std_logic;
  signal ac_53 : std_logic;
  signal ac_54 : std_logic;
  signal ac_55 : std_logic;
  signal ac_56 : std_logic;
  signal ac_57 : std_logic;
  signal ac_58 : std_logic;
  signal ac_59 : std_logic;
  signal ac_60 : std_logic;
  signal ac_61 : std_logic;
  signal ac_62 : std_logic;
  signal ac_63 : std_logic;
  signal ac_64 : std_logic;
  signal ac_65 : std_logic;
  signal ac_66 : std_logic;
  signal ac_67 : std_logic;
  signal ac_68 : std_logic;
  signal ac_69 : std_logic;
  signal ac_70 : std_logic;
  signal ac_71 : std_logic;
  signal ac_72 : std_logic;
  signal ac_73 : std_logic;
  signal ac_74 : std_logic;
  signal ac_75 : std_logic;
  signal ac_76 : std_logic;
  signal ac_77 : std_logic;
  signal ac_78 : std_logic;
  signal ac_79 : std_logic;
  signal ac_80 : std_logic;
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
  signal ad_25 : std_logic;
  signal ad_26 : std_logic;
  signal ad_27 : std_logic;
  signal ad_28 : std_logic;
  signal ad_29 : std_logic;
  signal ad_30 : std_logic;
  signal ad_31 : std_logic;
  signal ad_32 : std_logic;
  signal ad_33 : std_logic;
  signal ad_34 : std_logic;
  signal ad_35 : std_logic;
  signal ad_36 : std_logic;
  signal ad_37 : std_logic;
  signal ad_38 : std_logic;
  signal ad_39 : std_logic;
  signal ad_40 : std_logic;
  signal ad_41 : std_logic;
  signal ad_42 : std_logic;
  signal ad_43 : std_logic;
  signal ad_44 : std_logic;
  signal ad_45 : std_logic;
  signal ad_46 : std_logic;
  signal ad_47 : std_logic;
  signal ad_48 : std_logic;
  signal ad_49 : std_logic;
  signal ad_50 : std_logic;
  signal ad_51 : std_logic;
  signal ad_52 : std_logic;
  signal ad_53 : std_logic;
  signal ad_54 : std_logic;
  signal ad_55 : std_logic;
  signal ad_56 : std_logic;
  signal ad_57 : std_logic;
  signal ad_58 : std_logic;
  signal ad_59 : std_logic;
  signal ad_60 : std_logic;
  signal ad_61 : std_logic;
  signal ad_62 : std_logic;
  signal ad_63 : std_logic;
  signal ad_64 : std_logic;
  signal ad_65 : std_logic;
  signal ad_66 : std_logic;
  signal ad_67 : std_logic;
  signal ad_68 : std_logic;
  signal ad_69 : std_logic;
  signal ad_70 : std_logic;
  signal ad_71 : std_logic;
  signal ad_72 : std_logic;
  signal ad_73 : std_logic;
  signal ad_74 : std_logic;
  signal ad_75 : std_logic;
  signal ad_76 : std_logic;
  signal ad_77 : std_logic;
  signal ad_78 : std_logic;
  signal ad_79 : std_logic;
  signal ad_80 : std_logic;
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
  signal bc_25 : std_logic;
  signal bc_26 : std_logic;
  signal bc_27 : std_logic;
  signal bc_28 : std_logic;
  signal bc_29 : std_logic;
  signal bc_30 : std_logic;
  signal bc_31 : std_logic;
  signal bc_32 : std_logic;
  signal bc_33 : std_logic;
  signal bc_34 : std_logic;
  signal bc_35 : std_logic;
  signal bc_36 : std_logic;
  signal bc_37 : std_logic;
  signal bc_38 : std_logic;
  signal bc_39 : std_logic;
  signal bc_40 : std_logic;
  signal bc_41 : std_logic;
  signal bc_42 : std_logic;
  signal bc_43 : std_logic;
  signal bc_44 : std_logic;
  signal bc_45 : std_logic;
  signal bc_46 : std_logic;
  signal bc_47 : std_logic;
  signal bc_48 : std_logic;
  signal bc_49 : std_logic;
  signal bc_50 : std_logic;
  signal bc_51 : std_logic;
  signal bc_52 : std_logic;
  signal bc_53 : std_logic;
  signal bc_54 : std_logic;
  signal bc_55 : std_logic;
  signal bc_56 : std_logic;
  signal bc_57 : std_logic;
  signal bc_58 : std_logic;
  signal bc_59 : std_logic;
  signal bc_60 : std_logic;
  signal bc_61 : std_logic;
  signal bc_62 : std_logic;
  signal bc_63 : std_logic;
  signal bc_64 : std_logic;
  signal bc_65 : std_logic;
  signal bc_66 : std_logic;
  signal bc_67 : std_logic;
  signal bc_68 : std_logic;
  signal bc_69 : std_logic;
  signal bc_70 : std_logic;
  signal bc_71 : std_logic;
  signal bc_72 : std_logic;
  signal bc_73 : std_logic;
  signal bc_74 : std_logic;
  signal bc_75 : std_logic;
  signal bc_76 : std_logic;
  signal bc_77 : std_logic;
  signal bc_78 : std_logic;
  signal bc_79 : std_logic;
  signal bc_80 : std_logic;
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
  signal bd_25 : std_logic;
  signal bd_26 : std_logic;
  signal bd_27 : std_logic;
  signal bd_28 : std_logic;
  signal bd_29 : std_logic;
  signal bd_30 : std_logic;
  signal bd_31 : std_logic;
  signal bd_32 : std_logic;
  signal bd_33 : std_logic;
  signal bd_34 : std_logic;
  signal bd_35 : std_logic;
  signal bd_36 : std_logic;
  signal bd_37 : std_logic;
  signal bd_38 : std_logic;
  signal bd_39 : std_logic;
  signal bd_40 : std_logic;
  signal bd_41 : std_logic;
  signal bd_42 : std_logic;
  signal bd_43 : std_logic;
  signal bd_44 : std_logic;
  signal bd_45 : std_logic;
  signal bd_46 : std_logic;
  signal bd_47 : std_logic;
  signal bd_48 : std_logic;
  signal bd_49 : std_logic;
  signal bd_50 : std_logic;
  signal bd_51 : std_logic;
  signal bd_52 : std_logic;
  signal bd_53 : std_logic;
  signal bd_54 : std_logic;
  signal bd_55 : std_logic;
  signal bd_56 : std_logic;
  signal bd_57 : std_logic;
  signal bd_58 : std_logic;
  signal bd_59 : std_logic;
  signal bd_60 : std_logic;
  signal bd_61 : std_logic;
  signal bd_62 : std_logic;
  signal bd_63 : std_logic;
  signal bd_64 : std_logic;
  signal bd_65 : std_logic;
  signal bd_66 : std_logic;
  signal bd_67 : std_logic;
  signal bd_68 : std_logic;
  signal bd_69 : std_logic;
  signal bd_70 : std_logic;
  signal bd_71 : std_logic;
  signal bd_72 : std_logic;
  signal bd_73 : std_logic;
  signal bd_74 : std_logic;
  signal bd_75 : std_logic;
  signal bd_76 : std_logic;
  signal bd_77 : std_logic;
  signal bd_78 : std_logic;
  signal bd_79 : std_logic;
  signal bd_80 : std_logic;
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
  a_5 <= pkg_extract(io_x_5,1);
  b_5 <= pkg_extract(io_x_5,0);
  c_5 <= pkg_extract(io_y_5,1);
  d_5 <= pkg_extract(io_y_5,0);
  a_6 <= pkg_extract(io_x_6,1);
  b_6 <= pkg_extract(io_x_6,0);
  c_6 <= pkg_extract(io_y_6,1);
  d_6 <= pkg_extract(io_y_6,0);
  a_7 <= pkg_extract(io_x_7,1);
  b_7 <= pkg_extract(io_x_7,0);
  c_7 <= pkg_extract(io_y_7,1);
  d_7 <= pkg_extract(io_y_7,0);
  a_8 <= pkg_extract(io_x_8,1);
  b_8 <= pkg_extract(io_x_8,0);
  c_8 <= pkg_extract(io_y_8,1);
  d_8 <= pkg_extract(io_y_8,0);
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
  ac_5 <= (a_0 and c_5);
  ad_5 <= (a_0 and d_5);
  bc_5 <= (b_0 and c_5);
  bd_5 <= (b_0 and d_5);
  ac_6 <= (a_0 and c_6);
  ad_6 <= (a_0 and d_6);
  bc_6 <= (b_0 and c_6);
  bd_6 <= (b_0 and d_6);
  ac_7 <= (a_0 and c_7);
  ad_7 <= (a_0 and d_7);
  bc_7 <= (b_0 and c_7);
  bd_7 <= (b_0 and d_7);
  ac_8 <= (a_0 and c_8);
  ad_8 <= (a_0 and d_8);
  bc_8 <= (b_0 and c_8);
  bd_8 <= (b_0 and d_8);
  ac_9 <= (a_1 and c_0);
  ad_9 <= (a_1 and d_0);
  bc_9 <= (b_1 and c_0);
  bd_9 <= (b_1 and d_0);
  ac_10 <= (a_1 and c_1);
  ad_10 <= (a_1 and d_1);
  bc_10 <= (b_1 and c_1);
  bd_10 <= (b_1 and d_1);
  ac_11 <= (a_1 and c_2);
  ad_11 <= (a_1 and d_2);
  bc_11 <= (b_1 and c_2);
  bd_11 <= (b_1 and d_2);
  ac_12 <= (a_1 and c_3);
  ad_12 <= (a_1 and d_3);
  bc_12 <= (b_1 and c_3);
  bd_12 <= (b_1 and d_3);
  ac_13 <= (a_1 and c_4);
  ad_13 <= (a_1 and d_4);
  bc_13 <= (b_1 and c_4);
  bd_13 <= (b_1 and d_4);
  ac_14 <= (a_1 and c_5);
  ad_14 <= (a_1 and d_5);
  bc_14 <= (b_1 and c_5);
  bd_14 <= (b_1 and d_5);
  ac_15 <= (a_1 and c_6);
  ad_15 <= (a_1 and d_6);
  bc_15 <= (b_1 and c_6);
  bd_15 <= (b_1 and d_6);
  ac_16 <= (a_1 and c_7);
  ad_16 <= (a_1 and d_7);
  bc_16 <= (b_1 and c_7);
  bd_16 <= (b_1 and d_7);
  ac_17 <= (a_1 and c_8);
  ad_17 <= (a_1 and d_8);
  bc_17 <= (b_1 and c_8);
  bd_17 <= (b_1 and d_8);
  ac_18 <= (a_2 and c_0);
  ad_18 <= (a_2 and d_0);
  bc_18 <= (b_2 and c_0);
  bd_18 <= (b_2 and d_0);
  ac_19 <= (a_2 and c_1);
  ad_19 <= (a_2 and d_1);
  bc_19 <= (b_2 and c_1);
  bd_19 <= (b_2 and d_1);
  ac_20 <= (a_2 and c_2);
  ad_20 <= (a_2 and d_2);
  bc_20 <= (b_2 and c_2);
  bd_20 <= (b_2 and d_2);
  ac_21 <= (a_2 and c_3);
  ad_21 <= (a_2 and d_3);
  bc_21 <= (b_2 and c_3);
  bd_21 <= (b_2 and d_3);
  ac_22 <= (a_2 and c_4);
  ad_22 <= (a_2 and d_4);
  bc_22 <= (b_2 and c_4);
  bd_22 <= (b_2 and d_4);
  ac_23 <= (a_2 and c_5);
  ad_23 <= (a_2 and d_5);
  bc_23 <= (b_2 and c_5);
  bd_23 <= (b_2 and d_5);
  ac_24 <= (a_2 and c_6);
  ad_24 <= (a_2 and d_6);
  bc_24 <= (b_2 and c_6);
  bd_24 <= (b_2 and d_6);
  ac_25 <= (a_2 and c_7);
  ad_25 <= (a_2 and d_7);
  bc_25 <= (b_2 and c_7);
  bd_25 <= (b_2 and d_7);
  ac_26 <= (a_2 and c_8);
  ad_26 <= (a_2 and d_8);
  bc_26 <= (b_2 and c_8);
  bd_26 <= (b_2 and d_8);
  ac_27 <= (a_3 and c_0);
  ad_27 <= (a_3 and d_0);
  bc_27 <= (b_3 and c_0);
  bd_27 <= (b_3 and d_0);
  ac_28 <= (a_3 and c_1);
  ad_28 <= (a_3 and d_1);
  bc_28 <= (b_3 and c_1);
  bd_28 <= (b_3 and d_1);
  ac_29 <= (a_3 and c_2);
  ad_29 <= (a_3 and d_2);
  bc_29 <= (b_3 and c_2);
  bd_29 <= (b_3 and d_2);
  ac_30 <= (a_3 and c_3);
  ad_30 <= (a_3 and d_3);
  bc_30 <= (b_3 and c_3);
  bd_30 <= (b_3 and d_3);
  ac_31 <= (a_3 and c_4);
  ad_31 <= (a_3 and d_4);
  bc_31 <= (b_3 and c_4);
  bd_31 <= (b_3 and d_4);
  ac_32 <= (a_3 and c_5);
  ad_32 <= (a_3 and d_5);
  bc_32 <= (b_3 and c_5);
  bd_32 <= (b_3 and d_5);
  ac_33 <= (a_3 and c_6);
  ad_33 <= (a_3 and d_6);
  bc_33 <= (b_3 and c_6);
  bd_33 <= (b_3 and d_6);
  ac_34 <= (a_3 and c_7);
  ad_34 <= (a_3 and d_7);
  bc_34 <= (b_3 and c_7);
  bd_34 <= (b_3 and d_7);
  ac_35 <= (a_3 and c_8);
  ad_35 <= (a_3 and d_8);
  bc_35 <= (b_3 and c_8);
  bd_35 <= (b_3 and d_8);
  ac_36 <= (a_4 and c_0);
  ad_36 <= (a_4 and d_0);
  bc_36 <= (b_4 and c_0);
  bd_36 <= (b_4 and d_0);
  ac_37 <= (a_4 and c_1);
  ad_37 <= (a_4 and d_1);
  bc_37 <= (b_4 and c_1);
  bd_37 <= (b_4 and d_1);
  ac_38 <= (a_4 and c_2);
  ad_38 <= (a_4 and d_2);
  bc_38 <= (b_4 and c_2);
  bd_38 <= (b_4 and d_2);
  ac_39 <= (a_4 and c_3);
  ad_39 <= (a_4 and d_3);
  bc_39 <= (b_4 and c_3);
  bd_39 <= (b_4 and d_3);
  ac_40 <= (a_4 and c_4);
  ad_40 <= (a_4 and d_4);
  bc_40 <= (b_4 and c_4);
  bd_40 <= (b_4 and d_4);
  ac_41 <= (a_4 and c_5);
  ad_41 <= (a_4 and d_5);
  bc_41 <= (b_4 and c_5);
  bd_41 <= (b_4 and d_5);
  ac_42 <= (a_4 and c_6);
  ad_42 <= (a_4 and d_6);
  bc_42 <= (b_4 and c_6);
  bd_42 <= (b_4 and d_6);
  ac_43 <= (a_4 and c_7);
  ad_43 <= (a_4 and d_7);
  bc_43 <= (b_4 and c_7);
  bd_43 <= (b_4 and d_7);
  ac_44 <= (a_4 and c_8);
  ad_44 <= (a_4 and d_8);
  bc_44 <= (b_4 and c_8);
  bd_44 <= (b_4 and d_8);
  ac_45 <= (a_5 and c_0);
  ad_45 <= (a_5 and d_0);
  bc_45 <= (b_5 and c_0);
  bd_45 <= (b_5 and d_0);
  ac_46 <= (a_5 and c_1);
  ad_46 <= (a_5 and d_1);
  bc_46 <= (b_5 and c_1);
  bd_46 <= (b_5 and d_1);
  ac_47 <= (a_5 and c_2);
  ad_47 <= (a_5 and d_2);
  bc_47 <= (b_5 and c_2);
  bd_47 <= (b_5 and d_2);
  ac_48 <= (a_5 and c_3);
  ad_48 <= (a_5 and d_3);
  bc_48 <= (b_5 and c_3);
  bd_48 <= (b_5 and d_3);
  ac_49 <= (a_5 and c_4);
  ad_49 <= (a_5 and d_4);
  bc_49 <= (b_5 and c_4);
  bd_49 <= (b_5 and d_4);
  ac_50 <= (a_5 and c_5);
  ad_50 <= (a_5 and d_5);
  bc_50 <= (b_5 and c_5);
  bd_50 <= (b_5 and d_5);
  ac_51 <= (a_5 and c_6);
  ad_51 <= (a_5 and d_6);
  bc_51 <= (b_5 and c_6);
  bd_51 <= (b_5 and d_6);
  ac_52 <= (a_5 and c_7);
  ad_52 <= (a_5 and d_7);
  bc_52 <= (b_5 and c_7);
  bd_52 <= (b_5 and d_7);
  ac_53 <= (a_5 and c_8);
  ad_53 <= (a_5 and d_8);
  bc_53 <= (b_5 and c_8);
  bd_53 <= (b_5 and d_8);
  ac_54 <= (a_6 and c_0);
  ad_54 <= (a_6 and d_0);
  bc_54 <= (b_6 and c_0);
  bd_54 <= (b_6 and d_0);
  ac_55 <= (a_6 and c_1);
  ad_55 <= (a_6 and d_1);
  bc_55 <= (b_6 and c_1);
  bd_55 <= (b_6 and d_1);
  ac_56 <= (a_6 and c_2);
  ad_56 <= (a_6 and d_2);
  bc_56 <= (b_6 and c_2);
  bd_56 <= (b_6 and d_2);
  ac_57 <= (a_6 and c_3);
  ad_57 <= (a_6 and d_3);
  bc_57 <= (b_6 and c_3);
  bd_57 <= (b_6 and d_3);
  ac_58 <= (a_6 and c_4);
  ad_58 <= (a_6 and d_4);
  bc_58 <= (b_6 and c_4);
  bd_58 <= (b_6 and d_4);
  ac_59 <= (a_6 and c_5);
  ad_59 <= (a_6 and d_5);
  bc_59 <= (b_6 and c_5);
  bd_59 <= (b_6 and d_5);
  ac_60 <= (a_6 and c_6);
  ad_60 <= (a_6 and d_6);
  bc_60 <= (b_6 and c_6);
  bd_60 <= (b_6 and d_6);
  ac_61 <= (a_6 and c_7);
  ad_61 <= (a_6 and d_7);
  bc_61 <= (b_6 and c_7);
  bd_61 <= (b_6 and d_7);
  ac_62 <= (a_6 and c_8);
  ad_62 <= (a_6 and d_8);
  bc_62 <= (b_6 and c_8);
  bd_62 <= (b_6 and d_8);
  ac_63 <= (a_7 and c_0);
  ad_63 <= (a_7 and d_0);
  bc_63 <= (b_7 and c_0);
  bd_63 <= (b_7 and d_0);
  ac_64 <= (a_7 and c_1);
  ad_64 <= (a_7 and d_1);
  bc_64 <= (b_7 and c_1);
  bd_64 <= (b_7 and d_1);
  ac_65 <= (a_7 and c_2);
  ad_65 <= (a_7 and d_2);
  bc_65 <= (b_7 and c_2);
  bd_65 <= (b_7 and d_2);
  ac_66 <= (a_7 and c_3);
  ad_66 <= (a_7 and d_3);
  bc_66 <= (b_7 and c_3);
  bd_66 <= (b_7 and d_3);
  ac_67 <= (a_7 and c_4);
  ad_67 <= (a_7 and d_4);
  bc_67 <= (b_7 and c_4);
  bd_67 <= (b_7 and d_4);
  ac_68 <= (a_7 and c_5);
  ad_68 <= (a_7 and d_5);
  bc_68 <= (b_7 and c_5);
  bd_68 <= (b_7 and d_5);
  ac_69 <= (a_7 and c_6);
  ad_69 <= (a_7 and d_6);
  bc_69 <= (b_7 and c_6);
  bd_69 <= (b_7 and d_6);
  ac_70 <= (a_7 and c_7);
  ad_70 <= (a_7 and d_7);
  bc_70 <= (b_7 and c_7);
  bd_70 <= (b_7 and d_7);
  ac_71 <= (a_7 and c_8);
  ad_71 <= (a_7 and d_8);
  bc_71 <= (b_7 and c_8);
  bd_71 <= (b_7 and d_8);
  ac_72 <= (a_8 and c_0);
  ad_72 <= (a_8 and d_0);
  bc_72 <= (b_8 and c_0);
  bd_72 <= (b_8 and d_0);
  ac_73 <= (a_8 and c_1);
  ad_73 <= (a_8 and d_1);
  bc_73 <= (b_8 and c_1);
  bd_73 <= (b_8 and d_1);
  ac_74 <= (a_8 and c_2);
  ad_74 <= (a_8 and d_2);
  bc_74 <= (b_8 and c_2);
  bd_74 <= (b_8 and d_2);
  ac_75 <= (a_8 and c_3);
  ad_75 <= (a_8 and d_3);
  bc_75 <= (b_8 and c_3);
  bd_75 <= (b_8 and d_3);
  ac_76 <= (a_8 and c_4);
  ad_76 <= (a_8 and d_4);
  bc_76 <= (b_8 and c_4);
  bd_76 <= (b_8 and d_4);
  ac_77 <= (a_8 and c_5);
  ad_77 <= (a_8 and d_5);
  bc_77 <= (b_8 and c_5);
  bd_77 <= (b_8 and d_5);
  ac_78 <= (a_8 and c_6);
  ad_78 <= (a_8 and d_6);
  bc_78 <= (b_8 and c_6);
  bd_78 <= (b_8 and d_6);
  ac_79 <= (a_8 and c_7);
  ad_79 <= (a_8 and d_7);
  bc_79 <= (b_8 and c_7);
  bd_79 <= (b_8 and d_7);
  ac_80 <= (a_8 and c_8);
  ad_80 <= (a_8 and d_8);
  bc_80 <= (b_8 and c_8);
  bd_80 <= (b_8 and d_8);
  process(bc_0,ad_0,bd_0,bc_10,ad_10,bd_10,bc_20,ad_20,bd_20,bc_30,ad_30,bd_30,bc_40,ad_40,bd_40,bc_50,ad_50,bd_50,bc_60,ad_60,bd_60,bc_70,ad_70,bd_70,bc_80,ad_80,bd_80)
  begin
    e_0(8) <= ((bc_0 xor ad_0) xor bd_0);
    e_0(0) <= ((bc_10 xor ad_10) xor bd_10);
    e_0(1) <= ((bc_20 xor ad_20) xor bd_20);
    e_0(2) <= ((bc_30 xor ad_30) xor bd_30);
    e_0(3) <= ((bc_40 xor ad_40) xor bd_40);
    e_0(4) <= ((bc_50 xor ad_50) xor bd_50);
    e_0(5) <= ((bc_60 xor ad_60) xor bd_60);
    e_0(6) <= ((bc_70 xor ad_70) xor bd_70);
    e_0(7) <= ((bc_80 xor ad_80) xor bd_80);
  end process;

  process(bc_0,ad_0,ac_0,bc_10,ad_10,ac_10,bc_20,ad_20,ac_20,bc_30,ad_30,ac_30,bc_40,ad_40,ac_40,bc_50,ad_50,ac_50,bc_60,ad_60,ac_60,bc_70,ad_70,ac_70,bc_80,ad_80,ac_80)
  begin
    f_0(8) <= ((bc_0 xor ad_0) xor ac_0);
    f_0(0) <= ((bc_10 xor ad_10) xor ac_10);
    f_0(1) <= ((bc_20 xor ad_20) xor ac_20);
    f_0(2) <= ((bc_30 xor ad_30) xor ac_30);
    f_0(3) <= ((bc_40 xor ad_40) xor ac_40);
    f_0(4) <= ((bc_50 xor ad_50) xor ac_50);
    f_0(5) <= ((bc_60 xor ad_60) xor ac_60);
    f_0(6) <= ((bc_70 xor ad_70) xor ac_70);
    f_0(7) <= ((bc_80 xor ad_80) xor ac_80);
  end process;

  process(e_0,bc_11,ad_11,bd_11,bc_2,ad_2,bd_2,bc_1,ad_1,bd_1,bc_4,ad_4,bd_4,bc_3,ad_3,bd_3,bc_6,ad_6,bd_6,bc_5,ad_5,bd_5,bc_8,ad_8,bd_8,bc_7,ad_7,bd_7)
  begin
    e_1(0) <= (((pkg_extract(e_0,0) xor bc_11) xor ad_11) xor bd_11);
    e_1(1) <= (((pkg_extract(e_0,1) xor bc_2) xor ad_2) xor bd_2);
    e_1(2) <= (((pkg_extract(e_0,2) xor bc_1) xor ad_1) xor bd_1);
    e_1(3) <= (((pkg_extract(e_0,3) xor bc_4) xor ad_4) xor bd_4);
    e_1(4) <= (((pkg_extract(e_0,4) xor bc_3) xor ad_3) xor bd_3);
    e_1(5) <= (((pkg_extract(e_0,5) xor bc_6) xor ad_6) xor bd_6);
    e_1(6) <= (((pkg_extract(e_0,6) xor bc_5) xor ad_5) xor bd_5);
    e_1(7) <= (((pkg_extract(e_0,7) xor bc_8) xor ad_8) xor bd_8);
    e_1(8) <= (((pkg_extract(e_0,8) xor bc_7) xor ad_7) xor bd_7);
  end process;

  process(f_0,bc_11,ad_11,ac_11,bc_2,ad_2,ac_2,bc_1,ad_1,ac_1,bc_4,ad_4,ac_4,bc_3,ad_3,ac_3,bc_6,ad_6,ac_6,bc_5,ad_5,ac_5,bc_8,ad_8,ac_8,bc_7,ad_7,ac_7)
  begin
    f_1(0) <= (((pkg_extract(f_0,0) xor bc_11) xor ad_11) xor ac_11);
    f_1(1) <= (((pkg_extract(f_0,1) xor bc_2) xor ad_2) xor ac_2);
    f_1(2) <= (((pkg_extract(f_0,2) xor bc_1) xor ad_1) xor ac_1);
    f_1(3) <= (((pkg_extract(f_0,3) xor bc_4) xor ad_4) xor ac_4);
    f_1(4) <= (((pkg_extract(f_0,4) xor bc_3) xor ad_3) xor ac_3);
    f_1(5) <= (((pkg_extract(f_0,5) xor bc_6) xor ad_6) xor ac_6);
    f_1(6) <= (((pkg_extract(f_0,6) xor bc_5) xor ad_5) xor ac_5);
    f_1(7) <= (((pkg_extract(f_0,7) xor bc_8) xor ad_8) xor ac_8);
    f_1(8) <= (((pkg_extract(f_0,8) xor bc_7) xor ad_7) xor ac_7);
  end process;

  process(e_1,bc_19,ad_19,bd_19,bc_18,ad_18,bd_18,bc_9,ad_9,bd_9,bc_13,ad_13,bd_13,bc_12,ad_12,bd_12,bc_15,ad_15,bd_15,bc_14,ad_14,bd_14,bc_17,ad_17,bd_17,bc_16,ad_16,bd_16)
  begin
    e_2(0) <= (((pkg_extract(e_1,0) xor bc_19) xor ad_19) xor bd_19);
    e_2(1) <= (((pkg_extract(e_1,1) xor bc_18) xor ad_18) xor bd_18);
    e_2(2) <= (((pkg_extract(e_1,2) xor bc_9) xor ad_9) xor bd_9);
    e_2(3) <= (((pkg_extract(e_1,3) xor bc_13) xor ad_13) xor bd_13);
    e_2(4) <= (((pkg_extract(e_1,4) xor bc_12) xor ad_12) xor bd_12);
    e_2(5) <= (((pkg_extract(e_1,5) xor bc_15) xor ad_15) xor bd_15);
    e_2(6) <= (((pkg_extract(e_1,6) xor bc_14) xor ad_14) xor bd_14);
    e_2(7) <= (((pkg_extract(e_1,7) xor bc_17) xor ad_17) xor bd_17);
    e_2(8) <= (((pkg_extract(e_1,8) xor bc_16) xor ad_16) xor bd_16);
  end process;

  process(f_1,bc_19,ad_19,ac_19,bc_18,ad_18,ac_18,bc_9,ad_9,ac_9,bc_13,ad_13,ac_13,bc_12,ad_12,ac_12,bc_15,ad_15,ac_15,bc_14,ad_14,ac_14,bc_17,ad_17,ac_17,bc_16,ad_16,ac_16)
  begin
    f_2(0) <= (((pkg_extract(f_1,0) xor bc_19) xor ad_19) xor ac_19);
    f_2(1) <= (((pkg_extract(f_1,1) xor bc_18) xor ad_18) xor ac_18);
    f_2(2) <= (((pkg_extract(f_1,2) xor bc_9) xor ad_9) xor ac_9);
    f_2(3) <= (((pkg_extract(f_1,3) xor bc_13) xor ad_13) xor ac_13);
    f_2(4) <= (((pkg_extract(f_1,4) xor bc_12) xor ad_12) xor ac_12);
    f_2(5) <= (((pkg_extract(f_1,5) xor bc_15) xor ad_15) xor ac_15);
    f_2(6) <= (((pkg_extract(f_1,6) xor bc_14) xor ad_14) xor ac_14);
    f_2(7) <= (((pkg_extract(f_1,7) xor bc_17) xor ad_17) xor ac_17);
    f_2(8) <= (((pkg_extract(f_1,8) xor bc_16) xor ad_16) xor ac_16);
  end process;

  process(e_2,bc_28,ad_28,bd_28,bc_27,ad_27,bd_27,bc_31,ad_31,bd_31,bc_22,ad_22,bd_22,bc_21,ad_21,bd_21,bc_24,ad_24,bd_24,bc_23,ad_23,bd_23,bc_26,ad_26,bd_26,bc_25,ad_25,bd_25)
  begin
    e_3(0) <= (((pkg_extract(e_2,0) xor bc_28) xor ad_28) xor bd_28);
    e_3(1) <= (((pkg_extract(e_2,1) xor bc_27) xor ad_27) xor bd_27);
    e_3(2) <= (((pkg_extract(e_2,2) xor bc_31) xor ad_31) xor bd_31);
    e_3(3) <= (((pkg_extract(e_2,3) xor bc_22) xor ad_22) xor bd_22);
    e_3(4) <= (((pkg_extract(e_2,4) xor bc_21) xor ad_21) xor bd_21);
    e_3(5) <= (((pkg_extract(e_2,5) xor bc_24) xor ad_24) xor bd_24);
    e_3(6) <= (((pkg_extract(e_2,6) xor bc_23) xor ad_23) xor bd_23);
    e_3(7) <= (((pkg_extract(e_2,7) xor bc_26) xor ad_26) xor bd_26);
    e_3(8) <= (((pkg_extract(e_2,8) xor bc_25) xor ad_25) xor bd_25);
  end process;

  process(f_2,bc_28,ad_28,ac_28,bc_27,ad_27,ac_27,bc_31,ad_31,ac_31,bc_22,ad_22,ac_22,bc_21,ad_21,ac_21,bc_24,ad_24,ac_24,bc_23,ad_23,ac_23,bc_26,ad_26,ac_26,bc_25,ad_25,ac_25)
  begin
    f_3(0) <= (((pkg_extract(f_2,0) xor bc_28) xor ad_28) xor ac_28);
    f_3(1) <= (((pkg_extract(f_2,1) xor bc_27) xor ad_27) xor ac_27);
    f_3(2) <= (((pkg_extract(f_2,2) xor bc_31) xor ad_31) xor ac_31);
    f_3(3) <= (((pkg_extract(f_2,3) xor bc_22) xor ad_22) xor ac_22);
    f_3(4) <= (((pkg_extract(f_2,4) xor bc_21) xor ad_21) xor ac_21);
    f_3(5) <= (((pkg_extract(f_2,5) xor bc_24) xor ad_24) xor ac_24);
    f_3(6) <= (((pkg_extract(f_2,6) xor bc_23) xor ad_23) xor ac_23);
    f_3(7) <= (((pkg_extract(f_2,7) xor bc_26) xor ad_26) xor ac_26);
    f_3(8) <= (((pkg_extract(f_2,8) xor bc_25) xor ad_25) xor ac_25);
  end process;

  process(e_3,bc_37,ad_37,bd_37,bc_36,ad_36,bd_36,bc_39,ad_39,bd_39,bc_38,ad_38,bd_38,bc_29,ad_29,bd_29,bc_33,ad_33,bd_33,bc_32,ad_32,bd_32,bc_35,ad_35,bd_35,bc_34,ad_34,bd_34)
  begin
    e_4(0) <= (((pkg_extract(e_3,0) xor bc_37) xor ad_37) xor bd_37);
    e_4(1) <= (((pkg_extract(e_3,1) xor bc_36) xor ad_36) xor bd_36);
    e_4(2) <= (((pkg_extract(e_3,2) xor bc_39) xor ad_39) xor bd_39);
    e_4(3) <= (((pkg_extract(e_3,3) xor bc_38) xor ad_38) xor bd_38);
    e_4(4) <= (((pkg_extract(e_3,4) xor bc_29) xor ad_29) xor bd_29);
    e_4(5) <= (((pkg_extract(e_3,5) xor bc_33) xor ad_33) xor bd_33);
    e_4(6) <= (((pkg_extract(e_3,6) xor bc_32) xor ad_32) xor bd_32);
    e_4(7) <= (((pkg_extract(e_3,7) xor bc_35) xor ad_35) xor bd_35);
    e_4(8) <= (((pkg_extract(e_3,8) xor bc_34) xor ad_34) xor bd_34);
  end process;

  process(f_3,bc_37,ad_37,ac_37,bc_36,ad_36,ac_36,bc_39,ad_39,ac_39,bc_38,ad_38,ac_38,bc_29,ad_29,ac_29,bc_33,ad_33,ac_33,bc_32,ad_32,ac_32,bc_35,ad_35,ac_35,bc_34,ad_34,ac_34)
  begin
    f_4(0) <= (((pkg_extract(f_3,0) xor bc_37) xor ad_37) xor ac_37);
    f_4(1) <= (((pkg_extract(f_3,1) xor bc_36) xor ad_36) xor ac_36);
    f_4(2) <= (((pkg_extract(f_3,2) xor bc_39) xor ad_39) xor ac_39);
    f_4(3) <= (((pkg_extract(f_3,3) xor bc_38) xor ad_38) xor ac_38);
    f_4(4) <= (((pkg_extract(f_3,4) xor bc_29) xor ad_29) xor ac_29);
    f_4(5) <= (((pkg_extract(f_3,5) xor bc_33) xor ad_33) xor ac_33);
    f_4(6) <= (((pkg_extract(f_3,6) xor bc_32) xor ad_32) xor ac_32);
    f_4(7) <= (((pkg_extract(f_3,7) xor bc_35) xor ad_35) xor ac_35);
    f_4(8) <= (((pkg_extract(f_3,8) xor bc_34) xor ad_34) xor ac_34);
  end process;

  process(e_4,bc_46,ad_46,bd_46,bc_45,ad_45,bd_45,bc_48,ad_48,bd_48,bc_47,ad_47,bd_47,bc_51,ad_51,bd_51,bc_42,ad_42,bd_42,bc_41,ad_41,bd_41,bc_44,ad_44,bd_44,bc_43,ad_43,bd_43)
  begin
    e_5(0) <= (((pkg_extract(e_4,0) xor bc_46) xor ad_46) xor bd_46);
    e_5(1) <= (((pkg_extract(e_4,1) xor bc_45) xor ad_45) xor bd_45);
    e_5(2) <= (((pkg_extract(e_4,2) xor bc_48) xor ad_48) xor bd_48);
    e_5(3) <= (((pkg_extract(e_4,3) xor bc_47) xor ad_47) xor bd_47);
    e_5(4) <= (((pkg_extract(e_4,4) xor bc_51) xor ad_51) xor bd_51);
    e_5(5) <= (((pkg_extract(e_4,5) xor bc_42) xor ad_42) xor bd_42);
    e_5(6) <= (((pkg_extract(e_4,6) xor bc_41) xor ad_41) xor bd_41);
    e_5(7) <= (((pkg_extract(e_4,7) xor bc_44) xor ad_44) xor bd_44);
    e_5(8) <= (((pkg_extract(e_4,8) xor bc_43) xor ad_43) xor bd_43);
  end process;

  process(f_4,bc_46,ad_46,ac_46,bc_45,ad_45,ac_45,bc_48,ad_48,ac_48,bc_47,ad_47,ac_47,bc_51,ad_51,ac_51,bc_42,ad_42,ac_42,bc_41,ad_41,ac_41,bc_44,ad_44,ac_44,bc_43,ad_43,ac_43)
  begin
    f_5(0) <= (((pkg_extract(f_4,0) xor bc_46) xor ad_46) xor ac_46);
    f_5(1) <= (((pkg_extract(f_4,1) xor bc_45) xor ad_45) xor ac_45);
    f_5(2) <= (((pkg_extract(f_4,2) xor bc_48) xor ad_48) xor ac_48);
    f_5(3) <= (((pkg_extract(f_4,3) xor bc_47) xor ad_47) xor ac_47);
    f_5(4) <= (((pkg_extract(f_4,4) xor bc_51) xor ad_51) xor ac_51);
    f_5(5) <= (((pkg_extract(f_4,5) xor bc_42) xor ad_42) xor ac_42);
    f_5(6) <= (((pkg_extract(f_4,6) xor bc_41) xor ad_41) xor ac_41);
    f_5(7) <= (((pkg_extract(f_4,7) xor bc_44) xor ad_44) xor ac_44);
    f_5(8) <= (((pkg_extract(f_4,8) xor bc_43) xor ad_43) xor ac_43);
  end process;

  process(e_5,bc_55,ad_55,bd_55,bc_54,ad_54,bd_54,bc_57,ad_57,bd_57,bc_56,ad_56,bd_56,bc_59,ad_59,bd_59,bc_58,ad_58,bd_58,bc_49,ad_49,bd_49,bc_53,ad_53,bd_53,bc_52,ad_52,bd_52)
  begin
    e_6(0) <= (((pkg_extract(e_5,0) xor bc_55) xor ad_55) xor bd_55);
    e_6(1) <= (((pkg_extract(e_5,1) xor bc_54) xor ad_54) xor bd_54);
    e_6(2) <= (((pkg_extract(e_5,2) xor bc_57) xor ad_57) xor bd_57);
    e_6(3) <= (((pkg_extract(e_5,3) xor bc_56) xor ad_56) xor bd_56);
    e_6(4) <= (((pkg_extract(e_5,4) xor bc_59) xor ad_59) xor bd_59);
    e_6(5) <= (((pkg_extract(e_5,5) xor bc_58) xor ad_58) xor bd_58);
    e_6(6) <= (((pkg_extract(e_5,6) xor bc_49) xor ad_49) xor bd_49);
    e_6(7) <= (((pkg_extract(e_5,7) xor bc_53) xor ad_53) xor bd_53);
    e_6(8) <= (((pkg_extract(e_5,8) xor bc_52) xor ad_52) xor bd_52);
  end process;

  process(f_5,bc_55,ad_55,ac_55,bc_54,ad_54,ac_54,bc_57,ad_57,ac_57,bc_56,ad_56,ac_56,bc_59,ad_59,ac_59,bc_58,ad_58,ac_58,bc_49,ad_49,ac_49,bc_53,ad_53,ac_53,bc_52,ad_52,ac_52)
  begin
    f_6(0) <= (((pkg_extract(f_5,0) xor bc_55) xor ad_55) xor ac_55);
    f_6(1) <= (((pkg_extract(f_5,1) xor bc_54) xor ad_54) xor ac_54);
    f_6(2) <= (((pkg_extract(f_5,2) xor bc_57) xor ad_57) xor ac_57);
    f_6(3) <= (((pkg_extract(f_5,3) xor bc_56) xor ad_56) xor ac_56);
    f_6(4) <= (((pkg_extract(f_5,4) xor bc_59) xor ad_59) xor ac_59);
    f_6(5) <= (((pkg_extract(f_5,5) xor bc_58) xor ad_58) xor ac_58);
    f_6(6) <= (((pkg_extract(f_5,6) xor bc_49) xor ad_49) xor ac_49);
    f_6(7) <= (((pkg_extract(f_5,7) xor bc_53) xor ad_53) xor ac_53);
    f_6(8) <= (((pkg_extract(f_5,8) xor bc_52) xor ad_52) xor ac_52);
  end process;

  process(e_6,bc_64,ad_64,bd_64,bc_63,ad_63,bd_63,bc_66,ad_66,bd_66,bc_65,ad_65,bd_65,bc_68,ad_68,bd_68,bc_67,ad_67,bd_67,bc_71,ad_71,bd_71,bc_62,ad_62,bd_62,bc_61,ad_61,bd_61)
  begin
    e_7(0) <= (((pkg_extract(e_6,0) xor bc_64) xor ad_64) xor bd_64);
    e_7(1) <= (((pkg_extract(e_6,1) xor bc_63) xor ad_63) xor bd_63);
    e_7(2) <= (((pkg_extract(e_6,2) xor bc_66) xor ad_66) xor bd_66);
    e_7(3) <= (((pkg_extract(e_6,3) xor bc_65) xor ad_65) xor bd_65);
    e_7(4) <= (((pkg_extract(e_6,4) xor bc_68) xor ad_68) xor bd_68);
    e_7(5) <= (((pkg_extract(e_6,5) xor bc_67) xor ad_67) xor bd_67);
    e_7(6) <= (((pkg_extract(e_6,6) xor bc_71) xor ad_71) xor bd_71);
    e_7(7) <= (((pkg_extract(e_6,7) xor bc_62) xor ad_62) xor bd_62);
    e_7(8) <= (((pkg_extract(e_6,8) xor bc_61) xor ad_61) xor bd_61);
  end process;

  process(f_6,bc_64,ad_64,ac_64,bc_63,ad_63,ac_63,bc_66,ad_66,ac_66,bc_65,ad_65,ac_65,bc_68,ad_68,ac_68,bc_67,ad_67,ac_67,bc_71,ad_71,ac_71,bc_62,ad_62,ac_62,bc_61,ad_61,ac_61)
  begin
    f_7(0) <= (((pkg_extract(f_6,0) xor bc_64) xor ad_64) xor ac_64);
    f_7(1) <= (((pkg_extract(f_6,1) xor bc_63) xor ad_63) xor ac_63);
    f_7(2) <= (((pkg_extract(f_6,2) xor bc_66) xor ad_66) xor ac_66);
    f_7(3) <= (((pkg_extract(f_6,3) xor bc_65) xor ad_65) xor ac_65);
    f_7(4) <= (((pkg_extract(f_6,4) xor bc_68) xor ad_68) xor ac_68);
    f_7(5) <= (((pkg_extract(f_6,5) xor bc_67) xor ad_67) xor ac_67);
    f_7(6) <= (((pkg_extract(f_6,6) xor bc_71) xor ad_71) xor ac_71);
    f_7(7) <= (((pkg_extract(f_6,7) xor bc_62) xor ad_62) xor ac_62);
    f_7(8) <= (((pkg_extract(f_6,8) xor bc_61) xor ad_61) xor ac_61);
  end process;

  process(e_7,bc_73,ad_73,bd_73,bc_72,ad_72,bd_72,bc_75,ad_75,bd_75,bc_74,ad_74,bd_74,bc_77,ad_77,bd_77,bc_76,ad_76,bd_76,bc_79,ad_79,bd_79,bc_78,ad_78,bd_78,bc_69,ad_69,bd_69)
  begin
    e_8(0) <= (((pkg_extract(e_7,0) xor bc_73) xor ad_73) xor bd_73);
    e_8(1) <= (((pkg_extract(e_7,1) xor bc_72) xor ad_72) xor bd_72);
    e_8(2) <= (((pkg_extract(e_7,2) xor bc_75) xor ad_75) xor bd_75);
    e_8(3) <= (((pkg_extract(e_7,3) xor bc_74) xor ad_74) xor bd_74);
    e_8(4) <= (((pkg_extract(e_7,4) xor bc_77) xor ad_77) xor bd_77);
    e_8(5) <= (((pkg_extract(e_7,5) xor bc_76) xor ad_76) xor bd_76);
    e_8(6) <= (((pkg_extract(e_7,6) xor bc_79) xor ad_79) xor bd_79);
    e_8(7) <= (((pkg_extract(e_7,7) xor bc_78) xor ad_78) xor bd_78);
    e_8(8) <= (((pkg_extract(e_7,8) xor bc_69) xor ad_69) xor bd_69);
  end process;

  process(f_7,bc_73,ad_73,ac_73,bc_72,ad_72,ac_72,bc_75,ad_75,ac_75,bc_74,ad_74,ac_74,bc_77,ad_77,ac_77,bc_76,ad_76,ac_76,bc_79,ad_79,ac_79,bc_78,ad_78,ac_78,bc_69,ad_69,ac_69)
  begin
    f_8(0) <= (((pkg_extract(f_7,0) xor bc_73) xor ad_73) xor ac_73);
    f_8(1) <= (((pkg_extract(f_7,1) xor bc_72) xor ad_72) xor ac_72);
    f_8(2) <= (((pkg_extract(f_7,2) xor bc_75) xor ad_75) xor ac_75);
    f_8(3) <= (((pkg_extract(f_7,3) xor bc_74) xor ad_74) xor ac_74);
    f_8(4) <= (((pkg_extract(f_7,4) xor bc_77) xor ad_77) xor ac_77);
    f_8(5) <= (((pkg_extract(f_7,5) xor bc_76) xor ad_76) xor ac_76);
    f_8(6) <= (((pkg_extract(f_7,6) xor bc_79) xor ad_79) xor ac_79);
    f_8(7) <= (((pkg_extract(f_7,7) xor bc_78) xor ad_78) xor ac_78);
    f_8(8) <= (((pkg_extract(f_7,8) xor bc_69) xor ad_69) xor ac_69);
  end process;

  io_z_0 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,0)),pkg_toStdLogicVector(pkg_extract(f_8,0)));
  io_z_1 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,1)),pkg_toStdLogicVector(pkg_extract(f_8,1)));
  io_z_2 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,2)),pkg_toStdLogicVector(pkg_extract(f_8,2)));
  io_z_3 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,3)),pkg_toStdLogicVector(pkg_extract(f_8,3)));
  io_z_4 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,4)),pkg_toStdLogicVector(pkg_extract(f_8,4)));
  io_z_5 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,5)),pkg_toStdLogicVector(pkg_extract(f_8,5)));
  io_z_6 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,6)),pkg_toStdLogicVector(pkg_extract(f_8,6)));
  io_z_7 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,7)),pkg_toStdLogicVector(pkg_extract(f_8,7)));
  io_z_8 <= pkg_cat(pkg_toStdLogicVector(pkg_extract(e_8,8)),pkg_toStdLogicVector(pkg_extract(f_8,8)));
end arch;

