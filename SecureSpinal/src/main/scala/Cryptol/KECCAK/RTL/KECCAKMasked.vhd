-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : KECCAKMasked
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


entity SBoxMasked is
  port(
    io_c1 : in std_logic_vector(63 downto 0);
    io_c2 : in std_logic_vector(63 downto 0);
    io_a1 : in std_logic_vector(63 downto 0);
    io_a2 : in std_logic_vector(63 downto 0);
    io_b1 : in std_logic_vector(63 downto 0);
    io_b2 : in std_logic_vector(63 downto 0);
    io_res1 : out std_logic_vector(63 downto 0);
    io_res2 : out std_logic_vector(63 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end SBoxMasked;

architecture arch of SBoxMasked is

  signal a1b1 : std_logic_vector(63 downto 0);
  signal a1b2 : std_logic_vector(63 downto 0);
  signal a2b1 : std_logic_vector(63 downto 0);
  signal a2b2 : std_logic_vector(63 downto 0);
begin
  io_res1 <= (a1b1 xor a1b2);
  io_res2 <= (a2b1 xor a2b2);
  process(io_clk)
  begin
    if rising_edge(io_clk) then
      a1b1 <= (pkg_not(io_a1) and io_b1);
      a1b2 <= ((io_a1 and io_b2) xor io_c1);
      a2b1 <= ((io_a2 and io_b1) xor io_c2);
      a2b2 <= (pkg_not(io_a2) and io_b2);
    end if;
  end process;

end arch;


--SBoxMasked_1 replaced by SBoxMasked


--SBoxMasked_2 replaced by SBoxMasked


--SBoxMasked_3 replaced by SBoxMasked


--SBoxMasked_4 replaced by SBoxMasked


--SBoxMasked_5 replaced by SBoxMasked


--SBoxMasked_6 replaced by SBoxMasked


--SBoxMasked_7 replaced by SBoxMasked


--SBoxMasked_8 replaced by SBoxMasked


--SBoxMasked_9 replaced by SBoxMasked


--SBoxMasked_10 replaced by SBoxMasked


--SBoxMasked_11 replaced by SBoxMasked


--SBoxMasked_12 replaced by SBoxMasked


--SBoxMasked_13 replaced by SBoxMasked


--SBoxMasked_14 replaced by SBoxMasked


--SBoxMasked_15 replaced by SBoxMasked


--SBoxMasked_16 replaced by SBoxMasked


--SBoxMasked_17 replaced by SBoxMasked


--SBoxMasked_18 replaced by SBoxMasked


--SBoxMasked_19 replaced by SBoxMasked


--SBoxMasked_20 replaced by SBoxMasked


--SBoxMasked_21 replaced by SBoxMasked


--SBoxMasked_22 replaced by SBoxMasked


--SBoxMasked_23 replaced by SBoxMasked


--SBoxMasked_24 replaced by SBoxMasked

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
  zz_d <= pkg_extract(b,319,256);
  process(b,zz_d,zz_d_1,zz_d_2,zz_d_3,zz_d_4)
  begin
    d(63 downto 0) <= (pkg_extract(b,127,64) xor pkg_cat(pkg_extract(zz_d,62,0),pkg_extract(zz_d,63,63)));
    d(127 downto 64) <= (pkg_extract(b,191,128) xor pkg_cat(pkg_extract(zz_d_1,62,0),pkg_extract(zz_d_1,63,63)));
    d(191 downto 128) <= (pkg_extract(b,255,192) xor pkg_cat(pkg_extract(zz_d_2,62,0),pkg_extract(zz_d_2,63,63)));
    d(255 downto 192) <= (pkg_extract(b,319,256) xor pkg_cat(pkg_extract(zz_d_3,62,0),pkg_extract(zz_d_3,63,63)));
    d(319 downto 256) <= (pkg_extract(b,63,0) xor pkg_cat(pkg_extract(zz_d_4,62,0),pkg_extract(zz_d_4,63,63)));
  end process;

  zz_d_1 <= pkg_extract(b,63,0);
  zz_d_2 <= pkg_extract(b,127,64);
  zz_d_3 <= pkg_extract(b,191,128);
  zz_d_4 <= pkg_extract(b,255,192);
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


--Theta_1 replaced by Theta

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
    io_rhoOut(959 downto 896) <= pkg_cat(pkg_extract(zz_io_rhoOut,62,0),pkg_extract(zz_io_rhoOut,63,63));
    io_rhoOut(319 downto 256) <= pkg_cat(pkg_extract(zz_io_rhoOut_1,1,0),pkg_extract(zz_io_rhoOut_1,63,2));
    io_rhoOut(1279 downto 1216) <= pkg_cat(pkg_extract(zz_io_rhoOut_2,35,0),pkg_extract(zz_io_rhoOut_2,63,36));
    io_rhoOut(639 downto 576) <= pkg_cat(pkg_extract(zz_io_rhoOut_3,36,0),pkg_extract(zz_io_rhoOut_3,63,37));
    io_rhoOut(575 downto 512) <= pkg_cat(pkg_extract(zz_io_rhoOut_4,27,0),pkg_extract(zz_io_rhoOut_4,63,28));
    io_rhoOut(1535 downto 1472) <= pkg_cat(pkg_extract(zz_io_rhoOut_5,19,0),pkg_extract(zz_io_rhoOut_5,63,20));
    io_rhoOut(895 downto 832) <= pkg_cat(pkg_extract(zz_io_rhoOut_6,57,0),pkg_extract(zz_io_rhoOut_6,63,58));
    io_rhoOut(255 downto 192) <= pkg_cat(pkg_extract(zz_io_rhoOut_7,8,0),pkg_extract(zz_io_rhoOut_7,63,9));
    io_rhoOut(1215 downto 1152) <= pkg_cat(pkg_extract(zz_io_rhoOut_8,43,0),pkg_extract(zz_io_rhoOut_8,63,44));
    io_rhoOut(1151 downto 1088) <= pkg_cat(pkg_extract(zz_io_rhoOut_9,60,0),pkg_extract(zz_io_rhoOut_9,63,61));
    io_rhoOut(511 downto 448) <= pkg_cat(pkg_extract(zz_io_rhoOut_10,53,0),pkg_extract(zz_io_rhoOut_10,63,54));
    io_rhoOut(1471 downto 1408) <= pkg_cat(pkg_extract(zz_io_rhoOut_11,20,0),pkg_extract(zz_io_rhoOut_11,63,21));
    io_rhoOut(831 downto 768) <= pkg_cat(pkg_extract(zz_io_rhoOut_12,38,0),pkg_extract(zz_io_rhoOut_12,63,39));
    io_rhoOut(191 downto 128) <= pkg_cat(pkg_extract(zz_io_rhoOut_13,24,0),pkg_extract(zz_io_rhoOut_13,63,25));
    io_rhoOut(127 downto 64) <= pkg_cat(pkg_extract(zz_io_rhoOut_14,22,0),pkg_extract(zz_io_rhoOut_14,63,23));
    io_rhoOut(1087 downto 1024) <= pkg_cat(pkg_extract(zz_io_rhoOut_15,18,0),pkg_extract(zz_io_rhoOut_15,63,19));
    io_rhoOut(447 downto 384) <= pkg_cat(pkg_extract(zz_io_rhoOut_16,48,0),pkg_extract(zz_io_rhoOut_16,63,49));
    io_rhoOut(1407 downto 1344) <= pkg_cat(pkg_extract(zz_io_rhoOut_17,42,0),pkg_extract(zz_io_rhoOut_17,63,43));
    io_rhoOut(767 downto 704) <= pkg_cat(pkg_extract(zz_io_rhoOut_18,55,0),pkg_extract(zz_io_rhoOut_18,63,56));
    io_rhoOut(703 downto 640) <= pkg_cat(pkg_extract(zz_io_rhoOut_19,45,0),pkg_extract(zz_io_rhoOut_19,63,46));
    io_rhoOut(63 downto 0) <= pkg_cat(pkg_extract(zz_io_rhoOut_20,61,0),pkg_extract(zz_io_rhoOut_20,63,62));
    io_rhoOut(1023 downto 960) <= pkg_cat(pkg_extract(zz_io_rhoOut_21,2,0),pkg_extract(zz_io_rhoOut_21,63,3));
    io_rhoOut(383 downto 320) <= pkg_cat(pkg_extract(zz_io_rhoOut_22,7,0),pkg_extract(zz_io_rhoOut_22,63,8));
    io_rhoOut(1343 downto 1280) <= pkg_cat(pkg_extract(zz_io_rhoOut_23,49,0),pkg_extract(zz_io_rhoOut_23,63,50));
  end process;

  zz_io_rhoOut <= pkg_extract(io_rhoIn,1535,1472);
  zz_io_rhoOut_1 <= pkg_extract(io_rhoIn,1471,1408);
  zz_io_rhoOut_2 <= pkg_extract(io_rhoIn,1407,1344);
  zz_io_rhoOut_3 <= pkg_extract(io_rhoIn,1343,1280);
  zz_io_rhoOut_4 <= pkg_extract(io_rhoIn,1279,1216);
  zz_io_rhoOut_5 <= pkg_extract(io_rhoIn,1215,1152);
  zz_io_rhoOut_6 <= pkg_extract(io_rhoIn,1151,1088);
  zz_io_rhoOut_7 <= pkg_extract(io_rhoIn,1087,1024);
  zz_io_rhoOut_8 <= pkg_extract(io_rhoIn,1023,960);
  zz_io_rhoOut_9 <= pkg_extract(io_rhoIn,959,896);
  zz_io_rhoOut_10 <= pkg_extract(io_rhoIn,895,832);
  zz_io_rhoOut_11 <= pkg_extract(io_rhoIn,831,768);
  zz_io_rhoOut_12 <= pkg_extract(io_rhoIn,767,704);
  zz_io_rhoOut_13 <= pkg_extract(io_rhoIn,703,640);
  zz_io_rhoOut_14 <= pkg_extract(io_rhoIn,639,576);
  zz_io_rhoOut_15 <= pkg_extract(io_rhoIn,575,512);
  zz_io_rhoOut_16 <= pkg_extract(io_rhoIn,511,448);
  zz_io_rhoOut_17 <= pkg_extract(io_rhoIn,447,384);
  zz_io_rhoOut_18 <= pkg_extract(io_rhoIn,383,320);
  zz_io_rhoOut_19 <= pkg_extract(io_rhoIn,319,256);
  zz_io_rhoOut_20 <= pkg_extract(io_rhoIn,255,192);
  zz_io_rhoOut_21 <= pkg_extract(io_rhoIn,191,128);
  zz_io_rhoOut_22 <= pkg_extract(io_rhoIn,127,64);
  zz_io_rhoOut_23 <= pkg_extract(io_rhoIn,63,0);
end arch;


--RhoPi_1 replaced by RhoPi

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity ChiMasked is
  port(
    io_chiIn1 : in std_logic_vector(1599 downto 0);
    io_chiIn2 : in std_logic_vector(1599 downto 0);
    io_chiOut1 : out std_logic_vector(1599 downto 0);
    io_chiOut2 : out std_logic_vector(1599 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end ChiMasked;

architecture arch of ChiMasked is
  signal sBoxMasked_25_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_c1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_c2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_a1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_a2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_b1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_b2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_25_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_26_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_27_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_28_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_29_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_30_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_31_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_32_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_33_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_34_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_35_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_36_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_37_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_38_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_39_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_40_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_41_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_42_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_43_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_44_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_45_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_46_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_47_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_48_io_res2 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_res1 : std_logic_vector(63 downto 0);
  signal sBoxMasked_49_io_res2 : std_logic_vector(63 downto 0);

begin
  sBoxMasked_25 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_25_io_c1,
      io_c2 => sBoxMasked_25_io_c2,
      io_a1 => sBoxMasked_25_io_a1,
      io_a2 => sBoxMasked_25_io_a2,
      io_b1 => sBoxMasked_25_io_b1,
      io_b2 => sBoxMasked_25_io_b2,
      io_res1 => sBoxMasked_25_io_res1,
      io_res2 => sBoxMasked_25_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_26 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_26_io_c1,
      io_c2 => sBoxMasked_26_io_c2,
      io_a1 => sBoxMasked_26_io_a1,
      io_a2 => sBoxMasked_26_io_a2,
      io_b1 => sBoxMasked_26_io_b1,
      io_b2 => sBoxMasked_26_io_b2,
      io_res1 => sBoxMasked_26_io_res1,
      io_res2 => sBoxMasked_26_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_27 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_27_io_c1,
      io_c2 => sBoxMasked_27_io_c2,
      io_a1 => sBoxMasked_27_io_a1,
      io_a2 => sBoxMasked_27_io_a2,
      io_b1 => sBoxMasked_27_io_b1,
      io_b2 => sBoxMasked_27_io_b2,
      io_res1 => sBoxMasked_27_io_res1,
      io_res2 => sBoxMasked_27_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_28 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_28_io_c1,
      io_c2 => sBoxMasked_28_io_c2,
      io_a1 => sBoxMasked_28_io_a1,
      io_a2 => sBoxMasked_28_io_a2,
      io_b1 => sBoxMasked_28_io_b1,
      io_b2 => sBoxMasked_28_io_b2,
      io_res1 => sBoxMasked_28_io_res1,
      io_res2 => sBoxMasked_28_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_29 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_29_io_c1,
      io_c2 => sBoxMasked_29_io_c2,
      io_a1 => sBoxMasked_29_io_a1,
      io_a2 => sBoxMasked_29_io_a2,
      io_b1 => sBoxMasked_29_io_b1,
      io_b2 => sBoxMasked_29_io_b2,
      io_res1 => sBoxMasked_29_io_res1,
      io_res2 => sBoxMasked_29_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_30 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_30_io_c1,
      io_c2 => sBoxMasked_30_io_c2,
      io_a1 => sBoxMasked_30_io_a1,
      io_a2 => sBoxMasked_30_io_a2,
      io_b1 => sBoxMasked_30_io_b1,
      io_b2 => sBoxMasked_30_io_b2,
      io_res1 => sBoxMasked_30_io_res1,
      io_res2 => sBoxMasked_30_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_31 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_31_io_c1,
      io_c2 => sBoxMasked_31_io_c2,
      io_a1 => sBoxMasked_31_io_a1,
      io_a2 => sBoxMasked_31_io_a2,
      io_b1 => sBoxMasked_31_io_b1,
      io_b2 => sBoxMasked_31_io_b2,
      io_res1 => sBoxMasked_31_io_res1,
      io_res2 => sBoxMasked_31_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_32 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_32_io_c1,
      io_c2 => sBoxMasked_32_io_c2,
      io_a1 => sBoxMasked_32_io_a1,
      io_a2 => sBoxMasked_32_io_a2,
      io_b1 => sBoxMasked_32_io_b1,
      io_b2 => sBoxMasked_32_io_b2,
      io_res1 => sBoxMasked_32_io_res1,
      io_res2 => sBoxMasked_32_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_33 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_33_io_c1,
      io_c2 => sBoxMasked_33_io_c2,
      io_a1 => sBoxMasked_33_io_a1,
      io_a2 => sBoxMasked_33_io_a2,
      io_b1 => sBoxMasked_33_io_b1,
      io_b2 => sBoxMasked_33_io_b2,
      io_res1 => sBoxMasked_33_io_res1,
      io_res2 => sBoxMasked_33_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_34 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_34_io_c1,
      io_c2 => sBoxMasked_34_io_c2,
      io_a1 => sBoxMasked_34_io_a1,
      io_a2 => sBoxMasked_34_io_a2,
      io_b1 => sBoxMasked_34_io_b1,
      io_b2 => sBoxMasked_34_io_b2,
      io_res1 => sBoxMasked_34_io_res1,
      io_res2 => sBoxMasked_34_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_35 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_35_io_c1,
      io_c2 => sBoxMasked_35_io_c2,
      io_a1 => sBoxMasked_35_io_a1,
      io_a2 => sBoxMasked_35_io_a2,
      io_b1 => sBoxMasked_35_io_b1,
      io_b2 => sBoxMasked_35_io_b2,
      io_res1 => sBoxMasked_35_io_res1,
      io_res2 => sBoxMasked_35_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_36 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_36_io_c1,
      io_c2 => sBoxMasked_36_io_c2,
      io_a1 => sBoxMasked_36_io_a1,
      io_a2 => sBoxMasked_36_io_a2,
      io_b1 => sBoxMasked_36_io_b1,
      io_b2 => sBoxMasked_36_io_b2,
      io_res1 => sBoxMasked_36_io_res1,
      io_res2 => sBoxMasked_36_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_37 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_37_io_c1,
      io_c2 => sBoxMasked_37_io_c2,
      io_a1 => sBoxMasked_37_io_a1,
      io_a2 => sBoxMasked_37_io_a2,
      io_b1 => sBoxMasked_37_io_b1,
      io_b2 => sBoxMasked_37_io_b2,
      io_res1 => sBoxMasked_37_io_res1,
      io_res2 => sBoxMasked_37_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_38 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_38_io_c1,
      io_c2 => sBoxMasked_38_io_c2,
      io_a1 => sBoxMasked_38_io_a1,
      io_a2 => sBoxMasked_38_io_a2,
      io_b1 => sBoxMasked_38_io_b1,
      io_b2 => sBoxMasked_38_io_b2,
      io_res1 => sBoxMasked_38_io_res1,
      io_res2 => sBoxMasked_38_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_39 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_39_io_c1,
      io_c2 => sBoxMasked_39_io_c2,
      io_a1 => sBoxMasked_39_io_a1,
      io_a2 => sBoxMasked_39_io_a2,
      io_b1 => sBoxMasked_39_io_b1,
      io_b2 => sBoxMasked_39_io_b2,
      io_res1 => sBoxMasked_39_io_res1,
      io_res2 => sBoxMasked_39_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_40 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_40_io_c1,
      io_c2 => sBoxMasked_40_io_c2,
      io_a1 => sBoxMasked_40_io_a1,
      io_a2 => sBoxMasked_40_io_a2,
      io_b1 => sBoxMasked_40_io_b1,
      io_b2 => sBoxMasked_40_io_b2,
      io_res1 => sBoxMasked_40_io_res1,
      io_res2 => sBoxMasked_40_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_41 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_41_io_c1,
      io_c2 => sBoxMasked_41_io_c2,
      io_a1 => sBoxMasked_41_io_a1,
      io_a2 => sBoxMasked_41_io_a2,
      io_b1 => sBoxMasked_41_io_b1,
      io_b2 => sBoxMasked_41_io_b2,
      io_res1 => sBoxMasked_41_io_res1,
      io_res2 => sBoxMasked_41_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_42 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_42_io_c1,
      io_c2 => sBoxMasked_42_io_c2,
      io_a1 => sBoxMasked_42_io_a1,
      io_a2 => sBoxMasked_42_io_a2,
      io_b1 => sBoxMasked_42_io_b1,
      io_b2 => sBoxMasked_42_io_b2,
      io_res1 => sBoxMasked_42_io_res1,
      io_res2 => sBoxMasked_42_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_43 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_43_io_c1,
      io_c2 => sBoxMasked_43_io_c2,
      io_a1 => sBoxMasked_43_io_a1,
      io_a2 => sBoxMasked_43_io_a2,
      io_b1 => sBoxMasked_43_io_b1,
      io_b2 => sBoxMasked_43_io_b2,
      io_res1 => sBoxMasked_43_io_res1,
      io_res2 => sBoxMasked_43_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_44 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_44_io_c1,
      io_c2 => sBoxMasked_44_io_c2,
      io_a1 => sBoxMasked_44_io_a1,
      io_a2 => sBoxMasked_44_io_a2,
      io_b1 => sBoxMasked_44_io_b1,
      io_b2 => sBoxMasked_44_io_b2,
      io_res1 => sBoxMasked_44_io_res1,
      io_res2 => sBoxMasked_44_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_45 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_45_io_c1,
      io_c2 => sBoxMasked_45_io_c2,
      io_a1 => sBoxMasked_45_io_a1,
      io_a2 => sBoxMasked_45_io_a2,
      io_b1 => sBoxMasked_45_io_b1,
      io_b2 => sBoxMasked_45_io_b2,
      io_res1 => sBoxMasked_45_io_res1,
      io_res2 => sBoxMasked_45_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_46 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_46_io_c1,
      io_c2 => sBoxMasked_46_io_c2,
      io_a1 => sBoxMasked_46_io_a1,
      io_a2 => sBoxMasked_46_io_a2,
      io_b1 => sBoxMasked_46_io_b1,
      io_b2 => sBoxMasked_46_io_b2,
      io_res1 => sBoxMasked_46_io_res1,
      io_res2 => sBoxMasked_46_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_47 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_47_io_c1,
      io_c2 => sBoxMasked_47_io_c2,
      io_a1 => sBoxMasked_47_io_a1,
      io_a2 => sBoxMasked_47_io_a2,
      io_b1 => sBoxMasked_47_io_b1,
      io_b2 => sBoxMasked_47_io_b2,
      io_res1 => sBoxMasked_47_io_res1,
      io_res2 => sBoxMasked_47_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_48 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_48_io_c1,
      io_c2 => sBoxMasked_48_io_c2,
      io_a1 => sBoxMasked_48_io_a1,
      io_a2 => sBoxMasked_48_io_a2,
      io_b1 => sBoxMasked_48_io_b1,
      io_b2 => sBoxMasked_48_io_b2,
      io_res1 => sBoxMasked_48_io_res1,
      io_res2 => sBoxMasked_48_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_49 : entity work.SBoxMasked
    port map ( 
      io_c1 => sBoxMasked_49_io_c1,
      io_c2 => sBoxMasked_49_io_c2,
      io_a1 => sBoxMasked_49_io_a1,
      io_a2 => sBoxMasked_49_io_a2,
      io_b1 => sBoxMasked_49_io_b1,
      io_b2 => sBoxMasked_49_io_b2,
      io_res1 => sBoxMasked_49_io_res1,
      io_res2 => sBoxMasked_49_io_res2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sBoxMasked_25_io_c1 <= pkg_extract(io_chiIn1,1599,1536);
  sBoxMasked_25_io_c2 <= pkg_extract(io_chiIn2,1599,1536);
  sBoxMasked_25_io_a1 <= pkg_extract(io_chiIn1,1535,1472);
  sBoxMasked_25_io_a2 <= pkg_extract(io_chiIn2,1535,1472);
  sBoxMasked_25_io_b1 <= pkg_extract(io_chiIn1,1471,1408);
  sBoxMasked_25_io_b2 <= pkg_extract(io_chiIn2,1471,1408);
  process(sBoxMasked_25_io_res1,sBoxMasked_26_io_res1,sBoxMasked_27_io_res1,sBoxMasked_28_io_res1,sBoxMasked_29_io_res1,sBoxMasked_30_io_res1,sBoxMasked_31_io_res1,sBoxMasked_32_io_res1,sBoxMasked_33_io_res1,sBoxMasked_34_io_res1,sBoxMasked_35_io_res1,sBoxMasked_36_io_res1,sBoxMasked_37_io_res1,sBoxMasked_38_io_res1,sBoxMasked_39_io_res1,sBoxMasked_40_io_res1,sBoxMasked_41_io_res1,sBoxMasked_42_io_res1,sBoxMasked_43_io_res1,sBoxMasked_44_io_res1,sBoxMasked_45_io_res1,sBoxMasked_46_io_res1,sBoxMasked_47_io_res1,sBoxMasked_48_io_res1,sBoxMasked_49_io_res1)
  begin
    io_chiOut1(1599 downto 1536) <= sBoxMasked_25_io_res1;
    io_chiOut1(1535 downto 1472) <= sBoxMasked_26_io_res1;
    io_chiOut1(1471 downto 1408) <= sBoxMasked_27_io_res1;
    io_chiOut1(1407 downto 1344) <= sBoxMasked_28_io_res1;
    io_chiOut1(1343 downto 1280) <= sBoxMasked_29_io_res1;
    io_chiOut1(1279 downto 1216) <= sBoxMasked_30_io_res1;
    io_chiOut1(1215 downto 1152) <= sBoxMasked_31_io_res1;
    io_chiOut1(1151 downto 1088) <= sBoxMasked_32_io_res1;
    io_chiOut1(1087 downto 1024) <= sBoxMasked_33_io_res1;
    io_chiOut1(1023 downto 960) <= sBoxMasked_34_io_res1;
    io_chiOut1(959 downto 896) <= sBoxMasked_35_io_res1;
    io_chiOut1(895 downto 832) <= sBoxMasked_36_io_res1;
    io_chiOut1(831 downto 768) <= sBoxMasked_37_io_res1;
    io_chiOut1(767 downto 704) <= sBoxMasked_38_io_res1;
    io_chiOut1(703 downto 640) <= sBoxMasked_39_io_res1;
    io_chiOut1(639 downto 576) <= sBoxMasked_40_io_res1;
    io_chiOut1(575 downto 512) <= sBoxMasked_41_io_res1;
    io_chiOut1(511 downto 448) <= sBoxMasked_42_io_res1;
    io_chiOut1(447 downto 384) <= sBoxMasked_43_io_res1;
    io_chiOut1(383 downto 320) <= sBoxMasked_44_io_res1;
    io_chiOut1(319 downto 256) <= sBoxMasked_45_io_res1;
    io_chiOut1(255 downto 192) <= sBoxMasked_46_io_res1;
    io_chiOut1(191 downto 128) <= sBoxMasked_47_io_res1;
    io_chiOut1(127 downto 64) <= sBoxMasked_48_io_res1;
    io_chiOut1(63 downto 0) <= sBoxMasked_49_io_res1;
  end process;

  process(sBoxMasked_25_io_res2,sBoxMasked_26_io_res2,sBoxMasked_27_io_res2,sBoxMasked_28_io_res2,sBoxMasked_29_io_res2,sBoxMasked_30_io_res2,sBoxMasked_31_io_res2,sBoxMasked_32_io_res2,sBoxMasked_33_io_res2,sBoxMasked_34_io_res2,sBoxMasked_35_io_res2,sBoxMasked_36_io_res2,sBoxMasked_37_io_res2,sBoxMasked_38_io_res2,sBoxMasked_39_io_res2,sBoxMasked_40_io_res2,sBoxMasked_41_io_res2,sBoxMasked_42_io_res2,sBoxMasked_43_io_res2,sBoxMasked_44_io_res2,sBoxMasked_45_io_res2,sBoxMasked_46_io_res2,sBoxMasked_47_io_res2,sBoxMasked_48_io_res2,sBoxMasked_49_io_res2)
  begin
    io_chiOut2(1599 downto 1536) <= sBoxMasked_25_io_res2;
    io_chiOut2(1535 downto 1472) <= sBoxMasked_26_io_res2;
    io_chiOut2(1471 downto 1408) <= sBoxMasked_27_io_res2;
    io_chiOut2(1407 downto 1344) <= sBoxMasked_28_io_res2;
    io_chiOut2(1343 downto 1280) <= sBoxMasked_29_io_res2;
    io_chiOut2(1279 downto 1216) <= sBoxMasked_30_io_res2;
    io_chiOut2(1215 downto 1152) <= sBoxMasked_31_io_res2;
    io_chiOut2(1151 downto 1088) <= sBoxMasked_32_io_res2;
    io_chiOut2(1087 downto 1024) <= sBoxMasked_33_io_res2;
    io_chiOut2(1023 downto 960) <= sBoxMasked_34_io_res2;
    io_chiOut2(959 downto 896) <= sBoxMasked_35_io_res2;
    io_chiOut2(895 downto 832) <= sBoxMasked_36_io_res2;
    io_chiOut2(831 downto 768) <= sBoxMasked_37_io_res2;
    io_chiOut2(767 downto 704) <= sBoxMasked_38_io_res2;
    io_chiOut2(703 downto 640) <= sBoxMasked_39_io_res2;
    io_chiOut2(639 downto 576) <= sBoxMasked_40_io_res2;
    io_chiOut2(575 downto 512) <= sBoxMasked_41_io_res2;
    io_chiOut2(511 downto 448) <= sBoxMasked_42_io_res2;
    io_chiOut2(447 downto 384) <= sBoxMasked_43_io_res2;
    io_chiOut2(383 downto 320) <= sBoxMasked_44_io_res2;
    io_chiOut2(319 downto 256) <= sBoxMasked_45_io_res2;
    io_chiOut2(255 downto 192) <= sBoxMasked_46_io_res2;
    io_chiOut2(191 downto 128) <= sBoxMasked_47_io_res2;
    io_chiOut2(127 downto 64) <= sBoxMasked_48_io_res2;
    io_chiOut2(63 downto 0) <= sBoxMasked_49_io_res2;
  end process;

  sBoxMasked_26_io_c1 <= pkg_extract(io_chiIn1,1535,1472);
  sBoxMasked_26_io_c2 <= pkg_extract(io_chiIn2,1535,1472);
  sBoxMasked_26_io_a1 <= pkg_extract(io_chiIn1,1471,1408);
  sBoxMasked_26_io_a2 <= pkg_extract(io_chiIn2,1471,1408);
  sBoxMasked_26_io_b1 <= pkg_extract(io_chiIn1,1407,1344);
  sBoxMasked_26_io_b2 <= pkg_extract(io_chiIn2,1407,1344);
  sBoxMasked_27_io_c1 <= pkg_extract(io_chiIn1,1471,1408);
  sBoxMasked_27_io_c2 <= pkg_extract(io_chiIn2,1471,1408);
  sBoxMasked_27_io_a1 <= pkg_extract(io_chiIn1,1407,1344);
  sBoxMasked_27_io_a2 <= pkg_extract(io_chiIn2,1407,1344);
  sBoxMasked_27_io_b1 <= pkg_extract(io_chiIn1,1343,1280);
  sBoxMasked_27_io_b2 <= pkg_extract(io_chiIn2,1343,1280);
  sBoxMasked_28_io_c1 <= pkg_extract(io_chiIn1,1407,1344);
  sBoxMasked_28_io_c2 <= pkg_extract(io_chiIn2,1407,1344);
  sBoxMasked_28_io_a1 <= pkg_extract(io_chiIn1,1343,1280);
  sBoxMasked_28_io_a2 <= pkg_extract(io_chiIn2,1343,1280);
  sBoxMasked_28_io_b1 <= pkg_extract(io_chiIn1,1599,1536);
  sBoxMasked_28_io_b2 <= pkg_extract(io_chiIn2,1599,1536);
  sBoxMasked_29_io_c1 <= pkg_extract(io_chiIn1,1343,1280);
  sBoxMasked_29_io_c2 <= pkg_extract(io_chiIn2,1343,1280);
  sBoxMasked_29_io_a1 <= pkg_extract(io_chiIn1,1599,1536);
  sBoxMasked_29_io_a2 <= pkg_extract(io_chiIn2,1599,1536);
  sBoxMasked_29_io_b1 <= pkg_extract(io_chiIn1,1535,1472);
  sBoxMasked_29_io_b2 <= pkg_extract(io_chiIn2,1535,1472);
  sBoxMasked_30_io_c1 <= pkg_extract(io_chiIn1,1279,1216);
  sBoxMasked_30_io_c2 <= pkg_extract(io_chiIn2,1279,1216);
  sBoxMasked_30_io_a1 <= pkg_extract(io_chiIn1,1215,1152);
  sBoxMasked_30_io_a2 <= pkg_extract(io_chiIn2,1215,1152);
  sBoxMasked_30_io_b1 <= pkg_extract(io_chiIn1,1151,1088);
  sBoxMasked_30_io_b2 <= pkg_extract(io_chiIn2,1151,1088);
  sBoxMasked_31_io_c1 <= pkg_extract(io_chiIn1,1215,1152);
  sBoxMasked_31_io_c2 <= pkg_extract(io_chiIn2,1215,1152);
  sBoxMasked_31_io_a1 <= pkg_extract(io_chiIn1,1151,1088);
  sBoxMasked_31_io_a2 <= pkg_extract(io_chiIn2,1151,1088);
  sBoxMasked_31_io_b1 <= pkg_extract(io_chiIn1,1087,1024);
  sBoxMasked_31_io_b2 <= pkg_extract(io_chiIn2,1087,1024);
  sBoxMasked_32_io_c1 <= pkg_extract(io_chiIn1,1151,1088);
  sBoxMasked_32_io_c2 <= pkg_extract(io_chiIn2,1151,1088);
  sBoxMasked_32_io_a1 <= pkg_extract(io_chiIn1,1087,1024);
  sBoxMasked_32_io_a2 <= pkg_extract(io_chiIn2,1087,1024);
  sBoxMasked_32_io_b1 <= pkg_extract(io_chiIn1,1023,960);
  sBoxMasked_32_io_b2 <= pkg_extract(io_chiIn2,1023,960);
  sBoxMasked_33_io_c1 <= pkg_extract(io_chiIn1,1087,1024);
  sBoxMasked_33_io_c2 <= pkg_extract(io_chiIn2,1087,1024);
  sBoxMasked_33_io_a1 <= pkg_extract(io_chiIn1,1023,960);
  sBoxMasked_33_io_a2 <= pkg_extract(io_chiIn2,1023,960);
  sBoxMasked_33_io_b1 <= pkg_extract(io_chiIn1,1279,1216);
  sBoxMasked_33_io_b2 <= pkg_extract(io_chiIn2,1279,1216);
  sBoxMasked_34_io_c1 <= pkg_extract(io_chiIn1,1023,960);
  sBoxMasked_34_io_c2 <= pkg_extract(io_chiIn2,1023,960);
  sBoxMasked_34_io_a1 <= pkg_extract(io_chiIn1,1279,1216);
  sBoxMasked_34_io_a2 <= pkg_extract(io_chiIn2,1279,1216);
  sBoxMasked_34_io_b1 <= pkg_extract(io_chiIn1,1215,1152);
  sBoxMasked_34_io_b2 <= pkg_extract(io_chiIn2,1215,1152);
  sBoxMasked_35_io_c1 <= pkg_extract(io_chiIn1,959,896);
  sBoxMasked_35_io_c2 <= pkg_extract(io_chiIn2,959,896);
  sBoxMasked_35_io_a1 <= pkg_extract(io_chiIn1,895,832);
  sBoxMasked_35_io_a2 <= pkg_extract(io_chiIn2,895,832);
  sBoxMasked_35_io_b1 <= pkg_extract(io_chiIn1,831,768);
  sBoxMasked_35_io_b2 <= pkg_extract(io_chiIn2,831,768);
  sBoxMasked_36_io_c1 <= pkg_extract(io_chiIn1,895,832);
  sBoxMasked_36_io_c2 <= pkg_extract(io_chiIn2,895,832);
  sBoxMasked_36_io_a1 <= pkg_extract(io_chiIn1,831,768);
  sBoxMasked_36_io_a2 <= pkg_extract(io_chiIn2,831,768);
  sBoxMasked_36_io_b1 <= pkg_extract(io_chiIn1,767,704);
  sBoxMasked_36_io_b2 <= pkg_extract(io_chiIn2,767,704);
  sBoxMasked_37_io_c1 <= pkg_extract(io_chiIn1,831,768);
  sBoxMasked_37_io_c2 <= pkg_extract(io_chiIn2,831,768);
  sBoxMasked_37_io_a1 <= pkg_extract(io_chiIn1,767,704);
  sBoxMasked_37_io_a2 <= pkg_extract(io_chiIn2,767,704);
  sBoxMasked_37_io_b1 <= pkg_extract(io_chiIn1,703,640);
  sBoxMasked_37_io_b2 <= pkg_extract(io_chiIn2,703,640);
  sBoxMasked_38_io_c1 <= pkg_extract(io_chiIn1,767,704);
  sBoxMasked_38_io_c2 <= pkg_extract(io_chiIn2,767,704);
  sBoxMasked_38_io_a1 <= pkg_extract(io_chiIn1,703,640);
  sBoxMasked_38_io_a2 <= pkg_extract(io_chiIn2,703,640);
  sBoxMasked_38_io_b1 <= pkg_extract(io_chiIn1,959,896);
  sBoxMasked_38_io_b2 <= pkg_extract(io_chiIn2,959,896);
  sBoxMasked_39_io_c1 <= pkg_extract(io_chiIn1,703,640);
  sBoxMasked_39_io_c2 <= pkg_extract(io_chiIn2,703,640);
  sBoxMasked_39_io_a1 <= pkg_extract(io_chiIn1,959,896);
  sBoxMasked_39_io_a2 <= pkg_extract(io_chiIn2,959,896);
  sBoxMasked_39_io_b1 <= pkg_extract(io_chiIn1,895,832);
  sBoxMasked_39_io_b2 <= pkg_extract(io_chiIn2,895,832);
  sBoxMasked_40_io_c1 <= pkg_extract(io_chiIn1,639,576);
  sBoxMasked_40_io_c2 <= pkg_extract(io_chiIn2,639,576);
  sBoxMasked_40_io_a1 <= pkg_extract(io_chiIn1,575,512);
  sBoxMasked_40_io_a2 <= pkg_extract(io_chiIn2,575,512);
  sBoxMasked_40_io_b1 <= pkg_extract(io_chiIn1,511,448);
  sBoxMasked_40_io_b2 <= pkg_extract(io_chiIn2,511,448);
  sBoxMasked_41_io_c1 <= pkg_extract(io_chiIn1,575,512);
  sBoxMasked_41_io_c2 <= pkg_extract(io_chiIn2,575,512);
  sBoxMasked_41_io_a1 <= pkg_extract(io_chiIn1,511,448);
  sBoxMasked_41_io_a2 <= pkg_extract(io_chiIn2,511,448);
  sBoxMasked_41_io_b1 <= pkg_extract(io_chiIn1,447,384);
  sBoxMasked_41_io_b2 <= pkg_extract(io_chiIn2,447,384);
  sBoxMasked_42_io_c1 <= pkg_extract(io_chiIn1,511,448);
  sBoxMasked_42_io_c2 <= pkg_extract(io_chiIn2,511,448);
  sBoxMasked_42_io_a1 <= pkg_extract(io_chiIn1,447,384);
  sBoxMasked_42_io_a2 <= pkg_extract(io_chiIn2,447,384);
  sBoxMasked_42_io_b1 <= pkg_extract(io_chiIn1,383,320);
  sBoxMasked_42_io_b2 <= pkg_extract(io_chiIn2,383,320);
  sBoxMasked_43_io_c1 <= pkg_extract(io_chiIn1,447,384);
  sBoxMasked_43_io_c2 <= pkg_extract(io_chiIn2,447,384);
  sBoxMasked_43_io_a1 <= pkg_extract(io_chiIn1,383,320);
  sBoxMasked_43_io_a2 <= pkg_extract(io_chiIn2,383,320);
  sBoxMasked_43_io_b1 <= pkg_extract(io_chiIn1,639,576);
  sBoxMasked_43_io_b2 <= pkg_extract(io_chiIn2,639,576);
  sBoxMasked_44_io_c1 <= pkg_extract(io_chiIn1,383,320);
  sBoxMasked_44_io_c2 <= pkg_extract(io_chiIn2,383,320);
  sBoxMasked_44_io_a1 <= pkg_extract(io_chiIn1,639,576);
  sBoxMasked_44_io_a2 <= pkg_extract(io_chiIn2,639,576);
  sBoxMasked_44_io_b1 <= pkg_extract(io_chiIn1,575,512);
  sBoxMasked_44_io_b2 <= pkg_extract(io_chiIn2,575,512);
  sBoxMasked_45_io_c1 <= pkg_extract(io_chiIn1,319,256);
  sBoxMasked_45_io_c2 <= pkg_extract(io_chiIn2,319,256);
  sBoxMasked_45_io_a1 <= pkg_extract(io_chiIn1,255,192);
  sBoxMasked_45_io_a2 <= pkg_extract(io_chiIn2,255,192);
  sBoxMasked_45_io_b1 <= pkg_extract(io_chiIn1,191,128);
  sBoxMasked_45_io_b2 <= pkg_extract(io_chiIn2,191,128);
  sBoxMasked_46_io_c1 <= pkg_extract(io_chiIn1,255,192);
  sBoxMasked_46_io_c2 <= pkg_extract(io_chiIn2,255,192);
  sBoxMasked_46_io_a1 <= pkg_extract(io_chiIn1,191,128);
  sBoxMasked_46_io_a2 <= pkg_extract(io_chiIn2,191,128);
  sBoxMasked_46_io_b1 <= pkg_extract(io_chiIn1,127,64);
  sBoxMasked_46_io_b2 <= pkg_extract(io_chiIn2,127,64);
  sBoxMasked_47_io_c1 <= pkg_extract(io_chiIn1,191,128);
  sBoxMasked_47_io_c2 <= pkg_extract(io_chiIn2,191,128);
  sBoxMasked_47_io_a1 <= pkg_extract(io_chiIn1,127,64);
  sBoxMasked_47_io_a2 <= pkg_extract(io_chiIn2,127,64);
  sBoxMasked_47_io_b1 <= pkg_extract(io_chiIn1,63,0);
  sBoxMasked_47_io_b2 <= pkg_extract(io_chiIn2,63,0);
  sBoxMasked_48_io_c1 <= pkg_extract(io_chiIn1,127,64);
  sBoxMasked_48_io_c2 <= pkg_extract(io_chiIn2,127,64);
  sBoxMasked_48_io_a1 <= pkg_extract(io_chiIn1,63,0);
  sBoxMasked_48_io_a2 <= pkg_extract(io_chiIn2,63,0);
  sBoxMasked_48_io_b1 <= pkg_extract(io_chiIn1,319,256);
  sBoxMasked_48_io_b2 <= pkg_extract(io_chiIn2,319,256);
  sBoxMasked_49_io_c1 <= pkg_extract(io_chiIn1,63,0);
  sBoxMasked_49_io_c2 <= pkg_extract(io_chiIn2,63,0);
  sBoxMasked_49_io_a1 <= pkg_extract(io_chiIn1,319,256);
  sBoxMasked_49_io_a2 <= pkg_extract(io_chiIn2,319,256);
  sBoxMasked_49_io_b1 <= pkg_extract(io_chiIn1,255,192);
  sBoxMasked_49_io_b2 <= pkg_extract(io_chiIn2,255,192);
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


--Iota_1 replaced by Iota

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KECCAKMasked is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_in1 : in std_logic_vector(1599 downto 0);
    io_in2 : in std_logic_vector(1599 downto 0);
    io_out1 : out std_logic_vector(1599 downto 0);
    io_out2 : out std_logic_vector(1599 downto 0);
    io_done : out std_logic
  );
end KECCAKMasked;

architecture arch of KECCAKMasked is
  signal r_theta1_io_thetaOut : std_logic_vector(1599 downto 0);
  signal r_theta2_io_thetaOut : std_logic_vector(1599 downto 0);
  signal r_rhopi1_io_rhoOut : std_logic_vector(1599 downto 0);
  signal r_rhopi2_io_rhoOut : std_logic_vector(1599 downto 0);
  signal r_chi_io_chiOut1 : std_logic_vector(1599 downto 0);
  signal r_chi_io_chiOut2 : std_logic_vector(1599 downto 0);
  signal r_iota1_io_iotaOut : std_logic_vector(1599 downto 0);
  signal r_iota2_io_iotaOut : std_logic_vector(1599 downto 0);

  signal r_state1 : std_logic_vector(1599 downto 0);
  signal r_state2 : std_logic_vector(1599 downto 0);
  signal r_roundCounter_willIncrement : std_logic;
  signal r_roundCounter_willClear : std_logic;
  signal r_roundCounter_valueNext : unsigned(4 downto 0);
  signal r_roundCounter_value : unsigned(4 downto 0);
  signal r_roundCounter_willOverflowIfInc : std_logic;
  signal r_roundCounter_willOverflow : std_logic;
  signal r_smallCounter_willIncrement : std_logic;
  signal r_smallCounter_willClear : std_logic;
  signal r_smallCounter_valueNext : unsigned(0 downto 0);
  signal r_smallCounter_value : unsigned(0 downto 0);
  signal r_smallCounter_willOverflowIfInc : std_logic;
  signal r_smallCounter_willOverflow : std_logic;
  signal r_keccakState : States;
begin
  r_theta1 : entity work.Theta
    port map ( 
      io_thetaIn => r_state1,
      io_thetaOut => r_theta1_io_thetaOut 
    );
  r_theta2 : entity work.Theta
    port map ( 
      io_thetaIn => r_state2,
      io_thetaOut => r_theta2_io_thetaOut 
    );
  r_rhopi1 : entity work.RhoPi
    port map ( 
      io_rhoIn => r_theta1_io_thetaOut,
      io_rhoOut => r_rhopi1_io_rhoOut 
    );
  r_rhopi2 : entity work.RhoPi
    port map ( 
      io_rhoIn => r_theta2_io_thetaOut,
      io_rhoOut => r_rhopi2_io_rhoOut 
    );
  r_chi : entity work.ChiMasked
    port map ( 
      io_chiIn1 => r_rhopi1_io_rhoOut,
      io_chiIn2 => r_rhopi2_io_rhoOut,
      io_chiOut1 => r_chi_io_chiOut1,
      io_chiOut2 => r_chi_io_chiOut2,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_iota1 : entity work.Iota
    port map ( 
      io_iotaIn => r_chi_io_chiOut1,
      io_round => r_roundCounter_value,
      io_iotaOut => r_iota1_io_iotaOut 
    );
  r_iota2 : entity work.Iota
    port map ( 
      io_iotaIn => r_chi_io_chiOut2,
      io_round => pkg_unsigned("11001"),
      io_iotaOut => r_iota2_io_iotaOut 
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

  process(r_keccakState,r_smallCounter_willOverflow)
  begin
    r_roundCounter_willIncrement <= pkg_toStdLogic(false);
    case r_keccakState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        if r_smallCounter_willOverflow = '1' then
          r_roundCounter_willIncrement <= pkg_toStdLogic(true);
        end if;
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

  process(r_keccakState)
  begin
    r_smallCounter_willIncrement <= pkg_toStdLogic(false);
    case r_keccakState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        r_smallCounter_willIncrement <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(r_keccakState)
  begin
    r_smallCounter_willClear <= pkg_toStdLogic(false);
    case r_keccakState is
      when pkg_enum.sIdle =>
        r_smallCounter_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  r_smallCounter_willOverflowIfInc <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("1"));
  r_smallCounter_willOverflow <= (r_smallCounter_willOverflowIfInc and r_smallCounter_willIncrement);
  process(r_smallCounter_value,r_smallCounter_willIncrement,r_smallCounter_willClear)
  begin
    r_smallCounter_valueNext <= (r_smallCounter_value + unsigned(pkg_toStdLogicVector(r_smallCounter_willIncrement)));
    if r_smallCounter_willClear = '1' then
      r_smallCounter_valueNext <= pkg_unsigned("0");
    end if;
  end process;

  io_out1 <= r_state1;
  io_out2 <= r_state2;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_state1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_state2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_roundCounter_value <= pkg_unsigned("00000");
      r_smallCounter_value <= pkg_unsigned("0");
      r_keccakState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_smallCounter_value <= r_smallCounter_valueNext;
      r_state1 <= r_iota1_io_iotaOut;
      r_state2 <= r_iota2_io_iotaOut;
      case r_keccakState is
        when pkg_enum.sIdle =>
          r_keccakState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_state1 <= io_in1;
            r_state2 <= io_in2;
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

