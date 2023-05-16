-- Generator : SpinalHDL v1.6.1    git head : 8addf7fa9969a9cb92e967e4bc42178878175609
-- Component : AESEncryptMasked
-- Git hash  : 8addf7fa9969a9cb92e967e4bc42178878175609

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
  begin
    return that(bitId);
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
  begin
    return that(bitId);
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
  begin
    return that(bitId);
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


entity G4Mul is
  port(
    io_a : in std_logic_vector(1 downto 0);
    io_b : in std_logic_vector(1 downto 0);
    io_x : out std_logic_vector(1 downto 0)
  );
end G4Mul;

architecture arch of G4Mul is

  signal a : std_logic_vector(0 downto 0);
  signal b : std_logic_vector(0 downto 0);
  signal c : std_logic_vector(0 downto 0);
  signal d : std_logic_vector(0 downto 0);
  signal e : std_logic_vector(0 downto 0);
  signal p : std_logic_vector(0 downto 0);
  signal q : std_logic_vector(0 downto 0);
begin
  a <= pkg_toStdLogicVector(pkg_extract(io_a,1));
  b <= pkg_toStdLogicVector(pkg_extract(io_a,0));
  c <= pkg_toStdLogicVector(pkg_extract(io_b,1));
  d <= pkg_toStdLogicVector(pkg_extract(io_b,0));
  e <= ((a xor b) and (c xor d));
  p <= ((a and c) xor e);
  q <= ((b and d) xor e);
  io_x <= pkg_cat(p,q);
end arch;


--G4Mul_1 replaced by G4Mul


--G4Mul_2 replaced by G4Mul

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


--G4Mul_3 replaced by G4Mul


--G4Mul_4 replaced by G4Mul


--G4Mul_5 replaced by G4Mul


--G4ScaleN_1 replaced by G4ScaleN


--G4Mul_6 replaced by G4Mul


--G4Mul_7 replaced by G4Mul


--G4Mul_8 replaced by G4Mul


--G4ScaleN_2 replaced by G4ScaleN


--G4Mul_9 replaced by G4Mul


--G4Mul_10 replaced by G4Mul


--G4Mul_11 replaced by G4Mul


--G4ScaleN_3 replaced by G4ScaleN


--G4Mul_12 replaced by G4Mul


--G4Mul_13 replaced by G4Mul


--G4Mul_14 replaced by G4Mul


--G4ScaleN_4 replaced by G4ScaleN


--G4Mul_15 replaced by G4Mul


--G4Mul_16 replaced by G4Mul


--G4Mul_17 replaced by G4Mul


--G4ScaleN_5 replaced by G4ScaleN


--G4Mul_18 replaced by G4Mul


--G4Mul_19 replaced by G4Mul


--G4Mul_20 replaced by G4Mul


--G4ScaleN_6 replaced by G4ScaleN


--G4Mul_21 replaced by G4Mul


--G4Mul_22 replaced by G4Mul


--G4Mul_23 replaced by G4Mul


--G4ScaleN_7 replaced by G4ScaleN

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


--G4Sq_1 replaced by G4Sq

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G4ScaleN2 is
  port(
    io_t : in std_logic_vector(1 downto 0);
    io_x : out std_logic_vector(1 downto 0)
  );
end G4ScaleN2;

architecture arch of G4ScaleN2 is

begin
  io_x <= pkg_cat(pkg_toStdLogicVector((pkg_extract(io_t,1) xor pkg_extract(io_t,0))),pkg_toStdLogicVector(pkg_extract(io_t,1)));
end arch;


--G4Sq_2 replaced by G4Sq


--G4Sq_3 replaced by G4Sq


--G4ScaleN2_1 replaced by G4ScaleN2


--G4Mul_24 replaced by G4Mul


--G4Mul_25 replaced by G4Mul


--G4Mul_26 replaced by G4Mul


--G4Mul_27 replaced by G4Mul


--G4Mul_28 replaced by G4Mul


--G4Mul_29 replaced by G4Mul


--G4Mul_30 replaced by G4Mul


--G4Mul_31 replaced by G4Mul


--G4Sq_4 replaced by G4Sq


--G4ScaleN_8 replaced by G4ScaleN


--G4Sq_5 replaced by G4Sq


--G4ScaleN2_2 replaced by G4ScaleN2


--G4Mul_32 replaced by G4Mul


--G4Mul_33 replaced by G4Mul


--G4Mul_34 replaced by G4Mul


--G4ScaleN_9 replaced by G4ScaleN


--G4Mul_35 replaced by G4Mul


--G4Mul_36 replaced by G4Mul


--G4Mul_37 replaced by G4Mul


--G4ScaleN_10 replaced by G4ScaleN


--G4Mul_38 replaced by G4Mul


--G4Mul_39 replaced by G4Mul


--G4Mul_40 replaced by G4Mul


--G4ScaleN_11 replaced by G4ScaleN


--G4Mul_41 replaced by G4Mul


--G4Mul_42 replaced by G4Mul


--G4Mul_43 replaced by G4Mul


--G4ScaleN_12 replaced by G4ScaleN


--G4Mul_44 replaced by G4Mul


--G4Mul_45 replaced by G4Mul


--G4Mul_46 replaced by G4Mul


--G4ScaleN_13 replaced by G4ScaleN


--G4Mul_47 replaced by G4Mul


--G4Mul_48 replaced by G4Mul


--G4Mul_49 replaced by G4Mul


--G4ScaleN_14 replaced by G4ScaleN


--G4Mul_50 replaced by G4Mul


--G4Mul_51 replaced by G4Mul


--G4Mul_52 replaced by G4Mul


--G4ScaleN_15 replaced by G4ScaleN


--G4Mul_53 replaced by G4Mul


--G4Mul_54 replaced by G4Mul


--G4Mul_55 replaced by G4Mul


--G4ScaleN_16 replaced by G4ScaleN


--G4Sq_6 replaced by G4Sq


--G4Sq_7 replaced by G4Sq


--G4ScaleN2_3 replaced by G4ScaleN2


--G4Sq_8 replaced by G4Sq


--G4Sq_9 replaced by G4Sq


--G4ScaleN2_4 replaced by G4ScaleN2


--G4Mul_56 replaced by G4Mul


--G4Mul_57 replaced by G4Mul


--G4Mul_58 replaced by G4Mul


--G4Mul_59 replaced by G4Mul


--G4Mul_60 replaced by G4Mul


--G4Mul_61 replaced by G4Mul


--G4Mul_62 replaced by G4Mul


--G4Mul_63 replaced by G4Mul


--G4Sq_10 replaced by G4Sq


--G4ScaleN_17 replaced by G4ScaleN


--G4Sq_11 replaced by G4Sq


--G4ScaleN2_5 replaced by G4ScaleN2


--G4Mul_64 replaced by G4Mul


--G4Mul_65 replaced by G4Mul


--G4Mul_66 replaced by G4Mul


--G4ScaleN_18 replaced by G4ScaleN


--G4Mul_67 replaced by G4Mul


--G4Mul_68 replaced by G4Mul


--G4Mul_69 replaced by G4Mul


--G4ScaleN_19 replaced by G4ScaleN


--G4Mul_70 replaced by G4Mul


--G4Mul_71 replaced by G4Mul


--G4Mul_72 replaced by G4Mul


--G4ScaleN_20 replaced by G4ScaleN


--G4Mul_73 replaced by G4Mul


--G4Mul_74 replaced by G4Mul


--G4Mul_75 replaced by G4Mul


--G4ScaleN_21 replaced by G4ScaleN


--G4Mul_76 replaced by G4Mul


--G4Mul_77 replaced by G4Mul


--G4Mul_78 replaced by G4Mul


--G4ScaleN_22 replaced by G4ScaleN


--G4Mul_79 replaced by G4Mul


--G4Mul_80 replaced by G4Mul


--G4Mul_81 replaced by G4Mul


--G4ScaleN_23 replaced by G4ScaleN


--G4Mul_82 replaced by G4Mul


--G4Mul_83 replaced by G4Mul


--G4Mul_84 replaced by G4Mul


--G4ScaleN_24 replaced by G4ScaleN


--G4Mul_85 replaced by G4Mul


--G4Mul_86 replaced by G4Mul


--G4Mul_87 replaced by G4Mul


--G4ScaleN_25 replaced by G4ScaleN


--G4Sq_12 replaced by G4Sq


--G4Sq_13 replaced by G4Sq


--G4ScaleN2_6 replaced by G4ScaleN2


--G4Sq_14 replaced by G4Sq


--G4Sq_15 replaced by G4Sq


--G4ScaleN2_7 replaced by G4ScaleN2


--G4Mul_88 replaced by G4Mul


--G4Mul_89 replaced by G4Mul


--G4Mul_90 replaced by G4Mul


--G4Mul_91 replaced by G4Mul


--G4Mul_92 replaced by G4Mul


--G4Mul_93 replaced by G4Mul


--G4Mul_94 replaced by G4Mul


--G4Mul_95 replaced by G4Mul


--G4Sq_16 replaced by G4Sq


--G4ScaleN_26 replaced by G4ScaleN


--G4Sq_17 replaced by G4Sq


--G4ScaleN2_8 replaced by G4ScaleN2


--G4Mul_96 replaced by G4Mul


--G4Mul_97 replaced by G4Mul


--G4Mul_98 replaced by G4Mul


--G4ScaleN_27 replaced by G4ScaleN


--G4Mul_99 replaced by G4Mul


--G4Mul_100 replaced by G4Mul


--G4Mul_101 replaced by G4Mul


--G4ScaleN_28 replaced by G4ScaleN


--G4Mul_102 replaced by G4Mul


--G4Mul_103 replaced by G4Mul


--G4Mul_104 replaced by G4Mul


--G4ScaleN_29 replaced by G4ScaleN


--G4Mul_105 replaced by G4Mul


--G4Mul_106 replaced by G4Mul


--G4Mul_107 replaced by G4Mul


--G4ScaleN_30 replaced by G4ScaleN


--G4Mul_108 replaced by G4Mul


--G4Mul_109 replaced by G4Mul


--G4Mul_110 replaced by G4Mul


--G4ScaleN_31 replaced by G4ScaleN


--G4Mul_111 replaced by G4Mul


--G4Mul_112 replaced by G4Mul


--G4Mul_113 replaced by G4Mul


--G4ScaleN_32 replaced by G4ScaleN


--G4Mul_114 replaced by G4Mul


--G4Mul_115 replaced by G4Mul


--G4Mul_116 replaced by G4Mul


--G4ScaleN_33 replaced by G4ScaleN


--G4Mul_117 replaced by G4Mul


--G4Mul_118 replaced by G4Mul


--G4Mul_119 replaced by G4Mul


--G4ScaleN_34 replaced by G4ScaleN


--G4Sq_18 replaced by G4Sq


--G4Sq_19 replaced by G4Sq


--G4ScaleN2_9 replaced by G4ScaleN2


--G4Sq_20 replaced by G4Sq


--G4Sq_21 replaced by G4Sq


--G4ScaleN2_10 replaced by G4ScaleN2


--G4Mul_120 replaced by G4Mul


--G4Mul_121 replaced by G4Mul


--G4Mul_122 replaced by G4Mul


--G4Mul_123 replaced by G4Mul


--G4Mul_124 replaced by G4Mul


--G4Mul_125 replaced by G4Mul


--G4Mul_126 replaced by G4Mul


--G4Mul_127 replaced by G4Mul


--G4Sq_22 replaced by G4Sq


--G4ScaleN_35 replaced by G4ScaleN


--G4Sq_23 replaced by G4Sq


--G4ScaleN2_11 replaced by G4ScaleN2


--G4Mul_128 replaced by G4Mul


--G4Mul_129 replaced by G4Mul


--G4Mul_130 replaced by G4Mul


--G4ScaleN_36 replaced by G4ScaleN


--G4Mul_131 replaced by G4Mul


--G4Mul_132 replaced by G4Mul


--G4Mul_133 replaced by G4Mul


--G4ScaleN_37 replaced by G4ScaleN


--G4Mul_134 replaced by G4Mul


--G4Mul_135 replaced by G4Mul


--G4Mul_136 replaced by G4Mul


--G4ScaleN_38 replaced by G4ScaleN


--G4Mul_137 replaced by G4Mul


--G4Mul_138 replaced by G4Mul


--G4Mul_139 replaced by G4Mul


--G4ScaleN_39 replaced by G4ScaleN


--G4Mul_140 replaced by G4Mul


--G4Mul_141 replaced by G4Mul


--G4Mul_142 replaced by G4Mul


--G4ScaleN_40 replaced by G4ScaleN


--G4Mul_143 replaced by G4Mul


--G4Mul_144 replaced by G4Mul


--G4Mul_145 replaced by G4Mul


--G4ScaleN_41 replaced by G4ScaleN


--G4Mul_146 replaced by G4Mul


--G4Mul_147 replaced by G4Mul


--G4Mul_148 replaced by G4Mul


--G4ScaleN_42 replaced by G4ScaleN


--G4Mul_149 replaced by G4Mul


--G4Mul_150 replaced by G4Mul


--G4Mul_151 replaced by G4Mul


--G4ScaleN_43 replaced by G4ScaleN


--G4Sq_24 replaced by G4Sq


--G4Sq_25 replaced by G4Sq


--G4ScaleN2_12 replaced by G4ScaleN2


--G4Sq_26 replaced by G4Sq


--G4Sq_27 replaced by G4Sq


--G4ScaleN2_13 replaced by G4ScaleN2


--G4Mul_152 replaced by G4Mul


--G4Mul_153 replaced by G4Mul


--G4Mul_154 replaced by G4Mul


--G4Mul_155 replaced by G4Mul


--G4Mul_156 replaced by G4Mul


--G4Mul_157 replaced by G4Mul


--G4Mul_158 replaced by G4Mul


--G4Mul_159 replaced by G4Mul


--G4Sq_28 replaced by G4Sq


--G4ScaleN_44 replaced by G4ScaleN


--G4Sq_29 replaced by G4Sq


--G4ScaleN2_14 replaced by G4ScaleN2


--G4Mul_160 replaced by G4Mul


--G4Mul_161 replaced by G4Mul


--G4Mul_162 replaced by G4Mul


--G4ScaleN_45 replaced by G4ScaleN


--G4Mul_163 replaced by G4Mul


--G4Mul_164 replaced by G4Mul


--G4Mul_165 replaced by G4Mul


--G4ScaleN_46 replaced by G4ScaleN


--G4Mul_166 replaced by G4Mul


--G4Mul_167 replaced by G4Mul


--G4Mul_168 replaced by G4Mul


--G4ScaleN_47 replaced by G4ScaleN


--G4Mul_169 replaced by G4Mul


--G4Mul_170 replaced by G4Mul


--G4Mul_171 replaced by G4Mul


--G4ScaleN_48 replaced by G4ScaleN


--G4Mul_172 replaced by G4Mul


--G4Mul_173 replaced by G4Mul


--G4Mul_174 replaced by G4Mul


--G4ScaleN_49 replaced by G4ScaleN


--G4Mul_175 replaced by G4Mul


--G4Mul_176 replaced by G4Mul


--G4Mul_177 replaced by G4Mul


--G4ScaleN_50 replaced by G4ScaleN


--G4Mul_178 replaced by G4Mul


--G4Mul_179 replaced by G4Mul


--G4Mul_180 replaced by G4Mul


--G4ScaleN_51 replaced by G4ScaleN


--G4Mul_181 replaced by G4Mul


--G4Mul_182 replaced by G4Mul


--G4Mul_183 replaced by G4Mul


--G4ScaleN_52 replaced by G4ScaleN


--G4Sq_30 replaced by G4Sq


--G4Sq_31 replaced by G4Sq


--G4ScaleN2_15 replaced by G4ScaleN2


--G4Sq_32 replaced by G4Sq


--G4Sq_33 replaced by G4Sq


--G4ScaleN2_16 replaced by G4ScaleN2


--G4Mul_184 replaced by G4Mul


--G4Mul_185 replaced by G4Mul


--G4Mul_186 replaced by G4Mul


--G4Mul_187 replaced by G4Mul


--G4Mul_188 replaced by G4Mul


--G4Mul_189 replaced by G4Mul


--G4Mul_190 replaced by G4Mul


--G4Mul_191 replaced by G4Mul


--G4Sq_34 replaced by G4Sq


--G4ScaleN_53 replaced by G4ScaleN


--G4Sq_35 replaced by G4Sq


--G4ScaleN2_17 replaced by G4ScaleN2


--G4Mul_192 replaced by G4Mul


--G4Mul_193 replaced by G4Mul


--G4Mul_194 replaced by G4Mul


--G4ScaleN_54 replaced by G4ScaleN


--G4Mul_195 replaced by G4Mul


--G4Mul_196 replaced by G4Mul


--G4Mul_197 replaced by G4Mul


--G4ScaleN_55 replaced by G4ScaleN


--G4Mul_198 replaced by G4Mul


--G4Mul_199 replaced by G4Mul


--G4Mul_200 replaced by G4Mul


--G4ScaleN_56 replaced by G4ScaleN


--G4Mul_201 replaced by G4Mul


--G4Mul_202 replaced by G4Mul


--G4Mul_203 replaced by G4Mul


--G4ScaleN_57 replaced by G4ScaleN


--G4Mul_204 replaced by G4Mul


--G4Mul_205 replaced by G4Mul


--G4Mul_206 replaced by G4Mul


--G4ScaleN_58 replaced by G4ScaleN


--G4Mul_207 replaced by G4Mul


--G4Mul_208 replaced by G4Mul


--G4Mul_209 replaced by G4Mul


--G4ScaleN_59 replaced by G4ScaleN


--G4Mul_210 replaced by G4Mul


--G4Mul_211 replaced by G4Mul


--G4Mul_212 replaced by G4Mul


--G4ScaleN_60 replaced by G4ScaleN


--G4Mul_213 replaced by G4Mul


--G4Mul_214 replaced by G4Mul


--G4Mul_215 replaced by G4Mul


--G4ScaleN_61 replaced by G4ScaleN


--G4Sq_36 replaced by G4Sq


--G4Sq_37 replaced by G4Sq


--G4ScaleN2_18 replaced by G4ScaleN2


--G4Sq_38 replaced by G4Sq


--G4Sq_39 replaced by G4Sq


--G4ScaleN2_19 replaced by G4ScaleN2


--G4Mul_216 replaced by G4Mul


--G4Mul_217 replaced by G4Mul


--G4Mul_218 replaced by G4Mul


--G4Mul_219 replaced by G4Mul


--G4Mul_220 replaced by G4Mul


--G4Mul_221 replaced by G4Mul


--G4Mul_222 replaced by G4Mul


--G4Mul_223 replaced by G4Mul


--G4Sq_40 replaced by G4Sq


--G4ScaleN_62 replaced by G4ScaleN


--G4Sq_41 replaced by G4Sq


--G4ScaleN2_20 replaced by G4ScaleN2


--G4Mul_224 replaced by G4Mul


--G4Mul_225 replaced by G4Mul


--G4Mul_226 replaced by G4Mul


--G4ScaleN_63 replaced by G4ScaleN


--G4Mul_227 replaced by G4Mul


--G4Mul_228 replaced by G4Mul


--G4Mul_229 replaced by G4Mul


--G4ScaleN_64 replaced by G4ScaleN


--G4Mul_230 replaced by G4Mul


--G4Mul_231 replaced by G4Mul


--G4Mul_232 replaced by G4Mul


--G4ScaleN_65 replaced by G4ScaleN


--G4Mul_233 replaced by G4Mul


--G4Mul_234 replaced by G4Mul


--G4Mul_235 replaced by G4Mul


--G4ScaleN_66 replaced by G4ScaleN


--G4Mul_236 replaced by G4Mul


--G4Mul_237 replaced by G4Mul


--G4Mul_238 replaced by G4Mul


--G4ScaleN_67 replaced by G4ScaleN


--G4Mul_239 replaced by G4Mul


--G4Mul_240 replaced by G4Mul


--G4Mul_241 replaced by G4Mul


--G4ScaleN_68 replaced by G4ScaleN


--G4Mul_242 replaced by G4Mul


--G4Mul_243 replaced by G4Mul


--G4Mul_244 replaced by G4Mul


--G4ScaleN_69 replaced by G4ScaleN


--G4Mul_245 replaced by G4Mul


--G4Mul_246 replaced by G4Mul


--G4Mul_247 replaced by G4Mul


--G4ScaleN_70 replaced by G4ScaleN


--G4Sq_42 replaced by G4Sq


--G4Sq_43 replaced by G4Sq


--G4ScaleN2_21 replaced by G4ScaleN2


--G4Sq_44 replaced by G4Sq


--G4Sq_45 replaced by G4Sq


--G4ScaleN2_22 replaced by G4ScaleN2


--G4Mul_248 replaced by G4Mul


--G4Mul_249 replaced by G4Mul


--G4Mul_250 replaced by G4Mul


--G4Mul_251 replaced by G4Mul


--G4Mul_252 replaced by G4Mul


--G4Mul_253 replaced by G4Mul


--G4Mul_254 replaced by G4Mul


--G4Mul_255 replaced by G4Mul


--G4Sq_46 replaced by G4Sq


--G4ScaleN_71 replaced by G4ScaleN


--G4Sq_47 replaced by G4Sq


--G4ScaleN2_23 replaced by G4ScaleN2


--G4Mul_256 replaced by G4Mul


--G4Mul_257 replaced by G4Mul


--G4Mul_258 replaced by G4Mul


--G4ScaleN_72 replaced by G4ScaleN


--G4Mul_259 replaced by G4Mul


--G4Mul_260 replaced by G4Mul


--G4Mul_261 replaced by G4Mul


--G4ScaleN_73 replaced by G4ScaleN


--G4Mul_262 replaced by G4Mul


--G4Mul_263 replaced by G4Mul


--G4Mul_264 replaced by G4Mul


--G4ScaleN_74 replaced by G4ScaleN


--G4Mul_265 replaced by G4Mul


--G4Mul_266 replaced by G4Mul


--G4Mul_267 replaced by G4Mul


--G4ScaleN_75 replaced by G4ScaleN


--G4Mul_268 replaced by G4Mul


--G4Mul_269 replaced by G4Mul


--G4Mul_270 replaced by G4Mul


--G4ScaleN_76 replaced by G4ScaleN


--G4Mul_271 replaced by G4Mul


--G4Mul_272 replaced by G4Mul


--G4Mul_273 replaced by G4Mul


--G4ScaleN_77 replaced by G4ScaleN


--G4Mul_274 replaced by G4Mul


--G4Mul_275 replaced by G4Mul


--G4Mul_276 replaced by G4Mul


--G4ScaleN_78 replaced by G4ScaleN


--G4Mul_277 replaced by G4Mul


--G4Mul_278 replaced by G4Mul


--G4Mul_279 replaced by G4Mul


--G4ScaleN_79 replaced by G4ScaleN


--G4Sq_48 replaced by G4Sq


--G4Sq_49 replaced by G4Sq


--G4ScaleN2_24 replaced by G4ScaleN2


--G4Sq_50 replaced by G4Sq


--G4Sq_51 replaced by G4Sq


--G4ScaleN2_25 replaced by G4ScaleN2


--G4Mul_280 replaced by G4Mul


--G4Mul_281 replaced by G4Mul


--G4Mul_282 replaced by G4Mul


--G4Mul_283 replaced by G4Mul


--G4Mul_284 replaced by G4Mul


--G4Mul_285 replaced by G4Mul


--G4Mul_286 replaced by G4Mul


--G4Mul_287 replaced by G4Mul


--G4Sq_52 replaced by G4Sq


--G4ScaleN_80 replaced by G4ScaleN


--G4Sq_53 replaced by G4Sq


--G4ScaleN2_26 replaced by G4ScaleN2


--G4Mul_288 replaced by G4Mul


--G4Mul_289 replaced by G4Mul


--G4Mul_290 replaced by G4Mul


--G4ScaleN_81 replaced by G4ScaleN


--G4Mul_291 replaced by G4Mul


--G4Mul_292 replaced by G4Mul


--G4Mul_293 replaced by G4Mul


--G4ScaleN_82 replaced by G4ScaleN


--G4Mul_294 replaced by G4Mul


--G4Mul_295 replaced by G4Mul


--G4Mul_296 replaced by G4Mul


--G4ScaleN_83 replaced by G4ScaleN


--G4Mul_297 replaced by G4Mul


--G4Mul_298 replaced by G4Mul


--G4Mul_299 replaced by G4Mul


--G4ScaleN_84 replaced by G4ScaleN


--G4Mul_300 replaced by G4Mul


--G4Mul_301 replaced by G4Mul


--G4Mul_302 replaced by G4Mul


--G4ScaleN_85 replaced by G4ScaleN


--G4Mul_303 replaced by G4Mul


--G4Mul_304 replaced by G4Mul


--G4Mul_305 replaced by G4Mul


--G4ScaleN_86 replaced by G4ScaleN


--G4Mul_306 replaced by G4Mul


--G4Mul_307 replaced by G4Mul


--G4Mul_308 replaced by G4Mul


--G4ScaleN_87 replaced by G4ScaleN


--G4Mul_309 replaced by G4Mul


--G4Mul_310 replaced by G4Mul


--G4Mul_311 replaced by G4Mul


--G4ScaleN_88 replaced by G4ScaleN


--G4Sq_54 replaced by G4Sq


--G4Sq_55 replaced by G4Sq


--G4ScaleN2_27 replaced by G4ScaleN2


--G4Sq_56 replaced by G4Sq


--G4Sq_57 replaced by G4Sq


--G4ScaleN2_28 replaced by G4ScaleN2


--G4Mul_312 replaced by G4Mul


--G4Mul_313 replaced by G4Mul


--G4Mul_314 replaced by G4Mul


--G4Mul_315 replaced by G4Mul


--G4Mul_316 replaced by G4Mul


--G4Mul_317 replaced by G4Mul


--G4Mul_318 replaced by G4Mul


--G4Mul_319 replaced by G4Mul


--G4Sq_58 replaced by G4Sq


--G4ScaleN_89 replaced by G4ScaleN


--G4Sq_59 replaced by G4Sq


--G4ScaleN2_29 replaced by G4ScaleN2


--G4Mul_320 replaced by G4Mul


--G4Mul_321 replaced by G4Mul


--G4Mul_322 replaced by G4Mul


--G4ScaleN_90 replaced by G4ScaleN


--G4Mul_323 replaced by G4Mul


--G4Mul_324 replaced by G4Mul


--G4Mul_325 replaced by G4Mul


--G4ScaleN_91 replaced by G4ScaleN


--G4Mul_326 replaced by G4Mul


--G4Mul_327 replaced by G4Mul


--G4Mul_328 replaced by G4Mul


--G4ScaleN_92 replaced by G4ScaleN


--G4Mul_329 replaced by G4Mul


--G4Mul_330 replaced by G4Mul


--G4Mul_331 replaced by G4Mul


--G4ScaleN_93 replaced by G4ScaleN


--G4Mul_332 replaced by G4Mul


--G4Mul_333 replaced by G4Mul


--G4Mul_334 replaced by G4Mul


--G4ScaleN_94 replaced by G4ScaleN


--G4Mul_335 replaced by G4Mul


--G4Mul_336 replaced by G4Mul


--G4Mul_337 replaced by G4Mul


--G4ScaleN_95 replaced by G4ScaleN


--G4Mul_338 replaced by G4Mul


--G4Mul_339 replaced by G4Mul


--G4Mul_340 replaced by G4Mul


--G4ScaleN_96 replaced by G4ScaleN


--G4Mul_341 replaced by G4Mul


--G4Mul_342 replaced by G4Mul


--G4Mul_343 replaced by G4Mul


--G4ScaleN_97 replaced by G4ScaleN


--G4Sq_60 replaced by G4Sq


--G4Sq_61 replaced by G4Sq


--G4ScaleN2_30 replaced by G4ScaleN2


--G4Sq_62 replaced by G4Sq


--G4Sq_63 replaced by G4Sq


--G4ScaleN2_31 replaced by G4ScaleN2


--G4Mul_344 replaced by G4Mul


--G4Mul_345 replaced by G4Mul


--G4Mul_346 replaced by G4Mul


--G4Mul_347 replaced by G4Mul


--G4Mul_348 replaced by G4Mul


--G4Mul_349 replaced by G4Mul


--G4Mul_350 replaced by G4Mul


--G4Mul_351 replaced by G4Mul


--G4Sq_64 replaced by G4Sq


--G4ScaleN_98 replaced by G4ScaleN


--G4Sq_65 replaced by G4Sq


--G4ScaleN2_32 replaced by G4ScaleN2


--G4Mul_352 replaced by G4Mul


--G4Mul_353 replaced by G4Mul


--G4Mul_354 replaced by G4Mul


--G4ScaleN_99 replaced by G4ScaleN


--G4Mul_355 replaced by G4Mul


--G4Mul_356 replaced by G4Mul


--G4Mul_357 replaced by G4Mul


--G4ScaleN_100 replaced by G4ScaleN


--G4Mul_358 replaced by G4Mul


--G4Mul_359 replaced by G4Mul


--G4Mul_360 replaced by G4Mul


--G4ScaleN_101 replaced by G4ScaleN


--G4Mul_361 replaced by G4Mul


--G4Mul_362 replaced by G4Mul


--G4Mul_363 replaced by G4Mul


--G4ScaleN_102 replaced by G4ScaleN


--G4Mul_364 replaced by G4Mul


--G4Mul_365 replaced by G4Mul


--G4Mul_366 replaced by G4Mul


--G4ScaleN_103 replaced by G4ScaleN


--G4Mul_367 replaced by G4Mul


--G4Mul_368 replaced by G4Mul


--G4Mul_369 replaced by G4Mul


--G4ScaleN_104 replaced by G4ScaleN


--G4Mul_370 replaced by G4Mul


--G4Mul_371 replaced by G4Mul


--G4Mul_372 replaced by G4Mul


--G4ScaleN_105 replaced by G4ScaleN


--G4Mul_373 replaced by G4Mul


--G4Mul_374 replaced by G4Mul


--G4Mul_375 replaced by G4Mul


--G4ScaleN_106 replaced by G4ScaleN


--G4Sq_66 replaced by G4Sq


--G4Sq_67 replaced by G4Sq


--G4ScaleN2_33 replaced by G4ScaleN2


--G4Sq_68 replaced by G4Sq


--G4Sq_69 replaced by G4Sq


--G4ScaleN2_34 replaced by G4ScaleN2


--G4Mul_376 replaced by G4Mul


--G4Mul_377 replaced by G4Mul


--G4Mul_378 replaced by G4Mul


--G4Mul_379 replaced by G4Mul


--G4Mul_380 replaced by G4Mul


--G4Mul_381 replaced by G4Mul


--G4Mul_382 replaced by G4Mul


--G4Mul_383 replaced by G4Mul


--G4Sq_70 replaced by G4Sq


--G4ScaleN_107 replaced by G4ScaleN


--G4Sq_71 replaced by G4Sq


--G4ScaleN2_35 replaced by G4ScaleN2


--G4Mul_384 replaced by G4Mul


--G4Mul_385 replaced by G4Mul


--G4Mul_386 replaced by G4Mul


--G4ScaleN_108 replaced by G4ScaleN


--G4Mul_387 replaced by G4Mul


--G4Mul_388 replaced by G4Mul


--G4Mul_389 replaced by G4Mul


--G4ScaleN_109 replaced by G4ScaleN


--G4Mul_390 replaced by G4Mul


--G4Mul_391 replaced by G4Mul


--G4Mul_392 replaced by G4Mul


--G4ScaleN_110 replaced by G4ScaleN


--G4Mul_393 replaced by G4Mul


--G4Mul_394 replaced by G4Mul


--G4Mul_395 replaced by G4Mul


--G4ScaleN_111 replaced by G4ScaleN


--G4Mul_396 replaced by G4Mul


--G4Mul_397 replaced by G4Mul


--G4Mul_398 replaced by G4Mul


--G4ScaleN_112 replaced by G4ScaleN


--G4Mul_399 replaced by G4Mul


--G4Mul_400 replaced by G4Mul


--G4Mul_401 replaced by G4Mul


--G4ScaleN_113 replaced by G4ScaleN


--G4Mul_402 replaced by G4Mul


--G4Mul_403 replaced by G4Mul


--G4Mul_404 replaced by G4Mul


--G4ScaleN_114 replaced by G4ScaleN


--G4Mul_405 replaced by G4Mul


--G4Mul_406 replaced by G4Mul


--G4Mul_407 replaced by G4Mul


--G4ScaleN_115 replaced by G4ScaleN


--G4Sq_72 replaced by G4Sq


--G4Sq_73 replaced by G4Sq


--G4ScaleN2_36 replaced by G4ScaleN2


--G4Sq_74 replaced by G4Sq


--G4Sq_75 replaced by G4Sq


--G4ScaleN2_37 replaced by G4ScaleN2


--G4Mul_408 replaced by G4Mul


--G4Mul_409 replaced by G4Mul


--G4Mul_410 replaced by G4Mul


--G4Mul_411 replaced by G4Mul


--G4Mul_412 replaced by G4Mul


--G4Mul_413 replaced by G4Mul


--G4Mul_414 replaced by G4Mul


--G4Mul_415 replaced by G4Mul


--G4Sq_76 replaced by G4Sq


--G4ScaleN_116 replaced by G4ScaleN


--G4Sq_77 replaced by G4Sq


--G4ScaleN2_38 replaced by G4ScaleN2


--G4Mul_416 replaced by G4Mul


--G4Mul_417 replaced by G4Mul


--G4Mul_418 replaced by G4Mul


--G4ScaleN_117 replaced by G4ScaleN


--G4Mul_419 replaced by G4Mul


--G4Mul_420 replaced by G4Mul


--G4Mul_421 replaced by G4Mul


--G4ScaleN_118 replaced by G4ScaleN


--G4Mul_422 replaced by G4Mul


--G4Mul_423 replaced by G4Mul


--G4Mul_424 replaced by G4Mul


--G4ScaleN_119 replaced by G4ScaleN


--G4Mul_425 replaced by G4Mul


--G4Mul_426 replaced by G4Mul


--G4Mul_427 replaced by G4Mul


--G4ScaleN_120 replaced by G4ScaleN


--G4Mul_428 replaced by G4Mul


--G4Mul_429 replaced by G4Mul


--G4Mul_430 replaced by G4Mul


--G4ScaleN_121 replaced by G4ScaleN


--G4Mul_431 replaced by G4Mul


--G4Mul_432 replaced by G4Mul


--G4Mul_433 replaced by G4Mul


--G4ScaleN_122 replaced by G4ScaleN


--G4Mul_434 replaced by G4Mul


--G4Mul_435 replaced by G4Mul


--G4Mul_436 replaced by G4Mul


--G4ScaleN_123 replaced by G4ScaleN


--G4Mul_437 replaced by G4Mul


--G4Mul_438 replaced by G4Mul


--G4Mul_439 replaced by G4Mul


--G4ScaleN_124 replaced by G4ScaleN


--G4Sq_78 replaced by G4Sq


--G4Sq_79 replaced by G4Sq


--G4ScaleN2_39 replaced by G4ScaleN2


--G4Sq_80 replaced by G4Sq


--G4Sq_81 replaced by G4Sq


--G4ScaleN2_40 replaced by G4ScaleN2


--G4Mul_440 replaced by G4Mul


--G4Mul_441 replaced by G4Mul


--G4Mul_442 replaced by G4Mul


--G4Mul_443 replaced by G4Mul


--G4Mul_444 replaced by G4Mul


--G4Mul_445 replaced by G4Mul


--G4Mul_446 replaced by G4Mul


--G4Mul_447 replaced by G4Mul


--G4Sq_82 replaced by G4Sq


--G4ScaleN_125 replaced by G4ScaleN


--G4Sq_83 replaced by G4Sq


--G4ScaleN2_41 replaced by G4ScaleN2


--G4Mul_448 replaced by G4Mul


--G4Mul_449 replaced by G4Mul


--G4Mul_450 replaced by G4Mul


--G4ScaleN_126 replaced by G4ScaleN


--G4Mul_451 replaced by G4Mul


--G4Mul_452 replaced by G4Mul


--G4Mul_453 replaced by G4Mul


--G4ScaleN_127 replaced by G4ScaleN


--G4Mul_454 replaced by G4Mul


--G4Mul_455 replaced by G4Mul


--G4Mul_456 replaced by G4Mul


--G4ScaleN_128 replaced by G4ScaleN


--G4Mul_457 replaced by G4Mul


--G4Mul_458 replaced by G4Mul


--G4Mul_459 replaced by G4Mul


--G4ScaleN_129 replaced by G4ScaleN


--G4Mul_460 replaced by G4Mul


--G4Mul_461 replaced by G4Mul


--G4Mul_462 replaced by G4Mul


--G4ScaleN_130 replaced by G4ScaleN


--G4Mul_463 replaced by G4Mul


--G4Mul_464 replaced by G4Mul


--G4Mul_465 replaced by G4Mul


--G4ScaleN_131 replaced by G4ScaleN


--G4Mul_466 replaced by G4Mul


--G4Mul_467 replaced by G4Mul


--G4Mul_468 replaced by G4Mul


--G4ScaleN_132 replaced by G4ScaleN


--G4Mul_469 replaced by G4Mul


--G4Mul_470 replaced by G4Mul


--G4Mul_471 replaced by G4Mul


--G4ScaleN_133 replaced by G4ScaleN


--G4Sq_84 replaced by G4Sq


--G4Sq_85 replaced by G4Sq


--G4ScaleN2_42 replaced by G4ScaleN2


--G4Sq_86 replaced by G4Sq


--G4Sq_87 replaced by G4Sq


--G4ScaleN2_43 replaced by G4ScaleN2


--G4Mul_472 replaced by G4Mul


--G4Mul_473 replaced by G4Mul


--G4Mul_474 replaced by G4Mul


--G4Mul_475 replaced by G4Mul


--G4Mul_476 replaced by G4Mul


--G4Mul_477 replaced by G4Mul


--G4Mul_478 replaced by G4Mul


--G4Mul_479 replaced by G4Mul


--G4Sq_88 replaced by G4Sq


--G4ScaleN_134 replaced by G4ScaleN


--G4Sq_89 replaced by G4Sq


--G4ScaleN2_44 replaced by G4ScaleN2


--G4Mul_480 replaced by G4Mul


--G4Mul_481 replaced by G4Mul


--G4Mul_482 replaced by G4Mul


--G4ScaleN_135 replaced by G4ScaleN


--G4Mul_483 replaced by G4Mul


--G4Mul_484 replaced by G4Mul


--G4Mul_485 replaced by G4Mul


--G4ScaleN_136 replaced by G4ScaleN


--G4Mul_486 replaced by G4Mul


--G4Mul_487 replaced by G4Mul


--G4Mul_488 replaced by G4Mul


--G4ScaleN_137 replaced by G4ScaleN


--G4Mul_489 replaced by G4Mul


--G4Mul_490 replaced by G4Mul


--G4Mul_491 replaced by G4Mul


--G4ScaleN_138 replaced by G4ScaleN


--G4Mul_492 replaced by G4Mul


--G4Mul_493 replaced by G4Mul


--G4Mul_494 replaced by G4Mul


--G4ScaleN_139 replaced by G4ScaleN


--G4Mul_495 replaced by G4Mul


--G4Mul_496 replaced by G4Mul


--G4Mul_497 replaced by G4Mul


--G4ScaleN_140 replaced by G4ScaleN


--G4Mul_498 replaced by G4Mul


--G4Mul_499 replaced by G4Mul


--G4Mul_500 replaced by G4Mul


--G4ScaleN_141 replaced by G4ScaleN


--G4Mul_501 replaced by G4Mul


--G4Mul_502 replaced by G4Mul


--G4Mul_503 replaced by G4Mul


--G4ScaleN_142 replaced by G4ScaleN


--G4Sq_90 replaced by G4Sq


--G4Sq_91 replaced by G4Sq


--G4ScaleN2_45 replaced by G4ScaleN2


--G4Sq_92 replaced by G4Sq


--G4Sq_93 replaced by G4Sq


--G4ScaleN2_46 replaced by G4ScaleN2


--G4Mul_504 replaced by G4Mul


--G4Mul_505 replaced by G4Mul


--G4Mul_506 replaced by G4Mul


--G4Mul_507 replaced by G4Mul


--G4Mul_508 replaced by G4Mul


--G4Mul_509 replaced by G4Mul


--G4Mul_510 replaced by G4Mul


--G4Mul_511 replaced by G4Mul


--G4Sq_94 replaced by G4Sq


--G4ScaleN_143 replaced by G4ScaleN


--G4Sq_95 replaced by G4Sq


--G4ScaleN2_47 replaced by G4ScaleN2


--G4Mul_512 replaced by G4Mul


--G4Mul_513 replaced by G4Mul


--G4Mul_514 replaced by G4Mul


--G4ScaleN_144 replaced by G4ScaleN


--G4Mul_515 replaced by G4Mul


--G4Mul_516 replaced by G4Mul


--G4Mul_517 replaced by G4Mul


--G4ScaleN_145 replaced by G4ScaleN


--G4Mul_518 replaced by G4Mul


--G4Mul_519 replaced by G4Mul


--G4Mul_520 replaced by G4Mul


--G4ScaleN_146 replaced by G4ScaleN


--G4Mul_521 replaced by G4Mul


--G4Mul_522 replaced by G4Mul


--G4Mul_523 replaced by G4Mul


--G4ScaleN_147 replaced by G4ScaleN


--G4Mul_524 replaced by G4Mul


--G4Mul_525 replaced by G4Mul


--G4Mul_526 replaced by G4Mul


--G4ScaleN_148 replaced by G4ScaleN


--G4Mul_527 replaced by G4Mul


--G4Mul_528 replaced by G4Mul


--G4Mul_529 replaced by G4Mul


--G4ScaleN_149 replaced by G4ScaleN


--G4Mul_530 replaced by G4Mul


--G4Mul_531 replaced by G4Mul


--G4Mul_532 replaced by G4Mul


--G4ScaleN_150 replaced by G4ScaleN


--G4Mul_533 replaced by G4Mul


--G4Mul_534 replaced by G4Mul


--G4Mul_535 replaced by G4Mul


--G4ScaleN_151 replaced by G4ScaleN


--G4Sq_96 replaced by G4Sq


--G4Sq_97 replaced by G4Sq


--G4ScaleN2_48 replaced by G4ScaleN2


--G4Sq_98 replaced by G4Sq


--G4Sq_99 replaced by G4Sq


--G4ScaleN2_49 replaced by G4ScaleN2


--G4Mul_536 replaced by G4Mul


--G4Mul_537 replaced by G4Mul


--G4Mul_538 replaced by G4Mul


--G4Mul_539 replaced by G4Mul


--G4Mul_540 replaced by G4Mul


--G4Mul_541 replaced by G4Mul


--G4Mul_542 replaced by G4Mul


--G4Mul_543 replaced by G4Mul


--G4Sq_100 replaced by G4Sq


--G4ScaleN_152 replaced by G4ScaleN


--G4Sq_101 replaced by G4Sq


--G4ScaleN2_50 replaced by G4ScaleN2


--G4Mul_544 replaced by G4Mul


--G4Mul_545 replaced by G4Mul


--G4Mul_546 replaced by G4Mul


--G4ScaleN_153 replaced by G4ScaleN


--G4Mul_547 replaced by G4Mul


--G4Mul_548 replaced by G4Mul


--G4Mul_549 replaced by G4Mul


--G4ScaleN_154 replaced by G4ScaleN


--G4Mul_550 replaced by G4Mul


--G4Mul_551 replaced by G4Mul


--G4Mul_552 replaced by G4Mul


--G4ScaleN_155 replaced by G4ScaleN


--G4Mul_553 replaced by G4Mul


--G4Mul_554 replaced by G4Mul


--G4Mul_555 replaced by G4Mul


--G4ScaleN_156 replaced by G4ScaleN


--G4Mul_556 replaced by G4Mul


--G4Mul_557 replaced by G4Mul


--G4Mul_558 replaced by G4Mul


--G4ScaleN_157 replaced by G4ScaleN


--G4Mul_559 replaced by G4Mul


--G4Mul_560 replaced by G4Mul


--G4Mul_561 replaced by G4Mul


--G4ScaleN_158 replaced by G4ScaleN


--G4Mul_562 replaced by G4Mul


--G4Mul_563 replaced by G4Mul


--G4Mul_564 replaced by G4Mul


--G4ScaleN_159 replaced by G4ScaleN


--G4Mul_565 replaced by G4Mul


--G4Mul_566 replaced by G4Mul


--G4Mul_567 replaced by G4Mul


--G4ScaleN_160 replaced by G4ScaleN


--G4Sq_102 replaced by G4Sq


--G4Sq_103 replaced by G4Sq


--G4ScaleN2_51 replaced by G4ScaleN2


--G4Sq_104 replaced by G4Sq


--G4Sq_105 replaced by G4Sq


--G4ScaleN2_52 replaced by G4ScaleN2


--G4Mul_568 replaced by G4Mul


--G4Mul_569 replaced by G4Mul


--G4Mul_570 replaced by G4Mul


--G4Mul_571 replaced by G4Mul


--G4Mul_572 replaced by G4Mul


--G4Mul_573 replaced by G4Mul


--G4Mul_574 replaced by G4Mul


--G4Mul_575 replaced by G4Mul


--G4Sq_106 replaced by G4Sq


--G4ScaleN_161 replaced by G4ScaleN


--G4Sq_107 replaced by G4Sq


--G4ScaleN2_53 replaced by G4ScaleN2


--G4Mul_576 replaced by G4Mul


--G4Mul_577 replaced by G4Mul


--G4Mul_578 replaced by G4Mul


--G4ScaleN_162 replaced by G4ScaleN


--G4Mul_579 replaced by G4Mul


--G4Mul_580 replaced by G4Mul


--G4Mul_581 replaced by G4Mul


--G4ScaleN_163 replaced by G4ScaleN


--G4Mul_582 replaced by G4Mul


--G4Mul_583 replaced by G4Mul


--G4Mul_584 replaced by G4Mul


--G4ScaleN_164 replaced by G4ScaleN


--G4Mul_585 replaced by G4Mul


--G4Mul_586 replaced by G4Mul


--G4Mul_587 replaced by G4Mul


--G4ScaleN_165 replaced by G4ScaleN


--G4Mul_588 replaced by G4Mul


--G4Mul_589 replaced by G4Mul


--G4Mul_590 replaced by G4Mul


--G4ScaleN_166 replaced by G4ScaleN


--G4Mul_591 replaced by G4Mul


--G4Mul_592 replaced by G4Mul


--G4Mul_593 replaced by G4Mul


--G4ScaleN_167 replaced by G4ScaleN


--G4Mul_594 replaced by G4Mul


--G4Mul_595 replaced by G4Mul


--G4Mul_596 replaced by G4Mul


--G4ScaleN_168 replaced by G4ScaleN


--G4Mul_597 replaced by G4Mul


--G4Mul_598 replaced by G4Mul


--G4Mul_599 replaced by G4Mul


--G4ScaleN_169 replaced by G4ScaleN


--G4Sq_108 replaced by G4Sq


--G4Sq_109 replaced by G4Sq


--G4ScaleN2_54 replaced by G4ScaleN2


--G4Sq_110 replaced by G4Sq


--G4Sq_111 replaced by G4Sq


--G4ScaleN2_55 replaced by G4ScaleN2


--G4Mul_600 replaced by G4Mul


--G4Mul_601 replaced by G4Mul


--G4Mul_602 replaced by G4Mul


--G4Mul_603 replaced by G4Mul


--G4Mul_604 replaced by G4Mul


--G4Mul_605 replaced by G4Mul


--G4Mul_606 replaced by G4Mul


--G4Mul_607 replaced by G4Mul


--G4Sq_112 replaced by G4Sq


--G4ScaleN_170 replaced by G4ScaleN


--G4Sq_113 replaced by G4Sq


--G4ScaleN2_56 replaced by G4ScaleN2


--G4Mul_608 replaced by G4Mul


--G4Mul_609 replaced by G4Mul


--G4Mul_610 replaced by G4Mul


--G4ScaleN_171 replaced by G4ScaleN


--G4Mul_611 replaced by G4Mul


--G4Mul_612 replaced by G4Mul


--G4Mul_613 replaced by G4Mul


--G4ScaleN_172 replaced by G4ScaleN


--G4Mul_614 replaced by G4Mul


--G4Mul_615 replaced by G4Mul


--G4Mul_616 replaced by G4Mul


--G4ScaleN_173 replaced by G4ScaleN


--G4Mul_617 replaced by G4Mul


--G4Mul_618 replaced by G4Mul


--G4Mul_619 replaced by G4Mul


--G4ScaleN_174 replaced by G4ScaleN


--G4Mul_620 replaced by G4Mul


--G4Mul_621 replaced by G4Mul


--G4Mul_622 replaced by G4Mul


--G4ScaleN_175 replaced by G4ScaleN


--G4Mul_623 replaced by G4Mul


--G4Mul_624 replaced by G4Mul


--G4Mul_625 replaced by G4Mul


--G4ScaleN_176 replaced by G4ScaleN


--G4Mul_626 replaced by G4Mul


--G4Mul_627 replaced by G4Mul


--G4Mul_628 replaced by G4Mul


--G4ScaleN_177 replaced by G4ScaleN


--G4Mul_629 replaced by G4Mul


--G4Mul_630 replaced by G4Mul


--G4Mul_631 replaced by G4Mul


--G4ScaleN_178 replaced by G4ScaleN


--G4Sq_114 replaced by G4Sq


--G4Sq_115 replaced by G4Sq


--G4ScaleN2_57 replaced by G4ScaleN2


--G4Sq_116 replaced by G4Sq


--G4Sq_117 replaced by G4Sq


--G4ScaleN2_58 replaced by G4ScaleN2


--G4Mul_632 replaced by G4Mul


--G4Mul_633 replaced by G4Mul


--G4Mul_634 replaced by G4Mul


--G4Mul_635 replaced by G4Mul


--G4Mul_636 replaced by G4Mul


--G4Mul_637 replaced by G4Mul


--G4Mul_638 replaced by G4Mul


--G4Mul_639 replaced by G4Mul


--G4Sq_118 replaced by G4Sq


--G4ScaleN_179 replaced by G4ScaleN


--G4Sq_119 replaced by G4Sq


--G4ScaleN2_59 replaced by G4ScaleN2

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16Mul is
  port(
    io_a : in std_logic_vector(3 downto 0);
    io_b : in std_logic_vector(3 downto 0);
    io_x : out std_logic_vector(3 downto 0)
  );
end G16Mul;

architecture arch of G16Mul is
  signal mul1_io_a : std_logic_vector(1 downto 0);
  signal mul1_io_b : std_logic_vector(1 downto 0);
  signal mul1_io_x : std_logic_vector(1 downto 0);
  signal mul2_io_x : std_logic_vector(1 downto 0);
  signal mul3_io_x : std_logic_vector(1 downto 0);
  signal scale_io_x : std_logic_vector(1 downto 0);

  signal a : std_logic_vector(1 downto 0);
  signal b : std_logic_vector(1 downto 0);
  signal c : std_logic_vector(1 downto 0);
  signal d : std_logic_vector(1 downto 0);
  signal e : std_logic_vector(1 downto 0);
  signal f : std_logic_vector(1 downto 0);
  signal p : std_logic_vector(1 downto 0);
  signal q : std_logic_vector(1 downto 0);
begin
  mul1 : entity work.G4Mul
    port map ( 
      io_a => mul1_io_a,
      io_b => mul1_io_b,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G4Mul
    port map ( 
      io_a => a,
      io_b => c,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G4Mul
    port map ( 
      io_a => b,
      io_b => d,
      io_x => mul3_io_x 
    );
  scale : entity work.G4ScaleN
    port map ( 
      io_t => e,
      io_x => scale_io_x 
    );
  mul1_io_a <= (a xor b);
  mul1_io_b <= (c xor d);
  e <= mul1_io_x;
  f <= scale_io_x;
  p <= (mul2_io_x xor f);
  q <= (mul3_io_x xor f);
  a <= pkg_extract(io_a,3,2);
  b <= pkg_extract(io_a,1,0);
  c <= pkg_extract(io_b,3,2);
  d <= pkg_extract(io_b,1,0);
  io_x <= pkg_cat(p,q);
end arch;


--G16Mul_1 replaced by G16Mul


--G16Mul_2 replaced by G16Mul


--G16Mul_3 replaced by G16Mul


--G16Mul_4 replaced by G16Mul


--G16Mul_5 replaced by G16Mul


--G16Mul_6 replaced by G16Mul


--G16Mul_7 replaced by G16Mul

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16SqSc is
  port(
    io_t : in std_logic_vector(3 downto 0);
    io_x : out std_logic_vector(3 downto 0)
  );
end G16SqSc;

architecture arch of G16SqSc is
  signal square1_io_t : std_logic_vector(1 downto 0);
  signal square1_io_x : std_logic_vector(1 downto 0);
  signal square2_io_x : std_logic_vector(1 downto 0);
  signal scale_io_x : std_logic_vector(1 downto 0);

  signal a : std_logic_vector(1 downto 0);
  signal b : std_logic_vector(1 downto 0);
  signal c : std_logic_vector(1 downto 0);
  signal p : std_logic_vector(1 downto 0);
  signal q : std_logic_vector(1 downto 0);
begin
  square1 : entity work.G4Sq
    port map ( 
      io_t => square1_io_t,
      io_x => square1_io_x 
    );
  square2 : entity work.G4Sq
    port map ( 
      io_t => b,
      io_x => square2_io_x 
    );
  scale : entity work.G4ScaleN2
    port map ( 
      io_t => c,
      io_x => scale_io_x 
    );
  square1_io_t <= (a xor b);
  p <= square1_io_x;
  c <= square2_io_x;
  q <= scale_io_x;
  a <= pkg_extract(io_t,3,2);
  b <= pkg_extract(io_t,1,0);
  io_x <= pkg_cat(p,q);
end arch;


--G16SqSc_1 replaced by G16SqSc

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16InvMaskedOptimized is
  port(
    io_B : in std_logic_vector(3 downto 0);
    io_M : in std_logic_vector(3 downto 0);
    io_M1 : in std_logic_vector(3 downto 0);
    io_BInv : out std_logic_vector(3 downto 0)
  );
end G16InvMaskedOptimized;

architecture arch of G16InvMaskedOptimized is
  signal square_io_t : std_logic_vector(1 downto 0);
  signal mul1_io_x : std_logic_vector(1 downto 0);
  signal mul2_io_x : std_logic_vector(1 downto 0);
  signal mul3_io_x : std_logic_vector(1 downto 0);
  signal mul4_io_x : std_logic_vector(1 downto 0);
  signal mul5_io_x : std_logic_vector(1 downto 0);
  signal mul6_io_x : std_logic_vector(1 downto 0);
  signal mul7_io_x : std_logic_vector(1 downto 0);
  signal mul8_io_x : std_logic_vector(1 downto 0);
  signal square_io_x : std_logic_vector(1 downto 0);
  signal scale1_io_x : std_logic_vector(1 downto 0);
  signal inv_io_x : std_logic_vector(1 downto 0);
  signal scale2_io_x : std_logic_vector(1 downto 0);

  signal b1 : std_logic_vector(1 downto 0);
  signal b0 : std_logic_vector(1 downto 0);
  signal b1Inv : std_logic_vector(1 downto 0);
  signal b0Inv : std_logic_vector(1 downto 0);
  signal m2 : std_logic_vector(1 downto 0);
  signal m1 : std_logic_vector(1 downto 0);
  signal m0 : std_logic_vector(1 downto 0);
  signal c : std_logic_vector(1 downto 0);
  signal d : std_logic_vector(1 downto 0);
  signal b1b0 : std_logic_vector(1 downto 0);
  signal b1m0 : std_logic_vector(1 downto 0);
  signal b0m1 : std_logic_vector(1 downto 0);
  signal m1m0 : std_logic_vector(1 downto 0);
  signal cInv : std_logic_vector(1 downto 0);
  signal c2Inv : std_logic_vector(1 downto 0);
  signal b0c : std_logic_vector(1 downto 0);
  signal b0m2 : std_logic_vector(1 downto 0);
  signal m0c : std_logic_vector(1 downto 0);
  signal m0m2 : std_logic_vector(1 downto 0);
  signal b1c : std_logic_vector(1 downto 0);
  signal b1m2 : std_logic_vector(1 downto 0);
  signal m1c : std_logic_vector(1 downto 0);
  signal m1m2 : std_logic_vector(1 downto 0);
  signal m1Xorm2 : std_logic_vector(1 downto 0);
  signal m0Xorm1 : std_logic_vector(1 downto 0);
begin
  mul1 : entity work.G4Mul
    port map ( 
      io_a => b1,
      io_b => b0,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G4Mul
    port map ( 
      io_a => b1,
      io_b => m0,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G4Mul
    port map ( 
      io_a => b0,
      io_b => m1,
      io_x => mul3_io_x 
    );
  mul4 : entity work.G4Mul
    port map ( 
      io_a => m1,
      io_b => m0,
      io_x => mul4_io_x 
    );
  mul5 : entity work.G4Mul
    port map ( 
      io_a => b0,
      io_b => cInv,
      io_x => mul5_io_x 
    );
  mul6 : entity work.G4Mul
    port map ( 
      io_a => m0,
      io_b => cInv,
      io_x => mul6_io_x 
    );
  mul7 : entity work.G4Mul
    port map ( 
      io_a => b1,
      io_b => c2Inv,
      io_x => mul7_io_x 
    );
  mul8 : entity work.G4Mul
    port map ( 
      io_a => m1,
      io_b => c2Inv,
      io_x => mul8_io_x 
    );
  square : entity work.G4Sq
    port map ( 
      io_t => square_io_t,
      io_x => square_io_x 
    );
  scale1 : entity work.G4ScaleN
    port map ( 
      io_t => square_io_x,
      io_x => scale1_io_x 
    );
  inv : entity work.G4Sq
    port map ( 
      io_t => c,
      io_x => inv_io_x 
    );
  scale2 : entity work.G4ScaleN2
    port map ( 
      io_t => m0Xorm1,
      io_x => scale2_io_x 
    );
  b1 <= pkg_extract(io_B,3,2);
  b0 <= pkg_extract(io_B,1,0);
  m1 <= pkg_extract(io_M,3,2);
  m0 <= pkg_extract(io_M,1,0);
  square_io_t <= (b1 xor b0);
  d <= scale1_io_x;
  b1b0 <= mul1_io_x;
  b1m0 <= mul2_io_x;
  b0m1 <= mul3_io_x;
  m1m0 <= mul4_io_x;
  c <= ((((d xor b1b0) xor b1m0) xor b0m1) xor m1m0);
  m1Xorm2 <= (m1 xor m2);
  m0Xorm1 <= (m0 xor m1);
  cInv <= (inv_io_x xor m1Xorm2);
  m2 <= scale2_io_x;
  c2Inv <= (cInv xor m0Xorm1);
  b0c <= mul5_io_x;
  m0c <= mul6_io_x;
  b1c <= mul7_io_x;
  m1c <= mul8_io_x;
  b1Inv <= ((((pkg_extract(io_M1,3,2) xor b0c) xor b0m1) xor m0c) xor m1m0);
  b0Inv <= ((((pkg_extract(io_M1,1,0) xor b1c) xor b1m0) xor m1c) xor m1m0);
  io_BInv <= pkg_cat(b1Inv,b0Inv);
end arch;


--G16Mul_8 replaced by G16Mul


--G16Mul_9 replaced by G16Mul


--G16Mul_10 replaced by G16Mul


--G16Mul_11 replaced by G16Mul


--G16Mul_12 replaced by G16Mul


--G16Mul_13 replaced by G16Mul


--G16Mul_14 replaced by G16Mul


--G16Mul_15 replaced by G16Mul


--G16SqSc_2 replaced by G16SqSc


--G16SqSc_3 replaced by G16SqSc


--G16InvMaskedOptimized_1 replaced by G16InvMaskedOptimized


--G16Mul_16 replaced by G16Mul


--G16Mul_17 replaced by G16Mul


--G16Mul_18 replaced by G16Mul


--G16Mul_19 replaced by G16Mul


--G16Mul_20 replaced by G16Mul


--G16Mul_21 replaced by G16Mul


--G16Mul_22 replaced by G16Mul


--G16Mul_23 replaced by G16Mul


--G16SqSc_4 replaced by G16SqSc


--G16SqSc_5 replaced by G16SqSc


--G16InvMaskedOptimized_2 replaced by G16InvMaskedOptimized


--G16Mul_24 replaced by G16Mul


--G16Mul_25 replaced by G16Mul


--G16Mul_26 replaced by G16Mul


--G16Mul_27 replaced by G16Mul


--G16Mul_28 replaced by G16Mul


--G16Mul_29 replaced by G16Mul


--G16Mul_30 replaced by G16Mul


--G16Mul_31 replaced by G16Mul


--G16SqSc_6 replaced by G16SqSc


--G16SqSc_7 replaced by G16SqSc


--G16InvMaskedOptimized_3 replaced by G16InvMaskedOptimized


--G16Mul_32 replaced by G16Mul


--G16Mul_33 replaced by G16Mul


--G16Mul_34 replaced by G16Mul


--G16Mul_35 replaced by G16Mul


--G16Mul_36 replaced by G16Mul


--G16Mul_37 replaced by G16Mul


--G16Mul_38 replaced by G16Mul


--G16Mul_39 replaced by G16Mul


--G16SqSc_8 replaced by G16SqSc


--G16SqSc_9 replaced by G16SqSc


--G16InvMaskedOptimized_4 replaced by G16InvMaskedOptimized


--G16Mul_40 replaced by G16Mul


--G16Mul_41 replaced by G16Mul


--G16Mul_42 replaced by G16Mul


--G16Mul_43 replaced by G16Mul


--G16Mul_44 replaced by G16Mul


--G16Mul_45 replaced by G16Mul


--G16Mul_46 replaced by G16Mul


--G16Mul_47 replaced by G16Mul


--G16SqSc_10 replaced by G16SqSc


--G16SqSc_11 replaced by G16SqSc


--G16InvMaskedOptimized_5 replaced by G16InvMaskedOptimized


--G16Mul_48 replaced by G16Mul


--G16Mul_49 replaced by G16Mul


--G16Mul_50 replaced by G16Mul


--G16Mul_51 replaced by G16Mul


--G16Mul_52 replaced by G16Mul


--G16Mul_53 replaced by G16Mul


--G16Mul_54 replaced by G16Mul


--G16Mul_55 replaced by G16Mul


--G16SqSc_12 replaced by G16SqSc


--G16SqSc_13 replaced by G16SqSc


--G16InvMaskedOptimized_6 replaced by G16InvMaskedOptimized


--G16Mul_56 replaced by G16Mul


--G16Mul_57 replaced by G16Mul


--G16Mul_58 replaced by G16Mul


--G16Mul_59 replaced by G16Mul


--G16Mul_60 replaced by G16Mul


--G16Mul_61 replaced by G16Mul


--G16Mul_62 replaced by G16Mul


--G16Mul_63 replaced by G16Mul


--G16SqSc_14 replaced by G16SqSc


--G16SqSc_15 replaced by G16SqSc


--G16InvMaskedOptimized_7 replaced by G16InvMaskedOptimized


--G16Mul_64 replaced by G16Mul


--G16Mul_65 replaced by G16Mul


--G16Mul_66 replaced by G16Mul


--G16Mul_67 replaced by G16Mul


--G16Mul_68 replaced by G16Mul


--G16Mul_69 replaced by G16Mul


--G16Mul_70 replaced by G16Mul


--G16Mul_71 replaced by G16Mul


--G16SqSc_16 replaced by G16SqSc


--G16SqSc_17 replaced by G16SqSc


--G16InvMaskedOptimized_8 replaced by G16InvMaskedOptimized


--G16Mul_72 replaced by G16Mul


--G16Mul_73 replaced by G16Mul


--G16Mul_74 replaced by G16Mul


--G16Mul_75 replaced by G16Mul


--G16Mul_76 replaced by G16Mul


--G16Mul_77 replaced by G16Mul


--G16Mul_78 replaced by G16Mul


--G16Mul_79 replaced by G16Mul


--G16SqSc_18 replaced by G16SqSc


--G16SqSc_19 replaced by G16SqSc


--G16InvMaskedOptimized_9 replaced by G16InvMaskedOptimized


--G16Mul_80 replaced by G16Mul


--G16Mul_81 replaced by G16Mul


--G16Mul_82 replaced by G16Mul


--G16Mul_83 replaced by G16Mul


--G16Mul_84 replaced by G16Mul


--G16Mul_85 replaced by G16Mul


--G16Mul_86 replaced by G16Mul


--G16Mul_87 replaced by G16Mul


--G16SqSc_20 replaced by G16SqSc


--G16SqSc_21 replaced by G16SqSc


--G16InvMaskedOptimized_10 replaced by G16InvMaskedOptimized


--G16Mul_88 replaced by G16Mul


--G16Mul_89 replaced by G16Mul


--G16Mul_90 replaced by G16Mul


--G16Mul_91 replaced by G16Mul


--G16Mul_92 replaced by G16Mul


--G16Mul_93 replaced by G16Mul


--G16Mul_94 replaced by G16Mul


--G16Mul_95 replaced by G16Mul


--G16SqSc_22 replaced by G16SqSc


--G16SqSc_23 replaced by G16SqSc


--G16InvMaskedOptimized_11 replaced by G16InvMaskedOptimized


--G16Mul_96 replaced by G16Mul


--G16Mul_97 replaced by G16Mul


--G16Mul_98 replaced by G16Mul


--G16Mul_99 replaced by G16Mul


--G16Mul_100 replaced by G16Mul


--G16Mul_101 replaced by G16Mul


--G16Mul_102 replaced by G16Mul


--G16Mul_103 replaced by G16Mul


--G16SqSc_24 replaced by G16SqSc


--G16SqSc_25 replaced by G16SqSc


--G16InvMaskedOptimized_12 replaced by G16InvMaskedOptimized


--G16Mul_104 replaced by G16Mul


--G16Mul_105 replaced by G16Mul


--G16Mul_106 replaced by G16Mul


--G16Mul_107 replaced by G16Mul


--G16Mul_108 replaced by G16Mul


--G16Mul_109 replaced by G16Mul


--G16Mul_110 replaced by G16Mul


--G16Mul_111 replaced by G16Mul


--G16SqSc_26 replaced by G16SqSc


--G16SqSc_27 replaced by G16SqSc


--G16InvMaskedOptimized_13 replaced by G16InvMaskedOptimized


--G16Mul_112 replaced by G16Mul


--G16Mul_113 replaced by G16Mul


--G16Mul_114 replaced by G16Mul


--G16Mul_115 replaced by G16Mul


--G16Mul_116 replaced by G16Mul


--G16Mul_117 replaced by G16Mul


--G16Mul_118 replaced by G16Mul


--G16Mul_119 replaced by G16Mul


--G16SqSc_28 replaced by G16SqSc


--G16SqSc_29 replaced by G16SqSc


--G16InvMaskedOptimized_14 replaced by G16InvMaskedOptimized


--G16Mul_120 replaced by G16Mul


--G16Mul_121 replaced by G16Mul


--G16Mul_122 replaced by G16Mul


--G16Mul_123 replaced by G16Mul


--G16Mul_124 replaced by G16Mul


--G16Mul_125 replaced by G16Mul


--G16Mul_126 replaced by G16Mul


--G16Mul_127 replaced by G16Mul


--G16SqSc_30 replaced by G16SqSc


--G16SqSc_31 replaced by G16SqSc


--G16InvMaskedOptimized_15 replaced by G16InvMaskedOptimized


--G16Mul_128 replaced by G16Mul


--G16Mul_129 replaced by G16Mul


--G16Mul_130 replaced by G16Mul


--G16Mul_131 replaced by G16Mul


--G16Mul_132 replaced by G16Mul


--G16Mul_133 replaced by G16Mul


--G16Mul_134 replaced by G16Mul


--G16Mul_135 replaced by G16Mul


--G16SqSc_32 replaced by G16SqSc


--G16SqSc_33 replaced by G16SqSc


--G16InvMaskedOptimized_16 replaced by G16InvMaskedOptimized


--G16Mul_136 replaced by G16Mul


--G16Mul_137 replaced by G16Mul


--G16Mul_138 replaced by G16Mul


--G16Mul_139 replaced by G16Mul


--G16Mul_140 replaced by G16Mul


--G16Mul_141 replaced by G16Mul


--G16Mul_142 replaced by G16Mul


--G16Mul_143 replaced by G16Mul


--G16SqSc_34 replaced by G16SqSc


--G16SqSc_35 replaced by G16SqSc


--G16InvMaskedOptimized_17 replaced by G16InvMaskedOptimized


--G16Mul_144 replaced by G16Mul


--G16Mul_145 replaced by G16Mul


--G16Mul_146 replaced by G16Mul


--G16Mul_147 replaced by G16Mul


--G16Mul_148 replaced by G16Mul


--G16Mul_149 replaced by G16Mul


--G16Mul_150 replaced by G16Mul


--G16Mul_151 replaced by G16Mul


--G16SqSc_36 replaced by G16SqSc


--G16SqSc_37 replaced by G16SqSc


--G16InvMaskedOptimized_18 replaced by G16InvMaskedOptimized


--G16Mul_152 replaced by G16Mul


--G16Mul_153 replaced by G16Mul


--G16Mul_154 replaced by G16Mul


--G16Mul_155 replaced by G16Mul


--G16Mul_156 replaced by G16Mul


--G16Mul_157 replaced by G16Mul


--G16Mul_158 replaced by G16Mul


--G16Mul_159 replaced by G16Mul


--G16SqSc_38 replaced by G16SqSc


--G16SqSc_39 replaced by G16SqSc


--G16InvMaskedOptimized_19 replaced by G16InvMaskedOptimized

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G256InvMaskedOptimized is
  port(
    io_A : in std_logic_vector(7 downto 0);
    io_M : in std_logic_vector(7 downto 0);
    io_S : in std_logic_vector(7 downto 0);
    io_AInv : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G256InvMaskedOptimized;

architecture arch of G256InvMaskedOptimized is
  signal scale1_io_t : std_logic_vector(3 downto 0);
  signal scale2_io_t : std_logic_vector(3 downto 0);
  signal mul1_io_x : std_logic_vector(3 downto 0);
  signal mul2_io_x : std_logic_vector(3 downto 0);
  signal mul3_io_x : std_logic_vector(3 downto 0);
  signal mul4_io_x : std_logic_vector(3 downto 0);
  signal mul5_io_x : std_logic_vector(3 downto 0);
  signal mul6_io_x : std_logic_vector(3 downto 0);
  signal mul7_io_x : std_logic_vector(3 downto 0);
  signal mul8_io_x : std_logic_vector(3 downto 0);
  signal scale1_io_x : std_logic_vector(3 downto 0);
  signal scale2_io_x : std_logic_vector(3 downto 0);
  signal inv_io_BInv : std_logic_vector(3 downto 0);

  signal dummy : std_logic;
  signal A1A0 : std_logic_vector(3 downto 0);
  signal A1 : std_logic_vector(3 downto 0);
  signal A0 : std_logic_vector(3 downto 0);
  signal M2 : std_logic_vector(3 downto 0);
  signal M1 : std_logic_vector(3 downto 0);
  signal M0 : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
  signal BInv : std_logic_vector(3 downto 0);
  signal B2Inv : std_logic_vector(3 downto 0);
  signal A1M0 : std_logic_vector(3 downto 0);
  signal A0M1 : std_logic_vector(3 downto 0);
  signal M1M0 : std_logic_vector(3 downto 0);
  signal M0XorM1 : std_logic_vector(3 downto 0);
  signal C : std_logic_vector(3 downto 0);
  signal S1 : std_logic_vector(3 downto 0);
  signal S0 : std_logic_vector(3 downto 0);
  signal A0B : std_logic_vector(3 downto 0);
  signal A1B : std_logic_vector(3 downto 0);
  signal M0B : std_logic_vector(3 downto 0);
  signal M1B : std_logic_vector(3 downto 0);
  signal A1Inv : std_logic_vector(3 downto 0);
  signal A0Inv : std_logic_vector(3 downto 0);
begin
  mul1 : entity work.G16Mul
    port map ( 
      io_a => A1,
      io_b => A0,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G16Mul
    port map ( 
      io_a => A1,
      io_b => M0,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G16Mul
    port map ( 
      io_a => A0,
      io_b => M1,
      io_x => mul3_io_x 
    );
  mul4 : entity work.G16Mul
    port map ( 
      io_a => M1,
      io_b => M0,
      io_x => mul4_io_x 
    );
  mul5 : entity work.G16Mul
    port map ( 
      io_a => A0,
      io_b => BInv,
      io_x => mul5_io_x 
    );
  mul6 : entity work.G16Mul
    port map ( 
      io_a => M0,
      io_b => BInv,
      io_x => mul6_io_x 
    );
  mul7 : entity work.G16Mul
    port map ( 
      io_a => A1,
      io_b => B2Inv,
      io_x => mul7_io_x 
    );
  mul8 : entity work.G16Mul
    port map ( 
      io_a => M1,
      io_b => B2Inv,
      io_x => mul8_io_x 
    );
  scale1 : entity work.G16SqSc
    port map ( 
      io_t => scale1_io_t,
      io_x => scale1_io_x 
    );
  scale2 : entity work.G16SqSc
    port map ( 
      io_t => scale2_io_t,
      io_x => scale2_io_x 
    );
  inv : entity work.G16InvMaskedOptimized
    port map ( 
      io_B => B,
      io_M => M2,
      io_M1 => M1,
      io_BInv => inv_io_BInv 
    );
  dummy <= pkg_toStdLogic(false);
  A1 <= pkg_extract(io_A,7,4);
  A0 <= pkg_extract(io_A,3,0);
  M1 <= pkg_extract(io_M,7,4);
  M0 <= pkg_extract(io_M,3,0);
  S1 <= pkg_extract(io_S,7,4);
  S0 <= pkg_extract(io_S,3,0);
  A1A0 <= mul1_io_x;
  A1M0 <= mul2_io_x;
  A0M1 <= mul3_io_x;
  M1M0 <= mul4_io_x;
  scale1_io_t <= (A1 xor A0);
  C <= scale1_io_x;
  scale2_io_t <= (M1 xor M0);
  M2 <= scale2_io_x;
  B <= ((((C xor A1A0) xor A1M0) xor A0M1) xor M1M0);
  BInv <= inv_io_BInv;
  A0B <= mul5_io_x;
  M0B <= mul6_io_x;
  A1B <= mul7_io_x;
  M1B <= mul8_io_x;
  M0XorM1 <= (M0 xor M1);
  B2Inv <= (BInv xor M0XorM1);
  A1Inv <= ((((S1 xor A0B) xor A0M1) xor M0B) xor M1M0);
  A0Inv <= ((((S0 xor A1B) xor A1M0) xor M1B) xor M1M0);
  io_AInv <= pkg_cat(A1Inv,A0Inv);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity NewBasis is
  port(
    io_input : in std_logic_vector(7 downto 0);
    io_direction : in std_logic;
    io_output : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end NewBasis;

architecture arch of NewBasis is

  signal dummy : std_logic;
  signal a : std_logic_vector(7 downto 0);
  signal b : std_logic_vector(7 downto 0);
  signal c : std_logic_vector(7 downto 0);
  signal when_NewBasis_l45 : std_logic;
begin
  dummy <= pkg_toStdLogic(false);
  a <= io_input;
  process(a)
  begin
    b(7) <= (((((pkg_extract(a,7) xor pkg_extract(a,6)) xor pkg_extract(a,5)) xor pkg_extract(a,2)) xor pkg_extract(a,1)) xor pkg_extract(a,0));
    b(6) <= (((pkg_extract(a,6) xor pkg_extract(a,5)) xor pkg_extract(a,4)) xor pkg_extract(a,0));
    b(5) <= (((pkg_extract(a,6) xor pkg_extract(a,5)) xor pkg_extract(a,1)) xor pkg_extract(a,0));
    b(4) <= (((pkg_extract(a,7) xor pkg_extract(a,6)) xor pkg_extract(a,5)) xor pkg_extract(a,0));
    b(3) <= ((((pkg_extract(a,7) xor pkg_extract(a,4)) xor pkg_extract(a,3)) xor pkg_extract(a,1)) xor pkg_extract(a,0));
    b(2) <= pkg_extract(a,0);
    b(1) <= ((pkg_extract(a,6) xor pkg_extract(a,5)) xor pkg_extract(a,0));
    b(0) <= ((((pkg_extract(a,6) xor pkg_extract(a,3)) xor pkg_extract(a,2)) xor pkg_extract(a,1)) xor pkg_extract(a,0));
  end process;

  process(a)
  begin
    c(7) <= (pkg_extract(a,5) xor pkg_extract(a,3));
    c(6) <= (pkg_extract(a,7) xor pkg_extract(a,3));
    c(5) <= (pkg_extract(a,6) xor pkg_extract(a,0));
    c(4) <= ((pkg_extract(a,7) xor pkg_extract(a,5)) xor pkg_extract(a,3));
    c(3) <= ((((pkg_extract(a,7) xor pkg_extract(a,6)) xor pkg_extract(a,5)) xor pkg_extract(a,4)) xor pkg_extract(a,3));
    c(2) <= ((((pkg_extract(a,6) xor pkg_extract(a,5)) xor pkg_extract(a,3)) xor pkg_extract(a,2)) xor pkg_extract(a,0));
    c(1) <= ((pkg_extract(a,5) xor pkg_extract(a,4)) xor pkg_extract(a,1));
    c(0) <= ((pkg_extract(a,6) xor pkg_extract(a,4)) xor pkg_extract(a,1));
  end process;

  when_NewBasis_l45 <= (not io_direction);
  process(when_NewBasis_l45,b,c)
  begin
    if when_NewBasis_l45 = '1' then
      io_output <= b;
    else
      io_output <= c;
    end if;
  end process;

end arch;


--NewBasis_1 replaced by NewBasis


--NewBasis_2 replaced by NewBasis


--G256InvMaskedOptimized_1 replaced by G256InvMaskedOptimized


--NewBasis_3 replaced by NewBasis


--NewBasis_4 replaced by NewBasis


--NewBasis_5 replaced by NewBasis


--G256InvMaskedOptimized_2 replaced by G256InvMaskedOptimized


--NewBasis_6 replaced by NewBasis


--NewBasis_7 replaced by NewBasis


--NewBasis_8 replaced by NewBasis


--G256InvMaskedOptimized_3 replaced by G256InvMaskedOptimized


--NewBasis_9 replaced by NewBasis


--NewBasis_10 replaced by NewBasis


--NewBasis_11 replaced by NewBasis


--G256InvMaskedOptimized_4 replaced by G256InvMaskedOptimized


--NewBasis_12 replaced by NewBasis


--NewBasis_13 replaced by NewBasis


--NewBasis_14 replaced by NewBasis


--G256InvMaskedOptimized_5 replaced by G256InvMaskedOptimized


--NewBasis_15 replaced by NewBasis


--NewBasis_16 replaced by NewBasis


--NewBasis_17 replaced by NewBasis


--G256InvMaskedOptimized_6 replaced by G256InvMaskedOptimized


--NewBasis_18 replaced by NewBasis


--NewBasis_19 replaced by NewBasis


--NewBasis_20 replaced by NewBasis


--G256InvMaskedOptimized_7 replaced by G256InvMaskedOptimized


--NewBasis_21 replaced by NewBasis


--NewBasis_22 replaced by NewBasis


--NewBasis_23 replaced by NewBasis


--G256InvMaskedOptimized_8 replaced by G256InvMaskedOptimized


--NewBasis_24 replaced by NewBasis


--NewBasis_25 replaced by NewBasis


--NewBasis_26 replaced by NewBasis


--G256InvMaskedOptimized_9 replaced by G256InvMaskedOptimized


--NewBasis_27 replaced by NewBasis


--NewBasis_28 replaced by NewBasis


--NewBasis_29 replaced by NewBasis


--G256InvMaskedOptimized_10 replaced by G256InvMaskedOptimized


--NewBasis_30 replaced by NewBasis


--NewBasis_31 replaced by NewBasis


--NewBasis_32 replaced by NewBasis


--G256InvMaskedOptimized_11 replaced by G256InvMaskedOptimized


--NewBasis_33 replaced by NewBasis


--NewBasis_34 replaced by NewBasis


--NewBasis_35 replaced by NewBasis


--G256InvMaskedOptimized_12 replaced by G256InvMaskedOptimized


--NewBasis_36 replaced by NewBasis


--NewBasis_37 replaced by NewBasis


--NewBasis_38 replaced by NewBasis


--G256InvMaskedOptimized_13 replaced by G256InvMaskedOptimized


--NewBasis_39 replaced by NewBasis


--NewBasis_40 replaced by NewBasis


--NewBasis_41 replaced by NewBasis


--G256InvMaskedOptimized_14 replaced by G256InvMaskedOptimized


--NewBasis_42 replaced by NewBasis


--NewBasis_43 replaced by NewBasis


--NewBasis_44 replaced by NewBasis


--G256InvMaskedOptimized_15 replaced by G256InvMaskedOptimized


--NewBasis_45 replaced by NewBasis


--NewBasis_46 replaced by NewBasis


--NewBasis_47 replaced by NewBasis


--G256InvMaskedOptimized_16 replaced by G256InvMaskedOptimized


--NewBasis_48 replaced by NewBasis


--NewBasis_49 replaced by NewBasis


--NewBasis_50 replaced by NewBasis


--G256InvMaskedOptimized_17 replaced by G256InvMaskedOptimized


--NewBasis_51 replaced by NewBasis


--NewBasis_52 replaced by NewBasis


--NewBasis_53 replaced by NewBasis


--G256InvMaskedOptimized_18 replaced by G256InvMaskedOptimized


--NewBasis_54 replaced by NewBasis


--NewBasis_55 replaced by NewBasis


--NewBasis_56 replaced by NewBasis


--G256InvMaskedOptimized_19 replaced by G256InvMaskedOptimized


--NewBasis_57 replaced by NewBasis


--NewBasis_58 replaced by NewBasis


--NewBasis_59 replaced by NewBasis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity CanrightSBoxMasked is
  port(
    io_A : in std_logic_vector(7 downto 0);
    io_M : in std_logic_vector(7 downto 0);
    io_S : in std_logic_vector(7 downto 0);
    io_Q : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end CanrightSBoxMasked;

architecture arch of CanrightSBoxMasked is
  signal inv_io_AInv : std_logic_vector(7 downto 0);
  signal transform1_io_output : std_logic_vector(7 downto 0);
  signal transform2_io_output : std_logic_vector(7 downto 0);
  signal transform3_io_output : std_logic_vector(7 downto 0);

  signal dummy : std_logic;
  signal ATransformed : std_logic_vector(7 downto 0);
  signal MTransformed : std_logic_vector(7 downto 0);
  signal STransformed : std_logic_vector(7 downto 0);
  signal AInv : std_logic_vector(7 downto 0);
begin
  inv : entity work.G256InvMaskedOptimized
    port map ( 
      io_A => ATransformed,
      io_M => MTransformed,
      io_S => STransformed,
      io_AInv => inv_io_AInv,
      clk => clk,
      reset => reset 
    );
  transform1 : entity work.NewBasis
    port map ( 
      io_input => io_A,
      io_direction => pkg_toStdLogic(false),
      io_output => transform1_io_output,
      clk => clk,
      reset => reset 
    );
  transform2 : entity work.NewBasis
    port map ( 
      io_input => io_M,
      io_direction => pkg_toStdLogic(false),
      io_output => transform2_io_output,
      clk => clk,
      reset => reset 
    );
  transform3 : entity work.NewBasis
    port map ( 
      io_input => AInv,
      io_direction => pkg_toStdLogic(true),
      io_output => transform3_io_output,
      clk => clk,
      reset => reset 
    );
  dummy <= pkg_toStdLogic(false);
  ATransformed <= transform1_io_output;
  MTransformed <= transform2_io_output;
  process(io_S)
  begin
    STransformed(7) <= (pkg_extract(io_S,7) xor pkg_extract(io_S,4));
    STransformed(6) <= (((pkg_extract(io_S,6) xor pkg_extract(io_S,4)) xor pkg_extract(io_S,1)) xor pkg_extract(io_S,0));
    STransformed(5) <= (pkg_extract(io_S,6) xor pkg_extract(io_S,4));
    STransformed(4) <= (((pkg_extract(io_S,6) xor pkg_extract(io_S,3)) xor pkg_extract(io_S,1)) xor pkg_extract(io_S,0));
    STransformed(3) <= ((pkg_extract(io_S,7) xor pkg_extract(io_S,6)) xor pkg_extract(io_S,4));
    STransformed(2) <= ((pkg_extract(io_S,7) xor pkg_extract(io_S,5)) xor pkg_extract(io_S,2));
    STransformed(1) <= ((pkg_extract(io_S,4) xor pkg_extract(io_S,3)) xor pkg_extract(io_S,0));
    STransformed(0) <= ((((pkg_extract(io_S,6) xor pkg_extract(io_S,5)) xor pkg_extract(io_S,4)) xor pkg_extract(io_S,1)) xor pkg_extract(io_S,0));
  end process;

  AInv <= inv_io_AInv;
  io_Q <= (transform3_io_output xor pkg_stdLogicVector("01100011"));
end arch;


--CanrightSBoxMasked_1 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_2 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_3 replaced by CanrightSBoxMasked

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AddRoundKeyMasked is
  port(
    io_a_0 : in std_logic_vector(127 downto 0);
    io_a_1 : in std_logic_vector(127 downto 0);
    io_k_0 : in std_logic_vector(127 downto 0);
    io_k_1 : in std_logic_vector(127 downto 0);
    io_b_0 : out std_logic_vector(127 downto 0);
    io_b_1 : out std_logic_vector(127 downto 0)
  );
end AddRoundKeyMasked;

architecture arch of AddRoundKeyMasked is

begin
  io_b_0 <= (io_a_0 xor io_k_0);
  io_b_1 <= (io_a_1 xor io_k_1);
end arch;


--CanrightSBoxMasked_4 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_5 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_6 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_7 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_8 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_9 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_10 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_11 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_12 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_13 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_14 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_15 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_16 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_17 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_18 replaced by CanrightSBoxMasked


--CanrightSBoxMasked_19 replaced by CanrightSBoxMasked

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity ShiftRows is
  port(
    io_shiftRowsInput : in std_logic_vector(127 downto 0);
    io_shiftRowsOutput : out std_logic_vector(127 downto 0)
  );
end ShiftRows;

architecture arch of ShiftRows is
  signal zz_io_shiftRowsOutput : std_logic_vector(39 downto 0);
  signal zz_io_shiftRowsOutput_1 : std_logic_vector(7 downto 0);

  signal a : std_logic_vector(127 downto 0);
begin
  zz_io_shiftRowsOutput <= pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_extract(a,127,120),pkg_extract(a,87,80)),pkg_extract(a,47,40)),pkg_extract(a,7,0)),pkg_extract(a,95,88));
  zz_io_shiftRowsOutput_1 <= pkg_extract(a,55,48);
  a <= io_shiftRowsInput;
  io_shiftRowsOutput <= pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(zz_io_shiftRowsOutput,zz_io_shiftRowsOutput_1),pkg_extract(a,15,8)),pkg_extract(a,103,96)),pkg_extract(a,63,56)),pkg_extract(a,23,16)),pkg_extract(a,111,104)),pkg_extract(a,71,64)),pkg_extract(a,31,24)),pkg_extract(a,119,112)),pkg_extract(a,79,72)),pkg_extract(a,39,32));
end arch;


--ShiftRows_1 replaced by ShiftRows

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumns is
  port(
    io_mixColumnsInput : in std_logic_vector(31 downto 0);
    io_mixColumnsOutput : out std_logic_vector(31 downto 0)
  );
end MixColumns;

architecture arch of MixColumns is

  signal a1 : std_logic_vector(7 downto 0);
  signal a2 : std_logic_vector(7 downto 0);
  signal a3 : std_logic_vector(7 downto 0);
  signal a0 : std_logic_vector(7 downto 0);
  signal zz_io_mixColumnsOutput : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29 : std_logic;
  signal zz_io_mixColumnsOutput_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_1 : std_logic;
  signal zz_io_mixColumnsOutput_2 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_2 : std_logic;
  signal zz_io_mixColumnsOutput_3 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_3 : std_logic;
  signal zz_io_mixColumnsOutput_4 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_4 : std_logic;
  signal zz_io_mixColumnsOutput_5 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_5 : std_logic;
  signal zz_io_mixColumnsOutput_6 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_6 : std_logic;
  signal zz_io_mixColumnsOutput_7 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l29_7 : std_logic;
begin
  a0 <= pkg_extract(io_mixColumnsInput,31,24);
  a1 <= pkg_extract(io_mixColumnsInput,23,16);
  a2 <= pkg_extract(io_mixColumnsInput,15,8);
  a3 <= pkg_extract(io_mixColumnsInput,7,0);
  when_MixColumns_l29 <= pkg_extract(a0,7);
  process(when_MixColumns_l29,a0)
  begin
    if when_MixColumns_l29 = '1' then
      zz_io_mixColumnsOutput <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l29_1 <= pkg_extract(a1,7);
  process(when_MixColumns_l29_1,a1)
  begin
    if when_MixColumns_l29_1 = '1' then
      zz_io_mixColumnsOutput_1 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_1 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  process(zz_io_mixColumnsOutput,zz_io_mixColumnsOutput_1,a1,a2,a3,a0,zz_io_mixColumnsOutput_2,zz_io_mixColumnsOutput_3,zz_io_mixColumnsOutput_4,zz_io_mixColumnsOutput_5,zz_io_mixColumnsOutput_6,zz_io_mixColumnsOutput_7)
  begin
    io_mixColumnsOutput(31 downto 24) <= (((pkg_extract(zz_io_mixColumnsOutput,7,0) xor (pkg_extract(zz_io_mixColumnsOutput_1,7,0) xor a1)) xor a2) xor a3);
    io_mixColumnsOutput(23 downto 16) <= (((a0 xor pkg_extract(zz_io_mixColumnsOutput_2,7,0)) xor (pkg_extract(zz_io_mixColumnsOutput_3,7,0) xor a2)) xor a3);
    io_mixColumnsOutput(15 downto 8) <= (((a0 xor a1) xor pkg_extract(zz_io_mixColumnsOutput_4,7,0)) xor (pkg_extract(zz_io_mixColumnsOutput_5,7,0) xor a3));
    io_mixColumnsOutput(7 downto 0) <= ((((pkg_extract(zz_io_mixColumnsOutput_6,7,0) xor a0) xor a1) xor a2) xor pkg_extract(zz_io_mixColumnsOutput_7,7,0));
  end process;

  when_MixColumns_l29_2 <= pkg_extract(a1,7);
  process(when_MixColumns_l29_2,a1)
  begin
    if when_MixColumns_l29_2 = '1' then
      zz_io_mixColumnsOutput_2 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_2 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  when_MixColumns_l29_3 <= pkg_extract(a2,7);
  process(when_MixColumns_l29_3,a2)
  begin
    if when_MixColumns_l29_3 = '1' then
      zz_io_mixColumnsOutput_3 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_3 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l29_4 <= pkg_extract(a2,7);
  process(when_MixColumns_l29_4,a2)
  begin
    if when_MixColumns_l29_4 = '1' then
      zz_io_mixColumnsOutput_4 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_4 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l29_5 <= pkg_extract(a3,7);
  process(when_MixColumns_l29_5,a3)
  begin
    if when_MixColumns_l29_5 = '1' then
      zz_io_mixColumnsOutput_5 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_5 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  when_MixColumns_l29_6 <= pkg_extract(a0,7);
  process(when_MixColumns_l29_6,a0)
  begin
    if when_MixColumns_l29_6 = '1' then
      zz_io_mixColumnsOutput_6 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_6 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l29_7 <= pkg_extract(a3,7);
  process(when_MixColumns_l29_7,a3)
  begin
    if when_MixColumns_l29_7 = '1' then
      zz_io_mixColumnsOutput_7 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_7 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

end arch;


--MixColumns_1 replaced by MixColumns


--MixColumns_2 replaced by MixColumns


--MixColumns_3 replaced by MixColumns


--MixColumns_4 replaced by MixColumns


--MixColumns_5 replaced by MixColumns


--MixColumns_6 replaced by MixColumns


--MixColumns_7 replaced by MixColumns

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KeyScheduleMasked is
  port(
    io_keyScheduleInput_0 : in std_logic_vector(127 downto 0);
    io_keyScheduleInput_1 : in std_logic_vector(127 downto 0);
    io_m : in std_logic_vector(31 downto 0);
    io_RC : in std_logic_vector(7 downto 0);
    io_keyScheduleOutput_0 : out std_logic_vector(127 downto 0);
    io_keyScheduleOutput_1 : out std_logic_vector(127 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end KeyScheduleMasked;

architecture arch of KeyScheduleMasked is
  signal canrightSBoxMasked_20_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_20_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_20_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_20_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_Q : std_logic_vector(7 downto 0);

  signal w1 : std_logic_vector(31 downto 0);
  signal w2 : std_logic_vector(31 downto 0);
  signal w3 : std_logic_vector(31 downto 0);
  signal w4 : std_logic_vector(31 downto 0);
  signal SB : std_logic_vector(31 downto 0);
  signal m1 : std_logic_vector(31 downto 0);
  signal m2 : std_logic_vector(31 downto 0);
  signal m3 : std_logic_vector(31 downto 0);
  signal m4 : std_logic_vector(31 downto 0);
begin
  canrightSBoxMasked_20 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_20_io_A,
      io_M => canrightSBoxMasked_20_io_M,
      io_S => canrightSBoxMasked_20_io_S,
      io_Q => canrightSBoxMasked_20_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_21 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_21_io_A,
      io_M => canrightSBoxMasked_21_io_M,
      io_S => canrightSBoxMasked_21_io_S,
      io_Q => canrightSBoxMasked_21_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_22 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_22_io_A,
      io_M => canrightSBoxMasked_22_io_M,
      io_S => canrightSBoxMasked_22_io_S,
      io_Q => canrightSBoxMasked_22_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_23 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_23_io_A,
      io_M => canrightSBoxMasked_23_io_M,
      io_S => canrightSBoxMasked_23_io_S,
      io_Q => canrightSBoxMasked_23_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_20_io_A <= pkg_extract(io_keyScheduleInput_0,31,24);
  canrightSBoxMasked_20_io_M <= pkg_extract(io_keyScheduleInput_1,31,24);
  canrightSBoxMasked_20_io_S <= pkg_extract(io_m,31,24);
  process(canrightSBoxMasked_20_io_Q,canrightSBoxMasked_21_io_Q,canrightSBoxMasked_22_io_Q,canrightSBoxMasked_23_io_Q)
  begin
    SB(31 downto 24) <= canrightSBoxMasked_20_io_Q;
    SB(23 downto 16) <= canrightSBoxMasked_21_io_Q;
    SB(15 downto 8) <= canrightSBoxMasked_22_io_Q;
    SB(7 downto 0) <= canrightSBoxMasked_23_io_Q;
  end process;

  canrightSBoxMasked_21_io_A <= pkg_extract(io_keyScheduleInput_0,23,16);
  canrightSBoxMasked_21_io_M <= pkg_extract(io_keyScheduleInput_1,23,16);
  canrightSBoxMasked_21_io_S <= pkg_extract(io_m,23,16);
  canrightSBoxMasked_22_io_A <= pkg_extract(io_keyScheduleInput_0,15,8);
  canrightSBoxMasked_22_io_M <= pkg_extract(io_keyScheduleInput_1,15,8);
  canrightSBoxMasked_22_io_S <= pkg_extract(io_m,15,8);
  canrightSBoxMasked_23_io_A <= pkg_extract(io_keyScheduleInput_0,7,0);
  canrightSBoxMasked_23_io_M <= pkg_extract(io_keyScheduleInput_1,7,0);
  canrightSBoxMasked_23_io_S <= pkg_extract(io_m,7,0);
  w1 <= ((pkg_extract(io_keyScheduleInput_0,127,96) xor pkg_cat(pkg_extract(SB,23,0),pkg_extract(SB,31,24))) xor pkg_cat(io_RC,pkg_stdLogicVector("000000000000000000000000")));
  w2 <= (pkg_extract(io_keyScheduleInput_0,95,64) xor w1);
  w3 <= (pkg_extract(io_keyScheduleInput_0,63,32) xor w2);
  w4 <= (pkg_extract(io_keyScheduleInput_0,31,0) xor w3);
  m1 <= (pkg_extract(io_keyScheduleInput_1,127,96) xor pkg_cat(pkg_extract(io_m,23,0),pkg_extract(io_m,31,24)));
  m2 <= (pkg_extract(io_keyScheduleInput_1,95,64) xor m1);
  m3 <= (pkg_extract(io_keyScheduleInput_1,63,32) xor m2);
  m4 <= (pkg_extract(io_keyScheduleInput_1,31,0) xor m3);
  io_keyScheduleOutput_0 <= pkg_cat(pkg_cat(pkg_cat(w1,w2),w3),w4);
  io_keyScheduleOutput_1 <= pkg_cat(pkg_cat(pkg_cat(m1,m2),m3),m4);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AESEncryptMasked is
  port(
    io_reset : in std_logic;
    io_p_0 : in std_logic_vector(127 downto 0);
    io_p_1 : in std_logic_vector(127 downto 0);
    io_k_0 : in std_logic_vector(127 downto 0);
    io_k_1 : in std_logic_vector(127 downto 0);
    io_m : in std_logic_vector(159 downto 0);
    io_c_0 : out std_logic_vector(127 downto 0);
    io_c_1 : out std_logic_vector(127 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end AESEncryptMasked;

architecture arch of AESEncryptMasked is
  signal canrightSBoxMasked_20_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_20_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_20_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_24_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_24_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_24_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_25_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_25_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_25_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_26_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_26_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_26_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_27_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_27_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_27_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_28_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_28_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_28_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_29_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_29_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_29_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_30_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_30_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_30_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_31_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_31_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_31_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_32_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_32_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_32_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_33_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_33_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_33_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_34_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_34_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_34_io_S : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_35_io_A : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_35_io_M : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_35_io_S : std_logic_vector(7 downto 0);
  signal mixColumns_8_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_9_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_10_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_11_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_12_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_13_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_14_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_15_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal keySchedule_io_m : std_logic_vector(31 downto 0);
  signal addKey_io_b_0 : std_logic_vector(127 downto 0);
  signal addKey_io_b_1 : std_logic_vector(127 downto 0);
  signal canrightSBoxMasked_20_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_21_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_22_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_23_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_24_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_25_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_26_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_27_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_28_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_29_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_30_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_31_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_32_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_33_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_34_io_Q : std_logic_vector(7 downto 0);
  signal canrightSBoxMasked_35_io_Q : std_logic_vector(7 downto 0);
  signal shiftRows_2_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal shiftRows_3_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal mixColumns_8_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_9_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_10_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_11_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_12_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_13_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_14_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_15_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal keySchedule_io_keyScheduleOutput_0 : std_logic_vector(127 downto 0);
  signal keySchedule_io_keyScheduleOutput_1 : std_logic_vector(127 downto 0);

  signal stateRegister_0 : std_logic_vector(127 downto 0);
  signal stateRegister_1 : std_logic_vector(127 downto 0);
  signal keyRegister_0 : std_logic_vector(127 downto 0);
  signal keyRegister_1 : std_logic_vector(127 downto 0);
  signal round : unsigned(3 downto 0);
  signal roundConstant : std_logic_vector(7 downto 0);
  signal incRC : std_logic;
  signal lastRound : std_logic;
  signal KA_0 : std_logic_vector(127 downto 0);
  signal KA_1 : std_logic_vector(127 downto 0);
  signal SB_0 : std_logic_vector(127 downto 0);
  signal SB_1 : std_logic_vector(127 downto 0);
  signal SR_0 : std_logic_vector(127 downto 0);
  signal SR_1 : std_logic_vector(127 downto 0);
  signal MC_0 : std_logic_vector(127 downto 0);
  signal MC_1 : std_logic_vector(127 downto 0);
  signal when_AESEncryptMasked_l83 : std_logic;
  signal when_AESEncryptMasked_l93 : std_logic;
  signal io_reset_regNext : std_logic;
  signal when_AESEncryptMasked_l103 : std_logic;
  signal lastRound_regNext : std_logic;
  signal when_AESEncryptMasked_l114 : std_logic;
begin
  addKey : entity work.AddRoundKeyMasked
    port map ( 
      io_a_0 => stateRegister_0,
      io_a_1 => stateRegister_1,
      io_k_0 => keyRegister_0,
      io_k_1 => keyRegister_1,
      io_b_0 => addKey_io_b_0,
      io_b_1 => addKey_io_b_1 
    );
  canrightSBoxMasked_20 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_20_io_A,
      io_M => canrightSBoxMasked_20_io_M,
      io_S => canrightSBoxMasked_20_io_S,
      io_Q => canrightSBoxMasked_20_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_21 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_21_io_A,
      io_M => canrightSBoxMasked_21_io_M,
      io_S => canrightSBoxMasked_21_io_S,
      io_Q => canrightSBoxMasked_21_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_22 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_22_io_A,
      io_M => canrightSBoxMasked_22_io_M,
      io_S => canrightSBoxMasked_22_io_S,
      io_Q => canrightSBoxMasked_22_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_23 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_23_io_A,
      io_M => canrightSBoxMasked_23_io_M,
      io_S => canrightSBoxMasked_23_io_S,
      io_Q => canrightSBoxMasked_23_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_24 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_24_io_A,
      io_M => canrightSBoxMasked_24_io_M,
      io_S => canrightSBoxMasked_24_io_S,
      io_Q => canrightSBoxMasked_24_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_25 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_25_io_A,
      io_M => canrightSBoxMasked_25_io_M,
      io_S => canrightSBoxMasked_25_io_S,
      io_Q => canrightSBoxMasked_25_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_26 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_26_io_A,
      io_M => canrightSBoxMasked_26_io_M,
      io_S => canrightSBoxMasked_26_io_S,
      io_Q => canrightSBoxMasked_26_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_27 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_27_io_A,
      io_M => canrightSBoxMasked_27_io_M,
      io_S => canrightSBoxMasked_27_io_S,
      io_Q => canrightSBoxMasked_27_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_28 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_28_io_A,
      io_M => canrightSBoxMasked_28_io_M,
      io_S => canrightSBoxMasked_28_io_S,
      io_Q => canrightSBoxMasked_28_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_29 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_29_io_A,
      io_M => canrightSBoxMasked_29_io_M,
      io_S => canrightSBoxMasked_29_io_S,
      io_Q => canrightSBoxMasked_29_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_30 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_30_io_A,
      io_M => canrightSBoxMasked_30_io_M,
      io_S => canrightSBoxMasked_30_io_S,
      io_Q => canrightSBoxMasked_30_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_31 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_31_io_A,
      io_M => canrightSBoxMasked_31_io_M,
      io_S => canrightSBoxMasked_31_io_S,
      io_Q => canrightSBoxMasked_31_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_32 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_32_io_A,
      io_M => canrightSBoxMasked_32_io_M,
      io_S => canrightSBoxMasked_32_io_S,
      io_Q => canrightSBoxMasked_32_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_33 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_33_io_A,
      io_M => canrightSBoxMasked_33_io_M,
      io_S => canrightSBoxMasked_33_io_S,
      io_Q => canrightSBoxMasked_33_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_34 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_34_io_A,
      io_M => canrightSBoxMasked_34_io_M,
      io_S => canrightSBoxMasked_34_io_S,
      io_Q => canrightSBoxMasked_34_io_Q,
      clk => clk,
      reset => reset 
    );
  canrightSBoxMasked_35 : entity work.CanrightSBoxMasked
    port map ( 
      io_A => canrightSBoxMasked_35_io_A,
      io_M => canrightSBoxMasked_35_io_M,
      io_S => canrightSBoxMasked_35_io_S,
      io_Q => canrightSBoxMasked_35_io_Q,
      clk => clk,
      reset => reset 
    );
  shiftRows_2 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => SB_0,
      io_shiftRowsOutput => shiftRows_2_io_shiftRowsOutput 
    );
  shiftRows_3 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => SB_1,
      io_shiftRowsOutput => shiftRows_3_io_shiftRowsOutput 
    );
  mixColumns_8 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_8_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_8_io_mixColumnsOutput 
    );
  mixColumns_9 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_9_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_9_io_mixColumnsOutput 
    );
  mixColumns_10 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_10_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_10_io_mixColumnsOutput 
    );
  mixColumns_11 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_11_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_11_io_mixColumnsOutput 
    );
  mixColumns_12 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_12_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_12_io_mixColumnsOutput 
    );
  mixColumns_13 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_13_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_13_io_mixColumnsOutput 
    );
  mixColumns_14 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_14_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_14_io_mixColumnsOutput 
    );
  mixColumns_15 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_15_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_15_io_mixColumnsOutput 
    );
  keySchedule : entity work.KeyScheduleMasked
    port map ( 
      io_keyScheduleInput_0 => keyRegister_0,
      io_keyScheduleInput_1 => keyRegister_1,
      io_m => keySchedule_io_m,
      io_RC => roundConstant,
      io_keyScheduleOutput_0 => keySchedule_io_keyScheduleOutput_0,
      io_keyScheduleOutput_1 => keySchedule_io_keyScheduleOutput_1,
      clk => clk,
      reset => reset 
    );
  KA_0 <= addKey_io_b_0;
  KA_1 <= addKey_io_b_1;
  canrightSBoxMasked_20_io_A <= pkg_extract(KA_0,7,0);
  canrightSBoxMasked_20_io_M <= pkg_extract(KA_1,7,0);
  canrightSBoxMasked_20_io_S <= pkg_extract(io_m,159,152);
  process(io_m)
  begin
    SB_1(7 downto 0) <= pkg_extract(io_m,159,152);
    SB_1(15 downto 8) <= pkg_extract(io_m,151,144);
    SB_1(23 downto 16) <= pkg_extract(io_m,143,136);
    SB_1(31 downto 24) <= pkg_extract(io_m,135,128);
    SB_1(39 downto 32) <= pkg_extract(io_m,127,120);
    SB_1(47 downto 40) <= pkg_extract(io_m,119,112);
    SB_1(55 downto 48) <= pkg_extract(io_m,111,104);
    SB_1(63 downto 56) <= pkg_extract(io_m,103,96);
    SB_1(71 downto 64) <= pkg_extract(io_m,95,88);
    SB_1(79 downto 72) <= pkg_extract(io_m,87,80);
    SB_1(87 downto 80) <= pkg_extract(io_m,79,72);
    SB_1(95 downto 88) <= pkg_extract(io_m,71,64);
    SB_1(103 downto 96) <= pkg_extract(io_m,63,56);
    SB_1(111 downto 104) <= pkg_extract(io_m,55,48);
    SB_1(119 downto 112) <= pkg_extract(io_m,47,40);
    SB_1(127 downto 120) <= pkg_extract(io_m,39,32);
  end process;

  process(canrightSBoxMasked_20_io_Q,canrightSBoxMasked_21_io_Q,canrightSBoxMasked_22_io_Q,canrightSBoxMasked_23_io_Q,canrightSBoxMasked_24_io_Q,canrightSBoxMasked_25_io_Q,canrightSBoxMasked_26_io_Q,canrightSBoxMasked_27_io_Q,canrightSBoxMasked_28_io_Q,canrightSBoxMasked_29_io_Q,canrightSBoxMasked_30_io_Q,canrightSBoxMasked_31_io_Q,canrightSBoxMasked_32_io_Q,canrightSBoxMasked_33_io_Q,canrightSBoxMasked_34_io_Q,canrightSBoxMasked_35_io_Q)
  begin
    SB_0(7 downto 0) <= canrightSBoxMasked_20_io_Q;
    SB_0(15 downto 8) <= canrightSBoxMasked_21_io_Q;
    SB_0(23 downto 16) <= canrightSBoxMasked_22_io_Q;
    SB_0(31 downto 24) <= canrightSBoxMasked_23_io_Q;
    SB_0(39 downto 32) <= canrightSBoxMasked_24_io_Q;
    SB_0(47 downto 40) <= canrightSBoxMasked_25_io_Q;
    SB_0(55 downto 48) <= canrightSBoxMasked_26_io_Q;
    SB_0(63 downto 56) <= canrightSBoxMasked_27_io_Q;
    SB_0(71 downto 64) <= canrightSBoxMasked_28_io_Q;
    SB_0(79 downto 72) <= canrightSBoxMasked_29_io_Q;
    SB_0(87 downto 80) <= canrightSBoxMasked_30_io_Q;
    SB_0(95 downto 88) <= canrightSBoxMasked_31_io_Q;
    SB_0(103 downto 96) <= canrightSBoxMasked_32_io_Q;
    SB_0(111 downto 104) <= canrightSBoxMasked_33_io_Q;
    SB_0(119 downto 112) <= canrightSBoxMasked_34_io_Q;
    SB_0(127 downto 120) <= canrightSBoxMasked_35_io_Q;
  end process;

  canrightSBoxMasked_21_io_A <= pkg_extract(KA_0,15,8);
  canrightSBoxMasked_21_io_M <= pkg_extract(KA_1,15,8);
  canrightSBoxMasked_21_io_S <= pkg_extract(io_m,151,144);
  canrightSBoxMasked_22_io_A <= pkg_extract(KA_0,23,16);
  canrightSBoxMasked_22_io_M <= pkg_extract(KA_1,23,16);
  canrightSBoxMasked_22_io_S <= pkg_extract(io_m,143,136);
  canrightSBoxMasked_23_io_A <= pkg_extract(KA_0,31,24);
  canrightSBoxMasked_23_io_M <= pkg_extract(KA_1,31,24);
  canrightSBoxMasked_23_io_S <= pkg_extract(io_m,135,128);
  canrightSBoxMasked_24_io_A <= pkg_extract(KA_0,39,32);
  canrightSBoxMasked_24_io_M <= pkg_extract(KA_1,39,32);
  canrightSBoxMasked_24_io_S <= pkg_extract(io_m,127,120);
  canrightSBoxMasked_25_io_A <= pkg_extract(KA_0,47,40);
  canrightSBoxMasked_25_io_M <= pkg_extract(KA_1,47,40);
  canrightSBoxMasked_25_io_S <= pkg_extract(io_m,119,112);
  canrightSBoxMasked_26_io_A <= pkg_extract(KA_0,55,48);
  canrightSBoxMasked_26_io_M <= pkg_extract(KA_1,55,48);
  canrightSBoxMasked_26_io_S <= pkg_extract(io_m,111,104);
  canrightSBoxMasked_27_io_A <= pkg_extract(KA_0,63,56);
  canrightSBoxMasked_27_io_M <= pkg_extract(KA_1,63,56);
  canrightSBoxMasked_27_io_S <= pkg_extract(io_m,103,96);
  canrightSBoxMasked_28_io_A <= pkg_extract(KA_0,71,64);
  canrightSBoxMasked_28_io_M <= pkg_extract(KA_1,71,64);
  canrightSBoxMasked_28_io_S <= pkg_extract(io_m,95,88);
  canrightSBoxMasked_29_io_A <= pkg_extract(KA_0,79,72);
  canrightSBoxMasked_29_io_M <= pkg_extract(KA_1,79,72);
  canrightSBoxMasked_29_io_S <= pkg_extract(io_m,87,80);
  canrightSBoxMasked_30_io_A <= pkg_extract(KA_0,87,80);
  canrightSBoxMasked_30_io_M <= pkg_extract(KA_1,87,80);
  canrightSBoxMasked_30_io_S <= pkg_extract(io_m,79,72);
  canrightSBoxMasked_31_io_A <= pkg_extract(KA_0,95,88);
  canrightSBoxMasked_31_io_M <= pkg_extract(KA_1,95,88);
  canrightSBoxMasked_31_io_S <= pkg_extract(io_m,71,64);
  canrightSBoxMasked_32_io_A <= pkg_extract(KA_0,103,96);
  canrightSBoxMasked_32_io_M <= pkg_extract(KA_1,103,96);
  canrightSBoxMasked_32_io_S <= pkg_extract(io_m,63,56);
  canrightSBoxMasked_33_io_A <= pkg_extract(KA_0,111,104);
  canrightSBoxMasked_33_io_M <= pkg_extract(KA_1,111,104);
  canrightSBoxMasked_33_io_S <= pkg_extract(io_m,55,48);
  canrightSBoxMasked_34_io_A <= pkg_extract(KA_0,119,112);
  canrightSBoxMasked_34_io_M <= pkg_extract(KA_1,119,112);
  canrightSBoxMasked_34_io_S <= pkg_extract(io_m,47,40);
  canrightSBoxMasked_35_io_A <= pkg_extract(KA_0,127,120);
  canrightSBoxMasked_35_io_M <= pkg_extract(KA_1,127,120);
  canrightSBoxMasked_35_io_S <= pkg_extract(io_m,39,32);
  SR_0 <= shiftRows_2_io_shiftRowsOutput;
  SR_1 <= shiftRows_3_io_shiftRowsOutput;
  mixColumns_8_io_mixColumnsInput <= pkg_extract(SR_0,31,0);
  process(mixColumns_8_io_mixColumnsOutput,mixColumns_9_io_mixColumnsOutput,mixColumns_10_io_mixColumnsOutput,mixColumns_11_io_mixColumnsOutput)
  begin
    MC_0(31 downto 0) <= mixColumns_8_io_mixColumnsOutput;
    MC_0(63 downto 32) <= mixColumns_9_io_mixColumnsOutput;
    MC_0(95 downto 64) <= mixColumns_10_io_mixColumnsOutput;
    MC_0(127 downto 96) <= mixColumns_11_io_mixColumnsOutput;
  end process;

  mixColumns_9_io_mixColumnsInput <= pkg_extract(SR_0,63,32);
  mixColumns_10_io_mixColumnsInput <= pkg_extract(SR_0,95,64);
  mixColumns_11_io_mixColumnsInput <= pkg_extract(SR_0,127,96);
  mixColumns_12_io_mixColumnsInput <= pkg_extract(SR_1,31,0);
  process(mixColumns_12_io_mixColumnsOutput,mixColumns_13_io_mixColumnsOutput,mixColumns_14_io_mixColumnsOutput,mixColumns_15_io_mixColumnsOutput)
  begin
    MC_1(31 downto 0) <= mixColumns_12_io_mixColumnsOutput;
    MC_1(63 downto 32) <= mixColumns_13_io_mixColumnsOutput;
    MC_1(95 downto 64) <= mixColumns_14_io_mixColumnsOutput;
    MC_1(127 downto 96) <= mixColumns_15_io_mixColumnsOutput;
  end process;

  mixColumns_13_io_mixColumnsInput <= pkg_extract(SR_1,63,32);
  mixColumns_14_io_mixColumnsInput <= pkg_extract(SR_1,95,64);
  mixColumns_15_io_mixColumnsInput <= pkg_extract(SR_1,127,96);
  keySchedule_io_m <= pkg_extract(io_m,31,0);
  when_AESEncryptMasked_l83 <= pkg_toStdLogic(unsigned(roundConstant) < pkg_unsigned("10000000"));
  when_AESEncryptMasked_l93 <= pkg_toStdLogic(round = pkg_unsigned("1001"));
  when_AESEncryptMasked_l103 <= ((not io_reset) and io_reset_regNext);
  io_c_0 <= KA_0;
  io_c_1 <= KA_1;
  when_AESEncryptMasked_l114 <= ((not lastRound) and lastRound_regNext);
  process(when_AESEncryptMasked_l114)
  begin
    if when_AESEncryptMasked_l114 = '1' then
      io_done <= pkg_toStdLogic(true);
    else
      io_done <= pkg_toStdLogic(false);
    end if;
  end process;

  process(clk, reset)
  begin
    if reset = '1' then
      stateRegister_0 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      stateRegister_1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyRegister_0 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyRegister_1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      round <= pkg_unsigned("0000");
      roundConstant <= pkg_stdLogicVector("00000001");
      incRC <= pkg_toStdLogic(false);
      lastRound <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      keyRegister_0 <= keySchedule_io_keyScheduleOutput_0;
      keyRegister_1 <= keySchedule_io_keyScheduleOutput_1;
      if io_reset = '1' then
        round <= pkg_unsigned("0000");
        lastRound <= pkg_toStdLogic(false);
        incRC <= pkg_toStdLogic(false);
      else
        round <= (round + pkg_unsigned("0001"));
        incRC <= pkg_toStdLogic(true);
      end if;
      if incRC = '1' then
        if when_AESEncryptMasked_l83 = '1' then
          roundConstant <= pkg_extract(pkg_shiftLeft(roundConstant,1),7,0);
        else
          roundConstant <= (pkg_extract(pkg_shiftLeft(roundConstant,1),7,0) xor pkg_stdLogicVector("00011011"));
        end if;
      else
        roundConstant <= pkg_stdLogicVector("00000001");
      end if;
      if when_AESEncryptMasked_l93 = '1' then
        lastRound <= pkg_toStdLogic(true);
      else
        lastRound <= pkg_toStdLogic(false);
      end if;
      if when_AESEncryptMasked_l103 = '1' then
        stateRegister_0 <= io_p_0;
        stateRegister_1 <= io_p_1;
        keyRegister_0 <= io_k_0;
        keyRegister_1 <= io_k_1;
      else
        if lastRound = '1' then
          stateRegister_0 <= SR_0;
          stateRegister_1 <= SR_1;
        else
          stateRegister_0 <= MC_0;
          stateRegister_1 <= MC_1;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      io_reset_regNext <= io_reset;
      lastRound_regNext <= lastRound;
    end if;
  end process;

end arch;

