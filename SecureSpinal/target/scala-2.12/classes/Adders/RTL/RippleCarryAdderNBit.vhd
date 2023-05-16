-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : RippleCarryAdderNBit
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

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


entity RippleCarryAdderNBit is
  port(
    io_x : in std_logic_vector(31 downto 0);
    io_y : in std_logic_vector(31 downto 0);
    io_z : out std_logic_vector(31 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end RippleCarryAdderNBit;

architecture arch of RippleCarryAdderNBit is

  signal dummy : std_logic;
  signal c_0 : std_logic;
  signal c_1 : std_logic;
  signal c_2 : std_logic;
  signal c_3 : std_logic;
  signal c_4 : std_logic;
  signal c_5 : std_logic;
  signal c_6 : std_logic;
  signal c_7 : std_logic;
  signal c_8 : std_logic;
  signal c_9 : std_logic;
  signal c_10 : std_logic;
  signal c_11 : std_logic;
  signal c_12 : std_logic;
  signal c_13 : std_logic;
  signal c_14 : std_logic;
  signal c_15 : std_logic;
  signal c_16 : std_logic;
  signal c_17 : std_logic;
  signal c_18 : std_logic;
  signal c_19 : std_logic;
  signal c_20 : std_logic;
  signal c_21 : std_logic;
  signal c_22 : std_logic;
  signal c_23 : std_logic;
  signal c_24 : std_logic;
  signal c_25 : std_logic;
  signal c_26 : std_logic;
  signal c_27 : std_logic;
  signal c_28 : std_logic;
  signal c_29 : std_logic;
  signal c_30 : std_logic;
  signal c_31 : std_logic;
  signal s_0 : std_logic;
  signal s_1 : std_logic;
  signal s_2 : std_logic;
  signal s_3 : std_logic;
  signal s_4 : std_logic;
  signal s_5 : std_logic;
  signal s_6 : std_logic;
  signal s_7 : std_logic;
  signal s_8 : std_logic;
  signal s_9 : std_logic;
  signal s_10 : std_logic;
  signal s_11 : std_logic;
  signal s_12 : std_logic;
  signal s_13 : std_logic;
  signal s_14 : std_logic;
  signal s_15 : std_logic;
  signal s_16 : std_logic;
  signal s_17 : std_logic;
  signal s_18 : std_logic;
  signal s_19 : std_logic;
  signal s_20 : std_logic;
  signal s_21 : std_logic;
  signal s_22 : std_logic;
  signal s_23 : std_logic;
  signal s_24 : std_logic;
  signal s_25 : std_logic;
  signal s_26 : std_logic;
  signal s_27 : std_logic;
  signal s_28 : std_logic;
  signal s_29 : std_logic;
  signal s_30 : std_logic;
  signal s_31 : std_logic;
begin
  c_0 <= pkg_toStdLogic(false);
  c_1 <= (((pkg_extract(io_x,0) and pkg_extract(io_y,0)) xor (pkg_extract(io_x,0) and c_0)) xor (pkg_extract(io_y,0) and c_0));
  c_2 <= (((pkg_extract(io_x,1) and pkg_extract(io_y,1)) xor (pkg_extract(io_x,1) and c_1)) xor (pkg_extract(io_y,1) and c_1));
  c_3 <= (((pkg_extract(io_x,2) and pkg_extract(io_y,2)) xor (pkg_extract(io_x,2) and c_2)) xor (pkg_extract(io_y,2) and c_2));
  c_4 <= (((pkg_extract(io_x,3) and pkg_extract(io_y,3)) xor (pkg_extract(io_x,3) and c_3)) xor (pkg_extract(io_y,3) and c_3));
  c_5 <= (((pkg_extract(io_x,4) and pkg_extract(io_y,4)) xor (pkg_extract(io_x,4) and c_4)) xor (pkg_extract(io_y,4) and c_4));
  c_6 <= (((pkg_extract(io_x,5) and pkg_extract(io_y,5)) xor (pkg_extract(io_x,5) and c_5)) xor (pkg_extract(io_y,5) and c_5));
  c_7 <= (((pkg_extract(io_x,6) and pkg_extract(io_y,6)) xor (pkg_extract(io_x,6) and c_6)) xor (pkg_extract(io_y,6) and c_6));
  c_8 <= (((pkg_extract(io_x,7) and pkg_extract(io_y,7)) xor (pkg_extract(io_x,7) and c_7)) xor (pkg_extract(io_y,7) and c_7));
  c_9 <= (((pkg_extract(io_x,8) and pkg_extract(io_y,8)) xor (pkg_extract(io_x,8) and c_8)) xor (pkg_extract(io_y,8) and c_8));
  c_10 <= (((pkg_extract(io_x,9) and pkg_extract(io_y,9)) xor (pkg_extract(io_x,9) and c_9)) xor (pkg_extract(io_y,9) and c_9));
  c_11 <= (((pkg_extract(io_x,10) and pkg_extract(io_y,10)) xor (pkg_extract(io_x,10) and c_10)) xor (pkg_extract(io_y,10) and c_10));
  c_12 <= (((pkg_extract(io_x,11) and pkg_extract(io_y,11)) xor (pkg_extract(io_x,11) and c_11)) xor (pkg_extract(io_y,11) and c_11));
  c_13 <= (((pkg_extract(io_x,12) and pkg_extract(io_y,12)) xor (pkg_extract(io_x,12) and c_12)) xor (pkg_extract(io_y,12) and c_12));
  c_14 <= (((pkg_extract(io_x,13) and pkg_extract(io_y,13)) xor (pkg_extract(io_x,13) and c_13)) xor (pkg_extract(io_y,13) and c_13));
  c_15 <= (((pkg_extract(io_x,14) and pkg_extract(io_y,14)) xor (pkg_extract(io_x,14) and c_14)) xor (pkg_extract(io_y,14) and c_14));
  c_16 <= (((pkg_extract(io_x,15) and pkg_extract(io_y,15)) xor (pkg_extract(io_x,15) and c_15)) xor (pkg_extract(io_y,15) and c_15));
  c_17 <= (((pkg_extract(io_x,16) and pkg_extract(io_y,16)) xor (pkg_extract(io_x,16) and c_16)) xor (pkg_extract(io_y,16) and c_16));
  c_18 <= (((pkg_extract(io_x,17) and pkg_extract(io_y,17)) xor (pkg_extract(io_x,17) and c_17)) xor (pkg_extract(io_y,17) and c_17));
  c_19 <= (((pkg_extract(io_x,18) and pkg_extract(io_y,18)) xor (pkg_extract(io_x,18) and c_18)) xor (pkg_extract(io_y,18) and c_18));
  c_20 <= (((pkg_extract(io_x,19) and pkg_extract(io_y,19)) xor (pkg_extract(io_x,19) and c_19)) xor (pkg_extract(io_y,19) and c_19));
  c_21 <= (((pkg_extract(io_x,20) and pkg_extract(io_y,20)) xor (pkg_extract(io_x,20) and c_20)) xor (pkg_extract(io_y,20) and c_20));
  c_22 <= (((pkg_extract(io_x,21) and pkg_extract(io_y,21)) xor (pkg_extract(io_x,21) and c_21)) xor (pkg_extract(io_y,21) and c_21));
  c_23 <= (((pkg_extract(io_x,22) and pkg_extract(io_y,22)) xor (pkg_extract(io_x,22) and c_22)) xor (pkg_extract(io_y,22) and c_22));
  c_24 <= (((pkg_extract(io_x,23) and pkg_extract(io_y,23)) xor (pkg_extract(io_x,23) and c_23)) xor (pkg_extract(io_y,23) and c_23));
  c_25 <= (((pkg_extract(io_x,24) and pkg_extract(io_y,24)) xor (pkg_extract(io_x,24) and c_24)) xor (pkg_extract(io_y,24) and c_24));
  c_26 <= (((pkg_extract(io_x,25) and pkg_extract(io_y,25)) xor (pkg_extract(io_x,25) and c_25)) xor (pkg_extract(io_y,25) and c_25));
  c_27 <= (((pkg_extract(io_x,26) and pkg_extract(io_y,26)) xor (pkg_extract(io_x,26) and c_26)) xor (pkg_extract(io_y,26) and c_26));
  c_28 <= (((pkg_extract(io_x,27) and pkg_extract(io_y,27)) xor (pkg_extract(io_x,27) and c_27)) xor (pkg_extract(io_y,27) and c_27));
  c_29 <= (((pkg_extract(io_x,28) and pkg_extract(io_y,28)) xor (pkg_extract(io_x,28) and c_28)) xor (pkg_extract(io_y,28) and c_28));
  c_30 <= (((pkg_extract(io_x,29) and pkg_extract(io_y,29)) xor (pkg_extract(io_x,29) and c_29)) xor (pkg_extract(io_y,29) and c_29));
  c_31 <= (((pkg_extract(io_x,30) and pkg_extract(io_y,30)) xor (pkg_extract(io_x,30) and c_30)) xor (pkg_extract(io_y,30) and c_30));
  s_0 <= ((pkg_extract(io_x,0) xor pkg_extract(io_y,0)) xor c_0);
  process(s_0,s_1,s_2,s_3,s_4,s_5,s_6,s_7,s_8,s_9,s_10,s_11,s_12,s_13,s_14,s_15,s_16,s_17,s_18,s_19,s_20,s_21,s_22,s_23,s_24,s_25,s_26,s_27,s_28,s_29,s_30,s_31)
  begin
    io_z(0) <= s_0;
    io_z(1) <= s_1;
    io_z(2) <= s_2;
    io_z(3) <= s_3;
    io_z(4) <= s_4;
    io_z(5) <= s_5;
    io_z(6) <= s_6;
    io_z(7) <= s_7;
    io_z(8) <= s_8;
    io_z(9) <= s_9;
    io_z(10) <= s_10;
    io_z(11) <= s_11;
    io_z(12) <= s_12;
    io_z(13) <= s_13;
    io_z(14) <= s_14;
    io_z(15) <= s_15;
    io_z(16) <= s_16;
    io_z(17) <= s_17;
    io_z(18) <= s_18;
    io_z(19) <= s_19;
    io_z(20) <= s_20;
    io_z(21) <= s_21;
    io_z(22) <= s_22;
    io_z(23) <= s_23;
    io_z(24) <= s_24;
    io_z(25) <= s_25;
    io_z(26) <= s_26;
    io_z(27) <= s_27;
    io_z(28) <= s_28;
    io_z(29) <= s_29;
    io_z(30) <= s_30;
    io_z(31) <= s_31;
  end process;

  s_1 <= ((pkg_extract(io_x,1) xor pkg_extract(io_y,1)) xor c_1);
  s_2 <= ((pkg_extract(io_x,2) xor pkg_extract(io_y,2)) xor c_2);
  s_3 <= ((pkg_extract(io_x,3) xor pkg_extract(io_y,3)) xor c_3);
  s_4 <= ((pkg_extract(io_x,4) xor pkg_extract(io_y,4)) xor c_4);
  s_5 <= ((pkg_extract(io_x,5) xor pkg_extract(io_y,5)) xor c_5);
  s_6 <= ((pkg_extract(io_x,6) xor pkg_extract(io_y,6)) xor c_6);
  s_7 <= ((pkg_extract(io_x,7) xor pkg_extract(io_y,7)) xor c_7);
  s_8 <= ((pkg_extract(io_x,8) xor pkg_extract(io_y,8)) xor c_8);
  s_9 <= ((pkg_extract(io_x,9) xor pkg_extract(io_y,9)) xor c_9);
  s_10 <= ((pkg_extract(io_x,10) xor pkg_extract(io_y,10)) xor c_10);
  s_11 <= ((pkg_extract(io_x,11) xor pkg_extract(io_y,11)) xor c_11);
  s_12 <= ((pkg_extract(io_x,12) xor pkg_extract(io_y,12)) xor c_12);
  s_13 <= ((pkg_extract(io_x,13) xor pkg_extract(io_y,13)) xor c_13);
  s_14 <= ((pkg_extract(io_x,14) xor pkg_extract(io_y,14)) xor c_14);
  s_15 <= ((pkg_extract(io_x,15) xor pkg_extract(io_y,15)) xor c_15);
  s_16 <= ((pkg_extract(io_x,16) xor pkg_extract(io_y,16)) xor c_16);
  s_17 <= ((pkg_extract(io_x,17) xor pkg_extract(io_y,17)) xor c_17);
  s_18 <= ((pkg_extract(io_x,18) xor pkg_extract(io_y,18)) xor c_18);
  s_19 <= ((pkg_extract(io_x,19) xor pkg_extract(io_y,19)) xor c_19);
  s_20 <= ((pkg_extract(io_x,20) xor pkg_extract(io_y,20)) xor c_20);
  s_21 <= ((pkg_extract(io_x,21) xor pkg_extract(io_y,21)) xor c_21);
  s_22 <= ((pkg_extract(io_x,22) xor pkg_extract(io_y,22)) xor c_22);
  s_23 <= ((pkg_extract(io_x,23) xor pkg_extract(io_y,23)) xor c_23);
  s_24 <= ((pkg_extract(io_x,24) xor pkg_extract(io_y,24)) xor c_24);
  s_25 <= ((pkg_extract(io_x,25) xor pkg_extract(io_y,25)) xor c_25);
  s_26 <= ((pkg_extract(io_x,26) xor pkg_extract(io_y,26)) xor c_26);
  s_27 <= ((pkg_extract(io_x,27) xor pkg_extract(io_y,27)) xor c_27);
  s_28 <= ((pkg_extract(io_x,28) xor pkg_extract(io_y,28)) xor c_28);
  s_29 <= ((pkg_extract(io_x,29) xor pkg_extract(io_y,29)) xor c_29);
  s_30 <= ((pkg_extract(io_x,30) xor pkg_extract(io_y,30)) xor c_30);
  s_31 <= ((pkg_extract(io_x,31) xor pkg_extract(io_y,31)) xor c_31);
end arch;

