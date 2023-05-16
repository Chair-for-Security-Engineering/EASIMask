-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : KECCAK
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


entity SBox is
  port(
    io_a1 : in std_logic_vector(63 downto 0);
    io_a2 : in std_logic_vector(63 downto 0);
    io_a3 : in std_logic_vector(63 downto 0);
    io_res : out std_logic_vector(63 downto 0)
  );
end SBox;

architecture arch of SBox is

begin
  io_res <= (io_a1 xor (pkg_not(io_a2) and io_a3));
end arch;


--SBox_1 replaced by SBox


--SBox_2 replaced by SBox


--SBox_3 replaced by SBox


--SBox_4 replaced by SBox


--SBox_5 replaced by SBox


--SBox_6 replaced by SBox


--SBox_7 replaced by SBox


--SBox_8 replaced by SBox


--SBox_9 replaced by SBox


--SBox_10 replaced by SBox


--SBox_11 replaced by SBox


--SBox_12 replaced by SBox


--SBox_13 replaced by SBox


--SBox_14 replaced by SBox


--SBox_15 replaced by SBox


--SBox_16 replaced by SBox


--SBox_17 replaced by SBox


--SBox_18 replaced by SBox


--SBox_19 replaced by SBox


--SBox_20 replaced by SBox


--SBox_21 replaced by SBox


--SBox_22 replaced by SBox


--SBox_23 replaced by SBox


--SBox_24 replaced by SBox

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Theta is
  port(
    io_thetaIn : in std_logic_vector(1599 downto 0);
    io_thetaOut : out std_logic_vector(1599 downto 0)
  );
end Theta;

architecture arch of Theta is

  signal b : std_logic_vector(319 downto 0);
  signal d : std_logic_vector(319 downto 0);
  signal zz_d : std_logic_vector(63 downto 0);
  signal zz_d_1 : std_logic_vector(63 downto 0);
  signal zz_d_2 : std_logic_vector(63 downto 0);
  signal zz_d_3 : std_logic_vector(63 downto 0);
  signal zz_d_4 : std_logic_vector(63 downto 0);
begin
  b <= ((((pkg_extract(io_thetaIn,1599,1280) xor pkg_extract(io_thetaIn,1279,960)) xor pkg_extract(io_thetaIn,959,640)) xor pkg_extract(io_thetaIn,639,320)) xor pkg_extract(io_thetaIn,319,0));
  zz_d <= pkg_extract(b,255,192);
  process(b,zz_d,zz_d_1,zz_d_2,zz_d_3,zz_d_4)
  begin
    d(319 downto 256) <= (pkg_extract(b,63,0) xor pkg_cat(pkg_extract(zz_d,62,0),pkg_extract(zz_d,63,63)));
    d(255 downto 192) <= (pkg_extract(b,319,256) xor pkg_cat(pkg_extract(zz_d_1,62,0),pkg_extract(zz_d_1,63,63)));
    d(191 downto 128) <= (pkg_extract(b,255,192) xor pkg_cat(pkg_extract(zz_d_2,62,0),pkg_extract(zz_d_2,63,63)));
    d(127 downto 64) <= (pkg_extract(b,191,128) xor pkg_cat(pkg_extract(zz_d_3,62,0),pkg_extract(zz_d_3,63,63)));
    d(63 downto 0) <= (pkg_extract(b,127,64) xor pkg_cat(pkg_extract(zz_d_4,62,0),pkg_extract(zz_d_4,63,63)));
  end process;

  zz_d_1 <= pkg_extract(b,191,128);
  zz_d_2 <= pkg_extract(b,127,64);
  zz_d_3 <= pkg_extract(b,63,0);
  zz_d_4 <= pkg_extract(b,319,256);
  process(io_thetaIn,d)
  begin
    io_thetaOut(1599 downto 1536) <= (pkg_extract(io_thetaIn,1599,1536) xor pkg_extract(d,319,256));
    io_thetaOut(1535 downto 1472) <= (pkg_extract(io_thetaIn,1535,1472) xor pkg_extract(d,255,192));
    io_thetaOut(1471 downto 1408) <= (pkg_extract(io_thetaIn,1471,1408) xor pkg_extract(d,191,128));
    io_thetaOut(1407 downto 1344) <= (pkg_extract(io_thetaIn,1407,1344) xor pkg_extract(d,127,64));
    io_thetaOut(1343 downto 1280) <= (pkg_extract(io_thetaIn,1343,1280) xor pkg_extract(d,63,0));
    io_thetaOut(1279 downto 1216) <= (pkg_extract(io_thetaIn,1279,1216) xor pkg_extract(d,319,256));
    io_thetaOut(1215 downto 1152) <= (pkg_extract(io_thetaIn,1215,1152) xor pkg_extract(d,255,192));
    io_thetaOut(1151 downto 1088) <= (pkg_extract(io_thetaIn,1151,1088) xor pkg_extract(d,191,128));
    io_thetaOut(1087 downto 1024) <= (pkg_extract(io_thetaIn,1087,1024) xor pkg_extract(d,127,64));
    io_thetaOut(1023 downto 960) <= (pkg_extract(io_thetaIn,1023,960) xor pkg_extract(d,63,0));
    io_thetaOut(959 downto 896) <= (pkg_extract(io_thetaIn,959,896) xor pkg_extract(d,319,256));
    io_thetaOut(895 downto 832) <= (pkg_extract(io_thetaIn,895,832) xor pkg_extract(d,255,192));
    io_thetaOut(831 downto 768) <= (pkg_extract(io_thetaIn,831,768) xor pkg_extract(d,191,128));
    io_thetaOut(767 downto 704) <= (pkg_extract(io_thetaIn,767,704) xor pkg_extract(d,127,64));
    io_thetaOut(703 downto 640) <= (pkg_extract(io_thetaIn,703,640) xor pkg_extract(d,63,0));
    io_thetaOut(639 downto 576) <= (pkg_extract(io_thetaIn,639,576) xor pkg_extract(d,319,256));
    io_thetaOut(575 downto 512) <= (pkg_extract(io_thetaIn,575,512) xor pkg_extract(d,255,192));
    io_thetaOut(511 downto 448) <= (pkg_extract(io_thetaIn,511,448) xor pkg_extract(d,191,128));
    io_thetaOut(447 downto 384) <= (pkg_extract(io_thetaIn,447,384) xor pkg_extract(d,127,64));
    io_thetaOut(383 downto 320) <= (pkg_extract(io_thetaIn,383,320) xor pkg_extract(d,63,0));
    io_thetaOut(319 downto 256) <= (pkg_extract(io_thetaIn,319,256) xor pkg_extract(d,319,256));
    io_thetaOut(255 downto 192) <= (pkg_extract(io_thetaIn,255,192) xor pkg_extract(d,255,192));
    io_thetaOut(191 downto 128) <= (pkg_extract(io_thetaIn,191,128) xor pkg_extract(d,191,128));
    io_thetaOut(127 downto 64) <= (pkg_extract(io_thetaIn,127,64) xor pkg_extract(d,127,64));
    io_thetaOut(63 downto 0) <= (pkg_extract(io_thetaIn,63,0) xor pkg_extract(d,63,0));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity RhoPi is
  port(
    io_rhoIn : in std_logic_vector(1599 downto 0);
    io_rhoOut : out std_logic_vector(1599 downto 0)
  );
end RhoPi;

architecture arch of RhoPi is

  signal zz_io_rhoOut : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_1 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_2 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_3 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_4 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_5 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_6 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_7 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_8 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_9 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_10 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_11 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_12 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_13 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_14 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_15 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_16 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_17 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_18 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_19 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_20 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_21 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_22 : std_logic_vector(63 downto 0);
  signal zz_io_rhoOut_23 : std_logic_vector(63 downto 0);
begin
  process(io_rhoIn,zz_io_rhoOut,zz_io_rhoOut_1,zz_io_rhoOut_2,zz_io_rhoOut_3,zz_io_rhoOut_4,zz_io_rhoOut_5,zz_io_rhoOut_6,zz_io_rhoOut_7,zz_io_rhoOut_8,zz_io_rhoOut_9,zz_io_rhoOut_10,zz_io_rhoOut_11,zz_io_rhoOut_12,zz_io_rhoOut_13,zz_io_rhoOut_14,zz_io_rhoOut_15,zz_io_rhoOut_16,zz_io_rhoOut_17,zz_io_rhoOut_18,zz_io_rhoOut_19,zz_io_rhoOut_20,zz_io_rhoOut_21,zz_io_rhoOut_22,zz_io_rhoOut_23)
  begin
    io_rhoOut(1599 downto 1536) <= pkg_extract(pkg_extract(io_rhoIn,1599,1536),63,0);
    io_rhoOut(1535 downto 1472) <= pkg_cat(pkg_extract(zz_io_rhoOut,19,0),pkg_extract(zz_io_rhoOut,63,20));
    io_rhoOut(1471 downto 1408) <= pkg_cat(pkg_extract(zz_io_rhoOut_1,20,0),pkg_extract(zz_io_rhoOut_1,63,21));
    io_rhoOut(1407 downto 1344) <= pkg_cat(pkg_extract(zz_io_rhoOut_2,42,0),pkg_extract(zz_io_rhoOut_2,63,43));
    io_rhoOut(1343 downto 1280) <= pkg_cat(pkg_extract(zz_io_rhoOut_3,49,0),pkg_extract(zz_io_rhoOut_3,63,50));
    io_rhoOut(1279 downto 1216) <= pkg_cat(pkg_extract(zz_io_rhoOut_4,35,0),pkg_extract(zz_io_rhoOut_4,63,36));
    io_rhoOut(1215 downto 1152) <= pkg_cat(pkg_extract(zz_io_rhoOut_5,43,0),pkg_extract(zz_io_rhoOut_5,63,44));
    io_rhoOut(1151 downto 1088) <= pkg_cat(pkg_extract(zz_io_rhoOut_6,60,0),pkg_extract(zz_io_rhoOut_6,63,61));
    io_rhoOut(1087 downto 1024) <= pkg_cat(pkg_extract(zz_io_rhoOut_7,18,0),pkg_extract(zz_io_rhoOut_7,63,19));
    io_rhoOut(1023 downto 960) <= pkg_cat(pkg_extract(zz_io_rhoOut_8,2,0),pkg_extract(zz_io_rhoOut_8,63,3));
    io_rhoOut(959 downto 896) <= pkg_cat(pkg_extract(zz_io_rhoOut_9,62,0),pkg_extract(zz_io_rhoOut_9,63,63));
    io_rhoOut(895 downto 832) <= pkg_cat(pkg_extract(zz_io_rhoOut_10,57,0),pkg_extract(zz_io_rhoOut_10,63,58));
    io_rhoOut(831 downto 768) <= pkg_cat(pkg_extract(zz_io_rhoOut_11,38,0),pkg_extract(zz_io_rhoOut_11,63,39));
    io_rhoOut(767 downto 704) <= pkg_cat(pkg_extract(zz_io_rhoOut_12,55,0),pkg_extract(zz_io_rhoOut_12,63,56));
    io_rhoOut(703 downto 640) <= pkg_cat(pkg_extract(zz_io_rhoOut_13,45,0),pkg_extract(zz_io_rhoOut_13,63,46));
    io_rhoOut(639 downto 576) <= pkg_cat(pkg_extract(zz_io_rhoOut_14,36,0),pkg_extract(zz_io_rhoOut_14,63,37));
    io_rhoOut(575 downto 512) <= pkg_cat(pkg_extract(zz_io_rhoOut_15,27,0),pkg_extract(zz_io_rhoOut_15,63,28));
    io_rhoOut(511 downto 448) <= pkg_cat(pkg_extract(zz_io_rhoOut_16,53,0),pkg_extract(zz_io_rhoOut_16,63,54));
    io_rhoOut(447 downto 384) <= pkg_cat(pkg_extract(zz_io_rhoOut_17,48,0),pkg_extract(zz_io_rhoOut_17,63,49));
    io_rhoOut(383 downto 320) <= pkg_cat(pkg_extract(zz_io_rhoOut_18,7,0),pkg_extract(zz_io_rhoOut_18,63,8));
    io_rhoOut(319 downto 256) <= pkg_cat(pkg_extract(zz_io_rhoOut_19,1,0),pkg_extract(zz_io_rhoOut_19,63,2));
    io_rhoOut(255 downto 192) <= pkg_cat(pkg_extract(zz_io_rhoOut_20,8,0),pkg_extract(zz_io_rhoOut_20,63,9));
    io_rhoOut(191 downto 128) <= pkg_cat(pkg_extract(zz_io_rhoOut_21,24,0),pkg_extract(zz_io_rhoOut_21,63,25));
    io_rhoOut(127 downto 64) <= pkg_cat(pkg_extract(zz_io_rhoOut_22,22,0),pkg_extract(zz_io_rhoOut_22,63,23));
    io_rhoOut(63 downto 0) <= pkg_cat(pkg_extract(zz_io_rhoOut_23,61,0),pkg_extract(zz_io_rhoOut_23,63,62));
  end process;

  zz_io_rhoOut <= pkg_extract(io_rhoIn,1215,1152);
  zz_io_rhoOut_1 <= pkg_extract(io_rhoIn,831,768);
  zz_io_rhoOut_2 <= pkg_extract(io_rhoIn,447,384);
  zz_io_rhoOut_3 <= pkg_extract(io_rhoIn,63,0);
  zz_io_rhoOut_4 <= pkg_extract(io_rhoIn,1407,1344);
  zz_io_rhoOut_5 <= pkg_extract(io_rhoIn,1023,960);
  zz_io_rhoOut_6 <= pkg_extract(io_rhoIn,959,896);
  zz_io_rhoOut_7 <= pkg_extract(io_rhoIn,575,512);
  zz_io_rhoOut_8 <= pkg_extract(io_rhoIn,191,128);
  zz_io_rhoOut_9 <= pkg_extract(io_rhoIn,1535,1472);
  zz_io_rhoOut_10 <= pkg_extract(io_rhoIn,1151,1088);
  zz_io_rhoOut_11 <= pkg_extract(io_rhoIn,767,704);
  zz_io_rhoOut_12 <= pkg_extract(io_rhoIn,383,320);
  zz_io_rhoOut_13 <= pkg_extract(io_rhoIn,319,256);
  zz_io_rhoOut_14 <= pkg_extract(io_rhoIn,1343,1280);
  zz_io_rhoOut_15 <= pkg_extract(io_rhoIn,1279,1216);
  zz_io_rhoOut_16 <= pkg_extract(io_rhoIn,895,832);
  zz_io_rhoOut_17 <= pkg_extract(io_rhoIn,511,448);
  zz_io_rhoOut_18 <= pkg_extract(io_rhoIn,127,64);
  zz_io_rhoOut_19 <= pkg_extract(io_rhoIn,1471,1408);
  zz_io_rhoOut_20 <= pkg_extract(io_rhoIn,1087,1024);
  zz_io_rhoOut_21 <= pkg_extract(io_rhoIn,703,640);
  zz_io_rhoOut_22 <= pkg_extract(io_rhoIn,639,576);
  zz_io_rhoOut_23 <= pkg_extract(io_rhoIn,255,192);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Chi is
  port(
    io_chiIn : in std_logic_vector(1599 downto 0);
    io_chiOut : out std_logic_vector(1599 downto 0)
  );
end Chi;

architecture arch of Chi is
  signal sBox_25_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_25_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_25_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_26_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_26_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_26_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_27_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_27_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_27_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_28_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_28_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_28_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_29_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_29_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_29_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_30_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_30_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_30_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_31_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_31_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_31_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_32_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_32_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_32_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_33_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_33_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_33_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_34_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_34_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_34_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_35_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_35_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_35_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_36_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_36_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_36_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_37_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_37_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_37_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_38_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_38_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_38_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_39_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_39_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_39_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_40_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_40_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_40_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_41_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_41_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_41_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_42_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_42_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_42_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_43_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_43_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_43_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_44_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_44_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_44_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_45_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_45_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_45_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_46_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_46_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_46_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_47_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_47_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_47_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_48_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_48_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_48_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_49_io_a1 : std_logic_vector(63 downto 0);
  signal sBox_49_io_a2 : std_logic_vector(63 downto 0);
  signal sBox_49_io_a3 : std_logic_vector(63 downto 0);
  signal sBox_25_io_res : std_logic_vector(63 downto 0);
  signal sBox_26_io_res : std_logic_vector(63 downto 0);
  signal sBox_27_io_res : std_logic_vector(63 downto 0);
  signal sBox_28_io_res : std_logic_vector(63 downto 0);
  signal sBox_29_io_res : std_logic_vector(63 downto 0);
  signal sBox_30_io_res : std_logic_vector(63 downto 0);
  signal sBox_31_io_res : std_logic_vector(63 downto 0);
  signal sBox_32_io_res : std_logic_vector(63 downto 0);
  signal sBox_33_io_res : std_logic_vector(63 downto 0);
  signal sBox_34_io_res : std_logic_vector(63 downto 0);
  signal sBox_35_io_res : std_logic_vector(63 downto 0);
  signal sBox_36_io_res : std_logic_vector(63 downto 0);
  signal sBox_37_io_res : std_logic_vector(63 downto 0);
  signal sBox_38_io_res : std_logic_vector(63 downto 0);
  signal sBox_39_io_res : std_logic_vector(63 downto 0);
  signal sBox_40_io_res : std_logic_vector(63 downto 0);
  signal sBox_41_io_res : std_logic_vector(63 downto 0);
  signal sBox_42_io_res : std_logic_vector(63 downto 0);
  signal sBox_43_io_res : std_logic_vector(63 downto 0);
  signal sBox_44_io_res : std_logic_vector(63 downto 0);
  signal sBox_45_io_res : std_logic_vector(63 downto 0);
  signal sBox_46_io_res : std_logic_vector(63 downto 0);
  signal sBox_47_io_res : std_logic_vector(63 downto 0);
  signal sBox_48_io_res : std_logic_vector(63 downto 0);
  signal sBox_49_io_res : std_logic_vector(63 downto 0);

begin
  sBox_25 : entity work.SBox
    port map ( 
      io_a1 => sBox_25_io_a1,
      io_a2 => sBox_25_io_a2,
      io_a3 => sBox_25_io_a3,
      io_res => sBox_25_io_res 
    );
  sBox_26 : entity work.SBox
    port map ( 
      io_a1 => sBox_26_io_a1,
      io_a2 => sBox_26_io_a2,
      io_a3 => sBox_26_io_a3,
      io_res => sBox_26_io_res 
    );
  sBox_27 : entity work.SBox
    port map ( 
      io_a1 => sBox_27_io_a1,
      io_a2 => sBox_27_io_a2,
      io_a3 => sBox_27_io_a3,
      io_res => sBox_27_io_res 
    );
  sBox_28 : entity work.SBox
    port map ( 
      io_a1 => sBox_28_io_a1,
      io_a2 => sBox_28_io_a2,
      io_a3 => sBox_28_io_a3,
      io_res => sBox_28_io_res 
    );
  sBox_29 : entity work.SBox
    port map ( 
      io_a1 => sBox_29_io_a1,
      io_a2 => sBox_29_io_a2,
      io_a3 => sBox_29_io_a3,
      io_res => sBox_29_io_res 
    );
  sBox_30 : entity work.SBox
    port map ( 
      io_a1 => sBox_30_io_a1,
      io_a2 => sBox_30_io_a2,
      io_a3 => sBox_30_io_a3,
      io_res => sBox_30_io_res 
    );
  sBox_31 : entity work.SBox
    port map ( 
      io_a1 => sBox_31_io_a1,
      io_a2 => sBox_31_io_a2,
      io_a3 => sBox_31_io_a3,
      io_res => sBox_31_io_res 
    );
  sBox_32 : entity work.SBox
    port map ( 
      io_a1 => sBox_32_io_a1,
      io_a2 => sBox_32_io_a2,
      io_a3 => sBox_32_io_a3,
      io_res => sBox_32_io_res 
    );
  sBox_33 : entity work.SBox
    port map ( 
      io_a1 => sBox_33_io_a1,
      io_a2 => sBox_33_io_a2,
      io_a3 => sBox_33_io_a3,
      io_res => sBox_33_io_res 
    );
  sBox_34 : entity work.SBox
    port map ( 
      io_a1 => sBox_34_io_a1,
      io_a2 => sBox_34_io_a2,
      io_a3 => sBox_34_io_a3,
      io_res => sBox_34_io_res 
    );
  sBox_35 : entity work.SBox
    port map ( 
      io_a1 => sBox_35_io_a1,
      io_a2 => sBox_35_io_a2,
      io_a3 => sBox_35_io_a3,
      io_res => sBox_35_io_res 
    );
  sBox_36 : entity work.SBox
    port map ( 
      io_a1 => sBox_36_io_a1,
      io_a2 => sBox_36_io_a2,
      io_a3 => sBox_36_io_a3,
      io_res => sBox_36_io_res 
    );
  sBox_37 : entity work.SBox
    port map ( 
      io_a1 => sBox_37_io_a1,
      io_a2 => sBox_37_io_a2,
      io_a3 => sBox_37_io_a3,
      io_res => sBox_37_io_res 
    );
  sBox_38 : entity work.SBox
    port map ( 
      io_a1 => sBox_38_io_a1,
      io_a2 => sBox_38_io_a2,
      io_a3 => sBox_38_io_a3,
      io_res => sBox_38_io_res 
    );
  sBox_39 : entity work.SBox
    port map ( 
      io_a1 => sBox_39_io_a1,
      io_a2 => sBox_39_io_a2,
      io_a3 => sBox_39_io_a3,
      io_res => sBox_39_io_res 
    );
  sBox_40 : entity work.SBox
    port map ( 
      io_a1 => sBox_40_io_a1,
      io_a2 => sBox_40_io_a2,
      io_a3 => sBox_40_io_a3,
      io_res => sBox_40_io_res 
    );
  sBox_41 : entity work.SBox
    port map ( 
      io_a1 => sBox_41_io_a1,
      io_a2 => sBox_41_io_a2,
      io_a3 => sBox_41_io_a3,
      io_res => sBox_41_io_res 
    );
  sBox_42 : entity work.SBox
    port map ( 
      io_a1 => sBox_42_io_a1,
      io_a2 => sBox_42_io_a2,
      io_a3 => sBox_42_io_a3,
      io_res => sBox_42_io_res 
    );
  sBox_43 : entity work.SBox
    port map ( 
      io_a1 => sBox_43_io_a1,
      io_a2 => sBox_43_io_a2,
      io_a3 => sBox_43_io_a3,
      io_res => sBox_43_io_res 
    );
  sBox_44 : entity work.SBox
    port map ( 
      io_a1 => sBox_44_io_a1,
      io_a2 => sBox_44_io_a2,
      io_a3 => sBox_44_io_a3,
      io_res => sBox_44_io_res 
    );
  sBox_45 : entity work.SBox
    port map ( 
      io_a1 => sBox_45_io_a1,
      io_a2 => sBox_45_io_a2,
      io_a3 => sBox_45_io_a3,
      io_res => sBox_45_io_res 
    );
  sBox_46 : entity work.SBox
    port map ( 
      io_a1 => sBox_46_io_a1,
      io_a2 => sBox_46_io_a2,
      io_a3 => sBox_46_io_a3,
      io_res => sBox_46_io_res 
    );
  sBox_47 : entity work.SBox
    port map ( 
      io_a1 => sBox_47_io_a1,
      io_a2 => sBox_47_io_a2,
      io_a3 => sBox_47_io_a3,
      io_res => sBox_47_io_res 
    );
  sBox_48 : entity work.SBox
    port map ( 
      io_a1 => sBox_48_io_a1,
      io_a2 => sBox_48_io_a2,
      io_a3 => sBox_48_io_a3,
      io_res => sBox_48_io_res 
    );
  sBox_49 : entity work.SBox
    port map ( 
      io_a1 => sBox_49_io_a1,
      io_a2 => sBox_49_io_a2,
      io_a3 => sBox_49_io_a3,
      io_res => sBox_49_io_res 
    );
  sBox_25_io_a1 <= pkg_extract(io_chiIn,1599,1536);
  sBox_25_io_a2 <= pkg_extract(io_chiIn,1535,1472);
  sBox_25_io_a3 <= pkg_extract(io_chiIn,1471,1408);
  process(sBox_25_io_res,sBox_26_io_res,sBox_27_io_res,sBox_28_io_res,sBox_29_io_res,sBox_30_io_res,sBox_31_io_res,sBox_32_io_res,sBox_33_io_res,sBox_34_io_res,sBox_35_io_res,sBox_36_io_res,sBox_37_io_res,sBox_38_io_res,sBox_39_io_res,sBox_40_io_res,sBox_41_io_res,sBox_42_io_res,sBox_43_io_res,sBox_44_io_res,sBox_45_io_res,sBox_46_io_res,sBox_47_io_res,sBox_48_io_res,sBox_49_io_res)
  begin
    io_chiOut(1599 downto 1536) <= sBox_25_io_res;
    io_chiOut(1535 downto 1472) <= sBox_26_io_res;
    io_chiOut(1471 downto 1408) <= sBox_27_io_res;
    io_chiOut(1407 downto 1344) <= sBox_28_io_res;
    io_chiOut(1343 downto 1280) <= sBox_29_io_res;
    io_chiOut(1279 downto 1216) <= sBox_30_io_res;
    io_chiOut(1215 downto 1152) <= sBox_31_io_res;
    io_chiOut(1151 downto 1088) <= sBox_32_io_res;
    io_chiOut(1087 downto 1024) <= sBox_33_io_res;
    io_chiOut(1023 downto 960) <= sBox_34_io_res;
    io_chiOut(959 downto 896) <= sBox_35_io_res;
    io_chiOut(895 downto 832) <= sBox_36_io_res;
    io_chiOut(831 downto 768) <= sBox_37_io_res;
    io_chiOut(767 downto 704) <= sBox_38_io_res;
    io_chiOut(703 downto 640) <= sBox_39_io_res;
    io_chiOut(639 downto 576) <= sBox_40_io_res;
    io_chiOut(575 downto 512) <= sBox_41_io_res;
    io_chiOut(511 downto 448) <= sBox_42_io_res;
    io_chiOut(447 downto 384) <= sBox_43_io_res;
    io_chiOut(383 downto 320) <= sBox_44_io_res;
    io_chiOut(319 downto 256) <= sBox_45_io_res;
    io_chiOut(255 downto 192) <= sBox_46_io_res;
    io_chiOut(191 downto 128) <= sBox_47_io_res;
    io_chiOut(127 downto 64) <= sBox_48_io_res;
    io_chiOut(63 downto 0) <= sBox_49_io_res;
  end process;

  sBox_26_io_a1 <= pkg_extract(io_chiIn,1535,1472);
  sBox_26_io_a2 <= pkg_extract(io_chiIn,1471,1408);
  sBox_26_io_a3 <= pkg_extract(io_chiIn,1407,1344);
  sBox_27_io_a1 <= pkg_extract(io_chiIn,1471,1408);
  sBox_27_io_a2 <= pkg_extract(io_chiIn,1407,1344);
  sBox_27_io_a3 <= pkg_extract(io_chiIn,1343,1280);
  sBox_28_io_a1 <= pkg_extract(io_chiIn,1407,1344);
  sBox_28_io_a2 <= pkg_extract(io_chiIn,1343,1280);
  sBox_28_io_a3 <= pkg_extract(io_chiIn,1599,1536);
  sBox_29_io_a1 <= pkg_extract(io_chiIn,1343,1280);
  sBox_29_io_a2 <= pkg_extract(io_chiIn,1599,1536);
  sBox_29_io_a3 <= pkg_extract(io_chiIn,1535,1472);
  sBox_30_io_a1 <= pkg_extract(io_chiIn,1279,1216);
  sBox_30_io_a2 <= pkg_extract(io_chiIn,1215,1152);
  sBox_30_io_a3 <= pkg_extract(io_chiIn,1151,1088);
  sBox_31_io_a1 <= pkg_extract(io_chiIn,1215,1152);
  sBox_31_io_a2 <= pkg_extract(io_chiIn,1151,1088);
  sBox_31_io_a3 <= pkg_extract(io_chiIn,1087,1024);
  sBox_32_io_a1 <= pkg_extract(io_chiIn,1151,1088);
  sBox_32_io_a2 <= pkg_extract(io_chiIn,1087,1024);
  sBox_32_io_a3 <= pkg_extract(io_chiIn,1023,960);
  sBox_33_io_a1 <= pkg_extract(io_chiIn,1087,1024);
  sBox_33_io_a2 <= pkg_extract(io_chiIn,1023,960);
  sBox_33_io_a3 <= pkg_extract(io_chiIn,1279,1216);
  sBox_34_io_a1 <= pkg_extract(io_chiIn,1023,960);
  sBox_34_io_a2 <= pkg_extract(io_chiIn,1279,1216);
  sBox_34_io_a3 <= pkg_extract(io_chiIn,1215,1152);
  sBox_35_io_a1 <= pkg_extract(io_chiIn,959,896);
  sBox_35_io_a2 <= pkg_extract(io_chiIn,895,832);
  sBox_35_io_a3 <= pkg_extract(io_chiIn,831,768);
  sBox_36_io_a1 <= pkg_extract(io_chiIn,895,832);
  sBox_36_io_a2 <= pkg_extract(io_chiIn,831,768);
  sBox_36_io_a3 <= pkg_extract(io_chiIn,767,704);
  sBox_37_io_a1 <= pkg_extract(io_chiIn,831,768);
  sBox_37_io_a2 <= pkg_extract(io_chiIn,767,704);
  sBox_37_io_a3 <= pkg_extract(io_chiIn,703,640);
  sBox_38_io_a1 <= pkg_extract(io_chiIn,767,704);
  sBox_38_io_a2 <= pkg_extract(io_chiIn,703,640);
  sBox_38_io_a3 <= pkg_extract(io_chiIn,959,896);
  sBox_39_io_a1 <= pkg_extract(io_chiIn,703,640);
  sBox_39_io_a2 <= pkg_extract(io_chiIn,959,896);
  sBox_39_io_a3 <= pkg_extract(io_chiIn,895,832);
  sBox_40_io_a1 <= pkg_extract(io_chiIn,639,576);
  sBox_40_io_a2 <= pkg_extract(io_chiIn,575,512);
  sBox_40_io_a3 <= pkg_extract(io_chiIn,511,448);
  sBox_41_io_a1 <= pkg_extract(io_chiIn,575,512);
  sBox_41_io_a2 <= pkg_extract(io_chiIn,511,448);
  sBox_41_io_a3 <= pkg_extract(io_chiIn,447,384);
  sBox_42_io_a1 <= pkg_extract(io_chiIn,511,448);
  sBox_42_io_a2 <= pkg_extract(io_chiIn,447,384);
  sBox_42_io_a3 <= pkg_extract(io_chiIn,383,320);
  sBox_43_io_a1 <= pkg_extract(io_chiIn,447,384);
  sBox_43_io_a2 <= pkg_extract(io_chiIn,383,320);
  sBox_43_io_a3 <= pkg_extract(io_chiIn,639,576);
  sBox_44_io_a1 <= pkg_extract(io_chiIn,383,320);
  sBox_44_io_a2 <= pkg_extract(io_chiIn,639,576);
  sBox_44_io_a3 <= pkg_extract(io_chiIn,575,512);
  sBox_45_io_a1 <= pkg_extract(io_chiIn,319,256);
  sBox_45_io_a2 <= pkg_extract(io_chiIn,255,192);
  sBox_45_io_a3 <= pkg_extract(io_chiIn,191,128);
  sBox_46_io_a1 <= pkg_extract(io_chiIn,255,192);
  sBox_46_io_a2 <= pkg_extract(io_chiIn,191,128);
  sBox_46_io_a3 <= pkg_extract(io_chiIn,127,64);
  sBox_47_io_a1 <= pkg_extract(io_chiIn,191,128);
  sBox_47_io_a2 <= pkg_extract(io_chiIn,127,64);
  sBox_47_io_a3 <= pkg_extract(io_chiIn,63,0);
  sBox_48_io_a1 <= pkg_extract(io_chiIn,127,64);
  sBox_48_io_a2 <= pkg_extract(io_chiIn,63,0);
  sBox_48_io_a3 <= pkg_extract(io_chiIn,319,256);
  sBox_49_io_a1 <= pkg_extract(io_chiIn,63,0);
  sBox_49_io_a2 <= pkg_extract(io_chiIn,319,256);
  sBox_49_io_a3 <= pkg_extract(io_chiIn,255,192);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Iota is
  port(
    io_iotaIn : in std_logic_vector(1599 downto 0);
    io_round : in unsigned(4 downto 0);
    io_iotaOut : out std_logic_vector(1599 downto 0)
  );
end Iota;

architecture arch of Iota is

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
  io_iotaOut <= pkg_cat((pkg_extract(io_iotaIn,1599,1536) xor roundConstant),pkg_extract(io_iotaIn,1535,0));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KECCAK is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_keccakIn : in std_logic_vector(1599 downto 0);
    io_keccakOut : out std_logic_vector(1599 downto 0);
    io_done : out std_logic
  );
end KECCAK;

architecture arch of KECCAK is
  signal r_theta_io_thetaOut : std_logic_vector(1599 downto 0);
  signal r_rhopi_io_rhoOut : std_logic_vector(1599 downto 0);
  signal r_chi_io_chiOut : std_logic_vector(1599 downto 0);
  signal r_iota_io_iotaOut : std_logic_vector(1599 downto 0);

  signal r_state : std_logic_vector(1599 downto 0);
  signal r_roundCounter_willIncrement : std_logic;
  signal r_roundCounter_willClear : std_logic;
  signal r_roundCounter_valueNext : unsigned(4 downto 0);
  signal r_roundCounter_value : unsigned(4 downto 0);
  signal r_roundCounter_willOverflowIfInc : std_logic;
  signal r_roundCounter_willOverflow : std_logic;
  signal r_thetaIn : std_logic_vector(1599 downto 0);
  signal r_thetaOut : std_logic_vector(1599 downto 0);
  signal r_rhoOut : std_logic_vector(1599 downto 0);
  signal r_chiOut : std_logic_vector(1599 downto 0);
  signal r_iotaOut : std_logic_vector(1599 downto 0);
  signal r_current_0_0 : std_logic_vector(63 downto 0);
  signal r_current_0_1 : std_logic_vector(63 downto 0);
  signal r_current_0_2 : std_logic_vector(63 downto 0);
  signal r_current_0_3 : std_logic_vector(63 downto 0);
  signal r_current_0_4 : std_logic_vector(63 downto 0);
  signal r_current_1_0 : std_logic_vector(63 downto 0);
  signal r_current_1_1 : std_logic_vector(63 downto 0);
  signal r_current_1_2 : std_logic_vector(63 downto 0);
  signal r_current_1_3 : std_logic_vector(63 downto 0);
  signal r_current_1_4 : std_logic_vector(63 downto 0);
  signal r_current_2_0 : std_logic_vector(63 downto 0);
  signal r_current_2_1 : std_logic_vector(63 downto 0);
  signal r_current_2_2 : std_logic_vector(63 downto 0);
  signal r_current_2_3 : std_logic_vector(63 downto 0);
  signal r_current_2_4 : std_logic_vector(63 downto 0);
  signal r_current_3_0 : std_logic_vector(63 downto 0);
  signal r_current_3_1 : std_logic_vector(63 downto 0);
  signal r_current_3_2 : std_logic_vector(63 downto 0);
  signal r_current_3_3 : std_logic_vector(63 downto 0);
  signal r_current_3_4 : std_logic_vector(63 downto 0);
  signal r_current_4_0 : std_logic_vector(63 downto 0);
  signal r_current_4_1 : std_logic_vector(63 downto 0);
  signal r_current_4_2 : std_logic_vector(63 downto 0);
  signal r_current_4_3 : std_logic_vector(63 downto 0);
  signal r_current_4_4 : std_logic_vector(63 downto 0);
  signal r_keccakState : States;
begin
  r_theta : entity work.Theta
    port map ( 
      io_thetaIn => r_thetaIn,
      io_thetaOut => r_theta_io_thetaOut 
    );
  r_rhopi : entity work.RhoPi
    port map ( 
      io_rhoIn => r_thetaOut,
      io_rhoOut => r_rhopi_io_rhoOut 
    );
  r_chi : entity work.Chi
    port map ( 
      io_chiIn => r_rhoOut,
      io_chiOut => r_chi_io_chiOut 
    );
  r_iota : entity work.Iota
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

  r_current_0_0 <= pkg_extract(r_iotaOut,1599,1536);
  r_current_0_1 <= pkg_extract(r_iotaOut,1535,1472);
  r_current_0_2 <= pkg_extract(r_iotaOut,1471,1408);
  r_current_0_3 <= pkg_extract(r_iotaOut,1407,1344);
  r_current_0_4 <= pkg_extract(r_iotaOut,1343,1280);
  r_current_1_0 <= pkg_extract(r_iotaOut,1279,1216);
  r_current_1_1 <= pkg_extract(r_iotaOut,1215,1152);
  r_current_1_2 <= pkg_extract(r_iotaOut,1151,1088);
  r_current_1_3 <= pkg_extract(r_iotaOut,1087,1024);
  r_current_1_4 <= pkg_extract(r_iotaOut,1023,960);
  r_current_2_0 <= pkg_extract(r_iotaOut,959,896);
  r_current_2_1 <= pkg_extract(r_iotaOut,895,832);
  r_current_2_2 <= pkg_extract(r_iotaOut,831,768);
  r_current_2_3 <= pkg_extract(r_iotaOut,767,704);
  r_current_2_4 <= pkg_extract(r_iotaOut,703,640);
  r_current_3_0 <= pkg_extract(r_iotaOut,639,576);
  r_current_3_1 <= pkg_extract(r_iotaOut,575,512);
  r_current_3_2 <= pkg_extract(r_iotaOut,511,448);
  r_current_3_3 <= pkg_extract(r_iotaOut,447,384);
  r_current_3_4 <= pkg_extract(r_iotaOut,383,320);
  r_current_4_0 <= pkg_extract(r_iotaOut,319,256);
  r_current_4_1 <= pkg_extract(r_iotaOut,255,192);
  r_current_4_2 <= pkg_extract(r_iotaOut,191,128);
  r_current_4_3 <= pkg_extract(r_iotaOut,127,64);
  r_current_4_4 <= pkg_extract(r_iotaOut,63,0);
  io_keccakOut <= r_state;
  r_thetaIn <= r_state;
  r_thetaOut <= r_theta_io_thetaOut;
  r_rhoOut <= r_rhopi_io_rhoOut;
  r_chiOut <= r_chi_io_chiOut;
  r_iotaOut <= r_iota_io_iotaOut;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_state <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
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

