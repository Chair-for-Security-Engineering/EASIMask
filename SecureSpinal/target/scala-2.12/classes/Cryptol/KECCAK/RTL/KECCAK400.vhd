-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : KECCAK400
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


entity SBox16 is
  port(
    io_a1 : in std_logic_vector(15 downto 0);
    io_a2 : in std_logic_vector(15 downto 0);
    io_a3 : in std_logic_vector(15 downto 0);
    io_res : out std_logic_vector(15 downto 0)
  );
end SBox16;

architecture arch of SBox16 is

begin
  io_res <= (io_a1 xor (pkg_not(io_a2) and io_a3));
end arch;


--SBox16_1 replaced by SBox16


--SBox16_2 replaced by SBox16


--SBox16_3 replaced by SBox16


--SBox16_4 replaced by SBox16


--SBox16_5 replaced by SBox16


--SBox16_6 replaced by SBox16


--SBox16_7 replaced by SBox16


--SBox16_8 replaced by SBox16


--SBox16_9 replaced by SBox16


--SBox16_10 replaced by SBox16


--SBox16_11 replaced by SBox16


--SBox16_12 replaced by SBox16


--SBox16_13 replaced by SBox16


--SBox16_14 replaced by SBox16


--SBox16_15 replaced by SBox16


--SBox16_16 replaced by SBox16


--SBox16_17 replaced by SBox16


--SBox16_18 replaced by SBox16


--SBox16_19 replaced by SBox16


--SBox16_20 replaced by SBox16


--SBox16_21 replaced by SBox16


--SBox16_22 replaced by SBox16


--SBox16_23 replaced by SBox16


--SBox16_24 replaced by SBox16

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Theta400 is
  port(
    io_thetaIn : in std_logic_vector(399 downto 0);
    io_thetaOut : out std_logic_vector(399 downto 0)
  );
end Theta400;

architecture arch of Theta400 is

  signal b : std_logic_vector(79 downto 0);
  signal d : std_logic_vector(79 downto 0);
  signal zz_d : std_logic_vector(15 downto 0);
  signal zz_d_1 : std_logic_vector(15 downto 0);
  signal zz_d_2 : std_logic_vector(15 downto 0);
  signal zz_d_3 : std_logic_vector(15 downto 0);
  signal zz_d_4 : std_logic_vector(15 downto 0);
begin
  b <= ((((pkg_extract(io_thetaIn,399,320) xor pkg_extract(io_thetaIn,319,240)) xor pkg_extract(io_thetaIn,239,160)) xor pkg_extract(io_thetaIn,159,80)) xor pkg_extract(io_thetaIn,79,0));
  zz_d <= pkg_extract(b,79,64);
  process(b,zz_d,zz_d_1,zz_d_2,zz_d_3,zz_d_4)
  begin
    d(15 downto 0) <= (pkg_extract(b,31,16) xor pkg_cat(pkg_extract(zz_d,14,0),pkg_extract(zz_d,15,15)));
    d(31 downto 16) <= (pkg_extract(b,47,32) xor pkg_cat(pkg_extract(zz_d_1,14,0),pkg_extract(zz_d_1,15,15)));
    d(47 downto 32) <= (pkg_extract(b,63,48) xor pkg_cat(pkg_extract(zz_d_2,14,0),pkg_extract(zz_d_2,15,15)));
    d(63 downto 48) <= (pkg_extract(b,79,64) xor pkg_cat(pkg_extract(zz_d_3,14,0),pkg_extract(zz_d_3,15,15)));
    d(79 downto 64) <= (pkg_extract(b,15,0) xor pkg_cat(pkg_extract(zz_d_4,14,0),pkg_extract(zz_d_4,15,15)));
  end process;

  zz_d_1 <= pkg_extract(b,15,0);
  zz_d_2 <= pkg_extract(b,31,16);
  zz_d_3 <= pkg_extract(b,47,32);
  zz_d_4 <= pkg_extract(b,63,48);
  process(io_thetaIn,d)
  begin
    io_thetaOut(399 downto 384) <= (pkg_extract(io_thetaIn,399,384) xor pkg_extract(d,79,64));
    io_thetaOut(383 downto 368) <= (pkg_extract(io_thetaIn,383,368) xor pkg_extract(d,63,48));
    io_thetaOut(367 downto 352) <= (pkg_extract(io_thetaIn,367,352) xor pkg_extract(d,47,32));
    io_thetaOut(351 downto 336) <= (pkg_extract(io_thetaIn,351,336) xor pkg_extract(d,31,16));
    io_thetaOut(335 downto 320) <= (pkg_extract(io_thetaIn,335,320) xor pkg_extract(d,15,0));
    io_thetaOut(319 downto 304) <= (pkg_extract(io_thetaIn,319,304) xor pkg_extract(d,79,64));
    io_thetaOut(303 downto 288) <= (pkg_extract(io_thetaIn,303,288) xor pkg_extract(d,63,48));
    io_thetaOut(287 downto 272) <= (pkg_extract(io_thetaIn,287,272) xor pkg_extract(d,47,32));
    io_thetaOut(271 downto 256) <= (pkg_extract(io_thetaIn,271,256) xor pkg_extract(d,31,16));
    io_thetaOut(255 downto 240) <= (pkg_extract(io_thetaIn,255,240) xor pkg_extract(d,15,0));
    io_thetaOut(239 downto 224) <= (pkg_extract(io_thetaIn,239,224) xor pkg_extract(d,79,64));
    io_thetaOut(223 downto 208) <= (pkg_extract(io_thetaIn,223,208) xor pkg_extract(d,63,48));
    io_thetaOut(207 downto 192) <= (pkg_extract(io_thetaIn,207,192) xor pkg_extract(d,47,32));
    io_thetaOut(191 downto 176) <= (pkg_extract(io_thetaIn,191,176) xor pkg_extract(d,31,16));
    io_thetaOut(175 downto 160) <= (pkg_extract(io_thetaIn,175,160) xor pkg_extract(d,15,0));
    io_thetaOut(159 downto 144) <= (pkg_extract(io_thetaIn,159,144) xor pkg_extract(d,79,64));
    io_thetaOut(143 downto 128) <= (pkg_extract(io_thetaIn,143,128) xor pkg_extract(d,63,48));
    io_thetaOut(127 downto 112) <= (pkg_extract(io_thetaIn,127,112) xor pkg_extract(d,47,32));
    io_thetaOut(111 downto 96) <= (pkg_extract(io_thetaIn,111,96) xor pkg_extract(d,31,16));
    io_thetaOut(95 downto 80) <= (pkg_extract(io_thetaIn,95,80) xor pkg_extract(d,15,0));
    io_thetaOut(79 downto 64) <= (pkg_extract(io_thetaIn,79,64) xor pkg_extract(d,79,64));
    io_thetaOut(63 downto 48) <= (pkg_extract(io_thetaIn,63,48) xor pkg_extract(d,63,48));
    io_thetaOut(47 downto 32) <= (pkg_extract(io_thetaIn,47,32) xor pkg_extract(d,47,32));
    io_thetaOut(31 downto 16) <= (pkg_extract(io_thetaIn,31,16) xor pkg_extract(d,31,16));
    io_thetaOut(15 downto 0) <= (pkg_extract(io_thetaIn,15,0) xor pkg_extract(d,15,0));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity RhoPi400 is
  port(
    io_rhoIn : in std_logic_vector(399 downto 0);
    io_rhoOut : out std_logic_vector(399 downto 0)
  );
end RhoPi400;

architecture arch of RhoPi400 is

  signal zz_io_rhoOut : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_1 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_2 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_3 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_4 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_5 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_6 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_7 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_8 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_9 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_10 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_11 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_12 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_13 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_14 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_15 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_16 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_17 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_18 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_19 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_20 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_21 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_22 : std_logic_vector(15 downto 0);
  signal zz_io_rhoOut_23 : std_logic_vector(15 downto 0);
begin
  process(io_rhoIn,zz_io_rhoOut,zz_io_rhoOut_1,zz_io_rhoOut_2,zz_io_rhoOut_3,zz_io_rhoOut_4,zz_io_rhoOut_5,zz_io_rhoOut_6,zz_io_rhoOut_7,zz_io_rhoOut_8,zz_io_rhoOut_9,zz_io_rhoOut_10,zz_io_rhoOut_11,zz_io_rhoOut_12,zz_io_rhoOut_13,zz_io_rhoOut_14,zz_io_rhoOut_15,zz_io_rhoOut_16,zz_io_rhoOut_17,zz_io_rhoOut_18,zz_io_rhoOut_19,zz_io_rhoOut_20,zz_io_rhoOut_21,zz_io_rhoOut_22,zz_io_rhoOut_23)
  begin
    io_rhoOut(399 downto 384) <= pkg_extract(pkg_extract(io_rhoIn,399,384),15,0);
    io_rhoOut(239 downto 224) <= pkg_cat(pkg_extract(zz_io_rhoOut,14,0),pkg_extract(zz_io_rhoOut,15,15));
    io_rhoOut(79 downto 64) <= pkg_cat(pkg_extract(zz_io_rhoOut_1,1,0),pkg_extract(zz_io_rhoOut_1,15,2));
    io_rhoOut(319 downto 304) <= pkg_cat(pkg_extract(zz_io_rhoOut_2,3,0),pkg_extract(zz_io_rhoOut_2,15,4));
    io_rhoOut(159 downto 144) <= pkg_cat(pkg_extract(zz_io_rhoOut_3,4,0),pkg_extract(zz_io_rhoOut_3,15,5));
    io_rhoOut(143 downto 128) <= pkg_cat(pkg_extract(zz_io_rhoOut_4,11,0),pkg_extract(zz_io_rhoOut_4,15,12));
    io_rhoOut(383 downto 368) <= pkg_cat(pkg_extract(zz_io_rhoOut_5,3,0),pkg_extract(zz_io_rhoOut_5,15,4));
    io_rhoOut(223 downto 208) <= pkg_cat(pkg_extract(zz_io_rhoOut_6,9,0),pkg_extract(zz_io_rhoOut_6,15,10));
    io_rhoOut(63 downto 48) <= pkg_cat(pkg_extract(zz_io_rhoOut_7,8,0),pkg_extract(zz_io_rhoOut_7,15,9));
    io_rhoOut(303 downto 288) <= pkg_cat(pkg_extract(zz_io_rhoOut_8,11,0),pkg_extract(zz_io_rhoOut_8,15,12));
    io_rhoOut(287 downto 272) <= pkg_cat(pkg_extract(zz_io_rhoOut_9,12,0),pkg_extract(zz_io_rhoOut_9,15,13));
    io_rhoOut(127 downto 112) <= pkg_cat(pkg_extract(zz_io_rhoOut_10,5,0),pkg_extract(zz_io_rhoOut_10,15,6));
    io_rhoOut(367 downto 352) <= pkg_cat(pkg_extract(zz_io_rhoOut_11,4,0),pkg_extract(zz_io_rhoOut_11,15,5));
    io_rhoOut(207 downto 192) <= pkg_cat(pkg_extract(zz_io_rhoOut_12,6,0),pkg_extract(zz_io_rhoOut_12,15,7));
    io_rhoOut(47 downto 32) <= pkg_cat(pkg_extract(zz_io_rhoOut_13,8,0),pkg_extract(zz_io_rhoOut_13,15,9));
    io_rhoOut(31 downto 16) <= pkg_cat(pkg_extract(zz_io_rhoOut_14,6,0),pkg_extract(zz_io_rhoOut_14,15,7));
    io_rhoOut(271 downto 256) <= pkg_cat(pkg_extract(zz_io_rhoOut_15,2,0),pkg_extract(zz_io_rhoOut_15,15,3));
    io_rhoOut(111 downto 96) <= pkg_cat(pkg_extract(zz_io_rhoOut_16,0,0),pkg_extract(zz_io_rhoOut_16,15,1));
    io_rhoOut(351 downto 336) <= pkg_cat(pkg_extract(zz_io_rhoOut_17,10,0),pkg_extract(zz_io_rhoOut_17,15,11));
    io_rhoOut(191 downto 176) <= pkg_cat(pkg_extract(zz_io_rhoOut_18,7,0),pkg_extract(zz_io_rhoOut_18,15,8));
    io_rhoOut(175 downto 160) <= pkg_cat(pkg_extract(zz_io_rhoOut_19,13,0),pkg_extract(zz_io_rhoOut_19,15,14));
    io_rhoOut(15 downto 0) <= pkg_cat(pkg_extract(zz_io_rhoOut_20,13,0),pkg_extract(zz_io_rhoOut_20,15,14));
    io_rhoOut(255 downto 240) <= pkg_cat(pkg_extract(zz_io_rhoOut_21,2,0),pkg_extract(zz_io_rhoOut_21,15,3));
    io_rhoOut(95 downto 80) <= pkg_cat(pkg_extract(zz_io_rhoOut_22,7,0),pkg_extract(zz_io_rhoOut_22,15,8));
    io_rhoOut(335 downto 320) <= pkg_cat(pkg_extract(zz_io_rhoOut_23,1,0),pkg_extract(zz_io_rhoOut_23,15,2));
  end process;

  zz_io_rhoOut <= pkg_extract(io_rhoIn,383,368);
  zz_io_rhoOut_1 <= pkg_extract(io_rhoIn,367,352);
  zz_io_rhoOut_2 <= pkg_extract(io_rhoIn,351,336);
  zz_io_rhoOut_3 <= pkg_extract(io_rhoIn,335,320);
  zz_io_rhoOut_4 <= pkg_extract(io_rhoIn,319,304);
  zz_io_rhoOut_5 <= pkg_extract(io_rhoIn,303,288);
  zz_io_rhoOut_6 <= pkg_extract(io_rhoIn,287,272);
  zz_io_rhoOut_7 <= pkg_extract(io_rhoIn,271,256);
  zz_io_rhoOut_8 <= pkg_extract(io_rhoIn,255,240);
  zz_io_rhoOut_9 <= pkg_extract(io_rhoIn,239,224);
  zz_io_rhoOut_10 <= pkg_extract(io_rhoIn,223,208);
  zz_io_rhoOut_11 <= pkg_extract(io_rhoIn,207,192);
  zz_io_rhoOut_12 <= pkg_extract(io_rhoIn,191,176);
  zz_io_rhoOut_13 <= pkg_extract(io_rhoIn,175,160);
  zz_io_rhoOut_14 <= pkg_extract(io_rhoIn,159,144);
  zz_io_rhoOut_15 <= pkg_extract(io_rhoIn,143,128);
  zz_io_rhoOut_16 <= pkg_extract(io_rhoIn,127,112);
  zz_io_rhoOut_17 <= pkg_extract(io_rhoIn,111,96);
  zz_io_rhoOut_18 <= pkg_extract(io_rhoIn,95,80);
  zz_io_rhoOut_19 <= pkg_extract(io_rhoIn,79,64);
  zz_io_rhoOut_20 <= pkg_extract(io_rhoIn,63,48);
  zz_io_rhoOut_21 <= pkg_extract(io_rhoIn,47,32);
  zz_io_rhoOut_22 <= pkg_extract(io_rhoIn,31,16);
  zz_io_rhoOut_23 <= pkg_extract(io_rhoIn,15,0);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Chi400 is
  port(
    io_chiIn : in std_logic_vector(399 downto 0);
    io_chiOut : out std_logic_vector(399 downto 0)
  );
end Chi400;

architecture arch of Chi400 is
  signal sBox16_25_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_25_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_25_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_26_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_26_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_26_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_27_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_27_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_27_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_28_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_28_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_28_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_29_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_29_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_29_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_30_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_30_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_30_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_31_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_31_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_31_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_32_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_32_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_32_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_33_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_33_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_33_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_34_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_34_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_34_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_35_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_35_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_35_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_36_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_36_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_36_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_37_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_37_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_37_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_38_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_38_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_38_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_39_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_39_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_39_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_40_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_40_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_40_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_41_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_41_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_41_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_42_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_42_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_42_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_43_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_43_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_43_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_44_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_44_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_44_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_45_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_45_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_45_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_46_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_46_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_46_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_47_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_47_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_47_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_48_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_48_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_48_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_49_io_a1 : std_logic_vector(15 downto 0);
  signal sBox16_49_io_a2 : std_logic_vector(15 downto 0);
  signal sBox16_49_io_a3 : std_logic_vector(15 downto 0);
  signal sBox16_25_io_res : std_logic_vector(15 downto 0);
  signal sBox16_26_io_res : std_logic_vector(15 downto 0);
  signal sBox16_27_io_res : std_logic_vector(15 downto 0);
  signal sBox16_28_io_res : std_logic_vector(15 downto 0);
  signal sBox16_29_io_res : std_logic_vector(15 downto 0);
  signal sBox16_30_io_res : std_logic_vector(15 downto 0);
  signal sBox16_31_io_res : std_logic_vector(15 downto 0);
  signal sBox16_32_io_res : std_logic_vector(15 downto 0);
  signal sBox16_33_io_res : std_logic_vector(15 downto 0);
  signal sBox16_34_io_res : std_logic_vector(15 downto 0);
  signal sBox16_35_io_res : std_logic_vector(15 downto 0);
  signal sBox16_36_io_res : std_logic_vector(15 downto 0);
  signal sBox16_37_io_res : std_logic_vector(15 downto 0);
  signal sBox16_38_io_res : std_logic_vector(15 downto 0);
  signal sBox16_39_io_res : std_logic_vector(15 downto 0);
  signal sBox16_40_io_res : std_logic_vector(15 downto 0);
  signal sBox16_41_io_res : std_logic_vector(15 downto 0);
  signal sBox16_42_io_res : std_logic_vector(15 downto 0);
  signal sBox16_43_io_res : std_logic_vector(15 downto 0);
  signal sBox16_44_io_res : std_logic_vector(15 downto 0);
  signal sBox16_45_io_res : std_logic_vector(15 downto 0);
  signal sBox16_46_io_res : std_logic_vector(15 downto 0);
  signal sBox16_47_io_res : std_logic_vector(15 downto 0);
  signal sBox16_48_io_res : std_logic_vector(15 downto 0);
  signal sBox16_49_io_res : std_logic_vector(15 downto 0);

begin
  sBox16_25 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_25_io_a1,
      io_a2 => sBox16_25_io_a2,
      io_a3 => sBox16_25_io_a3,
      io_res => sBox16_25_io_res 
    );
  sBox16_26 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_26_io_a1,
      io_a2 => sBox16_26_io_a2,
      io_a3 => sBox16_26_io_a3,
      io_res => sBox16_26_io_res 
    );
  sBox16_27 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_27_io_a1,
      io_a2 => sBox16_27_io_a2,
      io_a3 => sBox16_27_io_a3,
      io_res => sBox16_27_io_res 
    );
  sBox16_28 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_28_io_a1,
      io_a2 => sBox16_28_io_a2,
      io_a3 => sBox16_28_io_a3,
      io_res => sBox16_28_io_res 
    );
  sBox16_29 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_29_io_a1,
      io_a2 => sBox16_29_io_a2,
      io_a3 => sBox16_29_io_a3,
      io_res => sBox16_29_io_res 
    );
  sBox16_30 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_30_io_a1,
      io_a2 => sBox16_30_io_a2,
      io_a3 => sBox16_30_io_a3,
      io_res => sBox16_30_io_res 
    );
  sBox16_31 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_31_io_a1,
      io_a2 => sBox16_31_io_a2,
      io_a3 => sBox16_31_io_a3,
      io_res => sBox16_31_io_res 
    );
  sBox16_32 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_32_io_a1,
      io_a2 => sBox16_32_io_a2,
      io_a3 => sBox16_32_io_a3,
      io_res => sBox16_32_io_res 
    );
  sBox16_33 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_33_io_a1,
      io_a2 => sBox16_33_io_a2,
      io_a3 => sBox16_33_io_a3,
      io_res => sBox16_33_io_res 
    );
  sBox16_34 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_34_io_a1,
      io_a2 => sBox16_34_io_a2,
      io_a3 => sBox16_34_io_a3,
      io_res => sBox16_34_io_res 
    );
  sBox16_35 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_35_io_a1,
      io_a2 => sBox16_35_io_a2,
      io_a3 => sBox16_35_io_a3,
      io_res => sBox16_35_io_res 
    );
  sBox16_36 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_36_io_a1,
      io_a2 => sBox16_36_io_a2,
      io_a3 => sBox16_36_io_a3,
      io_res => sBox16_36_io_res 
    );
  sBox16_37 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_37_io_a1,
      io_a2 => sBox16_37_io_a2,
      io_a3 => sBox16_37_io_a3,
      io_res => sBox16_37_io_res 
    );
  sBox16_38 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_38_io_a1,
      io_a2 => sBox16_38_io_a2,
      io_a3 => sBox16_38_io_a3,
      io_res => sBox16_38_io_res 
    );
  sBox16_39 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_39_io_a1,
      io_a2 => sBox16_39_io_a2,
      io_a3 => sBox16_39_io_a3,
      io_res => sBox16_39_io_res 
    );
  sBox16_40 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_40_io_a1,
      io_a2 => sBox16_40_io_a2,
      io_a3 => sBox16_40_io_a3,
      io_res => sBox16_40_io_res 
    );
  sBox16_41 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_41_io_a1,
      io_a2 => sBox16_41_io_a2,
      io_a3 => sBox16_41_io_a3,
      io_res => sBox16_41_io_res 
    );
  sBox16_42 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_42_io_a1,
      io_a2 => sBox16_42_io_a2,
      io_a3 => sBox16_42_io_a3,
      io_res => sBox16_42_io_res 
    );
  sBox16_43 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_43_io_a1,
      io_a2 => sBox16_43_io_a2,
      io_a3 => sBox16_43_io_a3,
      io_res => sBox16_43_io_res 
    );
  sBox16_44 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_44_io_a1,
      io_a2 => sBox16_44_io_a2,
      io_a3 => sBox16_44_io_a3,
      io_res => sBox16_44_io_res 
    );
  sBox16_45 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_45_io_a1,
      io_a2 => sBox16_45_io_a2,
      io_a3 => sBox16_45_io_a3,
      io_res => sBox16_45_io_res 
    );
  sBox16_46 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_46_io_a1,
      io_a2 => sBox16_46_io_a2,
      io_a3 => sBox16_46_io_a3,
      io_res => sBox16_46_io_res 
    );
  sBox16_47 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_47_io_a1,
      io_a2 => sBox16_47_io_a2,
      io_a3 => sBox16_47_io_a3,
      io_res => sBox16_47_io_res 
    );
  sBox16_48 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_48_io_a1,
      io_a2 => sBox16_48_io_a2,
      io_a3 => sBox16_48_io_a3,
      io_res => sBox16_48_io_res 
    );
  sBox16_49 : entity work.SBox16
    port map ( 
      io_a1 => sBox16_49_io_a1,
      io_a2 => sBox16_49_io_a2,
      io_a3 => sBox16_49_io_a3,
      io_res => sBox16_49_io_res 
    );
  sBox16_25_io_a1 <= pkg_extract(io_chiIn,399,384);
  sBox16_25_io_a2 <= pkg_extract(io_chiIn,383,368);
  sBox16_25_io_a3 <= pkg_extract(io_chiIn,367,352);
  process(sBox16_25_io_res,sBox16_26_io_res,sBox16_27_io_res,sBox16_28_io_res,sBox16_29_io_res,sBox16_30_io_res,sBox16_31_io_res,sBox16_32_io_res,sBox16_33_io_res,sBox16_34_io_res,sBox16_35_io_res,sBox16_36_io_res,sBox16_37_io_res,sBox16_38_io_res,sBox16_39_io_res,sBox16_40_io_res,sBox16_41_io_res,sBox16_42_io_res,sBox16_43_io_res,sBox16_44_io_res,sBox16_45_io_res,sBox16_46_io_res,sBox16_47_io_res,sBox16_48_io_res,sBox16_49_io_res)
  begin
    io_chiOut(399 downto 384) <= sBox16_25_io_res;
    io_chiOut(383 downto 368) <= sBox16_26_io_res;
    io_chiOut(367 downto 352) <= sBox16_27_io_res;
    io_chiOut(351 downto 336) <= sBox16_28_io_res;
    io_chiOut(335 downto 320) <= sBox16_29_io_res;
    io_chiOut(319 downto 304) <= sBox16_30_io_res;
    io_chiOut(303 downto 288) <= sBox16_31_io_res;
    io_chiOut(287 downto 272) <= sBox16_32_io_res;
    io_chiOut(271 downto 256) <= sBox16_33_io_res;
    io_chiOut(255 downto 240) <= sBox16_34_io_res;
    io_chiOut(239 downto 224) <= sBox16_35_io_res;
    io_chiOut(223 downto 208) <= sBox16_36_io_res;
    io_chiOut(207 downto 192) <= sBox16_37_io_res;
    io_chiOut(191 downto 176) <= sBox16_38_io_res;
    io_chiOut(175 downto 160) <= sBox16_39_io_res;
    io_chiOut(159 downto 144) <= sBox16_40_io_res;
    io_chiOut(143 downto 128) <= sBox16_41_io_res;
    io_chiOut(127 downto 112) <= sBox16_42_io_res;
    io_chiOut(111 downto 96) <= sBox16_43_io_res;
    io_chiOut(95 downto 80) <= sBox16_44_io_res;
    io_chiOut(79 downto 64) <= sBox16_45_io_res;
    io_chiOut(63 downto 48) <= sBox16_46_io_res;
    io_chiOut(47 downto 32) <= sBox16_47_io_res;
    io_chiOut(31 downto 16) <= sBox16_48_io_res;
    io_chiOut(15 downto 0) <= sBox16_49_io_res;
  end process;

  sBox16_26_io_a1 <= pkg_extract(io_chiIn,383,368);
  sBox16_26_io_a2 <= pkg_extract(io_chiIn,367,352);
  sBox16_26_io_a3 <= pkg_extract(io_chiIn,351,336);
  sBox16_27_io_a1 <= pkg_extract(io_chiIn,367,352);
  sBox16_27_io_a2 <= pkg_extract(io_chiIn,351,336);
  sBox16_27_io_a3 <= pkg_extract(io_chiIn,335,320);
  sBox16_28_io_a1 <= pkg_extract(io_chiIn,351,336);
  sBox16_28_io_a2 <= pkg_extract(io_chiIn,335,320);
  sBox16_28_io_a3 <= pkg_extract(io_chiIn,399,384);
  sBox16_29_io_a1 <= pkg_extract(io_chiIn,335,320);
  sBox16_29_io_a2 <= pkg_extract(io_chiIn,399,384);
  sBox16_29_io_a3 <= pkg_extract(io_chiIn,383,368);
  sBox16_30_io_a1 <= pkg_extract(io_chiIn,319,304);
  sBox16_30_io_a2 <= pkg_extract(io_chiIn,303,288);
  sBox16_30_io_a3 <= pkg_extract(io_chiIn,287,272);
  sBox16_31_io_a1 <= pkg_extract(io_chiIn,303,288);
  sBox16_31_io_a2 <= pkg_extract(io_chiIn,287,272);
  sBox16_31_io_a3 <= pkg_extract(io_chiIn,271,256);
  sBox16_32_io_a1 <= pkg_extract(io_chiIn,287,272);
  sBox16_32_io_a2 <= pkg_extract(io_chiIn,271,256);
  sBox16_32_io_a3 <= pkg_extract(io_chiIn,255,240);
  sBox16_33_io_a1 <= pkg_extract(io_chiIn,271,256);
  sBox16_33_io_a2 <= pkg_extract(io_chiIn,255,240);
  sBox16_33_io_a3 <= pkg_extract(io_chiIn,319,304);
  sBox16_34_io_a1 <= pkg_extract(io_chiIn,255,240);
  sBox16_34_io_a2 <= pkg_extract(io_chiIn,319,304);
  sBox16_34_io_a3 <= pkg_extract(io_chiIn,303,288);
  sBox16_35_io_a1 <= pkg_extract(io_chiIn,239,224);
  sBox16_35_io_a2 <= pkg_extract(io_chiIn,223,208);
  sBox16_35_io_a3 <= pkg_extract(io_chiIn,207,192);
  sBox16_36_io_a1 <= pkg_extract(io_chiIn,223,208);
  sBox16_36_io_a2 <= pkg_extract(io_chiIn,207,192);
  sBox16_36_io_a3 <= pkg_extract(io_chiIn,191,176);
  sBox16_37_io_a1 <= pkg_extract(io_chiIn,207,192);
  sBox16_37_io_a2 <= pkg_extract(io_chiIn,191,176);
  sBox16_37_io_a3 <= pkg_extract(io_chiIn,175,160);
  sBox16_38_io_a1 <= pkg_extract(io_chiIn,191,176);
  sBox16_38_io_a2 <= pkg_extract(io_chiIn,175,160);
  sBox16_38_io_a3 <= pkg_extract(io_chiIn,239,224);
  sBox16_39_io_a1 <= pkg_extract(io_chiIn,175,160);
  sBox16_39_io_a2 <= pkg_extract(io_chiIn,239,224);
  sBox16_39_io_a3 <= pkg_extract(io_chiIn,223,208);
  sBox16_40_io_a1 <= pkg_extract(io_chiIn,159,144);
  sBox16_40_io_a2 <= pkg_extract(io_chiIn,143,128);
  sBox16_40_io_a3 <= pkg_extract(io_chiIn,127,112);
  sBox16_41_io_a1 <= pkg_extract(io_chiIn,143,128);
  sBox16_41_io_a2 <= pkg_extract(io_chiIn,127,112);
  sBox16_41_io_a3 <= pkg_extract(io_chiIn,111,96);
  sBox16_42_io_a1 <= pkg_extract(io_chiIn,127,112);
  sBox16_42_io_a2 <= pkg_extract(io_chiIn,111,96);
  sBox16_42_io_a3 <= pkg_extract(io_chiIn,95,80);
  sBox16_43_io_a1 <= pkg_extract(io_chiIn,111,96);
  sBox16_43_io_a2 <= pkg_extract(io_chiIn,95,80);
  sBox16_43_io_a3 <= pkg_extract(io_chiIn,159,144);
  sBox16_44_io_a1 <= pkg_extract(io_chiIn,95,80);
  sBox16_44_io_a2 <= pkg_extract(io_chiIn,159,144);
  sBox16_44_io_a3 <= pkg_extract(io_chiIn,143,128);
  sBox16_45_io_a1 <= pkg_extract(io_chiIn,79,64);
  sBox16_45_io_a2 <= pkg_extract(io_chiIn,63,48);
  sBox16_45_io_a3 <= pkg_extract(io_chiIn,47,32);
  sBox16_46_io_a1 <= pkg_extract(io_chiIn,63,48);
  sBox16_46_io_a2 <= pkg_extract(io_chiIn,47,32);
  sBox16_46_io_a3 <= pkg_extract(io_chiIn,31,16);
  sBox16_47_io_a1 <= pkg_extract(io_chiIn,47,32);
  sBox16_47_io_a2 <= pkg_extract(io_chiIn,31,16);
  sBox16_47_io_a3 <= pkg_extract(io_chiIn,15,0);
  sBox16_48_io_a1 <= pkg_extract(io_chiIn,31,16);
  sBox16_48_io_a2 <= pkg_extract(io_chiIn,15,0);
  sBox16_48_io_a3 <= pkg_extract(io_chiIn,79,64);
  sBox16_49_io_a1 <= pkg_extract(io_chiIn,15,0);
  sBox16_49_io_a2 <= pkg_extract(io_chiIn,79,64);
  sBox16_49_io_a3 <= pkg_extract(io_chiIn,63,48);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Iota400 is
  port(
    io_iotaIn : in std_logic_vector(399 downto 0);
    io_round : in unsigned(4 downto 0);
    io_iotaOut : out std_logic_vector(399 downto 0)
  );
end Iota400;

architecture arch of Iota400 is

  signal roundConstant : std_logic_vector(63 downto 0);
  signal zz_roundConstant : std_logic_vector(63 downto 0);
begin
  process(io_round)
  begin
    case io_round is
      when "00000" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000001");
      when "00001" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000001000000010000010");
      when "00010" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000001000000010001010");
      when "00011" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000010000000000000001000000000000000");
      when "00100" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000001000000010001011");
      when "00101" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000010000000000000000000000000000001");
      when "00110" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000010000000000000001000000010000001");
      when "00111" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000001000000000001001");
      when "01000" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000010001010");
      when "01001" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000010001000");
      when "01010" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000010000000000000001000000000001001");
      when "01011" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000010000000000000000000000000001010");
      when "01100" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000010000000000000001000000010001011");
      when "01101" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000000000000010001011");
      when "01110" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000001000000010001001");
      when "01111" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000001000000000000011");
      when "10000" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000001000000000000010");
      when "10001" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000000000000010000000");
      when "10010" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000001000000000001010");
      when "10011" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000010000000000000000000000000001010");
      when "10100" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000010000000000000001000000010000001");
      when "10101" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000000000000000000001000000010000000");
      when "10110" =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000010000000000000000000000000000001");
      when "10111" =>
        zz_roundConstant <= pkg_stdLogicVector("1000000000000000000000000000000010000000000000001000000000001000");
      when others =>
        zz_roundConstant <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    end case;
  end process;

  roundConstant <= zz_roundConstant;
  io_iotaOut <= pkg_cat((pkg_extract(io_iotaIn,399,384) xor pkg_extract(roundConstant,15,0)),pkg_extract(io_iotaIn,383,0));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KECCAK400 is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_keccakIn : in std_logic_vector(399 downto 0);
    io_keccakOut : out std_logic_vector(399 downto 0);
    io_done : out std_logic
  );
end KECCAK400;

architecture arch of KECCAK400 is
  signal r_theta_io_thetaOut : std_logic_vector(399 downto 0);
  signal r_rhopi_io_rhoOut : std_logic_vector(399 downto 0);
  signal r_chi_io_chiOut : std_logic_vector(399 downto 0);
  signal r_iota_io_iotaOut : std_logic_vector(399 downto 0);

  signal r_state : std_logic_vector(399 downto 0);
  signal r_roundCounter_willIncrement : std_logic;
  signal r_roundCounter_willClear : std_logic;
  signal r_roundCounter_valueNext : unsigned(4 downto 0);
  signal r_roundCounter_value : unsigned(4 downto 0);
  signal r_roundCounter_willOverflowIfInc : std_logic;
  signal r_roundCounter_willOverflow : std_logic;
  signal r_thetaIn : std_logic_vector(399 downto 0);
  signal r_thetaOut : std_logic_vector(399 downto 0);
  signal r_rhoOut : std_logic_vector(399 downto 0);
  signal r_chiOut : std_logic_vector(399 downto 0);
  signal r_iotaOut : std_logic_vector(399 downto 0);
  signal r_keccakState : States;
begin
  r_theta : entity work.Theta400
    port map ( 
      io_thetaIn => r_thetaIn,
      io_thetaOut => r_theta_io_thetaOut 
    );
  r_rhopi : entity work.RhoPi400
    port map ( 
      io_rhoIn => r_thetaOut,
      io_rhoOut => r_rhopi_io_rhoOut 
    );
  r_chi : entity work.Chi400
    port map ( 
      io_chiIn => r_rhoOut,
      io_chiOut => r_chi_io_chiOut 
    );
  r_iota : entity work.Iota400
    port map ( 
      io_iotaIn => r_chiOut,
      io_round => r_roundCounter_value,
      io_iotaOut => r_iota_io_iotaOut 
    );
  process(r_keccakState)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_keccakState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_keccakState)
  begin
    r_roundCounter_willIncrement <= pkg_toStdLogic(false);
    case r_keccakState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        r_roundCounter_willIncrement <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(r_keccakState)
  begin
    r_roundCounter_willClear <= pkg_toStdLogic(false);
    case r_keccakState is
      when pkg_enum.sIdle =>
        r_roundCounter_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  r_roundCounter_willOverflowIfInc <= pkg_toStdLogic(r_roundCounter_value = pkg_unsigned("10111"));
  r_roundCounter_willOverflow <= (r_roundCounter_willOverflowIfInc and r_roundCounter_willIncrement);
  process(r_roundCounter_willOverflow,r_roundCounter_value,r_roundCounter_willIncrement,r_roundCounter_willClear)
  begin
    if r_roundCounter_willOverflow = '1' then
      r_roundCounter_valueNext <= pkg_unsigned("00000");
    else
      r_roundCounter_valueNext <= (r_roundCounter_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_roundCounter_willIncrement)),5));
    end if;
    if r_roundCounter_willClear = '1' then
      r_roundCounter_valueNext <= pkg_unsigned("00000");
    end if;
  end process;

  io_keccakOut <= r_state;
  r_thetaIn <= r_state;
  r_thetaOut <= r_theta_io_thetaOut;
  r_rhoOut <= r_rhopi_io_rhoOut;
  r_chiOut <= r_chi_io_chiOut;
  r_iotaOut <= r_iota_io_iotaOut;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_state <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_roundCounter_value <= pkg_unsigned("00000");
      r_keccakState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_state <= r_iotaOut;
      case r_keccakState is
        when pkg_enum.sIdle =>
          r_keccakState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_state <= io_keccakIn;
            r_keccakState <= pkg_enum.sExecute;
          end if;
        when pkg_enum.sExecute =>
          r_keccakState <= pkg_enum.sExecute;
          if r_roundCounter_willOverflow = '1' then
            r_keccakState <= pkg_enum.sDone;
          end if;
        when others =>
          r_keccakState <= pkg_enum.sDone;
      end case;
    end if;
  end process;

end arch;

