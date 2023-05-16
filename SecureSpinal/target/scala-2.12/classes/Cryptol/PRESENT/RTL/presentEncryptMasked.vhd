-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : presentEncryptMasked
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


entity G1 is
  port(
    io_X2 : in std_logic_vector(3 downto 0);
    io_X3 : in std_logic_vector(3 downto 0);
    io_Y : out std_logic_vector(3 downto 0)
  );
end G1;

architecture arch of G1 is
  signal zz_io_Y : std_logic;
  signal zz_io_Y_1 : std_logic;
  signal zz_io_Y_2 : std_logic;
  signal zz_io_Y_3 : std_logic;
  signal zz_io_Y_4 : std_logic;
  signal zz_io_Y_5 : std_logic;
  signal zz_io_Y_6 : std_logic;
  signal zz_io_Y_7 : std_logic;

begin
  zz_io_Y <= (pkg_toStdLogic(true) xor pkg_extract(io_X2,3));
  zz_io_Y_1 <= pkg_extract(io_X2,1);
  zz_io_Y_2 <= pkg_extract(io_X2,2);
  zz_io_Y_3 <= pkg_extract(io_X2,0);
  zz_io_Y_4 <= (pkg_toStdLogic(true) xor pkg_extract(io_X2,0));
  zz_io_Y_5 <= (pkg_extract(io_X2,3) and pkg_extract(io_X2,2));
  zz_io_Y_6 <= pkg_extract(io_X2,3);
  zz_io_Y_7 <= pkg_extract(io_X3,2);
  process(io_X2,zz_io_Y,zz_io_Y_1,zz_io_Y_2,zz_io_Y_3,io_X3,zz_io_Y_4,zz_io_Y_5,zz_io_Y_6,zz_io_Y_7)
  begin
    io_Y(3) <= ((pkg_extract(io_X2,2) xor pkg_extract(io_X2,1)) xor pkg_extract(io_X2,0));
    io_Y(2) <= ((pkg_toStdLogic(true) xor pkg_extract(io_X2,2)) xor pkg_extract(io_X2,1));
    io_Y(1) <= (((((((zz_io_Y xor zz_io_Y_1) xor (zz_io_Y_2 and zz_io_Y_3)) xor (pkg_extract(io_X2,2) and pkg_extract(io_X3,0))) xor (pkg_extract(io_X3,2) and pkg_extract(io_X2,0))) xor (pkg_extract(io_X2,1) and pkg_extract(io_X2,0))) xor (pkg_extract(io_X2,1) and pkg_extract(io_X3,0))) xor (pkg_extract(io_X3,1) and pkg_extract(io_X2,0)));
    io_Y(0) <= (((((((((zz_io_Y_4 xor zz_io_Y_5) xor (zz_io_Y_6 and zz_io_Y_7)) xor (pkg_extract(io_X3,3) and pkg_extract(io_X2,2))) xor (pkg_extract(io_X2,3) and pkg_extract(io_X2,1))) xor (pkg_extract(io_X2,3) and pkg_extract(io_X3,1))) xor (pkg_extract(io_X3,3) and pkg_extract(io_X2,1))) xor (pkg_extract(io_X2,2) and pkg_extract(io_X2,1))) xor (pkg_extract(io_X2,2) and pkg_extract(io_X3,1))) xor (pkg_extract(io_X3,2) and pkg_extract(io_X2,1)));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G2 is
  port(
    io_X1 : in std_logic_vector(3 downto 0);
    io_X3 : in std_logic_vector(3 downto 0);
    io_Y : out std_logic_vector(3 downto 0)
  );
end G2;

architecture arch of G2 is
  signal zz_io_Y : std_logic;
  signal zz_io_Y_1 : std_logic;
  signal zz_io_Y_2 : std_logic;
  signal zz_io_Y_3 : std_logic;
  signal zz_io_Y_4 : std_logic;
  signal zz_io_Y_5 : std_logic;
  signal zz_io_Y_6 : std_logic;
  signal zz_io_Y_7 : std_logic;

begin
  zz_io_Y <= pkg_extract(io_X3,3);
  zz_io_Y_1 <= pkg_extract(io_X3,1);
  zz_io_Y_2 <= pkg_extract(io_X3,2);
  zz_io_Y_3 <= pkg_extract(io_X3,0);
  zz_io_Y_4 <= pkg_extract(io_X3,0);
  zz_io_Y_5 <= (pkg_extract(io_X3,3) and pkg_extract(io_X3,2));
  zz_io_Y_6 <= pkg_extract(io_X3,3);
  zz_io_Y_7 <= pkg_extract(io_X1,2);
  process(io_X3,zz_io_Y,zz_io_Y_1,zz_io_Y_2,zz_io_Y_3,io_X1,zz_io_Y_4,zz_io_Y_5,zz_io_Y_6,zz_io_Y_7)
  begin
    io_Y(3) <= ((pkg_extract(io_X3,2) xor pkg_extract(io_X3,1)) xor pkg_extract(io_X3,0));
    io_Y(2) <= (pkg_extract(io_X3,2) xor pkg_extract(io_X3,1));
    io_Y(1) <= (((((((zz_io_Y xor zz_io_Y_1) xor (zz_io_Y_2 and zz_io_Y_3)) xor (pkg_extract(io_X3,2) and pkg_extract(io_X1,0))) xor (pkg_extract(io_X1,2) and pkg_extract(io_X3,0))) xor (pkg_extract(io_X3,1) and pkg_extract(io_X3,0))) xor (pkg_extract(io_X3,1) and pkg_extract(io_X1,0))) xor (pkg_extract(io_X1,1) and pkg_extract(io_X3,0)));
    io_Y(0) <= (((((((((zz_io_Y_4 xor zz_io_Y_5) xor (zz_io_Y_6 and zz_io_Y_7)) xor (pkg_extract(io_X1,3) and pkg_extract(io_X3,2))) xor (pkg_extract(io_X3,3) and pkg_extract(io_X3,1))) xor (pkg_extract(io_X3,3) and pkg_extract(io_X1,1))) xor (pkg_extract(io_X1,3) and pkg_extract(io_X3,1))) xor (pkg_extract(io_X3,2) and pkg_extract(io_X3,1))) xor (pkg_extract(io_X3,2) and pkg_extract(io_X1,1))) xor (pkg_extract(io_X1,2) and pkg_extract(io_X3,1)));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G3 is
  port(
    io_X1 : in std_logic_vector(3 downto 0);
    io_X2 : in std_logic_vector(3 downto 0);
    io_Y : out std_logic_vector(3 downto 0)
  );
end G3;

architecture arch of G3 is
  signal zz_io_Y : std_logic;
  signal zz_io_Y_1 : std_logic;
  signal zz_io_Y_2 : std_logic;
  signal zz_io_Y_3 : std_logic;
  signal zz_io_Y_4 : std_logic;
  signal zz_io_Y_5 : std_logic;
  signal zz_io_Y_6 : std_logic;
  signal zz_io_Y_7 : std_logic;

begin
  zz_io_Y <= pkg_extract(io_X1,3);
  zz_io_Y_1 <= pkg_extract(io_X1,1);
  zz_io_Y_2 <= pkg_extract(io_X1,2);
  zz_io_Y_3 <= pkg_extract(io_X1,0);
  zz_io_Y_4 <= pkg_extract(io_X1,0);
  zz_io_Y_5 <= (pkg_extract(io_X1,3) and pkg_extract(io_X1,2));
  zz_io_Y_6 <= pkg_extract(io_X1,3);
  zz_io_Y_7 <= pkg_extract(io_X2,2);
  process(io_X1,zz_io_Y,zz_io_Y_1,zz_io_Y_2,zz_io_Y_3,io_X2,zz_io_Y_4,zz_io_Y_5,zz_io_Y_6,zz_io_Y_7)
  begin
    io_Y(3) <= ((pkg_extract(io_X1,2) xor pkg_extract(io_X1,1)) xor pkg_extract(io_X1,0));
    io_Y(2) <= (pkg_extract(io_X1,2) xor pkg_extract(io_X1,1));
    io_Y(1) <= (((((((zz_io_Y xor zz_io_Y_1) xor (zz_io_Y_2 and zz_io_Y_3)) xor (pkg_extract(io_X1,2) and pkg_extract(io_X2,0))) xor (pkg_extract(io_X2,2) and pkg_extract(io_X1,0))) xor (pkg_extract(io_X1,1) and pkg_extract(io_X1,0))) xor (pkg_extract(io_X1,1) and pkg_extract(io_X2,0))) xor (pkg_extract(io_X2,1) and pkg_extract(io_X1,0)));
    io_Y(0) <= (((((((((zz_io_Y_4 xor zz_io_Y_5) xor (zz_io_Y_6 and zz_io_Y_7)) xor (pkg_extract(io_X2,3) and pkg_extract(io_X1,2))) xor (pkg_extract(io_X1,3) and pkg_extract(io_X1,1))) xor (pkg_extract(io_X1,3) and pkg_extract(io_X2,1))) xor (pkg_extract(io_X2,3) and pkg_extract(io_X1,1))) xor (pkg_extract(io_X1,2) and pkg_extract(io_X1,1))) xor (pkg_extract(io_X1,2) and pkg_extract(io_X2,1))) xor (pkg_extract(io_X2,2) and pkg_extract(io_X1,1)));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity F1 is
  port(
    io_R2 : in std_logic_vector(3 downto 0);
    io_R3 : in std_logic_vector(3 downto 0);
    io_Y : out std_logic_vector(3 downto 0)
  );
end F1;

architecture arch of F1 is

begin
  process(io_R2,io_R3)
  begin
    io_Y(3) <= (((((pkg_extract(io_R2,2) xor pkg_extract(io_R2,1)) xor pkg_extract(io_R2,0)) xor (pkg_extract(io_R2,3) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,3) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,3) and pkg_extract(io_R2,0)));
    io_Y(2) <= (((pkg_extract(io_R2,3) xor (pkg_extract(io_R2,1) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,1) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,1) and pkg_extract(io_R2,0)));
    io_Y(1) <= ((((pkg_extract(io_R2,2) xor pkg_extract(io_R2,1)) xor (pkg_extract(io_R2,3) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,3) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,3) and pkg_extract(io_R2,0)));
    io_Y(0) <= (((pkg_extract(io_R2,1) xor (pkg_extract(io_R2,2) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,2) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,2) and pkg_extract(io_R2,0)));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity F2 is
  port(
    io_R1 : in std_logic_vector(3 downto 0);
    io_R3 : in std_logic_vector(3 downto 0);
    io_Y : out std_logic_vector(3 downto 0)
  );
end F2;

architecture arch of F2 is

begin
  process(io_R3,io_R1)
  begin
    io_Y(3) <= (((((pkg_extract(io_R3,2) xor pkg_extract(io_R3,1)) xor pkg_extract(io_R3,0)) xor (pkg_extract(io_R3,3) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R1,3) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,3) and pkg_extract(io_R1,0)));
    io_Y(2) <= (((pkg_extract(io_R3,3) xor (pkg_extract(io_R3,1) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R1,1) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,1) and pkg_extract(io_R1,0)));
    io_Y(1) <= ((((pkg_extract(io_R3,2) xor pkg_extract(io_R3,1)) xor (pkg_extract(io_R3,3) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R1,3) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,3) and pkg_extract(io_R1,0)));
    io_Y(0) <= (((pkg_extract(io_R3,1) xor (pkg_extract(io_R3,2) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R1,2) and pkg_extract(io_R3,0))) xor (pkg_extract(io_R3,2) and pkg_extract(io_R1,0)));
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity F3 is
  port(
    io_R1 : in std_logic_vector(3 downto 0);
    io_R2 : in std_logic_vector(3 downto 0);
    io_Y : out std_logic_vector(3 downto 0)
  );
end F3;

architecture arch of F3 is

begin
  process(io_R1,io_R2)
  begin
    io_Y(3) <= (((((pkg_extract(io_R1,2) xor pkg_extract(io_R1,1)) xor pkg_extract(io_R1,0)) xor (pkg_extract(io_R1,3) and pkg_extract(io_R1,0))) xor (pkg_extract(io_R1,3) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,3) and pkg_extract(io_R1,0)));
    io_Y(2) <= (((pkg_extract(io_R1,3) xor (pkg_extract(io_R1,1) and pkg_extract(io_R1,0))) xor (pkg_extract(io_R1,1) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,1) and pkg_extract(io_R1,0)));
    io_Y(1) <= ((((pkg_extract(io_R1,2) xor pkg_extract(io_R1,1)) xor (pkg_extract(io_R1,3) and pkg_extract(io_R1,0))) xor (pkg_extract(io_R1,3) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,3) and pkg_extract(io_R1,0)));
    io_Y(0) <= (((pkg_extract(io_R1,1) xor (pkg_extract(io_R1,2) and pkg_extract(io_R1,0))) xor (pkg_extract(io_R1,2) and pkg_extract(io_R2,0))) xor (pkg_extract(io_R2,2) and pkg_extract(io_R1,0)));
  end process;

end arch;


--G1_1 replaced by G1


--G2_1 replaced by G2


--G3_1 replaced by G3


--F1_1 replaced by F1


--F2_1 replaced by F2


--F3_1 replaced by F3


--G1_2 replaced by G1


--G2_2 replaced by G2


--G3_2 replaced by G3


--F1_2 replaced by F1


--F2_2 replaced by F2


--F3_2 replaced by F3


--G1_3 replaced by G1


--G2_3 replaced by G2


--G3_3 replaced by G3


--F1_3 replaced by F1


--F2_3 replaced by F2


--F3_3 replaced by F3


--G1_4 replaced by G1


--G2_4 replaced by G2


--G3_4 replaced by G3


--F1_4 replaced by F1


--F2_4 replaced by F2


--F3_4 replaced by F3


--G1_5 replaced by G1


--G2_5 replaced by G2


--G3_5 replaced by G3


--F1_5 replaced by F1


--F2_5 replaced by F2


--F3_5 replaced by F3


--G1_6 replaced by G1


--G2_6 replaced by G2


--G3_6 replaced by G3


--F1_6 replaced by F1


--F2_6 replaced by F2


--F3_6 replaced by F3


--G1_7 replaced by G1


--G2_7 replaced by G2


--G3_7 replaced by G3


--F1_7 replaced by F1


--F2_7 replaced by F2


--F3_7 replaced by F3


--G1_8 replaced by G1


--G2_8 replaced by G2


--G3_8 replaced by G3


--F1_8 replaced by F1


--F2_8 replaced by F2


--F3_8 replaced by F3


--G1_9 replaced by G1


--G2_9 replaced by G2


--G3_9 replaced by G3


--F1_9 replaced by F1


--F2_9 replaced by F2


--F3_9 replaced by F3


--G1_10 replaced by G1


--G2_10 replaced by G2


--G3_10 replaced by G3


--F1_10 replaced by F1


--F2_10 replaced by F2


--F3_10 replaced by F3


--G1_11 replaced by G1


--G2_11 replaced by G2


--G3_11 replaced by G3


--F1_11 replaced by F1


--F2_11 replaced by F2


--F3_11 replaced by F3


--G1_12 replaced by G1


--G2_12 replaced by G2


--G3_12 replaced by G3


--F1_12 replaced by F1


--F2_12 replaced by F2


--F3_12 replaced by F3


--G1_13 replaced by G1


--G2_13 replaced by G2


--G3_13 replaced by G3


--F1_13 replaced by F1


--F2_13 replaced by F2


--F3_13 replaced by F3


--G1_14 replaced by G1


--G2_14 replaced by G2


--G3_14 replaced by G3


--F1_14 replaced by F1


--F2_14 replaced by F2


--F3_14 replaced by F3


--G1_15 replaced by G1


--G2_15 replaced by G2


--G3_15 replaced by G3


--F1_15 replaced by F1


--F2_15 replaced by F2


--F3_15 replaced by F3


--G1_16 replaced by G1


--G2_16 replaced by G2


--G3_16 replaced by G3


--F1_16 replaced by F1


--F2_16 replaced by F2


--F3_16 replaced by F3

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MaskedSBox is
  port(
    io_in1 : in std_logic_vector(3 downto 0);
    io_in2 : in std_logic_vector(3 downto 0);
    io_in3 : in std_logic_vector(3 downto 0);
    io_out1 : out std_logic_vector(3 downto 0);
    io_out2 : out std_logic_vector(3 downto 0);
    io_out3 : out std_logic_vector(3 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end MaskedSBox;

architecture arch of MaskedSBox is
  signal g1_17_io_Y : std_logic_vector(3 downto 0);
  signal g2_17_io_Y : std_logic_vector(3 downto 0);
  signal g3_17_io_Y : std_logic_vector(3 downto 0);
  signal f1_17_io_Y : std_logic_vector(3 downto 0);
  signal f2_17_io_Y : std_logic_vector(3 downto 0);
  signal f3_17_io_Y : std_logic_vector(3 downto 0);

  signal GOut1 : std_logic_vector(3 downto 0);
  signal GOut2 : std_logic_vector(3 downto 0);
  signal GOut3 : std_logic_vector(3 downto 0);
begin
  g1_17 : entity work.G1
    port map ( 
      io_X2 => io_in2,
      io_X3 => io_in3,
      io_Y => g1_17_io_Y 
    );
  g2_17 : entity work.G2
    port map ( 
      io_X1 => io_in1,
      io_X3 => io_in3,
      io_Y => g2_17_io_Y 
    );
  g3_17 : entity work.G3
    port map ( 
      io_X1 => io_in1,
      io_X2 => io_in2,
      io_Y => g3_17_io_Y 
    );
  f1_17 : entity work.F1
    port map ( 
      io_R2 => GOut2,
      io_R3 => GOut3,
      io_Y => f1_17_io_Y 
    );
  f2_17 : entity work.F2
    port map ( 
      io_R1 => GOut1,
      io_R3 => GOut3,
      io_Y => f2_17_io_Y 
    );
  f3_17 : entity work.F3
    port map ( 
      io_R1 => GOut1,
      io_R2 => GOut2,
      io_Y => f3_17_io_Y 
    );
  io_out1 <= f1_17_io_Y;
  io_out2 <= f2_17_io_Y;
  io_out3 <= f3_17_io_Y;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      GOut1 <= pkg_stdLogicVector("0000");
      GOut2 <= pkg_stdLogicVector("0000");
      GOut3 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      GOut1 <= g1_17_io_Y;
      GOut2 <= g2_17_io_Y;
      GOut3 <= g3_17_io_Y;
    end if;
  end process;

end arch;


--MaskedSBox_1 replaced by MaskedSBox


--MaskedSBox_2 replaced by MaskedSBox


--MaskedSBox_3 replaced by MaskedSBox


--MaskedSBox_4 replaced by MaskedSBox


--MaskedSBox_5 replaced by MaskedSBox


--MaskedSBox_6 replaced by MaskedSBox


--MaskedSBox_7 replaced by MaskedSBox


--MaskedSBox_8 replaced by MaskedSBox


--MaskedSBox_9 replaced by MaskedSBox


--MaskedSBox_10 replaced by MaskedSBox


--MaskedSBox_11 replaced by MaskedSBox


--MaskedSBox_12 replaced by MaskedSBox


--MaskedSBox_13 replaced by MaskedSBox


--MaskedSBox_14 replaced by MaskedSBox


--MaskedSBox_15 replaced by MaskedSBox


--MaskedSBox_16 replaced by MaskedSBox

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity addRoundKey is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_key : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end addRoundKey;

architecture arch of addRoundKey is

begin
  io_stateOut <= (io_stateIn xor io_key);
end arch;


--addRoundKey_1 replaced by addRoundKey


--addRoundKey_2 replaced by addRoundKey

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity updateKeyShared is
  port(
    io_keyIn1 : in std_logic_vector(79 downto 0);
    io_keyIn2 : in std_logic_vector(79 downto 0);
    io_keyIn3 : in std_logic_vector(79 downto 0);
    io_round : in std_logic_vector(4 downto 0);
    io_keyOut1 : out std_logic_vector(79 downto 0);
    io_keyOut2 : out std_logic_vector(79 downto 0);
    io_keyOut3 : out std_logic_vector(79 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end updateKeyShared;

architecture arch of updateKeyShared is
  signal sbox_io_in1 : std_logic_vector(3 downto 0);
  signal sbox_io_in2 : std_logic_vector(3 downto 0);
  signal sbox_io_in3 : std_logic_vector(3 downto 0);
  signal sbox_io_out1 : std_logic_vector(3 downto 0);
  signal sbox_io_out2 : std_logic_vector(3 downto 0);
  signal sbox_io_out3 : std_logic_vector(3 downto 0);

  signal k11 : std_logic_vector(79 downto 0);
  signal k12 : std_logic_vector(79 downto 0);
  signal k13 : std_logic_vector(79 downto 0);
  signal k21 : std_logic_vector(79 downto 0);
  signal k22 : std_logic_vector(79 downto 0);
  signal k23 : std_logic_vector(79 downto 0);
  signal k31 : std_logic_vector(79 downto 0);
  signal k32 : std_logic_vector(79 downto 0);
  signal k33 : std_logic_vector(79 downto 0);
  signal k11Reg : std_logic_vector(79 downto 0);
  signal k12Reg : std_logic_vector(79 downto 0);
  signal k13Reg : std_logic_vector(79 downto 0);
begin
  sbox : entity work.MaskedSBox
    port map ( 
      io_in1 => sbox_io_in1,
      io_in2 => sbox_io_in2,
      io_in3 => sbox_io_in3,
      io_out1 => sbox_io_out1,
      io_out2 => sbox_io_out2,
      io_out3 => sbox_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  sbox_io_in1 <= pkg_extract(k11,79,76);
  sbox_io_in2 <= pkg_extract(k12,79,76);
  sbox_io_in3 <= pkg_extract(k13,79,76);
  k11 <= pkg_cat(pkg_extract(io_keyIn1,18,0),pkg_extract(io_keyIn1,79,19));
  k12 <= pkg_cat(pkg_extract(io_keyIn2,18,0),pkg_extract(io_keyIn2,79,19));
  k13 <= pkg_cat(pkg_extract(io_keyIn3,18,0),pkg_extract(io_keyIn3,79,19));
  k21 <= pkg_cat(sbox_io_out1,pkg_extract(k11Reg,75,0));
  k22 <= pkg_cat(sbox_io_out2,pkg_extract(k12Reg,75,0));
  k23 <= pkg_cat(sbox_io_out3,pkg_extract(k13Reg,75,0));
  k31 <= pkg_cat(pkg_cat(pkg_extract(k21,79,20),(pkg_extract(k21,19,15) xor io_round)),pkg_extract(k21,14,0));
  k32 <= pkg_cat(pkg_cat(pkg_extract(k22,79,20),(pkg_extract(k22,19,15) xor io_round)),pkg_extract(k22,14,0));
  k33 <= pkg_cat(pkg_cat(pkg_extract(k23,79,20),(pkg_extract(k23,19,15) xor io_round)),pkg_extract(k23,14,0));
  io_keyOut1 <= k31;
  io_keyOut2 <= k32;
  io_keyOut3 <= k33;
  process(io_clk)
  begin
    if rising_edge(io_clk) then
      k11Reg <= k11;
      k12Reg <= k12;
      k13Reg <= k13;
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


entity sboxLayerShared is
  port(
    io_stateIn1 : in std_logic_vector(63 downto 0);
    io_stateIn2 : in std_logic_vector(63 downto 0);
    io_stateIn3 : in std_logic_vector(63 downto 0);
    io_stateOut1 : out std_logic_vector(63 downto 0);
    io_stateOut2 : out std_logic_vector(63 downto 0);
    io_stateOut3 : out std_logic_vector(63 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end sboxLayerShared;

architecture arch of sboxLayerShared is
  signal maskedSBox_17_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_17_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_17_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_17_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_17_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_17_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out3 : std_logic_vector(3 downto 0);

begin
  maskedSBox_17 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_17_io_in1,
      io_in2 => maskedSBox_17_io_in2,
      io_in3 => maskedSBox_17_io_in3,
      io_out1 => maskedSBox_17_io_out1,
      io_out2 => maskedSBox_17_io_out2,
      io_out3 => maskedSBox_17_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_18 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_18_io_in1,
      io_in2 => maskedSBox_18_io_in2,
      io_in3 => maskedSBox_18_io_in3,
      io_out1 => maskedSBox_18_io_out1,
      io_out2 => maskedSBox_18_io_out2,
      io_out3 => maskedSBox_18_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_19 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_19_io_in1,
      io_in2 => maskedSBox_19_io_in2,
      io_in3 => maskedSBox_19_io_in3,
      io_out1 => maskedSBox_19_io_out1,
      io_out2 => maskedSBox_19_io_out2,
      io_out3 => maskedSBox_19_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_20 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_20_io_in1,
      io_in2 => maskedSBox_20_io_in2,
      io_in3 => maskedSBox_20_io_in3,
      io_out1 => maskedSBox_20_io_out1,
      io_out2 => maskedSBox_20_io_out2,
      io_out3 => maskedSBox_20_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_21 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_21_io_in1,
      io_in2 => maskedSBox_21_io_in2,
      io_in3 => maskedSBox_21_io_in3,
      io_out1 => maskedSBox_21_io_out1,
      io_out2 => maskedSBox_21_io_out2,
      io_out3 => maskedSBox_21_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_22 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_22_io_in1,
      io_in2 => maskedSBox_22_io_in2,
      io_in3 => maskedSBox_22_io_in3,
      io_out1 => maskedSBox_22_io_out1,
      io_out2 => maskedSBox_22_io_out2,
      io_out3 => maskedSBox_22_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_23 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_23_io_in1,
      io_in2 => maskedSBox_23_io_in2,
      io_in3 => maskedSBox_23_io_in3,
      io_out1 => maskedSBox_23_io_out1,
      io_out2 => maskedSBox_23_io_out2,
      io_out3 => maskedSBox_23_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_24 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_24_io_in1,
      io_in2 => maskedSBox_24_io_in2,
      io_in3 => maskedSBox_24_io_in3,
      io_out1 => maskedSBox_24_io_out1,
      io_out2 => maskedSBox_24_io_out2,
      io_out3 => maskedSBox_24_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_25 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_25_io_in1,
      io_in2 => maskedSBox_25_io_in2,
      io_in3 => maskedSBox_25_io_in3,
      io_out1 => maskedSBox_25_io_out1,
      io_out2 => maskedSBox_25_io_out2,
      io_out3 => maskedSBox_25_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_26 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_26_io_in1,
      io_in2 => maskedSBox_26_io_in2,
      io_in3 => maskedSBox_26_io_in3,
      io_out1 => maskedSBox_26_io_out1,
      io_out2 => maskedSBox_26_io_out2,
      io_out3 => maskedSBox_26_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_27 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_27_io_in1,
      io_in2 => maskedSBox_27_io_in2,
      io_in3 => maskedSBox_27_io_in3,
      io_out1 => maskedSBox_27_io_out1,
      io_out2 => maskedSBox_27_io_out2,
      io_out3 => maskedSBox_27_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_28 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_28_io_in1,
      io_in2 => maskedSBox_28_io_in2,
      io_in3 => maskedSBox_28_io_in3,
      io_out1 => maskedSBox_28_io_out1,
      io_out2 => maskedSBox_28_io_out2,
      io_out3 => maskedSBox_28_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_29 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_29_io_in1,
      io_in2 => maskedSBox_29_io_in2,
      io_in3 => maskedSBox_29_io_in3,
      io_out1 => maskedSBox_29_io_out1,
      io_out2 => maskedSBox_29_io_out2,
      io_out3 => maskedSBox_29_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_30 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_30_io_in1,
      io_in2 => maskedSBox_30_io_in2,
      io_in3 => maskedSBox_30_io_in3,
      io_out1 => maskedSBox_30_io_out1,
      io_out2 => maskedSBox_30_io_out2,
      io_out3 => maskedSBox_30_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_31 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_31_io_in1,
      io_in2 => maskedSBox_31_io_in2,
      io_in3 => maskedSBox_31_io_in3,
      io_out1 => maskedSBox_31_io_out1,
      io_out2 => maskedSBox_31_io_out2,
      io_out3 => maskedSBox_31_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_32 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_32_io_in1,
      io_in2 => maskedSBox_32_io_in2,
      io_in3 => maskedSBox_32_io_in3,
      io_out1 => maskedSBox_32_io_out1,
      io_out2 => maskedSBox_32_io_out2,
      io_out3 => maskedSBox_32_io_out3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  maskedSBox_17_io_in1 <= pkg_extract(io_stateIn1,3,0);
  maskedSBox_17_io_in2 <= pkg_extract(io_stateIn2,3,0);
  maskedSBox_17_io_in3 <= pkg_extract(io_stateIn3,3,0);
  process(maskedSBox_17_io_out1,maskedSBox_18_io_out1,maskedSBox_19_io_out1,maskedSBox_20_io_out1,maskedSBox_21_io_out1,maskedSBox_22_io_out1,maskedSBox_23_io_out1,maskedSBox_24_io_out1,maskedSBox_25_io_out1,maskedSBox_26_io_out1,maskedSBox_27_io_out1,maskedSBox_28_io_out1,maskedSBox_29_io_out1,maskedSBox_30_io_out1,maskedSBox_31_io_out1,maskedSBox_32_io_out1)
  begin
    io_stateOut1(3 downto 0) <= maskedSBox_17_io_out1;
    io_stateOut1(7 downto 4) <= maskedSBox_18_io_out1;
    io_stateOut1(11 downto 8) <= maskedSBox_19_io_out1;
    io_stateOut1(15 downto 12) <= maskedSBox_20_io_out1;
    io_stateOut1(19 downto 16) <= maskedSBox_21_io_out1;
    io_stateOut1(23 downto 20) <= maskedSBox_22_io_out1;
    io_stateOut1(27 downto 24) <= maskedSBox_23_io_out1;
    io_stateOut1(31 downto 28) <= maskedSBox_24_io_out1;
    io_stateOut1(35 downto 32) <= maskedSBox_25_io_out1;
    io_stateOut1(39 downto 36) <= maskedSBox_26_io_out1;
    io_stateOut1(43 downto 40) <= maskedSBox_27_io_out1;
    io_stateOut1(47 downto 44) <= maskedSBox_28_io_out1;
    io_stateOut1(51 downto 48) <= maskedSBox_29_io_out1;
    io_stateOut1(55 downto 52) <= maskedSBox_30_io_out1;
    io_stateOut1(59 downto 56) <= maskedSBox_31_io_out1;
    io_stateOut1(63 downto 60) <= maskedSBox_32_io_out1;
  end process;

  process(maskedSBox_17_io_out2,maskedSBox_18_io_out2,maskedSBox_19_io_out2,maskedSBox_20_io_out2,maskedSBox_21_io_out2,maskedSBox_22_io_out2,maskedSBox_23_io_out2,maskedSBox_24_io_out2,maskedSBox_25_io_out2,maskedSBox_26_io_out2,maskedSBox_27_io_out2,maskedSBox_28_io_out2,maskedSBox_29_io_out2,maskedSBox_30_io_out2,maskedSBox_31_io_out2,maskedSBox_32_io_out2)
  begin
    io_stateOut2(3 downto 0) <= maskedSBox_17_io_out2;
    io_stateOut2(7 downto 4) <= maskedSBox_18_io_out2;
    io_stateOut2(11 downto 8) <= maskedSBox_19_io_out2;
    io_stateOut2(15 downto 12) <= maskedSBox_20_io_out2;
    io_stateOut2(19 downto 16) <= maskedSBox_21_io_out2;
    io_stateOut2(23 downto 20) <= maskedSBox_22_io_out2;
    io_stateOut2(27 downto 24) <= maskedSBox_23_io_out2;
    io_stateOut2(31 downto 28) <= maskedSBox_24_io_out2;
    io_stateOut2(35 downto 32) <= maskedSBox_25_io_out2;
    io_stateOut2(39 downto 36) <= maskedSBox_26_io_out2;
    io_stateOut2(43 downto 40) <= maskedSBox_27_io_out2;
    io_stateOut2(47 downto 44) <= maskedSBox_28_io_out2;
    io_stateOut2(51 downto 48) <= maskedSBox_29_io_out2;
    io_stateOut2(55 downto 52) <= maskedSBox_30_io_out2;
    io_stateOut2(59 downto 56) <= maskedSBox_31_io_out2;
    io_stateOut2(63 downto 60) <= maskedSBox_32_io_out2;
  end process;

  process(maskedSBox_17_io_out3,maskedSBox_18_io_out3,maskedSBox_19_io_out3,maskedSBox_20_io_out3,maskedSBox_21_io_out3,maskedSBox_22_io_out3,maskedSBox_23_io_out3,maskedSBox_24_io_out3,maskedSBox_25_io_out3,maskedSBox_26_io_out3,maskedSBox_27_io_out3,maskedSBox_28_io_out3,maskedSBox_29_io_out3,maskedSBox_30_io_out3,maskedSBox_31_io_out3,maskedSBox_32_io_out3)
  begin
    io_stateOut3(3 downto 0) <= maskedSBox_17_io_out3;
    io_stateOut3(7 downto 4) <= maskedSBox_18_io_out3;
    io_stateOut3(11 downto 8) <= maskedSBox_19_io_out3;
    io_stateOut3(15 downto 12) <= maskedSBox_20_io_out3;
    io_stateOut3(19 downto 16) <= maskedSBox_21_io_out3;
    io_stateOut3(23 downto 20) <= maskedSBox_22_io_out3;
    io_stateOut3(27 downto 24) <= maskedSBox_23_io_out3;
    io_stateOut3(31 downto 28) <= maskedSBox_24_io_out3;
    io_stateOut3(35 downto 32) <= maskedSBox_25_io_out3;
    io_stateOut3(39 downto 36) <= maskedSBox_26_io_out3;
    io_stateOut3(43 downto 40) <= maskedSBox_27_io_out3;
    io_stateOut3(47 downto 44) <= maskedSBox_28_io_out3;
    io_stateOut3(51 downto 48) <= maskedSBox_29_io_out3;
    io_stateOut3(55 downto 52) <= maskedSBox_30_io_out3;
    io_stateOut3(59 downto 56) <= maskedSBox_31_io_out3;
    io_stateOut3(63 downto 60) <= maskedSBox_32_io_out3;
  end process;

  maskedSBox_18_io_in1 <= pkg_extract(io_stateIn1,7,4);
  maskedSBox_18_io_in2 <= pkg_extract(io_stateIn2,7,4);
  maskedSBox_18_io_in3 <= pkg_extract(io_stateIn3,7,4);
  maskedSBox_19_io_in1 <= pkg_extract(io_stateIn1,11,8);
  maskedSBox_19_io_in2 <= pkg_extract(io_stateIn2,11,8);
  maskedSBox_19_io_in3 <= pkg_extract(io_stateIn3,11,8);
  maskedSBox_20_io_in1 <= pkg_extract(io_stateIn1,15,12);
  maskedSBox_20_io_in2 <= pkg_extract(io_stateIn2,15,12);
  maskedSBox_20_io_in3 <= pkg_extract(io_stateIn3,15,12);
  maskedSBox_21_io_in1 <= pkg_extract(io_stateIn1,19,16);
  maskedSBox_21_io_in2 <= pkg_extract(io_stateIn2,19,16);
  maskedSBox_21_io_in3 <= pkg_extract(io_stateIn3,19,16);
  maskedSBox_22_io_in1 <= pkg_extract(io_stateIn1,23,20);
  maskedSBox_22_io_in2 <= pkg_extract(io_stateIn2,23,20);
  maskedSBox_22_io_in3 <= pkg_extract(io_stateIn3,23,20);
  maskedSBox_23_io_in1 <= pkg_extract(io_stateIn1,27,24);
  maskedSBox_23_io_in2 <= pkg_extract(io_stateIn2,27,24);
  maskedSBox_23_io_in3 <= pkg_extract(io_stateIn3,27,24);
  maskedSBox_24_io_in1 <= pkg_extract(io_stateIn1,31,28);
  maskedSBox_24_io_in2 <= pkg_extract(io_stateIn2,31,28);
  maskedSBox_24_io_in3 <= pkg_extract(io_stateIn3,31,28);
  maskedSBox_25_io_in1 <= pkg_extract(io_stateIn1,35,32);
  maskedSBox_25_io_in2 <= pkg_extract(io_stateIn2,35,32);
  maskedSBox_25_io_in3 <= pkg_extract(io_stateIn3,35,32);
  maskedSBox_26_io_in1 <= pkg_extract(io_stateIn1,39,36);
  maskedSBox_26_io_in2 <= pkg_extract(io_stateIn2,39,36);
  maskedSBox_26_io_in3 <= pkg_extract(io_stateIn3,39,36);
  maskedSBox_27_io_in1 <= pkg_extract(io_stateIn1,43,40);
  maskedSBox_27_io_in2 <= pkg_extract(io_stateIn2,43,40);
  maskedSBox_27_io_in3 <= pkg_extract(io_stateIn3,43,40);
  maskedSBox_28_io_in1 <= pkg_extract(io_stateIn1,47,44);
  maskedSBox_28_io_in2 <= pkg_extract(io_stateIn2,47,44);
  maskedSBox_28_io_in3 <= pkg_extract(io_stateIn3,47,44);
  maskedSBox_29_io_in1 <= pkg_extract(io_stateIn1,51,48);
  maskedSBox_29_io_in2 <= pkg_extract(io_stateIn2,51,48);
  maskedSBox_29_io_in3 <= pkg_extract(io_stateIn3,51,48);
  maskedSBox_30_io_in1 <= pkg_extract(io_stateIn1,55,52);
  maskedSBox_30_io_in2 <= pkg_extract(io_stateIn2,55,52);
  maskedSBox_30_io_in3 <= pkg_extract(io_stateIn3,55,52);
  maskedSBox_31_io_in1 <= pkg_extract(io_stateIn1,59,56);
  maskedSBox_31_io_in2 <= pkg_extract(io_stateIn2,59,56);
  maskedSBox_31_io_in3 <= pkg_extract(io_stateIn3,59,56);
  maskedSBox_32_io_in1 <= pkg_extract(io_stateIn1,63,60);
  maskedSBox_32_io_in2 <= pkg_extract(io_stateIn2,63,60);
  maskedSBox_32_io_in3 <= pkg_extract(io_stateIn3,63,60);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity permutation is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end permutation;

architecture arch of permutation is

begin
  process(io_stateIn)
  begin
    io_stateOut(0) <= pkg_extract(io_stateIn,0);
    io_stateOut(16) <= pkg_extract(io_stateIn,1);
    io_stateOut(32) <= pkg_extract(io_stateIn,2);
    io_stateOut(48) <= pkg_extract(io_stateIn,3);
    io_stateOut(1) <= pkg_extract(io_stateIn,4);
    io_stateOut(17) <= pkg_extract(io_stateIn,5);
    io_stateOut(33) <= pkg_extract(io_stateIn,6);
    io_stateOut(49) <= pkg_extract(io_stateIn,7);
    io_stateOut(2) <= pkg_extract(io_stateIn,8);
    io_stateOut(18) <= pkg_extract(io_stateIn,9);
    io_stateOut(34) <= pkg_extract(io_stateIn,10);
    io_stateOut(50) <= pkg_extract(io_stateIn,11);
    io_stateOut(3) <= pkg_extract(io_stateIn,12);
    io_stateOut(19) <= pkg_extract(io_stateIn,13);
    io_stateOut(35) <= pkg_extract(io_stateIn,14);
    io_stateOut(51) <= pkg_extract(io_stateIn,15);
    io_stateOut(4) <= pkg_extract(io_stateIn,16);
    io_stateOut(20) <= pkg_extract(io_stateIn,17);
    io_stateOut(36) <= pkg_extract(io_stateIn,18);
    io_stateOut(52) <= pkg_extract(io_stateIn,19);
    io_stateOut(5) <= pkg_extract(io_stateIn,20);
    io_stateOut(21) <= pkg_extract(io_stateIn,21);
    io_stateOut(37) <= pkg_extract(io_stateIn,22);
    io_stateOut(53) <= pkg_extract(io_stateIn,23);
    io_stateOut(6) <= pkg_extract(io_stateIn,24);
    io_stateOut(22) <= pkg_extract(io_stateIn,25);
    io_stateOut(38) <= pkg_extract(io_stateIn,26);
    io_stateOut(54) <= pkg_extract(io_stateIn,27);
    io_stateOut(7) <= pkg_extract(io_stateIn,28);
    io_stateOut(23) <= pkg_extract(io_stateIn,29);
    io_stateOut(39) <= pkg_extract(io_stateIn,30);
    io_stateOut(55) <= pkg_extract(io_stateIn,31);
    io_stateOut(8) <= pkg_extract(io_stateIn,32);
    io_stateOut(24) <= pkg_extract(io_stateIn,33);
    io_stateOut(40) <= pkg_extract(io_stateIn,34);
    io_stateOut(56) <= pkg_extract(io_stateIn,35);
    io_stateOut(9) <= pkg_extract(io_stateIn,36);
    io_stateOut(25) <= pkg_extract(io_stateIn,37);
    io_stateOut(41) <= pkg_extract(io_stateIn,38);
    io_stateOut(57) <= pkg_extract(io_stateIn,39);
    io_stateOut(10) <= pkg_extract(io_stateIn,40);
    io_stateOut(26) <= pkg_extract(io_stateIn,41);
    io_stateOut(42) <= pkg_extract(io_stateIn,42);
    io_stateOut(58) <= pkg_extract(io_stateIn,43);
    io_stateOut(11) <= pkg_extract(io_stateIn,44);
    io_stateOut(27) <= pkg_extract(io_stateIn,45);
    io_stateOut(43) <= pkg_extract(io_stateIn,46);
    io_stateOut(59) <= pkg_extract(io_stateIn,47);
    io_stateOut(12) <= pkg_extract(io_stateIn,48);
    io_stateOut(28) <= pkg_extract(io_stateIn,49);
    io_stateOut(44) <= pkg_extract(io_stateIn,50);
    io_stateOut(60) <= pkg_extract(io_stateIn,51);
    io_stateOut(13) <= pkg_extract(io_stateIn,52);
    io_stateOut(29) <= pkg_extract(io_stateIn,53);
    io_stateOut(45) <= pkg_extract(io_stateIn,54);
    io_stateOut(61) <= pkg_extract(io_stateIn,55);
    io_stateOut(14) <= pkg_extract(io_stateIn,56);
    io_stateOut(30) <= pkg_extract(io_stateIn,57);
    io_stateOut(46) <= pkg_extract(io_stateIn,58);
    io_stateOut(62) <= pkg_extract(io_stateIn,59);
    io_stateOut(15) <= pkg_extract(io_stateIn,60);
    io_stateOut(31) <= pkg_extract(io_stateIn,61);
    io_stateOut(47) <= pkg_extract(io_stateIn,62);
    io_stateOut(63) <= pkg_extract(io_stateIn,63);
  end process;

end arch;


--permutation_1 replaced by permutation


--permutation_2 replaced by permutation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity presentEncryptMasked is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_plaintext1 : in std_logic_vector(63 downto 0);
    io_plaintext2 : in std_logic_vector(63 downto 0);
    io_plaintext3 : in std_logic_vector(63 downto 0);
    io_key1 : in std_logic_vector(79 downto 0);
    io_key2 : in std_logic_vector(79 downto 0);
    io_key3 : in std_logic_vector(79 downto 0);
    io_ciphertext1 : out std_logic_vector(63 downto 0);
    io_ciphertext2 : out std_logic_vector(63 downto 0);
    io_ciphertext3 : out std_logic_vector(63 downto 0);
    io_done : out std_logic
  );
end presentEncryptMasked;

architecture arch of presentEncryptMasked is
  signal r_updatekeyshared_io_round : std_logic_vector(4 downto 0);
  signal r_addroundkey1_io_stateOut : std_logic_vector(63 downto 0);
  signal r_addroundkey2_io_stateOut : std_logic_vector(63 downto 0);
  signal r_addroundkey3_io_stateOut : std_logic_vector(63 downto 0);
  signal r_updatekeyshared_io_keyOut1 : std_logic_vector(79 downto 0);
  signal r_updatekeyshared_io_keyOut2 : std_logic_vector(79 downto 0);
  signal r_updatekeyshared_io_keyOut3 : std_logic_vector(79 downto 0);
  signal r_sboxlayershared_io_stateOut1 : std_logic_vector(63 downto 0);
  signal r_sboxlayershared_io_stateOut2 : std_logic_vector(63 downto 0);
  signal r_sboxlayershared_io_stateOut3 : std_logic_vector(63 downto 0);
  signal r_permutation1_io_stateOut : std_logic_vector(63 downto 0);
  signal r_permutation2_io_stateOut : std_logic_vector(63 downto 0);
  signal r_permutation3_io_stateOut : std_logic_vector(63 downto 0);

  signal r_state1 : std_logic_vector(63 downto 0);
  signal r_state2 : std_logic_vector(63 downto 0);
  signal r_state3 : std_logic_vector(63 downto 0);
  signal r_keyReg1 : std_logic_vector(79 downto 0);
  signal r_keyReg2 : std_logic_vector(79 downto 0);
  signal r_keyReg3 : std_logic_vector(79 downto 0);
  signal r_roundKey1 : std_logic_vector(63 downto 0);
  signal r_roundKey2 : std_logic_vector(63 downto 0);
  signal r_roundKey3 : std_logic_vector(63 downto 0);
  signal r_ctr_willIncrement : std_logic;
  signal r_ctr_willClear : std_logic;
  signal r_ctr_valueNext : unsigned(4 downto 0);
  signal r_ctr_value : unsigned(4 downto 0);
  signal r_ctr_willOverflowIfInc : std_logic;
  signal r_ctr_willOverflow : std_logic;
  signal r_smallCtr_willIncrement : std_logic;
  signal r_smallCtr_willClear : std_logic;
  signal r_smallCtr_valueNext : unsigned(0 downto 0);
  signal r_smallCtr_value : unsigned(0 downto 0);
  signal r_smallCtr_willOverflowIfInc : std_logic;
  signal r_smallCtr_willOverflow : std_logic;
  signal r_presentState : States;
begin
  r_addroundkey1 : entity work.addRoundKey
    port map ( 
      io_stateIn => r_state1,
      io_key => r_roundKey1,
      io_stateOut => r_addroundkey1_io_stateOut 
    );
  r_addroundkey2 : entity work.addRoundKey
    port map ( 
      io_stateIn => r_state2,
      io_key => r_roundKey2,
      io_stateOut => r_addroundkey2_io_stateOut 
    );
  r_addroundkey3 : entity work.addRoundKey
    port map ( 
      io_stateIn => r_state3,
      io_key => r_roundKey3,
      io_stateOut => r_addroundkey3_io_stateOut 
    );
  r_updatekeyshared : entity work.updateKeyShared
    port map ( 
      io_keyIn1 => r_keyReg1,
      io_keyIn2 => r_keyReg2,
      io_keyIn3 => r_keyReg3,
      io_round => r_updatekeyshared_io_round,
      io_keyOut1 => r_updatekeyshared_io_keyOut1,
      io_keyOut2 => r_updatekeyshared_io_keyOut2,
      io_keyOut3 => r_updatekeyshared_io_keyOut3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_sboxlayershared : entity work.sboxLayerShared
    port map ( 
      io_stateIn1 => r_addroundkey1_io_stateOut,
      io_stateIn2 => r_addroundkey2_io_stateOut,
      io_stateIn3 => r_addroundkey3_io_stateOut,
      io_stateOut1 => r_sboxlayershared_io_stateOut1,
      io_stateOut2 => r_sboxlayershared_io_stateOut2,
      io_stateOut3 => r_sboxlayershared_io_stateOut3,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_permutation1 : entity work.permutation
    port map ( 
      io_stateIn => r_sboxlayershared_io_stateOut1,
      io_stateOut => r_permutation1_io_stateOut 
    );
  r_permutation2 : entity work.permutation
    port map ( 
      io_stateIn => r_sboxlayershared_io_stateOut2,
      io_stateOut => r_permutation2_io_stateOut 
    );
  r_permutation3 : entity work.permutation
    port map ( 
      io_stateIn => r_sboxlayershared_io_stateOut3,
      io_stateOut => r_permutation3_io_stateOut 
    );
  process(r_presentState)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_presentState,r_smallCtr_willOverflow)
  begin
    r_ctr_willIncrement <= pkg_toStdLogic(false);
    case r_presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        if r_smallCtr_willOverflow = '1' then
          r_ctr_willIncrement <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_presentState)
  begin
    r_ctr_willClear <= pkg_toStdLogic(false);
    case r_presentState is
      when pkg_enum.sIdle =>
        r_ctr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  r_ctr_willOverflowIfInc <= pkg_toStdLogic(r_ctr_value = pkg_unsigned("11111"));
  r_ctr_willOverflow <= (r_ctr_willOverflowIfInc and r_ctr_willIncrement);
  process(r_ctr_willOverflow,r_ctr_value,r_ctr_willIncrement,r_ctr_willClear)
  begin
    if r_ctr_willOverflow = '1' then
      r_ctr_valueNext <= pkg_unsigned("00001");
    else
      r_ctr_valueNext <= (r_ctr_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_ctr_willIncrement)),5));
    end if;
    if r_ctr_willClear = '1' then
      r_ctr_valueNext <= pkg_unsigned("00001");
    end if;
  end process;

  process(r_presentState)
  begin
    r_smallCtr_willIncrement <= pkg_toStdLogic(false);
    case r_presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        r_smallCtr_willIncrement <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(r_presentState)
  begin
    r_smallCtr_willClear <= pkg_toStdLogic(false);
    case r_presentState is
      when pkg_enum.sIdle =>
        r_smallCtr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  r_smallCtr_willOverflowIfInc <= pkg_toStdLogic(r_smallCtr_value = pkg_unsigned("1"));
  r_smallCtr_willOverflow <= (r_smallCtr_willOverflowIfInc and r_smallCtr_willIncrement);
  process(r_smallCtr_value,r_smallCtr_willIncrement,r_smallCtr_willClear)
  begin
    r_smallCtr_valueNext <= (r_smallCtr_value + unsigned(pkg_toStdLogicVector(r_smallCtr_willIncrement)));
    if r_smallCtr_willClear = '1' then
      r_smallCtr_valueNext <= pkg_unsigned("0");
    end if;
  end process;

  r_roundKey1 <= pkg_extract(r_keyReg1,79,16);
  r_roundKey2 <= pkg_extract(r_keyReg2,79,16);
  r_roundKey3 <= pkg_extract(r_keyReg3,79,16);
  r_updatekeyshared_io_round <= std_logic_vector(r_ctr_value);
  io_ciphertext1 <= r_addroundkey1_io_stateOut;
  io_ciphertext2 <= r_addroundkey2_io_stateOut;
  io_ciphertext3 <= r_addroundkey3_io_stateOut;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_state1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      r_state2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      r_state3 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg3 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_ctr_value <= pkg_unsigned("00001");
      r_smallCtr_value <= pkg_unsigned("0");
      r_presentState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_ctr_value <= r_ctr_valueNext;
      r_smallCtr_value <= r_smallCtr_valueNext;
      r_keyReg1 <= r_updatekeyshared_io_keyOut1;
      r_keyReg2 <= r_updatekeyshared_io_keyOut2;
      r_keyReg3 <= r_updatekeyshared_io_keyOut3;
      r_state1 <= r_permutation1_io_stateOut;
      r_state2 <= r_permutation2_io_stateOut;
      r_state3 <= r_permutation3_io_stateOut;
      case r_presentState is
        when pkg_enum.sIdle =>
          r_presentState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_presentState <= pkg_enum.sExecute;
            r_state1 <= io_plaintext1;
            r_state2 <= io_plaintext2;
            r_state3 <= io_plaintext3;
            r_keyReg1 <= io_key1;
            r_keyReg2 <= io_key2;
            r_keyReg3 <= io_key3;
          end if;
        when pkg_enum.sExecute =>
          r_presentState <= pkg_enum.sExecute;
          if r_ctr_willOverflow = '1' then
            r_presentState <= pkg_enum.sDone;
          end if;
        when others =>
          r_presentState <= pkg_enum.sDone;
      end case;
    end if;
  end process;

end arch;

