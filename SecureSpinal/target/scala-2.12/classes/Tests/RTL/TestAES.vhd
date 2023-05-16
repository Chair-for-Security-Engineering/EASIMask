-- Generator : SpinalHDL v1.6.2    git head : 85cae432eceede8556a3d1c01b9034bca87c9af9
-- Component : TestAES
-- Git hash  : b35dce327aac7da3d63fe591d87ab216ac6ce79b

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


entity SBox is
  port(
    io_a : in std_logic_vector(7 downto 0);
    io_b : out std_logic_vector(7 downto 0)
  );
end SBox;

architecture arch of SBox is

begin
  io_b <= pkg_not(io_a);
end arch;


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox


--SBox replaced by SBox

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity TestAES is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_done : out std_logic;
    io_p_0 : in std_logic_vector(127 downto 0);
    io_p_1 : in std_logic_vector(127 downto 0);
    io_k_0 : in std_logic_vector(127 downto 0);
    io_k_1 : in std_logic_vector(127 downto 0);
    io_c_0 : out std_logic_vector(127 downto 0);
    io_c_1 : out std_logic_vector(127 downto 0);
    io_m : in std_logic_vector(191 downto 0)
  );
end TestAES;

architecture arch of TestAES is
  signal sBox_0_io_a : std_logic_vector(7 downto 0);
  signal sBox_1_io_a : std_logic_vector(7 downto 0);
  signal sBox_2_io_a : std_logic_vector(7 downto 0);
  signal sBox_3_io_a : std_logic_vector(7 downto 0);
  signal sBox_4_io_a : std_logic_vector(7 downto 0);
  signal sBox_5_io_a : std_logic_vector(7 downto 0);
  signal sBox_6_io_a : std_logic_vector(7 downto 0);
  signal sBox_7_io_a : std_logic_vector(7 downto 0);
  signal sBox_8_io_a : std_logic_vector(7 downto 0);
  signal sBox_9_io_a : std_logic_vector(7 downto 0);
  signal sBox_10_io_a : std_logic_vector(7 downto 0);
  signal sBox_11_io_a : std_logic_vector(7 downto 0);
  signal sBox_12_io_a : std_logic_vector(7 downto 0);
  signal sBox_13_io_a : std_logic_vector(7 downto 0);
  signal sBox_14_io_a : std_logic_vector(7 downto 0);
  signal sBox_15_io_a : std_logic_vector(7 downto 0);
  signal mixColumns_0_0_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_0_1_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_1_0_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_1_1_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_2_0_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_2_1_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_3_0_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_3_1_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal sBox_0_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_0_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_0_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_1_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_1_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_1_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_2_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_2_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_2_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_3_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_3_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_3_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_4_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_4_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_4_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_5_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_5_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_5_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_6_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_6_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_6_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_7_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_7_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_7_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_8_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_8_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_8_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_9_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_9_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_9_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_10_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_10_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_10_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_11_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_11_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_11_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_12_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_12_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_12_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_13_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_13_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_13_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_14_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_14_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_14_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_15_Masked_io_a_0 : std_logic_vector(7 downto 0);
  signal sBox_15_Masked_io_a_1 : std_logic_vector(7 downto 0);
  signal sBox_15_Masked_io_m : std_logic_vector(11 downto 0);
  signal sBox_0_io_b : std_logic_vector(7 downto 0);
  signal sBox_1_io_b : std_logic_vector(7 downto 0);
  signal sBox_2_io_b : std_logic_vector(7 downto 0);
  signal sBox_3_io_b : std_logic_vector(7 downto 0);
  signal sBox_4_io_b : std_logic_vector(7 downto 0);
  signal sBox_5_io_b : std_logic_vector(7 downto 0);
  signal sBox_6_io_b : std_logic_vector(7 downto 0);
  signal sBox_7_io_b : std_logic_vector(7 downto 0);
  signal sBox_8_io_b : std_logic_vector(7 downto 0);
  signal sBox_9_io_b : std_logic_vector(7 downto 0);
  signal sBox_10_io_b : std_logic_vector(7 downto 0);
  signal sBox_11_io_b : std_logic_vector(7 downto 0);
  signal sBox_12_io_b : std_logic_vector(7 downto 0);
  signal sBox_13_io_b : std_logic_vector(7 downto 0);
  signal sBox_14_io_b : std_logic_vector(7 downto 0);
  signal sBox_15_io_b : std_logic_vector(7 downto 0);
  signal r_addroundkey_0_io_akOut : std_logic_vector(127 downto 0);
  signal r_addroundkey_1_io_akOut : std_logic_vector(127 downto 0);
  signal r_shiftrows_0_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal r_shiftrows_1_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal mixColumns_0_0_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_0_1_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_1_0_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_1_1_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_2_0_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_2_1_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_3_0_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_3_1_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal sBox_0_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_0_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_1_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_1_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_2_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_2_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_3_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_3_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_4_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_4_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_5_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_5_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_6_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_6_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_7_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_7_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_8_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_8_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_9_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_9_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_10_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_10_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_11_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_11_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_12_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_12_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_13_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_13_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_14_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_14_Masked_io_b_1 : std_logic_vector(7 downto 0);
  signal sBox_15_Masked_io_b_0 : std_logic_vector(7 downto 0);
  signal sBox_15_Masked_io_b_1 : std_logic_vector(7 downto 0);

  signal r_stateReg_0 : std_logic_vector(127 downto 0);
  signal r_stateReg_1 : std_logic_vector(127 downto 0);
  signal r_keyReg_0 : std_logic_vector(127 downto 0);
  signal r_keyReg_1 : std_logic_vector(127 downto 0);
  signal r_sBoxOut_0 : std_logic_vector(127 downto 0);
  signal r_sBoxOut_1 : std_logic_vector(127 downto 0);
  signal r_shiftRowsOut_0 : std_logic_vector(127 downto 0);
  signal r_shiftRowsOut_1 : std_logic_vector(127 downto 0);
  signal r_addRoundKeyOut_0 : std_logic_vector(127 downto 0);
  signal r_addRoundKeyOut_1 : std_logic_vector(127 downto 0);
  signal r_mixColumnsOut_0 : std_logic_vector(127 downto 0);
  signal r_mixColumnsOut_1 : std_logic_vector(127 downto 0);
begin
  sBox_0 : entity work.SBox
    port map ( 
      io_a => sBox_0_io_a,
      io_b => sBox_0_io_b 
    );
  sBox_1 : entity work.SBox
    port map ( 
      io_a => sBox_1_io_a,
      io_b => sBox_1_io_b 
    );
  sBox_2 : entity work.SBox
    port map ( 
      io_a => sBox_2_io_a,
      io_b => sBox_2_io_b 
    );
  sBox_3 : entity work.SBox
    port map ( 
      io_a => sBox_3_io_a,
      io_b => sBox_3_io_b 
    );
  sBox_4 : entity work.SBox
    port map ( 
      io_a => sBox_4_io_a,
      io_b => sBox_4_io_b 
    );
  sBox_5 : entity work.SBox
    port map ( 
      io_a => sBox_5_io_a,
      io_b => sBox_5_io_b 
    );
  sBox_6 : entity work.SBox
    port map ( 
      io_a => sBox_6_io_a,
      io_b => sBox_6_io_b 
    );
  sBox_7 : entity work.SBox
    port map ( 
      io_a => sBox_7_io_a,
      io_b => sBox_7_io_b 
    );
  sBox_8 : entity work.SBox
    port map ( 
      io_a => sBox_8_io_a,
      io_b => sBox_8_io_b 
    );
  sBox_9 : entity work.SBox
    port map ( 
      io_a => sBox_9_io_a,
      io_b => sBox_9_io_b 
    );
  sBox_10 : entity work.SBox
    port map ( 
      io_a => sBox_10_io_a,
      io_b => sBox_10_io_b 
    );
  sBox_11 : entity work.SBox
    port map ( 
      io_a => sBox_11_io_a,
      io_b => sBox_11_io_b 
    );
  sBox_12 : entity work.SBox
    port map ( 
      io_a => sBox_12_io_a,
      io_b => sBox_12_io_b 
    );
  sBox_13 : entity work.SBox
    port map ( 
      io_a => sBox_13_io_a,
      io_b => sBox_13_io_b 
    );
  sBox_14 : entity work.SBox
    port map ( 
      io_a => sBox_14_io_a,
      io_b => sBox_14_io_b 
    );
  sBox_15 : entity work.SBox
    port map ( 
      io_a => sBox_15_io_a,
      io_b => sBox_15_io_b 
    );
  r_addroundkey_0 : entity work.AddRoundKey
    port map ( 
      io_akIn => r_stateReg_0,
      io_rk => r_keyReg_0,
      io_akOut => r_addroundkey_0_io_akOut 
    );
  r_addroundkey_1 : entity work.AddRoundKey
    port map ( 
      io_akIn => r_stateReg_1,
      io_rk => r_keyReg_1,
      io_akOut => r_addroundkey_1_io_akOut 
    );
  r_shiftrows_0 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_sBoxOut_0,
      io_shiftRowsOutput => r_shiftrows_0_io_shiftRowsOutput 
    );
  r_shiftrows_1 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_sBoxOut_1,
      io_shiftRowsOutput => r_shiftrows_1_io_shiftRowsOutput 
    );
  mixColumns_0_0 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_0_0_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_0_0_io_mixColumnsOutput 
    );
  mixColumns_0_1 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_0_1_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_0_1_io_mixColumnsOutput 
    );
  mixColumns_1_0 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_1_0_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_1_0_io_mixColumnsOutput 
    );
  mixColumns_1_1 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_1_1_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_1_1_io_mixColumnsOutput 
    );
  mixColumns_2_0 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_2_0_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_2_0_io_mixColumnsOutput 
    );
  mixColumns_2_1 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_2_1_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_2_1_io_mixColumnsOutput 
    );
  mixColumns_3_0 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_3_0_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_3_0_io_mixColumnsOutput 
    );
  mixColumns_3_1 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_3_1_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_3_1_io_mixColumnsOutput 
    );
  sBox_0_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_0_Masked_io_a_0,
      io_a_1 => sBox_0_Masked_io_a_1,
      io_m => sBox_0_Masked_io_m,
      io_b_0 => sBox_0_Masked_io_b_0,
      io_b_1 => sBox_0_Masked_io_b_1 
    );
  sBox_1_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_1_Masked_io_a_0,
      io_a_1 => sBox_1_Masked_io_a_1,
      io_m => sBox_1_Masked_io_m,
      io_b_0 => sBox_1_Masked_io_b_0,
      io_b_1 => sBox_1_Masked_io_b_1 
    );
  sBox_2_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_2_Masked_io_a_0,
      io_a_1 => sBox_2_Masked_io_a_1,
      io_m => sBox_2_Masked_io_m,
      io_b_0 => sBox_2_Masked_io_b_0,
      io_b_1 => sBox_2_Masked_io_b_1 
    );
  sBox_3_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_3_Masked_io_a_0,
      io_a_1 => sBox_3_Masked_io_a_1,
      io_m => sBox_3_Masked_io_m,
      io_b_0 => sBox_3_Masked_io_b_0,
      io_b_1 => sBox_3_Masked_io_b_1 
    );
  sBox_4_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_4_Masked_io_a_0,
      io_a_1 => sBox_4_Masked_io_a_1,
      io_m => sBox_4_Masked_io_m,
      io_b_0 => sBox_4_Masked_io_b_0,
      io_b_1 => sBox_4_Masked_io_b_1 
    );
  sBox_5_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_5_Masked_io_a_0,
      io_a_1 => sBox_5_Masked_io_a_1,
      io_m => sBox_5_Masked_io_m,
      io_b_0 => sBox_5_Masked_io_b_0,
      io_b_1 => sBox_5_Masked_io_b_1 
    );
  sBox_6_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_6_Masked_io_a_0,
      io_a_1 => sBox_6_Masked_io_a_1,
      io_m => sBox_6_Masked_io_m,
      io_b_0 => sBox_6_Masked_io_b_0,
      io_b_1 => sBox_6_Masked_io_b_1 
    );
  sBox_7_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_7_Masked_io_a_0,
      io_a_1 => sBox_7_Masked_io_a_1,
      io_m => sBox_7_Masked_io_m,
      io_b_0 => sBox_7_Masked_io_b_0,
      io_b_1 => sBox_7_Masked_io_b_1 
    );
  sBox_8_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_8_Masked_io_a_0,
      io_a_1 => sBox_8_Masked_io_a_1,
      io_m => sBox_8_Masked_io_m,
      io_b_0 => sBox_8_Masked_io_b_0,
      io_b_1 => sBox_8_Masked_io_b_1 
    );
  sBox_9_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_9_Masked_io_a_0,
      io_a_1 => sBox_9_Masked_io_a_1,
      io_m => sBox_9_Masked_io_m,
      io_b_0 => sBox_9_Masked_io_b_0,
      io_b_1 => sBox_9_Masked_io_b_1 
    );
  sBox_10_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_10_Masked_io_a_0,
      io_a_1 => sBox_10_Masked_io_a_1,
      io_m => sBox_10_Masked_io_m,
      io_b_0 => sBox_10_Masked_io_b_0,
      io_b_1 => sBox_10_Masked_io_b_1 
    );
  sBox_11_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_11_Masked_io_a_0,
      io_a_1 => sBox_11_Masked_io_a_1,
      io_m => sBox_11_Masked_io_m,
      io_b_0 => sBox_11_Masked_io_b_0,
      io_b_1 => sBox_11_Masked_io_b_1 
    );
  sBox_12_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_12_Masked_io_a_0,
      io_a_1 => sBox_12_Masked_io_a_1,
      io_m => sBox_12_Masked_io_m,
      io_b_0 => sBox_12_Masked_io_b_0,
      io_b_1 => sBox_12_Masked_io_b_1 
    );
  sBox_13_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_13_Masked_io_a_0,
      io_a_1 => sBox_13_Masked_io_a_1,
      io_m => sBox_13_Masked_io_m,
      io_b_0 => sBox_13_Masked_io_b_0,
      io_b_1 => sBox_13_Masked_io_b_1 
    );
  sBox_14_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_14_Masked_io_a_0,
      io_a_1 => sBox_14_Masked_io_a_1,
      io_m => sBox_14_Masked_io_m,
      io_b_0 => sBox_14_Masked_io_b_0,
      io_b_1 => sBox_14_Masked_io_b_1 
    );
  sBox_15_Masked : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_a_0 => sBox_15_Masked_io_a_0,
      io_a_1 => sBox_15_Masked_io_a_1,
      io_m => sBox_15_Masked_io_m,
      io_b_0 => sBox_15_Masked_io_b_0,
      io_b_1 => sBox_15_Masked_io_b_1 
    );
  r_addRoundKeyOut_1 <= r_addroundkey_1_io_akOut;
  r_addRoundKeyOut_0 <= r_addroundkey_0_io_akOut;
  sBox_0_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,7,0);
  sBox_0_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,7,0);
  process(sBox_0_Masked_io_b_1,sBox_1_Masked_io_b_1,sBox_2_Masked_io_b_1,sBox_3_Masked_io_b_1,sBox_4_Masked_io_b_1,sBox_5_Masked_io_b_1,sBox_6_Masked_io_b_1,sBox_7_Masked_io_b_1,sBox_8_Masked_io_b_1,sBox_9_Masked_io_b_1,sBox_10_Masked_io_b_1,sBox_11_Masked_io_b_1,sBox_12_Masked_io_b_1,sBox_13_Masked_io_b_1,sBox_14_Masked_io_b_1,sBox_15_Masked_io_b_1)
  begin
    r_sBoxOut_1(7 downto 0) <= sBox_0_Masked_io_b_1;
    r_sBoxOut_1(15 downto 8) <= sBox_1_Masked_io_b_1;
    r_sBoxOut_1(23 downto 16) <= sBox_2_Masked_io_b_1;
    r_sBoxOut_1(31 downto 24) <= sBox_3_Masked_io_b_1;
    r_sBoxOut_1(39 downto 32) <= sBox_4_Masked_io_b_1;
    r_sBoxOut_1(47 downto 40) <= sBox_5_Masked_io_b_1;
    r_sBoxOut_1(55 downto 48) <= sBox_6_Masked_io_b_1;
    r_sBoxOut_1(63 downto 56) <= sBox_7_Masked_io_b_1;
    r_sBoxOut_1(71 downto 64) <= sBox_8_Masked_io_b_1;
    r_sBoxOut_1(79 downto 72) <= sBox_9_Masked_io_b_1;
    r_sBoxOut_1(87 downto 80) <= sBox_10_Masked_io_b_1;
    r_sBoxOut_1(95 downto 88) <= sBox_11_Masked_io_b_1;
    r_sBoxOut_1(103 downto 96) <= sBox_12_Masked_io_b_1;
    r_sBoxOut_1(111 downto 104) <= sBox_13_Masked_io_b_1;
    r_sBoxOut_1(119 downto 112) <= sBox_14_Masked_io_b_1;
    r_sBoxOut_1(127 downto 120) <= sBox_15_Masked_io_b_1;
  end process;

  process(sBox_0_Masked_io_b_0,sBox_1_Masked_io_b_0,sBox_2_Masked_io_b_0,sBox_3_Masked_io_b_0,sBox_4_Masked_io_b_0,sBox_5_Masked_io_b_0,sBox_6_Masked_io_b_0,sBox_7_Masked_io_b_0,sBox_8_Masked_io_b_0,sBox_9_Masked_io_b_0,sBox_10_Masked_io_b_0,sBox_11_Masked_io_b_0,sBox_12_Masked_io_b_0,sBox_13_Masked_io_b_0,sBox_14_Masked_io_b_0,sBox_15_Masked_io_b_0)
  begin
    r_sBoxOut_0(7 downto 0) <= sBox_0_Masked_io_b_0;
    r_sBoxOut_0(15 downto 8) <= sBox_1_Masked_io_b_0;
    r_sBoxOut_0(23 downto 16) <= sBox_2_Masked_io_b_0;
    r_sBoxOut_0(31 downto 24) <= sBox_3_Masked_io_b_0;
    r_sBoxOut_0(39 downto 32) <= sBox_4_Masked_io_b_0;
    r_sBoxOut_0(47 downto 40) <= sBox_5_Masked_io_b_0;
    r_sBoxOut_0(55 downto 48) <= sBox_6_Masked_io_b_0;
    r_sBoxOut_0(63 downto 56) <= sBox_7_Masked_io_b_0;
    r_sBoxOut_0(71 downto 64) <= sBox_8_Masked_io_b_0;
    r_sBoxOut_0(79 downto 72) <= sBox_9_Masked_io_b_0;
    r_sBoxOut_0(87 downto 80) <= sBox_10_Masked_io_b_0;
    r_sBoxOut_0(95 downto 88) <= sBox_11_Masked_io_b_0;
    r_sBoxOut_0(103 downto 96) <= sBox_12_Masked_io_b_0;
    r_sBoxOut_0(111 downto 104) <= sBox_13_Masked_io_b_0;
    r_sBoxOut_0(119 downto 112) <= sBox_14_Masked_io_b_0;
    r_sBoxOut_0(127 downto 120) <= sBox_15_Masked_io_b_0;
  end process;

  sBox_1_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,15,8);
  sBox_1_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,15,8);
  sBox_2_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,23,16);
  sBox_2_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,23,16);
  sBox_3_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,31,24);
  sBox_3_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,31,24);
  sBox_4_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,39,32);
  sBox_4_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,39,32);
  sBox_5_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,47,40);
  sBox_5_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,47,40);
  sBox_6_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,55,48);
  sBox_6_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,55,48);
  sBox_7_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,63,56);
  sBox_7_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,63,56);
  sBox_8_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,71,64);
  sBox_8_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,71,64);
  sBox_9_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,79,72);
  sBox_9_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,79,72);
  sBox_10_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,87,80);
  sBox_10_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,87,80);
  sBox_11_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,95,88);
  sBox_11_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,95,88);
  sBox_12_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,103,96);
  sBox_12_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,103,96);
  sBox_13_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,111,104);
  sBox_13_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,111,104);
  sBox_14_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,119,112);
  sBox_14_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,119,112);
  sBox_15_Masked_io_a_1 <= pkg_extract(r_addRoundKeyOut_1,127,120);
  sBox_15_Masked_io_a_0 <= pkg_extract(r_addRoundKeyOut_0,127,120);
  r_shiftRowsOut_1 <= r_shiftrows_1_io_shiftRowsOutput;
  r_shiftRowsOut_0 <= r_shiftrows_0_io_shiftRowsOutput;
  mixColumns_0_1_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,31,0);
  mixColumns_0_0_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,31,0);
  process(mixColumns_0_1_io_mixColumnsOutput,mixColumns_1_1_io_mixColumnsOutput,mixColumns_2_1_io_mixColumnsOutput,mixColumns_3_1_io_mixColumnsOutput)
  begin
    r_mixColumnsOut_1(31 downto 0) <= mixColumns_0_1_io_mixColumnsOutput;
    r_mixColumnsOut_1(63 downto 32) <= mixColumns_1_1_io_mixColumnsOutput;
    r_mixColumnsOut_1(95 downto 64) <= mixColumns_2_1_io_mixColumnsOutput;
    r_mixColumnsOut_1(127 downto 96) <= mixColumns_3_1_io_mixColumnsOutput;
  end process;

  process(mixColumns_0_0_io_mixColumnsOutput,mixColumns_1_0_io_mixColumnsOutput,mixColumns_2_0_io_mixColumnsOutput,mixColumns_3_0_io_mixColumnsOutput)
  begin
    r_mixColumnsOut_0(31 downto 0) <= mixColumns_0_0_io_mixColumnsOutput;
    r_mixColumnsOut_0(63 downto 32) <= mixColumns_1_0_io_mixColumnsOutput;
    r_mixColumnsOut_0(95 downto 64) <= mixColumns_2_0_io_mixColumnsOutput;
    r_mixColumnsOut_0(127 downto 96) <= mixColumns_3_0_io_mixColumnsOutput;
  end process;

  mixColumns_1_1_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,63,32);
  mixColumns_1_0_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,63,32);
  mixColumns_2_1_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,95,64);
  mixColumns_2_0_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,95,64);
  mixColumns_3_1_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,127,96);
  mixColumns_3_0_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,127,96);
  io_c_0 <= r_mixColumnsOut_0;
  io_c_1 <= r_mixColumnsOut_1;
  io_done <= pkg_toStdLogic(false);
  sBox_0_Masked_io_m <= pkg_extract(io_m,11,0);
  sBox_1_Masked_io_m <= pkg_extract(io_m,23,12);
  sBox_2_Masked_io_m <= pkg_extract(io_m,35,24);
  sBox_3_Masked_io_m <= pkg_extract(io_m,47,36);
  sBox_4_Masked_io_m <= pkg_extract(io_m,59,48);
  sBox_5_Masked_io_m <= pkg_extract(io_m,71,60);
  sBox_6_Masked_io_m <= pkg_extract(io_m,83,72);
  sBox_7_Masked_io_m <= pkg_extract(io_m,95,84);
  sBox_8_Masked_io_m <= pkg_extract(io_m,107,96);
  sBox_9_Masked_io_m <= pkg_extract(io_m,119,108);
  sBox_10_Masked_io_m <= pkg_extract(io_m,131,120);
  sBox_11_Masked_io_m <= pkg_extract(io_m,143,132);
  sBox_12_Masked_io_m <= pkg_extract(io_m,155,144);
  sBox_13_Masked_io_m <= pkg_extract(io_m,167,156);
  sBox_14_Masked_io_m <= pkg_extract(io_m,179,168);
  sBox_15_Masked_io_m <= pkg_extract(io_m,191,180);
  process(io_clk)
  begin
    if rising_edge(io_clk) then
      r_stateReg_0 <= io_p_0;
      r_stateReg_1 <= io_p_1;
      r_keyReg_0 <= io_k_0;
      r_keyReg_1 <= io_k_1;
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


entity AddRoundKey is
  port(
    io_akIn : in std_logic_vector(127 downto 0);
    io_rk : in std_logic_vector(127 downto 0);
    io_akOut : out std_logic_vector(127 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_akOut <= (io_akIn xor io_rk);
end arch;


--AddRoundKey replaced by AddRoundKey

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

begin
  zz_io_shiftRowsOutput <= pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_extract(io_shiftRowsInput,127,120),pkg_extract(io_shiftRowsInput,87,80)),pkg_extract(io_shiftRowsInput,47,40)),pkg_extract(io_shiftRowsInput,7,0)),pkg_extract(io_shiftRowsInput,95,88));
  zz_io_shiftRowsOutput_1 <= pkg_extract(io_shiftRowsInput,55,48);
  io_shiftRowsOutput <= pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(zz_io_shiftRowsOutput,zz_io_shiftRowsOutput_1),pkg_extract(io_shiftRowsInput,15,8)),pkg_extract(io_shiftRowsInput,103,96)),pkg_extract(io_shiftRowsInput,63,56)),pkg_extract(io_shiftRowsInput,23,16)),pkg_extract(io_shiftRowsInput,111,104)),pkg_extract(io_shiftRowsInput,71,64)),pkg_extract(io_shiftRowsInput,31,24)),pkg_extract(io_shiftRowsInput,119,112)),pkg_extract(io_shiftRowsInput,79,72)),pkg_extract(io_shiftRowsInput,39,32));
end arch;


--ShiftRows replaced by ShiftRows

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
  signal when_MixColumns_l20 : std_logic;
  signal zz_io_mixColumnsOutput_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_1 : std_logic;
  signal zz_io_mixColumnsOutput_2 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_2 : std_logic;
  signal zz_io_mixColumnsOutput_3 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_3 : std_logic;
  signal zz_io_mixColumnsOutput_4 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_4 : std_logic;
  signal zz_io_mixColumnsOutput_5 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_5 : std_logic;
  signal zz_io_mixColumnsOutput_6 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_6 : std_logic;
  signal zz_io_mixColumnsOutput_7 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_7 : std_logic;
begin
  a0 <= pkg_extract(io_mixColumnsInput,31,24);
  a1 <= pkg_extract(io_mixColumnsInput,23,16);
  a2 <= pkg_extract(io_mixColumnsInput,15,8);
  a3 <= pkg_extract(io_mixColumnsInput,7,0);
  when_MixColumns_l20 <= pkg_extract(a0,7);
  process(when_MixColumns_l20,a0)
  begin
    if when_MixColumns_l20 = '1' then
      zz_io_mixColumnsOutput <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l20_1 <= pkg_extract(a1,7);
  process(when_MixColumns_l20_1,a1)
  begin
    if when_MixColumns_l20_1 = '1' then
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

  when_MixColumns_l20_2 <= pkg_extract(a1,7);
  process(when_MixColumns_l20_2,a1)
  begin
    if when_MixColumns_l20_2 = '1' then
      zz_io_mixColumnsOutput_2 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_2 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  when_MixColumns_l20_3 <= pkg_extract(a2,7);
  process(when_MixColumns_l20_3,a2)
  begin
    if when_MixColumns_l20_3 = '1' then
      zz_io_mixColumnsOutput_3 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_3 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l20_4 <= pkg_extract(a2,7);
  process(when_MixColumns_l20_4,a2)
  begin
    if when_MixColumns_l20_4 = '1' then
      zz_io_mixColumnsOutput_4 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_4 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l20_5 <= pkg_extract(a3,7);
  process(when_MixColumns_l20_5,a3)
  begin
    if when_MixColumns_l20_5 = '1' then
      zz_io_mixColumnsOutput_5 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_5 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  when_MixColumns_l20_6 <= pkg_extract(a0,7);
  process(when_MixColumns_l20_6,a0)
  begin
    if when_MixColumns_l20_6 = '1' then
      zz_io_mixColumnsOutput_6 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_6 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l20_7 <= pkg_extract(a3,7);
  process(when_MixColumns_l20_7,a3)
  begin
    if when_MixColumns_l20_7 = '1' then
      zz_io_mixColumnsOutput_7 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_7 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

end arch;


--MixColumns replaced by MixColumns


--MixColumns replaced by MixColumns


--MixColumns replaced by MixColumns


--MixColumns replaced by MixColumns


--MixColumns replaced by MixColumns


--MixColumns replaced by MixColumns


--MixColumns replaced by MixColumns

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity SBoxMasked is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_a_0 : in std_logic_vector(7 downto 0);
    io_a_1 : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(11 downto 0);
    io_b_0 : out std_logic_vector(7 downto 0);
    io_b_1 : out std_logic_vector(7 downto 0)
  );
end SBoxMasked;

architecture arch of SBoxMasked is

begin
  io_b_0 <= io_a_0;
  io_b_1 <= io_a_1;
end arch;


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked


--SBoxMasked replaced by SBoxMasked

