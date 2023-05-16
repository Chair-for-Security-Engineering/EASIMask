-- Generator : SpinalHDL v1.6.2    git head : 85cae432eceede8556a3d1c01b9034bca87c9af9
-- Component : AES
-- Git hash  : 85cae432eceede8556a3d1c01b9034bca87c9af9

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type States2 is (sIdle,sInit,sRound,sDone);

  function pkg_mux (sel : std_logic; one : States2; zero : States2) return States2;
  function pkg_toStdLogicVector_native (value : States2) return std_logic_vector;
  function pkg_toStates2_native (value : std_logic_vector(1 downto 0)) return States2;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : States2; zero : States2) return States2 is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toStates2_native (value : std_logic_vector(1 downto 0)) return States2 is
  begin
    case value is
      when "00" => return sIdle;
      when "01" => return sInit;
      when "10" => return sRound;
      when "11" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States2) return std_logic_vector is
  begin
    case value is
      when sIdle => return "00";
      when sInit => return "01";
      when sRound => return "10";
      when sDone => return "11";
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


--G4ScaleN_3 replaced by G4ScaleN


--G4Sq_2 replaced by G4Sq


--G4Sq_3 replaced by G4Sq


--G4Mul_9 replaced by G4Mul


--G4Mul_10 replaced by G4Mul


--G4Mul_11 replaced by G4Mul

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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16Inv is
  port(
    io_t : in std_logic_vector(3 downto 0);
    io_x : out std_logic_vector(3 downto 0)
  );
end G16Inv;

architecture arch of G16Inv is
  signal square1_io_t : std_logic_vector(1 downto 0);
  signal square2_io_t : std_logic_vector(1 downto 0);
  signal scale_io_x : std_logic_vector(1 downto 0);
  signal square1_io_x : std_logic_vector(1 downto 0);
  signal square2_io_x : std_logic_vector(1 downto 0);
  signal mul1_io_x : std_logic_vector(1 downto 0);
  signal mul2_io_x : std_logic_vector(1 downto 0);
  signal mul3_io_x : std_logic_vector(1 downto 0);

  signal a : std_logic_vector(1 downto 0);
  signal b : std_logic_vector(1 downto 0);
  signal c : std_logic_vector(1 downto 0);
  signal d : std_logic_vector(1 downto 0);
  signal e : std_logic_vector(1 downto 0);
  signal p : std_logic_vector(1 downto 0);
  signal q : std_logic_vector(1 downto 0);
  signal x : std_logic_vector(1 downto 0);
begin
  scale : entity work.G4ScaleN
    port map ( 
      io_t => square1_io_x,
      io_x => scale_io_x 
    );
  square1 : entity work.G4Sq
    port map ( 
      io_t => square1_io_t,
      io_x => square1_io_x 
    );
  square2 : entity work.G4Sq
    port map ( 
      io_t => square2_io_t,
      io_x => square2_io_x 
    );
  mul1 : entity work.G4Mul
    port map ( 
      io_a => a,
      io_b => b,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G4Mul
    port map ( 
      io_a => e,
      io_b => b,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G4Mul
    port map ( 
      io_a => e,
      io_b => a,
      io_x => mul3_io_x 
    );
  square1_io_t <= (a xor b);
  c <= scale_io_x;
  d <= mul1_io_x;
  square2_io_t <= (c xor d);
  e <= square2_io_x;
  p <= mul2_io_x;
  q <= mul3_io_x;
  a <= pkg_extract(io_t,3,2);
  b <= pkg_extract(io_t,1,0);
  io_x <= pkg_cat(p,q);
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
    io_output : out std_logic_vector(7 downto 0)
  );
end NewBasis;

architecture arch of NewBasis is

  signal a : std_logic_vector(7 downto 0);
  signal b : std_logic_vector(7 downto 0);
  signal c : std_logic_vector(7 downto 0);
  signal when_NewBasis_l33 : std_logic;
begin
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

  when_NewBasis_l33 <= (not io_direction);
  process(when_NewBasis_l33,b,c)
  begin
    if when_NewBasis_l33 = '1' then
      io_output <= b;
    else
      io_output <= c;
    end if;
  end process;

end arch;


--NewBasis_1 replaced by NewBasis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G256Inv is
  port(
    io_t : in std_logic_vector(7 downto 0);
    io_x : out std_logic_vector(7 downto 0)
  );
end G256Inv;

architecture arch of G256Inv is
  signal sqSc_io_t : std_logic_vector(3 downto 0);
  signal inv_io_t : std_logic_vector(3 downto 0);
  signal sqSc_io_x : std_logic_vector(3 downto 0);
  signal mul1_io_x : std_logic_vector(3 downto 0);
  signal mul2_io_x : std_logic_vector(3 downto 0);
  signal mul3_io_x : std_logic_vector(3 downto 0);
  signal inv_io_x : std_logic_vector(3 downto 0);

  signal a : std_logic_vector(3 downto 0);
  signal b : std_logic_vector(3 downto 0);
  signal c : std_logic_vector(3 downto 0);
  signal d : std_logic_vector(3 downto 0);
  signal e : std_logic_vector(3 downto 0);
  signal p : std_logic_vector(3 downto 0);
  signal q : std_logic_vector(3 downto 0);
begin
  sqSc : entity work.G16SqSc
    port map ( 
      io_t => sqSc_io_t,
      io_x => sqSc_io_x 
    );
  mul1 : entity work.G16Mul
    port map ( 
      io_a => a,
      io_b => b,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G16Mul
    port map ( 
      io_a => e,
      io_b => b,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G16Mul
    port map ( 
      io_a => e,
      io_b => a,
      io_x => mul3_io_x 
    );
  inv : entity work.G16Inv
    port map ( 
      io_t => inv_io_t,
      io_x => inv_io_x 
    );
  sqSc_io_t <= (a xor b);
  c <= sqSc_io_x;
  d <= mul1_io_x;
  inv_io_t <= (c xor d);
  e <= inv_io_x;
  p <= mul2_io_x;
  q <= mul3_io_x;
  a <= pkg_extract(io_t,7,4);
  b <= pkg_extract(io_t,3,0);
  io_x <= pkg_cat(p,q);
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
    io_a : in std_logic_vector(7 downto 0);
    io_k : in std_logic_vector(7 downto 0);
    io_b : out std_logic_vector(7 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_b <= (io_a xor io_k);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity CanrightSBox is
  port(
    io_subBytesInput : in std_logic_vector(7 downto 0);
    io_subBytesOutput : out std_logic_vector(7 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end CanrightSBox;

architecture arch of CanrightSBox is
  signal convertBasis1_io_output : std_logic_vector(7 downto 0);
  signal convertBasis2_io_output : std_logic_vector(7 downto 0);
  signal inv_io_x : std_logic_vector(7 downto 0);

  signal dummy : std_logic;
  signal t : std_logic_vector(7 downto 0);
  signal x : std_logic_vector(7 downto 0);
begin
  convertBasis1 : entity work.NewBasis
    port map ( 
      io_input => io_subBytesInput,
      io_direction => pkg_toStdLogic(false),
      io_output => convertBasis1_io_output 
    );
  convertBasis2 : entity work.NewBasis
    port map ( 
      io_input => x,
      io_direction => pkg_toStdLogic(true),
      io_output => convertBasis2_io_output 
    );
  inv : entity work.G256Inv
    port map ( 
      io_t => t,
      io_x => inv_io_x 
    );
  dummy <= pkg_toStdLogic(false);
  t <= convertBasis1_io_output;
  x <= inv_io_x;
  io_subBytesOutput <= (convertBasis2_io_output xor pkg_stdLogicVector("01100011"));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumns is
  port(
    io_mcIn1 : in std_logic_vector(7 downto 0);
    io_mcIn2 : in std_logic_vector(7 downto 0);
    io_mcIn3 : in std_logic_vector(7 downto 0);
    io_mcIn4 : in std_logic_vector(7 downto 0);
    io_mcOut1 : out std_logic_vector(7 downto 0);
    io_mcOut2 : out std_logic_vector(7 downto 0);
    io_mcOut3 : out std_logic_vector(7 downto 0);
    io_mcOut4 : out std_logic_vector(7 downto 0)
  );
end MixColumns;

architecture arch of MixColumns is

  signal a1 : std_logic_vector(7 downto 0);
  signal a2 : std_logic_vector(7 downto 0);
  signal a3 : std_logic_vector(7 downto 0);
  signal a0 : std_logic_vector(7 downto 0);
  signal zz_io_mcOut1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26 : std_logic;
  signal zz_io_mcOut1_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_1 : std_logic;
  signal zz_io_mcOut2 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_2 : std_logic;
  signal zz_io_mcOut2_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_3 : std_logic;
  signal zz_io_mcOut3 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_4 : std_logic;
  signal zz_io_mcOut3_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_5 : std_logic;
  signal zz_io_mcOut4 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_6 : std_logic;
  signal zz_io_mcOut4_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l26_7 : std_logic;
begin
  a0 <= io_mcIn1;
  a1 <= io_mcIn2;
  a2 <= io_mcIn3;
  a3 <= io_mcIn4;
  when_MixColumns_l26 <= pkg_extract(a0,7);
  process(when_MixColumns_l26,a0)
  begin
    if when_MixColumns_l26 = '1' then
      zz_io_mcOut1 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut1 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l26_1 <= pkg_extract(a1,7);
  process(when_MixColumns_l26_1,a1)
  begin
    if when_MixColumns_l26_1 = '1' then
      zz_io_mcOut1_1 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut1_1 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  io_mcOut1 <= (((pkg_extract(zz_io_mcOut1,7,0) xor (pkg_extract(zz_io_mcOut1_1,7,0) xor a1)) xor a2) xor a3);
  when_MixColumns_l26_2 <= pkg_extract(a1,7);
  process(when_MixColumns_l26_2,a1)
  begin
    if when_MixColumns_l26_2 = '1' then
      zz_io_mcOut2 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut2 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  when_MixColumns_l26_3 <= pkg_extract(a2,7);
  process(when_MixColumns_l26_3,a2)
  begin
    if when_MixColumns_l26_3 = '1' then
      zz_io_mcOut2_1 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut2_1 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  io_mcOut2 <= (((a0 xor pkg_extract(zz_io_mcOut2,7,0)) xor (pkg_extract(zz_io_mcOut2_1,7,0) xor a2)) xor a3);
  when_MixColumns_l26_4 <= pkg_extract(a2,7);
  process(when_MixColumns_l26_4,a2)
  begin
    if when_MixColumns_l26_4 = '1' then
      zz_io_mcOut3 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut3 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l26_5 <= pkg_extract(a3,7);
  process(when_MixColumns_l26_5,a3)
  begin
    if when_MixColumns_l26_5 = '1' then
      zz_io_mcOut3_1 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut3_1 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  io_mcOut3 <= (((a0 xor a1) xor pkg_extract(zz_io_mcOut3,7,0)) xor (pkg_extract(zz_io_mcOut3_1,7,0) xor a3));
  when_MixColumns_l26_6 <= pkg_extract(a0,7);
  process(when_MixColumns_l26_6,a0)
  begin
    if when_MixColumns_l26_6 = '1' then
      zz_io_mcOut4 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut4 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l26_7 <= pkg_extract(a3,7);
  process(when_MixColumns_l26_7,a3)
  begin
    if when_MixColumns_l26_7 = '1' then
      zz_io_mcOut4_1 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut4_1 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  io_mcOut4 <= ((((pkg_extract(zz_io_mcOut4,7,0) xor a0) xor a1) xor a2) xor pkg_extract(zz_io_mcOut4_1,7,0));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AES is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_pt_valid : in std_logic;
    io_pt_ready : out std_logic;
    io_pt_payload : in std_logic_vector(31 downto 0);
    io_key_valid : in std_logic;
    io_key_ready : out std_logic;
    io_key_payload : in std_logic_vector(31 downto 0);
    io_ct_valid : out std_logic;
    io_ct_ready : in std_logic;
    io_ct_payload : out std_logic_vector(31 downto 0);
    io_done : out std_logic
  );
end AES;

architecture arch of AES is
  signal r_sbox_io_subBytesInput : std_logic_vector(7 downto 0);
  signal io_ct_valid_read_buffer : std_logic;
  signal r_addroundkey_io_b : std_logic_vector(7 downto 0);
  signal r_sbox_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut1 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut2 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut3 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut4 : std_logic_vector(7 downto 0);

  signal r_stateReg_0_0 : std_logic_vector(7 downto 0);
  signal r_stateReg_0_1 : std_logic_vector(7 downto 0);
  signal r_stateReg_0_2 : std_logic_vector(7 downto 0);
  signal r_stateReg_0_3 : std_logic_vector(7 downto 0);
  signal r_stateReg_1_0 : std_logic_vector(7 downto 0);
  signal r_stateReg_1_1 : std_logic_vector(7 downto 0);
  signal r_stateReg_1_2 : std_logic_vector(7 downto 0);
  signal r_stateReg_1_3 : std_logic_vector(7 downto 0);
  signal r_stateReg_2_0 : std_logic_vector(7 downto 0);
  signal r_stateReg_2_1 : std_logic_vector(7 downto 0);
  signal r_stateReg_2_2 : std_logic_vector(7 downto 0);
  signal r_stateReg_2_3 : std_logic_vector(7 downto 0);
  signal r_stateReg_3_0 : std_logic_vector(7 downto 0);
  signal r_stateReg_3_1 : std_logic_vector(7 downto 0);
  signal r_stateReg_3_2 : std_logic_vector(7 downto 0);
  signal r_stateReg_3_3 : std_logic_vector(7 downto 0);
  signal r_keyReg_0_0 : std_logic_vector(7 downto 0);
  signal r_keyReg_0_1 : std_logic_vector(7 downto 0);
  signal r_keyReg_0_2 : std_logic_vector(7 downto 0);
  signal r_keyReg_0_3 : std_logic_vector(7 downto 0);
  signal r_keyReg_1_0 : std_logic_vector(7 downto 0);
  signal r_keyReg_1_1 : std_logic_vector(7 downto 0);
  signal r_keyReg_1_2 : std_logic_vector(7 downto 0);
  signal r_keyReg_1_3 : std_logic_vector(7 downto 0);
  signal r_keyReg_2_0 : std_logic_vector(7 downto 0);
  signal r_keyReg_2_1 : std_logic_vector(7 downto 0);
  signal r_keyReg_2_2 : std_logic_vector(7 downto 0);
  signal r_keyReg_2_3 : std_logic_vector(7 downto 0);
  signal r_keyReg_3_0 : std_logic_vector(7 downto 0);
  signal r_keyReg_3_1 : std_logic_vector(7 downto 0);
  signal r_keyReg_3_2 : std_logic_vector(7 downto 0);
  signal r_keyReg_3_3 : std_logic_vector(7 downto 0);
  signal r_aesState : States2;
  signal r_round_willIncrement : std_logic;
  signal r_round_willClear : std_logic;
  signal r_round_valueNext : unsigned(3 downto 0);
  signal r_round_value : unsigned(3 downto 0);
  signal r_round_willOverflowIfInc : std_logic;
  signal r_round_willOverflow : std_logic;
  signal r_control_willIncrement : std_logic;
  signal r_control_willClear : std_logic;
  signal r_control_valueNext : unsigned(4 downto 0);
  signal r_control_value : unsigned(4 downto 0);
  signal r_control_willOverflowIfInc : std_logic;
  signal r_control_willOverflow : std_logic;
  signal r_roundConstant : std_logic_vector(7 downto 0);
  signal r_rc : std_logic_vector(7 downto 0);
  signal r_finalKeyAdd : std_logic;
  signal r_finalRound : std_logic;
  signal r_initialRotation : std_logic;
  signal r_stateRotation : std_logic;
  signal r_shiftRowsRotation : std_logic;
  signal r_mixColumnsRotation : std_logic;
  signal r_keyRotation : std_logic;
  signal r_finalRotation : std_logic;
  signal when_AES_l48 : std_logic;
  signal when_AES_l60 : std_logic;
  signal when_AES_l192 : std_logic;
  signal when_AES_l199 : std_logic;
  signal when_AES_l205 : std_logic;
  signal when_AES_l222 : std_logic;
  signal when_AES_l241 : std_logic;
  signal when_AES_l287 : std_logic;
  signal when_AES_l302 : std_logic;
  signal when_AES_l308 : std_logic;
  signal when_AES_l314 : std_logic;
  signal when_AES_l320 : std_logic;
  signal when_AES_l327 : std_logic;
  signal io_ct_fire : std_logic;
  signal when_AES_l348 : std_logic;
begin
  io_ct_valid <= io_ct_valid_read_buffer;
  r_addroundkey : entity work.AddRoundKey
    port map ( 
      io_a => r_stateReg_0_0,
      io_k => r_keyReg_0_0,
      io_b => r_addroundkey_io_b 
    );
  r_sbox : entity work.CanrightSBox
    port map ( 
      io_subBytesInput => r_sbox_io_subBytesInput,
      io_subBytesOutput => r_sbox_io_subBytesOutput,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_mixcolumns : entity work.MixColumns
    port map ( 
      io_mcIn1 => r_stateReg_0_0,
      io_mcIn2 => r_stateReg_1_0,
      io_mcIn3 => r_stateReg_2_0,
      io_mcIn4 => r_stateReg_3_0,
      io_mcOut1 => r_mixcolumns_io_mcOut1,
      io_mcOut2 => r_mixcolumns_io_mcOut2,
      io_mcOut3 => r_mixcolumns_io_mcOut3,
      io_mcOut4 => r_mixcolumns_io_mcOut4 
    );
  process(r_control_willOverflow)
  begin
    r_round_willIncrement <= pkg_toStdLogic(false);
    if r_control_willOverflow = '1' then
      r_round_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  process(r_aesState)
  begin
    r_round_willClear <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
        r_round_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  r_round_willOverflowIfInc <= pkg_toStdLogic(r_round_value = pkg_unsigned("1011"));
  r_round_willOverflow <= (r_round_willOverflowIfInc and r_round_willIncrement);
  process(r_round_willOverflow,r_round_value,r_round_willIncrement,r_round_willClear)
  begin
    if r_round_willOverflow = '1' then
      r_round_valueNext <= pkg_unsigned("0001");
    else
      r_round_valueNext <= (r_round_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_round_willIncrement)),4));
    end if;
    if r_round_willClear = '1' then
      r_round_valueNext <= pkg_unsigned("0001");
    end if;
  end process;

  process(r_aesState,io_ct_fire)
  begin
    r_control_willIncrement <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        r_control_willIncrement <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
        r_control_willIncrement <= pkg_toStdLogic(true);
      when others =>
        if io_ct_fire = '1' then
          r_control_willIncrement <= pkg_toStdLogic(true);
        end if;
    end case;
  end process;

  process(r_aesState,when_AES_l287,when_AES_l327)
  begin
    r_control_willClear <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
        r_control_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sInit =>
        if when_AES_l287 = '1' then
          r_control_willClear <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.sRound =>
        if when_AES_l327 = '1' then
          r_control_willClear <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  r_control_willOverflowIfInc <= pkg_toStdLogic(r_control_value = pkg_unsigned("10100"));
  r_control_willOverflow <= (r_control_willOverflowIfInc and r_control_willIncrement);
  process(r_control_willOverflow,r_control_value,r_control_willIncrement,r_control_willClear)
  begin
    if r_control_willOverflow = '1' then
      r_control_valueNext <= pkg_unsigned("00000");
    else
      r_control_valueNext <= (r_control_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_control_willIncrement)),5));
    end if;
    if r_control_willClear = '1' then
      r_control_valueNext <= pkg_unsigned("00000");
    end if;
  end process;

  when_AES_l48 <= pkg_toStdLogic(r_control_value < pkg_unsigned("10000"));
  process(when_AES_l48,r_addroundkey_io_b,r_keyReg_1_3)
  begin
    if when_AES_l48 = '1' then
      r_sbox_io_subBytesInput <= r_addroundkey_io_b;
    else
      r_sbox_io_subBytesInput <= r_keyReg_1_3;
    end if;
  end process;

  when_AES_l60 <= pkg_toStdLogic(r_control_value = pkg_unsigned("10001"));
  process(when_AES_l60,r_roundConstant)
  begin
    if when_AES_l60 = '1' then
      r_rc <= r_roundConstant;
    else
      r_rc <= pkg_stdLogicVector("00000000");
    end if;
  end process;

  when_AES_l192 <= pkg_toStdLogic(r_control_value < pkg_unsigned("01100"));
  when_AES_l199 <= pkg_toStdLogic(r_round_value = pkg_unsigned("0001"));
  when_AES_l205 <= ((pkg_toStdLogic(r_control_value = pkg_unsigned("10000")) and pkg_toStdLogic(r_aesState = pkg_enum.sRound)) and pkg_toStdLogic(pkg_unsigned("0001") < r_round_value));
  when_AES_l222 <= pkg_toStdLogic(pkg_unsigned("10001") <= r_control_value);
  process(r_aesState)
  begin
    io_pt_ready <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        io_pt_ready <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  process(r_aesState)
  begin
    io_key_ready <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        io_key_ready <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  process(r_aesState)
  begin
    io_ct_valid_read_buffer <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
      when others =>
        io_ct_valid_read_buffer <= pkg_toStdLogic(true);
    end case;
  end process;

  io_ct_payload <= pkg_cat(pkg_cat(pkg_cat(r_stateReg_0_0,r_stateReg_1_0),r_stateReg_2_0),r_stateReg_3_0);
  process(r_aesState,io_ct_fire,when_AES_l348)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
      when others =>
        if io_ct_fire = '1' then
          if when_AES_l348 = '1' then
            io_done <= pkg_toStdLogic(true);
          end if;
        end if;
    end case;
  end process;

  when_AES_l241 <= pkg_toStdLogic(unsigned(r_roundConstant) < pkg_unsigned("10000000"));
  process(r_aesState)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_initialRotation <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_initialRotation <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
        r_initialRotation <= pkg_toStdLogic(false);
      when others =>
        r_initialRotation <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_aesState,when_AES_l302)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_stateRotation <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_stateRotation <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        if when_AES_l302 = '1' then
          r_stateRotation <= pkg_toStdLogic(true);
        else
          r_stateRotation <= pkg_toStdLogic(false);
        end if;
      when others =>
        r_stateRotation <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_aesState,when_AES_l308)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_shiftRowsRotation <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_shiftRowsRotation <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        if when_AES_l308 = '1' then
          r_shiftRowsRotation <= pkg_toStdLogic(true);
        else
          r_shiftRowsRotation <= pkg_toStdLogic(false);
        end if;
      when others =>
        r_shiftRowsRotation <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_aesState,when_AES_l314)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_mixColumnsRotation <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_mixColumnsRotation <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        if when_AES_l314 = '1' then
          r_mixColumnsRotation <= pkg_toStdLogic(true);
        else
          r_mixColumnsRotation <= pkg_toStdLogic(false);
        end if;
      when others =>
        r_mixColumnsRotation <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_aesState,when_AES_l320)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_keyRotation <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_keyRotation <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        if when_AES_l320 = '1' then
          r_keyRotation <= pkg_toStdLogic(true);
        else
          r_keyRotation <= pkg_toStdLogic(false);
        end if;
      when others =>
        r_keyRotation <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_aesState)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_finalRotation <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_finalRotation <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        r_finalRotation <= pkg_toStdLogic(false);
      when others =>
        r_finalRotation <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_aesState,r_round_value)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_finalRound <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_finalRound <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        r_finalRound <= pkg_toStdLogic(r_round_value = pkg_unsigned("1010"));
      when others =>
        r_finalRound <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_aesState,r_round_value)
  begin
    case r_aesState is
      when pkg_enum.sIdle =>
        r_finalKeyAdd <= pkg_toStdLogic(false);
      when pkg_enum.sInit =>
        r_finalKeyAdd <= pkg_toStdLogic(false);
      when pkg_enum.sRound =>
        r_finalKeyAdd <= pkg_toStdLogic(r_round_value = pkg_unsigned("1011"));
      when others =>
        r_finalKeyAdd <= pkg_toStdLogic(false);
    end case;
  end process;

  when_AES_l287 <= pkg_toStdLogic(r_control_value = pkg_unsigned("00011"));
  when_AES_l302 <= pkg_toStdLogic(r_control_value < pkg_unsigned("10000"));
  when_AES_l308 <= pkg_toStdLogic(r_control_value = pkg_unsigned("10000"));
  when_AES_l314 <= pkg_toStdLogic(pkg_unsigned("10000") < r_control_value);
  when_AES_l320 <= pkg_toStdLogic(r_control_value < pkg_unsigned("10000"));
  when_AES_l327 <= (pkg_toStdLogic(r_round_value = pkg_unsigned("1011")) and pkg_toStdLogic(r_control_value = pkg_unsigned("01111")));
  io_ct_fire <= (io_ct_valid_read_buffer and io_ct_ready);
  when_AES_l348 <= pkg_toStdLogic(r_control_value = pkg_unsigned("00011"));
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_stateReg_0_0 <= pkg_stdLogicVector("00000000");
      r_stateReg_0_1 <= pkg_stdLogicVector("00000000");
      r_stateReg_0_2 <= pkg_stdLogicVector("00000000");
      r_stateReg_0_3 <= pkg_stdLogicVector("00000000");
      r_stateReg_1_0 <= pkg_stdLogicVector("00000000");
      r_stateReg_1_1 <= pkg_stdLogicVector("00000000");
      r_stateReg_1_2 <= pkg_stdLogicVector("00000000");
      r_stateReg_1_3 <= pkg_stdLogicVector("00000000");
      r_stateReg_2_0 <= pkg_stdLogicVector("00000000");
      r_stateReg_2_1 <= pkg_stdLogicVector("00000000");
      r_stateReg_2_2 <= pkg_stdLogicVector("00000000");
      r_stateReg_2_3 <= pkg_stdLogicVector("00000000");
      r_stateReg_3_0 <= pkg_stdLogicVector("00000000");
      r_stateReg_3_1 <= pkg_stdLogicVector("00000000");
      r_stateReg_3_2 <= pkg_stdLogicVector("00000000");
      r_stateReg_3_3 <= pkg_stdLogicVector("00000000");
      r_keyReg_0_0 <= pkg_stdLogicVector("00000000");
      r_keyReg_0_1 <= pkg_stdLogicVector("00000000");
      r_keyReg_0_2 <= pkg_stdLogicVector("00000000");
      r_keyReg_0_3 <= pkg_stdLogicVector("00000000");
      r_keyReg_1_0 <= pkg_stdLogicVector("00000000");
      r_keyReg_1_1 <= pkg_stdLogicVector("00000000");
      r_keyReg_1_2 <= pkg_stdLogicVector("00000000");
      r_keyReg_1_3 <= pkg_stdLogicVector("00000000");
      r_keyReg_2_0 <= pkg_stdLogicVector("00000000");
      r_keyReg_2_1 <= pkg_stdLogicVector("00000000");
      r_keyReg_2_2 <= pkg_stdLogicVector("00000000");
      r_keyReg_2_3 <= pkg_stdLogicVector("00000000");
      r_keyReg_3_0 <= pkg_stdLogicVector("00000000");
      r_keyReg_3_1 <= pkg_stdLogicVector("00000000");
      r_keyReg_3_2 <= pkg_stdLogicVector("00000000");
      r_keyReg_3_3 <= pkg_stdLogicVector("00000000");
      r_aesState <= pkg_enum.sIdle;
      r_round_value <= pkg_unsigned("0001");
      r_control_value <= pkg_unsigned("00000");
      r_roundConstant <= pkg_stdLogicVector("00000001");
    elsif rising_edge(io_clk) then
      r_round_value <= r_round_valueNext;
      r_control_value <= r_control_valueNext;
      if r_initialRotation = '1' then
        r_stateReg_0_0 <= r_stateReg_0_1;
        r_stateReg_0_1 <= r_stateReg_0_2;
        r_stateReg_0_2 <= r_stateReg_0_3;
        r_stateReg_0_3 <= pkg_extract(io_pt_payload,31,24);
        r_stateReg_1_0 <= r_stateReg_1_1;
        r_stateReg_1_1 <= r_stateReg_1_2;
        r_stateReg_1_2 <= r_stateReg_1_3;
        r_stateReg_1_3 <= pkg_extract(io_pt_payload,23,16);
        r_stateReg_2_0 <= r_stateReg_2_1;
        r_stateReg_2_1 <= r_stateReg_2_2;
        r_stateReg_2_2 <= r_stateReg_2_3;
        r_stateReg_2_3 <= pkg_extract(io_pt_payload,15,8);
        r_stateReg_3_0 <= r_stateReg_3_1;
        r_stateReg_3_1 <= r_stateReg_3_2;
        r_stateReg_3_2 <= r_stateReg_3_3;
        r_stateReg_3_3 <= pkg_extract(io_pt_payload,7,0);
        if r_finalRotation = '1' then
          r_stateReg_0_3 <= r_stateReg_0_0;
          r_stateReg_1_3 <= r_stateReg_1_0;
          r_stateReg_2_3 <= r_stateReg_2_0;
          r_stateReg_3_3 <= r_stateReg_3_0;
        end if;
      else
        if r_stateRotation = '1' then
          r_stateReg_0_0 <= r_stateReg_1_0;
          r_stateReg_1_0 <= r_stateReg_2_0;
          r_stateReg_2_0 <= r_stateReg_3_0;
          r_stateReg_3_0 <= r_stateReg_0_1;
          r_stateReg_0_1 <= r_stateReg_1_1;
          r_stateReg_1_1 <= r_stateReg_2_1;
          r_stateReg_2_1 <= r_stateReg_3_1;
          r_stateReg_3_1 <= r_stateReg_0_2;
          r_stateReg_0_2 <= r_stateReg_1_2;
          r_stateReg_1_2 <= r_stateReg_2_2;
          r_stateReg_2_2 <= r_stateReg_3_2;
          r_stateReg_3_2 <= r_stateReg_0_3;
          r_stateReg_0_3 <= r_stateReg_1_3;
          r_stateReg_1_3 <= r_stateReg_2_3;
          r_stateReg_2_3 <= r_stateReg_3_3;
          r_stateReg_3_3 <= r_sbox_io_subBytesOutput;
          if r_finalKeyAdd = '1' then
            r_stateReg_3_3 <= r_addroundkey_io_b;
          end if;
        else
          if r_shiftRowsRotation = '1' then
            r_stateReg_0_0 <= r_stateReg_0_0;
            r_stateReg_0_1 <= r_stateReg_0_1;
            r_stateReg_0_2 <= r_stateReg_0_2;
            r_stateReg_0_3 <= r_stateReg_0_3;
            r_stateReg_1_0 <= r_stateReg_1_1;
            r_stateReg_1_1 <= r_stateReg_1_2;
            r_stateReg_1_2 <= r_stateReg_1_3;
            r_stateReg_1_3 <= r_stateReg_1_0;
            r_stateReg_2_0 <= r_stateReg_2_2;
            r_stateReg_2_1 <= r_stateReg_2_3;
            r_stateReg_2_2 <= r_stateReg_2_0;
            r_stateReg_2_3 <= r_stateReg_2_1;
            r_stateReg_3_0 <= r_stateReg_3_3;
            r_stateReg_3_1 <= r_stateReg_3_0;
            r_stateReg_3_2 <= r_stateReg_3_1;
            r_stateReg_3_3 <= r_stateReg_3_2;
          else
            if r_mixColumnsRotation = '1' then
              r_stateReg_0_0 <= r_stateReg_0_1;
              r_stateReg_1_0 <= r_stateReg_1_1;
              r_stateReg_2_0 <= r_stateReg_2_1;
              r_stateReg_3_0 <= r_stateReg_3_1;
              r_stateReg_0_1 <= r_stateReg_0_2;
              r_stateReg_1_1 <= r_stateReg_1_2;
              r_stateReg_2_1 <= r_stateReg_2_2;
              r_stateReg_3_1 <= r_stateReg_3_2;
              r_stateReg_0_2 <= r_stateReg_0_3;
              r_stateReg_1_2 <= r_stateReg_1_3;
              r_stateReg_2_2 <= r_stateReg_2_3;
              r_stateReg_3_2 <= r_stateReg_3_3;
              r_stateReg_0_3 <= r_mixcolumns_io_mcOut1;
              r_stateReg_1_3 <= r_mixcolumns_io_mcOut2;
              r_stateReg_2_3 <= r_mixcolumns_io_mcOut3;
              r_stateReg_3_3 <= r_mixcolumns_io_mcOut4;
              if r_finalRound = '1' then
                r_stateReg_0_3 <= r_stateReg_0_0;
                r_stateReg_1_3 <= r_stateReg_1_0;
                r_stateReg_2_3 <= r_stateReg_2_0;
                r_stateReg_3_3 <= r_stateReg_3_0;
              end if;
            end if;
          end if;
        end if;
      end if;
      if r_initialRotation = '1' then
        r_keyReg_0_0 <= r_keyReg_0_1;
        r_keyReg_0_1 <= r_keyReg_0_2;
        r_keyReg_0_2 <= r_keyReg_0_3;
        r_keyReg_0_3 <= pkg_extract(io_key_payload,31,24);
        r_keyReg_1_0 <= r_keyReg_1_1;
        r_keyReg_1_1 <= r_keyReg_1_2;
        r_keyReg_1_2 <= r_keyReg_1_3;
        r_keyReg_1_3 <= pkg_extract(io_key_payload,23,16);
        r_keyReg_2_0 <= r_keyReg_2_1;
        r_keyReg_2_1 <= r_keyReg_2_2;
        r_keyReg_2_2 <= r_keyReg_2_3;
        r_keyReg_2_3 <= pkg_extract(io_key_payload,15,8);
        r_keyReg_3_0 <= r_keyReg_3_1;
        r_keyReg_3_1 <= r_keyReg_3_2;
        r_keyReg_3_2 <= r_keyReg_3_3;
        r_keyReg_3_3 <= pkg_extract(io_key_payload,7,0);
      else
        if r_keyRotation = '1' then
          r_keyReg_0_0 <= r_keyReg_1_0;
          r_keyReg_1_0 <= r_keyReg_2_0;
          r_keyReg_2_0 <= r_keyReg_3_0;
          r_keyReg_0_1 <= r_keyReg_1_1;
          r_keyReg_1_1 <= r_keyReg_2_1;
          r_keyReg_2_1 <= r_keyReg_3_1;
          r_keyReg_0_2 <= r_keyReg_1_2;
          r_keyReg_1_2 <= r_keyReg_2_2;
          r_keyReg_2_2 <= r_keyReg_3_2;
          r_keyReg_0_3 <= r_keyReg_1_3;
          r_keyReg_1_3 <= r_keyReg_2_3;
          r_keyReg_2_3 <= r_keyReg_3_3;
          r_keyReg_3_0 <= r_keyReg_0_0;
          r_keyReg_3_1 <= r_keyReg_0_1;
          r_keyReg_3_2 <= r_keyReg_0_2;
          r_keyReg_3_3 <= r_keyReg_0_3;
          if when_AES_l192 = '1' then
            r_keyReg_3_0 <= (r_keyReg_0_0 xor r_keyReg_0_1);
            r_keyReg_3_1 <= r_keyReg_0_2;
            r_keyReg_3_2 <= r_keyReg_0_3;
            r_keyReg_3_3 <= r_keyReg_0_0;
          end if;
          if when_AES_l199 = '1' then
            r_keyReg_3_0 <= r_keyReg_0_1;
            r_keyReg_3_1 <= r_keyReg_0_2;
            r_keyReg_3_2 <= r_keyReg_0_3;
            r_keyReg_3_3 <= r_keyReg_0_0;
          end if;
        else
          if when_AES_l205 = '1' then
            r_keyReg_0_0 <= r_keyReg_0_1;
            r_keyReg_0_1 <= r_keyReg_0_2;
            r_keyReg_0_2 <= r_keyReg_0_3;
            r_keyReg_0_3 <= r_keyReg_0_0;
            r_keyReg_1_0 <= r_keyReg_1_1;
            r_keyReg_1_1 <= r_keyReg_1_2;
            r_keyReg_1_2 <= r_keyReg_1_3;
            r_keyReg_1_3 <= r_keyReg_1_0;
            r_keyReg_2_0 <= r_keyReg_2_1;
            r_keyReg_2_1 <= r_keyReg_2_2;
            r_keyReg_2_2 <= r_keyReg_2_3;
            r_keyReg_2_3 <= r_keyReg_2_0;
            r_keyReg_3_0 <= r_keyReg_3_1;
            r_keyReg_3_1 <= r_keyReg_3_2;
            r_keyReg_3_2 <= r_keyReg_3_3;
            r_keyReg_3_3 <= r_keyReg_3_0;
          else
            if when_AES_l222 = '1' then
              r_keyReg_0_0 <= r_keyReg_1_0;
              r_keyReg_1_0 <= r_keyReg_2_0;
              r_keyReg_2_0 <= r_keyReg_3_0;
              r_keyReg_3_0 <= ((r_sbox_io_subBytesOutput xor r_keyReg_0_0) xor r_rc);
              r_keyReg_1_3 <= r_keyReg_2_3;
              r_keyReg_2_3 <= r_keyReg_3_3;
              r_keyReg_3_3 <= r_keyReg_0_3;
              r_keyReg_0_3 <= r_keyReg_1_3;
            end if;
          end if;
        end if;
      end if;
      if r_control_willOverflow = '1' then
        if when_AES_l241 = '1' then
          r_roundConstant <= std_logic_vector(shift_left(unsigned(r_roundConstant),1));
        else
          r_roundConstant <= (std_logic_vector(shift_left(unsigned(r_roundConstant),1)) xor pkg_stdLogicVector("00011011"));
        end if;
      end if;
      case r_aesState is
        when pkg_enum.sIdle =>
          r_aesState <= pkg_enum.sIdle;
          r_stateReg_0_0 <= pkg_stdLogicVector("00000000");
          r_stateReg_0_1 <= pkg_stdLogicVector("00000000");
          r_stateReg_0_2 <= pkg_stdLogicVector("00000000");
          r_stateReg_0_3 <= pkg_stdLogicVector("00000000");
          r_stateReg_1_0 <= pkg_stdLogicVector("00000000");
          r_stateReg_1_1 <= pkg_stdLogicVector("00000000");
          r_stateReg_1_2 <= pkg_stdLogicVector("00000000");
          r_stateReg_1_3 <= pkg_stdLogicVector("00000000");
          r_stateReg_2_0 <= pkg_stdLogicVector("00000000");
          r_stateReg_2_1 <= pkg_stdLogicVector("00000000");
          r_stateReg_2_2 <= pkg_stdLogicVector("00000000");
          r_stateReg_2_3 <= pkg_stdLogicVector("00000000");
          r_stateReg_3_0 <= pkg_stdLogicVector("00000000");
          r_stateReg_3_1 <= pkg_stdLogicVector("00000000");
          r_stateReg_3_2 <= pkg_stdLogicVector("00000000");
          r_stateReg_3_3 <= pkg_stdLogicVector("00000000");
          r_keyReg_0_0 <= pkg_stdLogicVector("00000000");
          r_keyReg_0_1 <= pkg_stdLogicVector("00000000");
          r_keyReg_0_2 <= pkg_stdLogicVector("00000000");
          r_keyReg_0_3 <= pkg_stdLogicVector("00000000");
          r_keyReg_1_0 <= pkg_stdLogicVector("00000000");
          r_keyReg_1_1 <= pkg_stdLogicVector("00000000");
          r_keyReg_1_2 <= pkg_stdLogicVector("00000000");
          r_keyReg_1_3 <= pkg_stdLogicVector("00000000");
          r_keyReg_2_0 <= pkg_stdLogicVector("00000000");
          r_keyReg_2_1 <= pkg_stdLogicVector("00000000");
          r_keyReg_2_2 <= pkg_stdLogicVector("00000000");
          r_keyReg_2_3 <= pkg_stdLogicVector("00000000");
          r_keyReg_3_0 <= pkg_stdLogicVector("00000000");
          r_keyReg_3_1 <= pkg_stdLogicVector("00000000");
          r_keyReg_3_2 <= pkg_stdLogicVector("00000000");
          r_keyReg_3_3 <= pkg_stdLogicVector("00000000");
          r_roundConstant <= pkg_stdLogicVector("00000001");
          if io_enable = '1' then
            r_aesState <= pkg_enum.sInit;
          end if;
        when pkg_enum.sInit =>
          r_aesState <= pkg_enum.sInit;
          if when_AES_l287 = '1' then
            r_aesState <= pkg_enum.sRound;
          end if;
        when pkg_enum.sRound =>
          r_aesState <= pkg_enum.sRound;
          if when_AES_l327 = '1' then
            r_aesState <= pkg_enum.sDone;
          end if;
        when others =>
          r_aesState <= pkg_enum.sDone;
          if io_ct_fire = '1' then
            if when_AES_l348 = '1' then
              r_aesState <= pkg_enum.sIdle;
            end if;
          end if;
      end case;
    end if;
  end process;

end arch;

