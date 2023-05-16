-- Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
-- Component : DomIndepMul
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


entity DomIndepMul is
  port(
    io_x_0 : in std_logic;
    io_x_1 : in std_logic;
    io_x_2 : in std_logic;
    io_x_3 : in std_logic;
    io_x_4 : in std_logic;
    io_x_5 : in std_logic;
    io_x_6 : in std_logic;
    io_x_7 : in std_logic;
    io_x_8 : in std_logic;
    io_y_0 : in std_logic;
    io_y_1 : in std_logic;
    io_y_2 : in std_logic;
    io_y_3 : in std_logic;
    io_y_4 : in std_logic;
    io_y_5 : in std_logic;
    io_y_6 : in std_logic;
    io_y_7 : in std_logic;
    io_y_8 : in std_logic;
    io_m_0 : in std_logic;
    io_m_1 : in std_logic;
    io_m_2 : in std_logic;
    io_m_3 : in std_logic;
    io_m_4 : in std_logic;
    io_m_5 : in std_logic;
    io_m_6 : in std_logic;
    io_m_7 : in std_logic;
    io_m_8 : in std_logic;
    io_m_9 : in std_logic;
    io_m_10 : in std_logic;
    io_m_11 : in std_logic;
    io_m_12 : in std_logic;
    io_m_13 : in std_logic;
    io_m_14 : in std_logic;
    io_m_15 : in std_logic;
    io_m_16 : in std_logic;
    io_m_17 : in std_logic;
    io_m_18 : in std_logic;
    io_m_19 : in std_logic;
    io_m_20 : in std_logic;
    io_m_21 : in std_logic;
    io_m_22 : in std_logic;
    io_m_23 : in std_logic;
    io_m_24 : in std_logic;
    io_m_25 : in std_logic;
    io_m_26 : in std_logic;
    io_m_27 : in std_logic;
    io_m_28 : in std_logic;
    io_m_29 : in std_logic;
    io_m_30 : in std_logic;
    io_m_31 : in std_logic;
    io_m_32 : in std_logic;
    io_m_33 : in std_logic;
    io_m_34 : in std_logic;
    io_m_35 : in std_logic;
    io_z_0 : out std_logic;
    io_z_1 : out std_logic;
    io_z_2 : out std_logic;
    io_z_3 : out std_logic;
    io_z_4 : out std_logic;
    io_z_5 : out std_logic;
    io_z_6 : out std_logic;
    io_z_7 : out std_logic;
    io_z_8 : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end DomIndepMul;

architecture arch of DomIndepMul is

  signal xy_0 : std_logic;
  signal xy_1 : std_logic;
  signal xy_2 : std_logic;
  signal xy_3 : std_logic;
  signal xy_4 : std_logic;
  signal xy_5 : std_logic;
  signal xy_6 : std_logic;
  signal xy_7 : std_logic;
  signal xy_8 : std_logic;
  signal xy_9 : std_logic;
  signal xy_10 : std_logic;
  signal xy_11 : std_logic;
  signal xy_12 : std_logic;
  signal xy_13 : std_logic;
  signal xy_14 : std_logic;
  signal xy_15 : std_logic;
  signal xy_16 : std_logic;
  signal xy_17 : std_logic;
  signal xy_18 : std_logic;
  signal xy_19 : std_logic;
  signal xy_20 : std_logic;
  signal xy_21 : std_logic;
  signal xy_22 : std_logic;
  signal xy_23 : std_logic;
  signal xy_24 : std_logic;
  signal xy_25 : std_logic;
  signal xy_26 : std_logic;
  signal xy_27 : std_logic;
  signal xy_28 : std_logic;
  signal xy_29 : std_logic;
  signal xy_30 : std_logic;
  signal xy_31 : std_logic;
  signal xy_32 : std_logic;
  signal xy_33 : std_logic;
  signal xy_34 : std_logic;
  signal xy_35 : std_logic;
  signal xy_36 : std_logic;
  signal xy_37 : std_logic;
  signal xy_38 : std_logic;
  signal xy_39 : std_logic;
  signal xy_40 : std_logic;
  signal xy_41 : std_logic;
  signal xy_42 : std_logic;
  signal xy_43 : std_logic;
  signal xy_44 : std_logic;
  signal xy_45 : std_logic;
  signal xy_46 : std_logic;
  signal xy_47 : std_logic;
  signal xy_48 : std_logic;
  signal xy_49 : std_logic;
  signal xy_50 : std_logic;
  signal xy_51 : std_logic;
  signal xy_52 : std_logic;
  signal xy_53 : std_logic;
  signal xy_54 : std_logic;
  signal xy_55 : std_logic;
  signal xy_56 : std_logic;
  signal xy_57 : std_logic;
  signal xy_58 : std_logic;
  signal xy_59 : std_logic;
  signal xy_60 : std_logic;
  signal xy_61 : std_logic;
  signal xy_62 : std_logic;
  signal xy_63 : std_logic;
  signal xy_64 : std_logic;
  signal xy_65 : std_logic;
  signal xy_66 : std_logic;
  signal xy_67 : std_logic;
  signal xy_68 : std_logic;
  signal xy_69 : std_logic;
  signal xy_70 : std_logic;
  signal xy_71 : std_logic;
  signal xy_72 : std_logic;
  signal xy_73 : std_logic;
  signal xy_74 : std_logic;
  signal xy_75 : std_logic;
  signal xy_76 : std_logic;
  signal xy_77 : std_logic;
  signal xy_78 : std_logic;
  signal xy_79 : std_logic;
  signal xy_80 : std_logic;
  signal z_0 : std_logic;
  signal z_1 : std_logic;
  signal z_2 : std_logic;
  signal z_3 : std_logic;
  signal z_4 : std_logic;
  signal z_5 : std_logic;
  signal z_6 : std_logic;
  signal z_7 : std_logic;
  signal z_8 : std_logic;
  signal z_9 : std_logic;
  signal z_10 : std_logic;
  signal z_11 : std_logic;
  signal z_12 : std_logic;
  signal z_13 : std_logic;
  signal z_14 : std_logic;
  signal z_15 : std_logic;
  signal z_16 : std_logic;
  signal z_17 : std_logic;
  signal z_18 : std_logic;
  signal z_19 : std_logic;
  signal z_20 : std_logic;
  signal z_21 : std_logic;
  signal z_22 : std_logic;
  signal z_23 : std_logic;
  signal z_24 : std_logic;
  signal z_25 : std_logic;
  signal z_26 : std_logic;
  signal z_27 : std_logic;
  signal z_28 : std_logic;
  signal z_29 : std_logic;
  signal z_30 : std_logic;
  signal z_31 : std_logic;
  signal z_32 : std_logic;
  signal z_33 : std_logic;
  signal z_34 : std_logic;
  signal z_35 : std_logic;
  signal z_36 : std_logic;
  signal z_37 : std_logic;
  signal z_38 : std_logic;
  signal z_39 : std_logic;
  signal z_40 : std_logic;
  signal z_41 : std_logic;
  signal z_42 : std_logic;
  signal z_43 : std_logic;
  signal z_44 : std_logic;
  signal z_45 : std_logic;
  signal z_46 : std_logic;
  signal z_47 : std_logic;
  signal z_48 : std_logic;
  signal z_49 : std_logic;
  signal z_50 : std_logic;
  signal z_51 : std_logic;
  signal z_52 : std_logic;
  signal z_53 : std_logic;
  signal z_54 : std_logic;
  signal z_55 : std_logic;
  signal z_56 : std_logic;
  signal z_57 : std_logic;
  signal z_58 : std_logic;
  signal z_59 : std_logic;
  signal z_60 : std_logic;
  signal z_61 : std_logic;
  signal z_62 : std_logic;
  signal z_63 : std_logic;
  signal z_64 : std_logic;
  signal z_65 : std_logic;
  signal z_66 : std_logic;
  signal z_67 : std_logic;
  signal z_68 : std_logic;
  signal z_69 : std_logic;
  signal z_70 : std_logic;
  signal z_71 : std_logic;
  signal z_72 : std_logic;
  signal z_73 : std_logic;
  signal z_74 : std_logic;
  signal z_75 : std_logic;
  signal z_76 : std_logic;
  signal z_77 : std_logic;
  signal z_78 : std_logic;
  signal z_79 : std_logic;
  signal z_80 : std_logic;
begin
  xy_0 <= (io_x_0 and io_y_0);
  xy_1 <= (io_x_0 and io_y_1);
  xy_2 <= (io_x_0 and io_y_2);
  xy_3 <= (io_x_0 and io_y_3);
  xy_4 <= (io_x_0 and io_y_4);
  xy_5 <= (io_x_0 and io_y_5);
  xy_6 <= (io_x_0 and io_y_6);
  xy_7 <= (io_x_0 and io_y_7);
  xy_8 <= (io_x_0 and io_y_8);
  xy_9 <= (io_x_1 and io_y_0);
  xy_10 <= (io_x_1 and io_y_1);
  xy_11 <= (io_x_1 and io_y_2);
  xy_12 <= (io_x_1 and io_y_3);
  xy_13 <= (io_x_1 and io_y_4);
  xy_14 <= (io_x_1 and io_y_5);
  xy_15 <= (io_x_1 and io_y_6);
  xy_16 <= (io_x_1 and io_y_7);
  xy_17 <= (io_x_1 and io_y_8);
  xy_18 <= (io_x_2 and io_y_0);
  xy_19 <= (io_x_2 and io_y_1);
  xy_20 <= (io_x_2 and io_y_2);
  xy_21 <= (io_x_2 and io_y_3);
  xy_22 <= (io_x_2 and io_y_4);
  xy_23 <= (io_x_2 and io_y_5);
  xy_24 <= (io_x_2 and io_y_6);
  xy_25 <= (io_x_2 and io_y_7);
  xy_26 <= (io_x_2 and io_y_8);
  xy_27 <= (io_x_3 and io_y_0);
  xy_28 <= (io_x_3 and io_y_1);
  xy_29 <= (io_x_3 and io_y_2);
  xy_30 <= (io_x_3 and io_y_3);
  xy_31 <= (io_x_3 and io_y_4);
  xy_32 <= (io_x_3 and io_y_5);
  xy_33 <= (io_x_3 and io_y_6);
  xy_34 <= (io_x_3 and io_y_7);
  xy_35 <= (io_x_3 and io_y_8);
  xy_36 <= (io_x_4 and io_y_0);
  xy_37 <= (io_x_4 and io_y_1);
  xy_38 <= (io_x_4 and io_y_2);
  xy_39 <= (io_x_4 and io_y_3);
  xy_40 <= (io_x_4 and io_y_4);
  xy_41 <= (io_x_4 and io_y_5);
  xy_42 <= (io_x_4 and io_y_6);
  xy_43 <= (io_x_4 and io_y_7);
  xy_44 <= (io_x_4 and io_y_8);
  xy_45 <= (io_x_5 and io_y_0);
  xy_46 <= (io_x_5 and io_y_1);
  xy_47 <= (io_x_5 and io_y_2);
  xy_48 <= (io_x_5 and io_y_3);
  xy_49 <= (io_x_5 and io_y_4);
  xy_50 <= (io_x_5 and io_y_5);
  xy_51 <= (io_x_5 and io_y_6);
  xy_52 <= (io_x_5 and io_y_7);
  xy_53 <= (io_x_5 and io_y_8);
  xy_54 <= (io_x_6 and io_y_0);
  xy_55 <= (io_x_6 and io_y_1);
  xy_56 <= (io_x_6 and io_y_2);
  xy_57 <= (io_x_6 and io_y_3);
  xy_58 <= (io_x_6 and io_y_4);
  xy_59 <= (io_x_6 and io_y_5);
  xy_60 <= (io_x_6 and io_y_6);
  xy_61 <= (io_x_6 and io_y_7);
  xy_62 <= (io_x_6 and io_y_8);
  xy_63 <= (io_x_7 and io_y_0);
  xy_64 <= (io_x_7 and io_y_1);
  xy_65 <= (io_x_7 and io_y_2);
  xy_66 <= (io_x_7 and io_y_3);
  xy_67 <= (io_x_7 and io_y_4);
  xy_68 <= (io_x_7 and io_y_5);
  xy_69 <= (io_x_7 and io_y_6);
  xy_70 <= (io_x_7 and io_y_7);
  xy_71 <= (io_x_7 and io_y_8);
  xy_72 <= (io_x_8 and io_y_0);
  xy_73 <= (io_x_8 and io_y_1);
  xy_74 <= (io_x_8 and io_y_2);
  xy_75 <= (io_x_8 and io_y_3);
  xy_76 <= (io_x_8 and io_y_4);
  xy_77 <= (io_x_8 and io_y_5);
  xy_78 <= (io_x_8 and io_y_6);
  xy_79 <= (io_x_8 and io_y_7);
  xy_80 <= (io_x_8 and io_y_8);
  io_z_0 <= (((((((((pkg_toStdLogic(false) xor z_0) xor z_1) xor z_2) xor z_3) xor z_4) xor z_5) xor z_6) xor z_7) xor z_8);
  io_z_1 <= (((((((((pkg_toStdLogic(false) xor z_9) xor z_10) xor z_11) xor z_12) xor z_13) xor z_14) xor z_15) xor z_16) xor z_17);
  io_z_2 <= (((((((((pkg_toStdLogic(false) xor z_18) xor z_19) xor z_20) xor z_21) xor z_22) xor z_23) xor z_24) xor z_25) xor z_26);
  io_z_3 <= (((((((((pkg_toStdLogic(false) xor z_27) xor z_28) xor z_29) xor z_30) xor z_31) xor z_32) xor z_33) xor z_34) xor z_35);
  io_z_4 <= (((((((((pkg_toStdLogic(false) xor z_36) xor z_37) xor z_38) xor z_39) xor z_40) xor z_41) xor z_42) xor z_43) xor z_44);
  io_z_5 <= (((((((((pkg_toStdLogic(false) xor z_45) xor z_46) xor z_47) xor z_48) xor z_49) xor z_50) xor z_51) xor z_52) xor z_53);
  io_z_6 <= (((((((((pkg_toStdLogic(false) xor z_54) xor z_55) xor z_56) xor z_57) xor z_58) xor z_59) xor z_60) xor z_61) xor z_62);
  io_z_7 <= (((((((((pkg_toStdLogic(false) xor z_63) xor z_64) xor z_65) xor z_66) xor z_67) xor z_68) xor z_69) xor z_70) xor z_71);
  io_z_8 <= (((((((((pkg_toStdLogic(false) xor z_72) xor z_73) xor z_74) xor z_75) xor z_76) xor z_77) xor z_78) xor z_79) xor z_80);
  process(clk, reset)
  begin
    if reset = '1' then
      z_0 <= pkg_toStdLogic(false);
      z_1 <= pkg_toStdLogic(false);
      z_2 <= pkg_toStdLogic(false);
      z_3 <= pkg_toStdLogic(false);
      z_4 <= pkg_toStdLogic(false);
      z_5 <= pkg_toStdLogic(false);
      z_6 <= pkg_toStdLogic(false);
      z_7 <= pkg_toStdLogic(false);
      z_8 <= pkg_toStdLogic(false);
      z_9 <= pkg_toStdLogic(false);
      z_10 <= pkg_toStdLogic(false);
      z_11 <= pkg_toStdLogic(false);
      z_12 <= pkg_toStdLogic(false);
      z_13 <= pkg_toStdLogic(false);
      z_14 <= pkg_toStdLogic(false);
      z_15 <= pkg_toStdLogic(false);
      z_16 <= pkg_toStdLogic(false);
      z_17 <= pkg_toStdLogic(false);
      z_18 <= pkg_toStdLogic(false);
      z_19 <= pkg_toStdLogic(false);
      z_20 <= pkg_toStdLogic(false);
      z_21 <= pkg_toStdLogic(false);
      z_22 <= pkg_toStdLogic(false);
      z_23 <= pkg_toStdLogic(false);
      z_24 <= pkg_toStdLogic(false);
      z_25 <= pkg_toStdLogic(false);
      z_26 <= pkg_toStdLogic(false);
      z_27 <= pkg_toStdLogic(false);
      z_28 <= pkg_toStdLogic(false);
      z_29 <= pkg_toStdLogic(false);
      z_30 <= pkg_toStdLogic(false);
      z_31 <= pkg_toStdLogic(false);
      z_32 <= pkg_toStdLogic(false);
      z_33 <= pkg_toStdLogic(false);
      z_34 <= pkg_toStdLogic(false);
      z_35 <= pkg_toStdLogic(false);
      z_36 <= pkg_toStdLogic(false);
      z_37 <= pkg_toStdLogic(false);
      z_38 <= pkg_toStdLogic(false);
      z_39 <= pkg_toStdLogic(false);
      z_40 <= pkg_toStdLogic(false);
      z_41 <= pkg_toStdLogic(false);
      z_42 <= pkg_toStdLogic(false);
      z_43 <= pkg_toStdLogic(false);
      z_44 <= pkg_toStdLogic(false);
      z_45 <= pkg_toStdLogic(false);
      z_46 <= pkg_toStdLogic(false);
      z_47 <= pkg_toStdLogic(false);
      z_48 <= pkg_toStdLogic(false);
      z_49 <= pkg_toStdLogic(false);
      z_50 <= pkg_toStdLogic(false);
      z_51 <= pkg_toStdLogic(false);
      z_52 <= pkg_toStdLogic(false);
      z_53 <= pkg_toStdLogic(false);
      z_54 <= pkg_toStdLogic(false);
      z_55 <= pkg_toStdLogic(false);
      z_56 <= pkg_toStdLogic(false);
      z_57 <= pkg_toStdLogic(false);
      z_58 <= pkg_toStdLogic(false);
      z_59 <= pkg_toStdLogic(false);
      z_60 <= pkg_toStdLogic(false);
      z_61 <= pkg_toStdLogic(false);
      z_62 <= pkg_toStdLogic(false);
      z_63 <= pkg_toStdLogic(false);
      z_64 <= pkg_toStdLogic(false);
      z_65 <= pkg_toStdLogic(false);
      z_66 <= pkg_toStdLogic(false);
      z_67 <= pkg_toStdLogic(false);
      z_68 <= pkg_toStdLogic(false);
      z_69 <= pkg_toStdLogic(false);
      z_70 <= pkg_toStdLogic(false);
      z_71 <= pkg_toStdLogic(false);
      z_72 <= pkg_toStdLogic(false);
      z_73 <= pkg_toStdLogic(false);
      z_74 <= pkg_toStdLogic(false);
      z_75 <= pkg_toStdLogic(false);
      z_76 <= pkg_toStdLogic(false);
      z_77 <= pkg_toStdLogic(false);
      z_78 <= pkg_toStdLogic(false);
      z_79 <= pkg_toStdLogic(false);
      z_80 <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      z_0 <= xy_0;
      z_1 <= (xy_1 xor io_m_0);
      z_2 <= (xy_2 xor io_m_1);
      z_3 <= (xy_3 xor io_m_2);
      z_4 <= (xy_4 xor io_m_3);
      z_5 <= (xy_5 xor io_m_4);
      z_6 <= (xy_6 xor io_m_5);
      z_7 <= (xy_7 xor io_m_6);
      z_8 <= (xy_8 xor io_m_7);
      z_9 <= (xy_9 xor io_m_0);
      z_10 <= xy_10;
      z_11 <= (xy_11 xor io_m_8);
      z_12 <= (xy_12 xor io_m_9);
      z_13 <= (xy_13 xor io_m_10);
      z_14 <= (xy_14 xor io_m_11);
      z_15 <= (xy_15 xor io_m_12);
      z_16 <= (xy_16 xor io_m_13);
      z_17 <= (xy_17 xor io_m_14);
      z_18 <= (xy_18 xor io_m_1);
      z_19 <= (xy_19 xor io_m_8);
      z_20 <= xy_20;
      z_21 <= (xy_21 xor io_m_15);
      z_22 <= (xy_22 xor io_m_16);
      z_23 <= (xy_23 xor io_m_17);
      z_24 <= (xy_24 xor io_m_18);
      z_25 <= (xy_25 xor io_m_19);
      z_26 <= (xy_26 xor io_m_20);
      z_27 <= (xy_27 xor io_m_2);
      z_28 <= (xy_28 xor io_m_9);
      z_29 <= (xy_29 xor io_m_15);
      z_30 <= xy_30;
      z_31 <= (xy_31 xor io_m_21);
      z_32 <= (xy_32 xor io_m_22);
      z_33 <= (xy_33 xor io_m_23);
      z_34 <= (xy_34 xor io_m_24);
      z_35 <= (xy_35 xor io_m_25);
      z_36 <= (xy_36 xor io_m_3);
      z_37 <= (xy_37 xor io_m_10);
      z_38 <= (xy_38 xor io_m_16);
      z_39 <= (xy_39 xor io_m_21);
      z_40 <= xy_40;
      z_41 <= (xy_41 xor io_m_26);
      z_42 <= (xy_42 xor io_m_27);
      z_43 <= (xy_43 xor io_m_28);
      z_44 <= (xy_44 xor io_m_29);
      z_45 <= (xy_45 xor io_m_4);
      z_46 <= (xy_46 xor io_m_11);
      z_47 <= (xy_47 xor io_m_17);
      z_48 <= (xy_48 xor io_m_22);
      z_49 <= (xy_49 xor io_m_26);
      z_50 <= xy_50;
      z_51 <= (xy_51 xor io_m_30);
      z_52 <= (xy_52 xor io_m_31);
      z_53 <= (xy_53 xor io_m_32);
      z_54 <= (xy_54 xor io_m_5);
      z_55 <= (xy_55 xor io_m_12);
      z_56 <= (xy_56 xor io_m_18);
      z_57 <= (xy_57 xor io_m_23);
      z_58 <= (xy_58 xor io_m_27);
      z_59 <= (xy_59 xor io_m_30);
      z_60 <= xy_60;
      z_61 <= (xy_61 xor io_m_33);
      z_62 <= (xy_62 xor io_m_34);
      z_63 <= (xy_63 xor io_m_6);
      z_64 <= (xy_64 xor io_m_13);
      z_65 <= (xy_65 xor io_m_19);
      z_66 <= (xy_66 xor io_m_24);
      z_67 <= (xy_67 xor io_m_28);
      z_68 <= (xy_68 xor io_m_31);
      z_69 <= (xy_69 xor io_m_33);
      z_70 <= xy_70;
      z_71 <= (xy_71 xor io_m_35);
      z_72 <= (xy_72 xor io_m_7);
      z_73 <= (xy_73 xor io_m_14);
      z_74 <= (xy_74 xor io_m_20);
      z_75 <= (xy_75 xor io_m_25);
      z_76 <= (xy_76 xor io_m_29);
      z_77 <= (xy_77 xor io_m_32);
      z_78 <= (xy_78 xor io_m_34);
      z_79 <= (xy_79 xor io_m_35);
      z_80 <= xy_80;
    end if;
  end process;

end arch;

