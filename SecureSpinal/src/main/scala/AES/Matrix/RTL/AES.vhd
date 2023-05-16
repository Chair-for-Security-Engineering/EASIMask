-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : AES
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type States is (sIdle,sExecute,sFinalRound,sDone);

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
      when "10" => return sFinalRound;
      when "11" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector is
  begin
    case value is
      when sIdle => return "00";
      when sExecute => return "01";
      when sFinalRound => return "10";
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


--G4Sq_4 replaced by G4Sq


--G4Sq_5 replaced by G4Sq


--G4ScaleN2_1 replaced by G4ScaleN2


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


--G4ScaleN_7 replaced by G4ScaleN


--G4Sq_6 replaced by G4Sq


--G4Sq_7 replaced by G4Sq


--G4Mul_21 replaced by G4Mul


--G4Mul_22 replaced by G4Mul


--G4Mul_23 replaced by G4Mul


--G4Sq_8 replaced by G4Sq


--G4Sq_9 replaced by G4Sq


--G4ScaleN2_2 replaced by G4ScaleN2


--G4Mul_24 replaced by G4Mul


--G4Mul_25 replaced by G4Mul


--G4Mul_26 replaced by G4Mul


--G4ScaleN_8 replaced by G4ScaleN


--G4Mul_27 replaced by G4Mul


--G4Mul_28 replaced by G4Mul


--G4Mul_29 replaced by G4Mul


--G4ScaleN_9 replaced by G4ScaleN


--G4Mul_30 replaced by G4Mul


--G4Mul_31 replaced by G4Mul


--G4Mul_32 replaced by G4Mul


--G4ScaleN_10 replaced by G4ScaleN


--G4ScaleN_11 replaced by G4ScaleN


--G4Sq_10 replaced by G4Sq


--G4Sq_11 replaced by G4Sq


--G4Mul_33 replaced by G4Mul


--G4Mul_34 replaced by G4Mul


--G4Mul_35 replaced by G4Mul


--G4Sq_12 replaced by G4Sq


--G4Sq_13 replaced by G4Sq


--G4ScaleN2_3 replaced by G4ScaleN2


--G4Mul_36 replaced by G4Mul


--G4Mul_37 replaced by G4Mul


--G4Mul_38 replaced by G4Mul


--G4ScaleN_12 replaced by G4ScaleN


--G4Mul_39 replaced by G4Mul


--G4Mul_40 replaced by G4Mul


--G4Mul_41 replaced by G4Mul


--G4ScaleN_13 replaced by G4ScaleN


--G4Mul_42 replaced by G4Mul


--G4Mul_43 replaced by G4Mul


--G4Mul_44 replaced by G4Mul


--G4ScaleN_14 replaced by G4ScaleN


--G4ScaleN_15 replaced by G4ScaleN


--G4Sq_14 replaced by G4Sq


--G4Sq_15 replaced by G4Sq


--G4Mul_45 replaced by G4Mul


--G4Mul_46 replaced by G4Mul


--G4Mul_47 replaced by G4Mul

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


--G16SqSc_1 replaced by G16SqSc


--G16Mul_3 replaced by G16Mul


--G16Mul_4 replaced by G16Mul


--G16Mul_5 replaced by G16Mul


--G16Inv_1 replaced by G16Inv


--G16SqSc_2 replaced by G16SqSc


--G16Mul_6 replaced by G16Mul


--G16Mul_7 replaced by G16Mul


--G16Mul_8 replaced by G16Mul


--G16Inv_2 replaced by G16Inv


--G16SqSc_3 replaced by G16SqSc


--G16Mul_9 replaced by G16Mul


--G16Mul_10 replaced by G16Mul


--G16Mul_11 replaced by G16Mul


--G16Inv_3 replaced by G16Inv

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
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end NewBasis;

architecture arch of NewBasis is

  signal dummy : std_logic;
  signal a : std_logic_vector(7 downto 0);
  signal b : std_logic_vector(7 downto 0);
  signal c : std_logic_vector(7 downto 0);
  signal when_NewBasis_l35 : std_logic;
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

  when_NewBasis_l35 <= (not io_direction);
  process(when_NewBasis_l35,b,c)
  begin
    if when_NewBasis_l35 = '1' then
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


--NewBasis_2 replaced by NewBasis


--NewBasis_3 replaced by NewBasis


--G256Inv_1 replaced by G256Inv


--NewBasis_4 replaced by NewBasis


--NewBasis_5 replaced by NewBasis


--G256Inv_2 replaced by G256Inv


--NewBasis_6 replaced by NewBasis


--NewBasis_7 replaced by NewBasis


--G256Inv_3 replaced by G256Inv

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AddRoundKey is
  port(
    io_stateIn_0 : in std_logic_vector(7 downto 0);
    io_stateIn_1 : in std_logic_vector(7 downto 0);
    io_stateIn_2 : in std_logic_vector(7 downto 0);
    io_stateIn_3 : in std_logic_vector(7 downto 0);
    io_key_0 : in std_logic_vector(7 downto 0);
    io_key_1 : in std_logic_vector(7 downto 0);
    io_key_2 : in std_logic_vector(7 downto 0);
    io_key_3 : in std_logic_vector(7 downto 0);
    io_stateOut_0 : out std_logic_vector(7 downto 0);
    io_stateOut_1 : out std_logic_vector(7 downto 0);
    io_stateOut_2 : out std_logic_vector(7 downto 0);
    io_stateOut_3 : out std_logic_vector(7 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_stateOut_0 <= (io_stateIn_0 xor io_key_0);
  io_stateOut_1 <= (io_stateIn_1 xor io_key_1);
  io_stateOut_2 <= (io_stateIn_2 xor io_key_2);
  io_stateOut_3 <= (io_stateIn_3 xor io_key_3);
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
      io_output => convertBasis1_io_output,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  convertBasis2 : entity work.NewBasis
    port map ( 
      io_input => x,
      io_direction => pkg_toStdLogic(true),
      io_output => convertBasis2_io_output,
      io_clk => io_clk,
      io_reset => io_reset 
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


--CanrightSBox_1 replaced by CanrightSBox


--CanrightSBox_2 replaced by CanrightSBox


--CanrightSBox_3 replaced by CanrightSBox

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumns is
  port(
    io_mcIn_0 : in std_logic_vector(7 downto 0);
    io_mcIn_1 : in std_logic_vector(7 downto 0);
    io_mcIn_2 : in std_logic_vector(7 downto 0);
    io_mcIn_3 : in std_logic_vector(7 downto 0);
    io_mcOut_0 : out std_logic_vector(7 downto 0);
    io_mcOut_1 : out std_logic_vector(7 downto 0);
    io_mcOut_2 : out std_logic_vector(7 downto 0);
    io_mcOut_3 : out std_logic_vector(7 downto 0)
  );
end MixColumns;

architecture arch of MixColumns is

  signal a1 : std_logic_vector(7 downto 0);
  signal a2 : std_logic_vector(7 downto 0);
  signal a3 : std_logic_vector(7 downto 0);
  signal a0 : std_logic_vector(7 downto 0);
  signal zz_io_mcOut_0 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20 : std_logic;
  signal zz_io_mcOut_0_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_1 : std_logic;
  signal zz_io_mcOut_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_2 : std_logic;
  signal zz_io_mcOut_1_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_3 : std_logic;
  signal zz_io_mcOut_2 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_4 : std_logic;
  signal zz_io_mcOut_2_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_5 : std_logic;
  signal zz_io_mcOut_3 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_6 : std_logic;
  signal zz_io_mcOut_3_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_7 : std_logic;
begin
  a0 <= io_mcIn_0;
  a1 <= io_mcIn_1;
  a2 <= io_mcIn_2;
  a3 <= io_mcIn_3;
  when_MixColumns_l20 <= pkg_extract(a0,7);
  process(when_MixColumns_l20,a0)
  begin
    if when_MixColumns_l20 = '1' then
      zz_io_mcOut_0 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_0 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l20_1 <= pkg_extract(a1,7);
  process(when_MixColumns_l20_1,a1)
  begin
    if when_MixColumns_l20_1 = '1' then
      zz_io_mcOut_0_1 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_0_1 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  io_mcOut_0 <= (((pkg_extract(zz_io_mcOut_0,7,0) xor (pkg_extract(zz_io_mcOut_0_1,7,0) xor a1)) xor a2) xor a3);
  when_MixColumns_l20_2 <= pkg_extract(a1,7);
  process(when_MixColumns_l20_2,a1)
  begin
    if when_MixColumns_l20_2 = '1' then
      zz_io_mcOut_1 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_1 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  when_MixColumns_l20_3 <= pkg_extract(a2,7);
  process(when_MixColumns_l20_3,a2)
  begin
    if when_MixColumns_l20_3 = '1' then
      zz_io_mcOut_1_1 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_1_1 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  io_mcOut_1 <= (((a0 xor pkg_extract(zz_io_mcOut_1,7,0)) xor (pkg_extract(zz_io_mcOut_1_1,7,0) xor a2)) xor a3);
  when_MixColumns_l20_4 <= pkg_extract(a2,7);
  process(when_MixColumns_l20_4,a2)
  begin
    if when_MixColumns_l20_4 = '1' then
      zz_io_mcOut_2 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_2 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l20_5 <= pkg_extract(a3,7);
  process(when_MixColumns_l20_5,a3)
  begin
    if when_MixColumns_l20_5 = '1' then
      zz_io_mcOut_2_1 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_2_1 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  io_mcOut_2 <= (((a0 xor a1) xor pkg_extract(zz_io_mcOut_2,7,0)) xor (pkg_extract(zz_io_mcOut_2_1,7,0) xor a3));
  when_MixColumns_l20_6 <= pkg_extract(a0,7);
  process(when_MixColumns_l20_6,a0)
  begin
    if when_MixColumns_l20_6 = '1' then
      zz_io_mcOut_3 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_3 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l20_7 <= pkg_extract(a3,7);
  process(when_MixColumns_l20_7,a3)
  begin
    if when_MixColumns_l20_7 = '1' then
      zz_io_mcOut_3_1 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mcOut_3_1 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  io_mcOut_3 <= ((((pkg_extract(zz_io_mcOut_3,7,0) xor a0) xor a1) xor a2) xor pkg_extract(zz_io_mcOut_3_1,7,0));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity ShiftRows is
  port(
    io_srIn_0_0 : in std_logic_vector(7 downto 0);
    io_srIn_0_1 : in std_logic_vector(7 downto 0);
    io_srIn_0_2 : in std_logic_vector(7 downto 0);
    io_srIn_0_3 : in std_logic_vector(7 downto 0);
    io_srIn_1_0 : in std_logic_vector(7 downto 0);
    io_srIn_1_1 : in std_logic_vector(7 downto 0);
    io_srIn_1_2 : in std_logic_vector(7 downto 0);
    io_srIn_1_3 : in std_logic_vector(7 downto 0);
    io_srIn_2_0 : in std_logic_vector(7 downto 0);
    io_srIn_2_1 : in std_logic_vector(7 downto 0);
    io_srIn_2_2 : in std_logic_vector(7 downto 0);
    io_srIn_2_3 : in std_logic_vector(7 downto 0);
    io_srIn_3_0 : in std_logic_vector(7 downto 0);
    io_srIn_3_1 : in std_logic_vector(7 downto 0);
    io_srIn_3_2 : in std_logic_vector(7 downto 0);
    io_srIn_3_3 : in std_logic_vector(7 downto 0);
    io_srOut_0_0 : out std_logic_vector(7 downto 0);
    io_srOut_0_1 : out std_logic_vector(7 downto 0);
    io_srOut_0_2 : out std_logic_vector(7 downto 0);
    io_srOut_0_3 : out std_logic_vector(7 downto 0);
    io_srOut_1_0 : out std_logic_vector(7 downto 0);
    io_srOut_1_1 : out std_logic_vector(7 downto 0);
    io_srOut_1_2 : out std_logic_vector(7 downto 0);
    io_srOut_1_3 : out std_logic_vector(7 downto 0);
    io_srOut_2_0 : out std_logic_vector(7 downto 0);
    io_srOut_2_1 : out std_logic_vector(7 downto 0);
    io_srOut_2_2 : out std_logic_vector(7 downto 0);
    io_srOut_2_3 : out std_logic_vector(7 downto 0);
    io_srOut_3_0 : out std_logic_vector(7 downto 0);
    io_srOut_3_1 : out std_logic_vector(7 downto 0);
    io_srOut_3_2 : out std_logic_vector(7 downto 0);
    io_srOut_3_3 : out std_logic_vector(7 downto 0)
  );
end ShiftRows;

architecture arch of ShiftRows is

begin
  io_srOut_0_0 <= io_srIn_0_0;
  io_srOut_0_1 <= io_srIn_0_1;
  io_srOut_0_2 <= io_srIn_0_2;
  io_srOut_0_3 <= io_srIn_0_3;
  io_srOut_1_0 <= io_srIn_1_1;
  io_srOut_1_1 <= io_srIn_1_2;
  io_srOut_1_2 <= io_srIn_1_3;
  io_srOut_1_3 <= io_srIn_1_0;
  io_srOut_2_0 <= io_srIn_2_2;
  io_srOut_2_1 <= io_srIn_2_3;
  io_srOut_2_2 <= io_srIn_2_0;
  io_srOut_2_3 <= io_srIn_2_1;
  io_srOut_3_0 <= io_srIn_3_3;
  io_srOut_3_1 <= io_srIn_3_0;
  io_srOut_3_2 <= io_srIn_3_1;
  io_srOut_3_3 <= io_srIn_3_2;
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
    io_plaintext : in std_logic_vector(127 downto 0);
    io_key : in std_logic_vector(127 downto 0);
    io_ciphertext : out std_logic_vector(127 downto 0);
    io_done : out std_logic
  );
end AES;

architecture arch of AES is
  signal r_addroundkey_io_stateIn_0 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateIn_1 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateIn_2 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateIn_3 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_key_0 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_key_1 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_key_2 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_key_3 : std_logic_vector(7 downto 0);
  signal r_sbox1_io_subBytesInput : std_logic_vector(7 downto 0);
  signal r_sbox2_io_subBytesInput : std_logic_vector(7 downto 0);
  signal r_sbox3_io_subBytesInput : std_logic_vector(7 downto 0);
  signal r_sbox4_io_subBytesInput : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcIn_0 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcIn_1 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcIn_2 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcIn_3 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateOut_0 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateOut_1 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateOut_2 : std_logic_vector(7 downto 0);
  signal r_addroundkey_io_stateOut_3 : std_logic_vector(7 downto 0);
  signal r_sbox1_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal r_sbox2_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal r_sbox3_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal r_sbox4_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut_0 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut_1 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut_2 : std_logic_vector(7 downto 0);
  signal r_mixcolumns_io_mcOut_3 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_0_0 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_0_1 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_0_2 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_0_3 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_1_0 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_1_1 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_1_2 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_1_3 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_2_0 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_2_1 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_2_2 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_2_3 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_3_0 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_3_1 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_3_2 : std_logic_vector(7 downto 0);
  signal r_shiftrows_io_srOut_3_3 : std_logic_vector(7 downto 0);

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
  signal r_roundCounter_willIncrement : std_logic;
  signal r_roundCounter_willClear : std_logic;
  signal r_roundCounter_valueNext : unsigned(3 downto 0);
  signal r_roundCounter_value : unsigned(3 downto 0);
  signal r_roundCounter_willOverflowIfInc : std_logic;
  signal r_roundCounter_willOverflow : std_logic;
  signal r_smallCounter_willIncrement : std_logic;
  signal r_smallCounter_willClear : std_logic;
  signal r_smallCounter_valueNext : unsigned(2 downto 0);
  signal r_smallCounter_value : unsigned(2 downto 0);
  signal r_smallCounter_willOverflowIfInc : std_logic;
  signal r_smallCounter_willOverflow : std_logic;
  signal r_roundConstant : std_logic_vector(7 downto 0);
  signal r_w0_0 : std_logic_vector(7 downto 0);
  signal r_w0_1 : std_logic_vector(7 downto 0);
  signal r_w0_2 : std_logic_vector(7 downto 0);
  signal r_w0_3 : std_logic_vector(7 downto 0);
  signal r_w1_0 : std_logic_vector(7 downto 0);
  signal r_w1_1 : std_logic_vector(7 downto 0);
  signal r_w1_2 : std_logic_vector(7 downto 0);
  signal r_w1_3 : std_logic_vector(7 downto 0);
  signal r_w2_0 : std_logic_vector(7 downto 0);
  signal r_w2_1 : std_logic_vector(7 downto 0);
  signal r_w2_2 : std_logic_vector(7 downto 0);
  signal r_w2_3 : std_logic_vector(7 downto 0);
  signal r_w3_0 : std_logic_vector(7 downto 0);
  signal r_w3_1 : std_logic_vector(7 downto 0);
  signal r_w3_2 : std_logic_vector(7 downto 0);
  signal r_w3_3 : std_logic_vector(7 downto 0);
  signal r_sboxOut_0 : std_logic_vector(7 downto 0);
  signal r_sboxOut_1 : std_logic_vector(7 downto 0);
  signal r_sboxOut_2 : std_logic_vector(7 downto 0);
  signal r_sboxOut_3 : std_logic_vector(7 downto 0);
  signal r_aesState : States;
  signal when_AES_l49 : std_logic;
  signal when_AES_l57 : std_logic;
  signal when_AES_l62 : std_logic;
  signal when_AES_l81 : std_logic;
  signal when_AES_l86 : std_logic;
  signal when_AES_l105 : std_logic;
  signal when_AES_l110 : std_logic;
  signal when_AES_l129 : std_logic;
  signal when_AES_l134 : std_logic;
  signal when_AES_l73 : std_logic;
  signal when_AES_l97 : std_logic;
  signal when_AES_l121 : std_logic;
  signal zz_io_ciphertext : std_logic_vector(127 downto 0);
  signal when_AES_l180 : std_logic;
  signal when_AES_l206 : std_logic;
begin
  r_addroundkey : entity work.AddRoundKey
    port map ( 
      io_stateIn_0 => r_addroundkey_io_stateIn_0,
      io_stateIn_1 => r_addroundkey_io_stateIn_1,
      io_stateIn_2 => r_addroundkey_io_stateIn_2,
      io_stateIn_3 => r_addroundkey_io_stateIn_3,
      io_key_0 => r_addroundkey_io_key_0,
      io_key_1 => r_addroundkey_io_key_1,
      io_key_2 => r_addroundkey_io_key_2,
      io_key_3 => r_addroundkey_io_key_3,
      io_stateOut_0 => r_addroundkey_io_stateOut_0,
      io_stateOut_1 => r_addroundkey_io_stateOut_1,
      io_stateOut_2 => r_addroundkey_io_stateOut_2,
      io_stateOut_3 => r_addroundkey_io_stateOut_3 
    );
  r_sbox1 : entity work.CanrightSBox
    port map ( 
      io_subBytesInput => r_sbox1_io_subBytesInput,
      io_subBytesOutput => r_sbox1_io_subBytesOutput,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_sbox2 : entity work.CanrightSBox
    port map ( 
      io_subBytesInput => r_sbox2_io_subBytesInput,
      io_subBytesOutput => r_sbox2_io_subBytesOutput,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_sbox3 : entity work.CanrightSBox
    port map ( 
      io_subBytesInput => r_sbox3_io_subBytesInput,
      io_subBytesOutput => r_sbox3_io_subBytesOutput,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_sbox4 : entity work.CanrightSBox
    port map ( 
      io_subBytesInput => r_sbox4_io_subBytesInput,
      io_subBytesOutput => r_sbox4_io_subBytesOutput,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_mixcolumns : entity work.MixColumns
    port map ( 
      io_mcIn_0 => r_mixcolumns_io_mcIn_0,
      io_mcIn_1 => r_mixcolumns_io_mcIn_1,
      io_mcIn_2 => r_mixcolumns_io_mcIn_2,
      io_mcIn_3 => r_mixcolumns_io_mcIn_3,
      io_mcOut_0 => r_mixcolumns_io_mcOut_0,
      io_mcOut_1 => r_mixcolumns_io_mcOut_1,
      io_mcOut_2 => r_mixcolumns_io_mcOut_2,
      io_mcOut_3 => r_mixcolumns_io_mcOut_3 
    );
  r_shiftrows : entity work.ShiftRows
    port map ( 
      io_srIn_0_0 => r_stateReg_0_0,
      io_srIn_0_1 => r_stateReg_0_1,
      io_srIn_0_2 => r_stateReg_0_2,
      io_srIn_0_3 => r_stateReg_0_3,
      io_srIn_1_0 => r_stateReg_1_0,
      io_srIn_1_1 => r_stateReg_1_1,
      io_srIn_1_2 => r_stateReg_1_2,
      io_srIn_1_3 => r_stateReg_1_3,
      io_srIn_2_0 => r_stateReg_2_0,
      io_srIn_2_1 => r_stateReg_2_1,
      io_srIn_2_2 => r_stateReg_2_2,
      io_srIn_2_3 => r_stateReg_2_3,
      io_srIn_3_0 => r_stateReg_3_0,
      io_srIn_3_1 => r_stateReg_3_1,
      io_srIn_3_2 => r_stateReg_3_2,
      io_srIn_3_3 => r_stateReg_3_3,
      io_srOut_0_0 => r_shiftrows_io_srOut_0_0,
      io_srOut_0_1 => r_shiftrows_io_srOut_0_1,
      io_srOut_0_2 => r_shiftrows_io_srOut_0_2,
      io_srOut_0_3 => r_shiftrows_io_srOut_0_3,
      io_srOut_1_0 => r_shiftrows_io_srOut_1_0,
      io_srOut_1_1 => r_shiftrows_io_srOut_1_1,
      io_srOut_1_2 => r_shiftrows_io_srOut_1_2,
      io_srOut_1_3 => r_shiftrows_io_srOut_1_3,
      io_srOut_2_0 => r_shiftrows_io_srOut_2_0,
      io_srOut_2_1 => r_shiftrows_io_srOut_2_1,
      io_srOut_2_2 => r_shiftrows_io_srOut_2_2,
      io_srOut_2_3 => r_shiftrows_io_srOut_2_3,
      io_srOut_3_0 => r_shiftrows_io_srOut_3_0,
      io_srOut_3_1 => r_shiftrows_io_srOut_3_1,
      io_srOut_3_2 => r_shiftrows_io_srOut_3_2,
      io_srOut_3_3 => r_shiftrows_io_srOut_3_3 
    );
  process(r_aesState,when_AES_l206)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when pkg_enum.sFinalRound =>
      when others =>
        if when_AES_l206 = '1' then
          io_done <= pkg_toStdLogic(true);
        end if;
    end case;
  end process;

  process(r_aesState,r_smallCounter_willOverflow)
  begin
    r_roundCounter_willIncrement <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        if r_smallCounter_willOverflow = '1' then
          r_roundCounter_willIncrement <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.sFinalRound =>
      when others =>
    end case;
  end process;

  process(r_aesState)
  begin
    r_roundCounter_willClear <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
        r_roundCounter_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when pkg_enum.sFinalRound =>
      when others =>
    end case;
  end process;

  r_roundCounter_willOverflowIfInc <= pkg_toStdLogic(r_roundCounter_value = pkg_unsigned("1001"));
  r_roundCounter_willOverflow <= (r_roundCounter_willOverflowIfInc and r_roundCounter_willIncrement);
  process(r_roundCounter_willOverflow,r_roundCounter_value,r_roundCounter_willIncrement,r_roundCounter_willClear)
  begin
    if r_roundCounter_willOverflow = '1' then
      r_roundCounter_valueNext <= pkg_unsigned("0001");
    else
      r_roundCounter_valueNext <= (r_roundCounter_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_roundCounter_willIncrement)),4));
    end if;
    if r_roundCounter_willClear = '1' then
      r_roundCounter_valueNext <= pkg_unsigned("0001");
    end if;
  end process;

  process(r_aesState)
  begin
    r_smallCounter_willIncrement <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        r_smallCounter_willIncrement <= pkg_toStdLogic(true);
      when pkg_enum.sFinalRound =>
        r_smallCounter_willIncrement <= pkg_toStdLogic(true);
      when others =>
        r_smallCounter_willIncrement <= pkg_toStdLogic(true);
    end case;
  end process;

  r_smallCounter_willClear <= pkg_toStdLogic(false);
  r_smallCounter_willOverflowIfInc <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("100"));
  r_smallCounter_willOverflow <= (r_smallCounter_willOverflowIfInc and r_smallCounter_willIncrement);
  process(r_smallCounter_willOverflow,r_smallCounter_value,r_smallCounter_willIncrement,r_smallCounter_willClear)
  begin
    if r_smallCounter_willOverflow = '1' then
      r_smallCounter_valueNext <= pkg_unsigned("000");
    else
      r_smallCounter_valueNext <= (r_smallCounter_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_smallCounter_willIncrement)),3));
    end if;
    if r_smallCounter_willClear = '1' then
      r_smallCounter_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  r_w0_0 <= ((r_keyReg_0_0 xor r_sboxOut_1) xor r_roundConstant);
  r_w1_0 <= (r_keyReg_0_1 xor r_w0_0);
  r_w2_0 <= (r_keyReg_0_2 xor r_w1_0);
  r_w3_0 <= (r_keyReg_0_3 xor r_w2_0);
  r_w0_1 <= ((r_keyReg_1_0 xor r_sboxOut_2) xor pkg_stdLogicVector("00000000"));
  r_w1_1 <= (r_keyReg_1_1 xor r_w0_1);
  r_w2_1 <= (r_keyReg_1_2 xor r_w1_1);
  r_w3_1 <= (r_keyReg_1_3 xor r_w2_1);
  r_w0_2 <= ((r_keyReg_2_0 xor r_sboxOut_3) xor pkg_stdLogicVector("00000000"));
  r_w1_2 <= (r_keyReg_2_1 xor r_w0_2);
  r_w2_2 <= (r_keyReg_2_2 xor r_w1_2);
  r_w3_2 <= (r_keyReg_2_3 xor r_w2_2);
  r_w0_3 <= ((r_keyReg_3_0 xor r_sboxOut_0) xor pkg_stdLogicVector("00000000"));
  r_w1_3 <= (r_keyReg_3_1 xor r_w0_3);
  r_w2_3 <= (r_keyReg_3_2 xor r_w1_3);
  r_w3_3 <= (r_keyReg_3_3 xor r_w2_3);
  r_sboxOut_0 <= r_sbox1_io_subBytesOutput;
  r_sboxOut_1 <= r_sbox2_io_subBytesOutput;
  r_sboxOut_2 <= r_sbox3_io_subBytesOutput;
  r_sboxOut_3 <= r_sbox4_io_subBytesOutput;
  when_AES_l49 <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("000"));
  process(when_AES_l49,r_stateReg_0_0,when_AES_l73,r_stateReg_0_1,when_AES_l97,r_stateReg_0_2,when_AES_l121,r_stateReg_0_3)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_stateIn_0 <= r_stateReg_0_0;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_stateIn_0 <= r_stateReg_0_1;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_stateIn_0 <= r_stateReg_0_2;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_stateIn_0 <= r_stateReg_0_3;
          else
            r_addroundkey_io_stateIn_0 <= r_stateReg_0_0;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_stateReg_1_1,when_AES_l73,r_stateReg_1_2,when_AES_l97,r_stateReg_1_3,when_AES_l121,r_stateReg_1_0)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_stateIn_1 <= r_stateReg_1_1;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_stateIn_1 <= r_stateReg_1_2;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_stateIn_1 <= r_stateReg_1_3;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_stateIn_1 <= r_stateReg_1_0;
          else
            r_addroundkey_io_stateIn_1 <= r_stateReg_1_1;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_stateReg_2_2,when_AES_l73,r_stateReg_2_3,when_AES_l97,r_stateReg_2_0,when_AES_l121,r_stateReg_2_1)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_stateIn_2 <= r_stateReg_2_2;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_stateIn_2 <= r_stateReg_2_3;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_stateIn_2 <= r_stateReg_2_0;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_stateIn_2 <= r_stateReg_2_1;
          else
            r_addroundkey_io_stateIn_2 <= r_stateReg_2_2;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_stateReg_3_3,when_AES_l73,r_stateReg_3_0,when_AES_l97,r_stateReg_3_1,when_AES_l121,r_stateReg_3_2)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_stateIn_3 <= r_stateReg_3_3;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_stateIn_3 <= r_stateReg_3_0;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_stateIn_3 <= r_stateReg_3_1;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_stateIn_3 <= r_stateReg_3_2;
          else
            r_addroundkey_io_stateIn_3 <= r_stateReg_3_3;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_keyReg_0_0,when_AES_l73,r_keyReg_0_1,when_AES_l97,r_keyReg_0_2,when_AES_l121,r_keyReg_0_3)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_key_0 <= r_keyReg_0_0;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_key_0 <= r_keyReg_0_1;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_key_0 <= r_keyReg_0_2;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_key_0 <= r_keyReg_0_3;
          else
            r_addroundkey_io_key_0 <= r_keyReg_0_0;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_keyReg_1_1,when_AES_l73,r_keyReg_1_2,when_AES_l97,r_keyReg_1_3,when_AES_l121,r_keyReg_1_0)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_key_1 <= r_keyReg_1_1;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_key_1 <= r_keyReg_1_2;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_key_1 <= r_keyReg_1_3;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_key_1 <= r_keyReg_1_0;
          else
            r_addroundkey_io_key_1 <= r_keyReg_1_1;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_keyReg_2_2,when_AES_l73,r_keyReg_2_3,when_AES_l97,r_keyReg_2_0,when_AES_l121,r_keyReg_2_1)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_key_2 <= r_keyReg_2_2;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_key_2 <= r_keyReg_2_3;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_key_2 <= r_keyReg_2_0;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_key_2 <= r_keyReg_2_1;
          else
            r_addroundkey_io_key_2 <= r_keyReg_2_2;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_keyReg_3_3,when_AES_l73,r_keyReg_3_0,when_AES_l97,r_keyReg_3_1,when_AES_l121,r_keyReg_3_2)
  begin
    if when_AES_l49 = '1' then
      r_addroundkey_io_key_3 <= r_keyReg_3_3;
    else
      if when_AES_l73 = '1' then
        r_addroundkey_io_key_3 <= r_keyReg_3_0;
      else
        if when_AES_l97 = '1' then
          r_addroundkey_io_key_3 <= r_keyReg_3_1;
        else
          if when_AES_l121 = '1' then
            r_addroundkey_io_key_3 <= r_keyReg_3_2;
          else
            r_addroundkey_io_key_3 <= r_keyReg_3_3;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_addroundkey_io_stateOut_0,when_AES_l73,when_AES_l97,when_AES_l121,r_keyReg_0_3)
  begin
    if when_AES_l49 = '1' then
      r_sbox1_io_subBytesInput <= r_addroundkey_io_stateOut_0;
    else
      if when_AES_l73 = '1' then
        r_sbox1_io_subBytesInput <= r_addroundkey_io_stateOut_0;
      else
        if when_AES_l97 = '1' then
          r_sbox1_io_subBytesInput <= r_addroundkey_io_stateOut_0;
        else
          if when_AES_l121 = '1' then
            r_sbox1_io_subBytesInput <= r_addroundkey_io_stateOut_0;
          else
            r_sbox1_io_subBytesInput <= r_keyReg_0_3;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_addroundkey_io_stateOut_1,when_AES_l73,when_AES_l97,when_AES_l121,r_keyReg_1_3)
  begin
    if when_AES_l49 = '1' then
      r_sbox2_io_subBytesInput <= r_addroundkey_io_stateOut_1;
    else
      if when_AES_l73 = '1' then
        r_sbox2_io_subBytesInput <= r_addroundkey_io_stateOut_1;
      else
        if when_AES_l97 = '1' then
          r_sbox2_io_subBytesInput <= r_addroundkey_io_stateOut_1;
        else
          if when_AES_l121 = '1' then
            r_sbox2_io_subBytesInput <= r_addroundkey_io_stateOut_1;
          else
            r_sbox2_io_subBytesInput <= r_keyReg_1_3;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_addroundkey_io_stateOut_2,when_AES_l73,when_AES_l97,when_AES_l121,r_keyReg_2_3)
  begin
    if when_AES_l49 = '1' then
      r_sbox3_io_subBytesInput <= r_addroundkey_io_stateOut_2;
    else
      if when_AES_l73 = '1' then
        r_sbox3_io_subBytesInput <= r_addroundkey_io_stateOut_2;
      else
        if when_AES_l97 = '1' then
          r_sbox3_io_subBytesInput <= r_addroundkey_io_stateOut_2;
        else
          if when_AES_l121 = '1' then
            r_sbox3_io_subBytesInput <= r_addroundkey_io_stateOut_2;
          else
            r_sbox3_io_subBytesInput <= r_keyReg_2_3;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_addroundkey_io_stateOut_3,when_AES_l73,when_AES_l97,when_AES_l121,r_keyReg_3_3)
  begin
    if when_AES_l49 = '1' then
      r_sbox4_io_subBytesInput <= r_addroundkey_io_stateOut_3;
    else
      if when_AES_l73 = '1' then
        r_sbox4_io_subBytesInput <= r_addroundkey_io_stateOut_3;
      else
        if when_AES_l97 = '1' then
          r_sbox4_io_subBytesInput <= r_addroundkey_io_stateOut_3;
        else
          if when_AES_l121 = '1' then
            r_sbox4_io_subBytesInput <= r_addroundkey_io_stateOut_3;
          else
            r_sbox4_io_subBytesInput <= r_keyReg_3_3;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_sbox1_io_subBytesOutput,when_AES_l73,when_AES_l97,when_AES_l121)
  begin
    if when_AES_l49 = '1' then
      r_mixcolumns_io_mcIn_0 <= r_sbox1_io_subBytesOutput;
    else
      if when_AES_l73 = '1' then
        r_mixcolumns_io_mcIn_0 <= r_sbox1_io_subBytesOutput;
      else
        if when_AES_l97 = '1' then
          r_mixcolumns_io_mcIn_0 <= r_sbox1_io_subBytesOutput;
        else
          if when_AES_l121 = '1' then
            r_mixcolumns_io_mcIn_0 <= r_sbox1_io_subBytesOutput;
          else
            r_mixcolumns_io_mcIn_0 <= r_sbox1_io_subBytesOutput;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_sbox2_io_subBytesOutput,when_AES_l73,when_AES_l97,when_AES_l121)
  begin
    if when_AES_l49 = '1' then
      r_mixcolumns_io_mcIn_1 <= r_sbox2_io_subBytesOutput;
    else
      if when_AES_l73 = '1' then
        r_mixcolumns_io_mcIn_1 <= r_sbox2_io_subBytesOutput;
      else
        if when_AES_l97 = '1' then
          r_mixcolumns_io_mcIn_1 <= r_sbox2_io_subBytesOutput;
        else
          if when_AES_l121 = '1' then
            r_mixcolumns_io_mcIn_1 <= r_sbox2_io_subBytesOutput;
          else
            r_mixcolumns_io_mcIn_1 <= r_sbox2_io_subBytesOutput;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_sbox3_io_subBytesOutput,when_AES_l73,when_AES_l97,when_AES_l121)
  begin
    if when_AES_l49 = '1' then
      r_mixcolumns_io_mcIn_2 <= r_sbox3_io_subBytesOutput;
    else
      if when_AES_l73 = '1' then
        r_mixcolumns_io_mcIn_2 <= r_sbox3_io_subBytesOutput;
      else
        if when_AES_l97 = '1' then
          r_mixcolumns_io_mcIn_2 <= r_sbox3_io_subBytesOutput;
        else
          if when_AES_l121 = '1' then
            r_mixcolumns_io_mcIn_2 <= r_sbox3_io_subBytesOutput;
          else
            r_mixcolumns_io_mcIn_2 <= r_sbox3_io_subBytesOutput;
          end if;
        end if;
      end if;
    end if;
  end process;

  process(when_AES_l49,r_sbox4_io_subBytesOutput,when_AES_l73,when_AES_l97,when_AES_l121)
  begin
    if when_AES_l49 = '1' then
      r_mixcolumns_io_mcIn_3 <= r_sbox4_io_subBytesOutput;
    else
      if when_AES_l73 = '1' then
        r_mixcolumns_io_mcIn_3 <= r_sbox4_io_subBytesOutput;
      else
        if when_AES_l97 = '1' then
          r_mixcolumns_io_mcIn_3 <= r_sbox4_io_subBytesOutput;
        else
          if when_AES_l121 = '1' then
            r_mixcolumns_io_mcIn_3 <= r_sbox4_io_subBytesOutput;
          else
            r_mixcolumns_io_mcIn_3 <= r_sbox4_io_subBytesOutput;
          end if;
        end if;
      end if;
    end if;
  end process;

  when_AES_l57 <= pkg_toStdLogic(r_aesState = pkg_enum.sExecute);
  when_AES_l62 <= pkg_toStdLogic(r_aesState = pkg_enum.sFinalRound);
  when_AES_l81 <= pkg_toStdLogic(r_aesState = pkg_enum.sExecute);
  when_AES_l86 <= pkg_toStdLogic(r_aesState = pkg_enum.sFinalRound);
  when_AES_l105 <= pkg_toStdLogic(r_aesState = pkg_enum.sExecute);
  when_AES_l110 <= pkg_toStdLogic(r_aesState = pkg_enum.sFinalRound);
  when_AES_l129 <= pkg_toStdLogic(r_aesState = pkg_enum.sExecute);
  when_AES_l134 <= pkg_toStdLogic(r_aesState = pkg_enum.sFinalRound);
  when_AES_l73 <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("001"));
  when_AES_l97 <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("010"));
  when_AES_l121 <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("011"));
  process(r_stateReg_0_0,r_stateReg_1_0,r_stateReg_2_0,r_stateReg_3_0,r_stateReg_0_1,r_stateReg_1_1,r_stateReg_2_1,r_stateReg_3_1,r_stateReg_0_2,r_stateReg_1_2,r_stateReg_2_2,r_stateReg_3_2,r_stateReg_0_3,r_stateReg_1_3,r_stateReg_2_3,r_stateReg_3_3)
  begin
    zz_io_ciphertext(127 downto 120) <= r_stateReg_0_0;
    zz_io_ciphertext(119 downto 112) <= r_stateReg_1_0;
    zz_io_ciphertext(111 downto 104) <= r_stateReg_2_0;
    zz_io_ciphertext(103 downto 96) <= r_stateReg_3_0;
    zz_io_ciphertext(95 downto 88) <= r_stateReg_0_1;
    zz_io_ciphertext(87 downto 80) <= r_stateReg_1_1;
    zz_io_ciphertext(79 downto 72) <= r_stateReg_2_1;
    zz_io_ciphertext(71 downto 64) <= r_stateReg_3_1;
    zz_io_ciphertext(63 downto 56) <= r_stateReg_0_2;
    zz_io_ciphertext(55 downto 48) <= r_stateReg_1_2;
    zz_io_ciphertext(47 downto 40) <= r_stateReg_2_2;
    zz_io_ciphertext(39 downto 32) <= r_stateReg_3_2;
    zz_io_ciphertext(31 downto 24) <= r_stateReg_0_3;
    zz_io_ciphertext(23 downto 16) <= r_stateReg_1_3;
    zz_io_ciphertext(15 downto 8) <= r_stateReg_2_3;
    zz_io_ciphertext(7 downto 0) <= r_stateReg_3_3;
  end process;

  io_ciphertext <= zz_io_ciphertext;
  when_AES_l180 <= pkg_toStdLogic(unsigned(r_roundConstant) < pkg_unsigned("10000000"));
  when_AES_l206 <= pkg_toStdLogic(r_smallCounter_value = pkg_unsigned("100"));
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_roundCounter_value <= pkg_unsigned("0001");
      r_smallCounter_value <= pkg_unsigned("000");
      r_roundConstant <= pkg_stdLogicVector("00000001");
      r_aesState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_smallCounter_value <= r_smallCounter_valueNext;
      case r_aesState is
        when pkg_enum.sIdle =>
          r_aesState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_aesState <= pkg_enum.sExecute;
          end if;
        when pkg_enum.sExecute =>
          r_aesState <= pkg_enum.sExecute;
          if r_smallCounter_willOverflow = '1' then
            if when_AES_l180 = '1' then
              r_roundConstant <= std_logic_vector(shift_left(unsigned(r_roundConstant),1));
            else
              r_roundConstant <= (std_logic_vector(shift_left(unsigned(r_roundConstant),1)) xor pkg_stdLogicVector("00011011"));
            end if;
          end if;
          if r_roundCounter_willOverflow = '1' then
            r_aesState <= pkg_enum.sFinalRound;
          end if;
        when pkg_enum.sFinalRound =>
          if r_smallCounter_willOverflow = '1' then
            r_aesState <= pkg_enum.sDone;
          end if;
        when others =>
      end case;
    end if;
  end process;

  process(io_clk)
  begin
    if rising_edge(io_clk) then
      if when_AES_l49 = '1' then
        if when_AES_l57 = '1' then
          r_stateReg_0_0 <= r_mixcolumns_io_mcOut_0;
          r_stateReg_1_1 <= r_mixcolumns_io_mcOut_1;
          r_stateReg_2_2 <= r_mixcolumns_io_mcOut_2;
          r_stateReg_3_3 <= r_mixcolumns_io_mcOut_3;
        else
          if when_AES_l62 = '1' then
            r_stateReg_0_0 <= r_sbox1_io_subBytesOutput;
            r_stateReg_1_1 <= r_sbox2_io_subBytesOutput;
            r_stateReg_2_2 <= r_sbox3_io_subBytesOutput;
            r_stateReg_3_3 <= r_sbox4_io_subBytesOutput;
          else
            r_stateReg_0_0 <= r_addroundkey_io_stateOut_0;
            r_stateReg_1_1 <= r_addroundkey_io_stateOut_1;
            r_stateReg_2_2 <= r_addroundkey_io_stateOut_2;
            r_stateReg_3_3 <= r_addroundkey_io_stateOut_3;
          end if;
        end if;
      else
        if when_AES_l73 = '1' then
          if when_AES_l81 = '1' then
            r_stateReg_0_1 <= r_mixcolumns_io_mcOut_0;
            r_stateReg_1_2 <= r_mixcolumns_io_mcOut_1;
            r_stateReg_2_3 <= r_mixcolumns_io_mcOut_2;
            r_stateReg_3_0 <= r_mixcolumns_io_mcOut_3;
          else
            if when_AES_l86 = '1' then
              r_stateReg_0_1 <= r_sbox1_io_subBytesOutput;
              r_stateReg_1_2 <= r_sbox2_io_subBytesOutput;
              r_stateReg_2_3 <= r_sbox3_io_subBytesOutput;
              r_stateReg_3_0 <= r_sbox4_io_subBytesOutput;
            else
              r_stateReg_0_1 <= r_addroundkey_io_stateOut_0;
              r_stateReg_1_2 <= r_addroundkey_io_stateOut_1;
              r_stateReg_2_3 <= r_addroundkey_io_stateOut_2;
              r_stateReg_3_0 <= r_addroundkey_io_stateOut_3;
            end if;
          end if;
        else
          if when_AES_l97 = '1' then
            if when_AES_l105 = '1' then
              r_stateReg_0_2 <= r_mixcolumns_io_mcOut_0;
              r_stateReg_1_3 <= r_mixcolumns_io_mcOut_1;
              r_stateReg_2_0 <= r_mixcolumns_io_mcOut_2;
              r_stateReg_3_1 <= r_mixcolumns_io_mcOut_3;
            else
              if when_AES_l110 = '1' then
                r_stateReg_0_2 <= r_sbox1_io_subBytesOutput;
                r_stateReg_1_3 <= r_sbox2_io_subBytesOutput;
                r_stateReg_2_0 <= r_sbox3_io_subBytesOutput;
                r_stateReg_3_1 <= r_sbox4_io_subBytesOutput;
              else
                r_stateReg_0_2 <= r_addroundkey_io_stateOut_0;
                r_stateReg_1_3 <= r_addroundkey_io_stateOut_1;
                r_stateReg_2_0 <= r_addroundkey_io_stateOut_2;
                r_stateReg_3_1 <= r_addroundkey_io_stateOut_3;
              end if;
            end if;
          else
            if when_AES_l121 = '1' then
              if when_AES_l129 = '1' then
                r_stateReg_0_3 <= r_mixcolumns_io_mcOut_0;
                r_stateReg_1_0 <= r_mixcolumns_io_mcOut_1;
                r_stateReg_2_1 <= r_mixcolumns_io_mcOut_2;
                r_stateReg_3_2 <= r_mixcolumns_io_mcOut_3;
              else
                if when_AES_l134 = '1' then
                  r_stateReg_0_3 <= r_sbox1_io_subBytesOutput;
                  r_stateReg_1_0 <= r_sbox2_io_subBytesOutput;
                  r_stateReg_2_1 <= r_sbox3_io_subBytesOutput;
                  r_stateReg_3_2 <= r_sbox4_io_subBytesOutput;
                else
                  r_stateReg_0_3 <= r_addroundkey_io_stateOut_0;
                  r_stateReg_1_0 <= r_addroundkey_io_stateOut_1;
                  r_stateReg_2_1 <= r_addroundkey_io_stateOut_2;
                  r_stateReg_3_2 <= r_addroundkey_io_stateOut_3;
                end if;
              end if;
            else
              r_stateReg_0_0 <= r_shiftrows_io_srOut_0_0;
              r_stateReg_0_1 <= r_shiftrows_io_srOut_0_1;
              r_stateReg_0_2 <= r_shiftrows_io_srOut_0_2;
              r_stateReg_0_3 <= r_shiftrows_io_srOut_0_3;
              r_stateReg_1_0 <= r_shiftrows_io_srOut_1_0;
              r_stateReg_1_1 <= r_shiftrows_io_srOut_1_1;
              r_stateReg_1_2 <= r_shiftrows_io_srOut_1_2;
              r_stateReg_1_3 <= r_shiftrows_io_srOut_1_3;
              r_stateReg_2_0 <= r_shiftrows_io_srOut_2_0;
              r_stateReg_2_1 <= r_shiftrows_io_srOut_2_1;
              r_stateReg_2_2 <= r_shiftrows_io_srOut_2_2;
              r_stateReg_2_3 <= r_shiftrows_io_srOut_2_3;
              r_stateReg_3_0 <= r_shiftrows_io_srOut_3_0;
              r_stateReg_3_1 <= r_shiftrows_io_srOut_3_1;
              r_stateReg_3_2 <= r_shiftrows_io_srOut_3_2;
              r_stateReg_3_3 <= r_shiftrows_io_srOut_3_3;
              r_keyReg_0_0 <= r_w0_0;
              r_keyReg_0_1 <= r_w1_0;
              r_keyReg_0_2 <= r_w2_0;
              r_keyReg_0_3 <= r_w3_0;
              r_keyReg_1_0 <= r_w0_1;
              r_keyReg_1_1 <= r_w1_1;
              r_keyReg_1_2 <= r_w2_1;
              r_keyReg_1_3 <= r_w3_1;
              r_keyReg_2_0 <= r_w0_2;
              r_keyReg_2_1 <= r_w1_2;
              r_keyReg_2_2 <= r_w2_2;
              r_keyReg_2_3 <= r_w3_2;
              r_keyReg_3_0 <= r_w0_3;
              r_keyReg_3_1 <= r_w1_3;
              r_keyReg_3_2 <= r_w2_3;
              r_keyReg_3_3 <= r_w3_3;
            end if;
          end if;
        end if;
      end if;
      case r_aesState is
        when pkg_enum.sIdle =>
          r_stateReg_0_0 <= pkg_extract(io_plaintext,127,120);
          r_stateReg_0_1 <= pkg_extract(io_plaintext,95,88);
          r_stateReg_0_2 <= pkg_extract(io_plaintext,63,56);
          r_stateReg_0_3 <= pkg_extract(io_plaintext,31,24);
          r_stateReg_1_0 <= pkg_extract(io_plaintext,119,112);
          r_stateReg_1_1 <= pkg_extract(io_plaintext,87,80);
          r_stateReg_1_2 <= pkg_extract(io_plaintext,55,48);
          r_stateReg_1_3 <= pkg_extract(io_plaintext,23,16);
          r_stateReg_2_0 <= pkg_extract(io_plaintext,111,104);
          r_stateReg_2_1 <= pkg_extract(io_plaintext,79,72);
          r_stateReg_2_2 <= pkg_extract(io_plaintext,47,40);
          r_stateReg_2_3 <= pkg_extract(io_plaintext,15,8);
          r_stateReg_3_0 <= pkg_extract(io_plaintext,103,96);
          r_stateReg_3_1 <= pkg_extract(io_plaintext,71,64);
          r_stateReg_3_2 <= pkg_extract(io_plaintext,39,32);
          r_stateReg_3_3 <= pkg_extract(io_plaintext,7,0);
          r_keyReg_0_0 <= pkg_extract(io_key,127,120);
          r_keyReg_0_1 <= pkg_extract(io_key,95,88);
          r_keyReg_0_2 <= pkg_extract(io_key,63,56);
          r_keyReg_0_3 <= pkg_extract(io_key,31,24);
          r_keyReg_1_0 <= pkg_extract(io_key,119,112);
          r_keyReg_1_1 <= pkg_extract(io_key,87,80);
          r_keyReg_1_2 <= pkg_extract(io_key,55,48);
          r_keyReg_1_3 <= pkg_extract(io_key,23,16);
          r_keyReg_2_0 <= pkg_extract(io_key,111,104);
          r_keyReg_2_1 <= pkg_extract(io_key,79,72);
          r_keyReg_2_2 <= pkg_extract(io_key,47,40);
          r_keyReg_2_3 <= pkg_extract(io_key,15,8);
          r_keyReg_3_0 <= pkg_extract(io_key,103,96);
          r_keyReg_3_1 <= pkg_extract(io_key,71,64);
          r_keyReg_3_2 <= pkg_extract(io_key,39,32);
          r_keyReg_3_3 <= pkg_extract(io_key,7,0);
        when pkg_enum.sExecute =>
        when pkg_enum.sFinalRound =>
        when others =>
      end case;
    end if;
  end process;

end arch;

