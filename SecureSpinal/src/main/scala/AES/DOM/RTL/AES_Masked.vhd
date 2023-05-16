-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : AES_Masked
-- Git hash  : ecc6ae7501227b5ade41fc5b9494339386fa9552

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


--G4Mul_15 replaced by G4Mul


--G4Mul_16 replaced by G4Mul


--G4Mul_17 replaced by G4Mul


--G4Mul_18 replaced by G4Mul


--G4Mul_19 replaced by G4Mul


--G4Mul_20 replaced by G4Mul


--G4Mul_21 replaced by G4Mul


--G4Mul_22 replaced by G4Mul


--G4Mul_23 replaced by G4Mul


--G4Mul_24 replaced by G4Mul


--G4Mul_25 replaced by G4Mul


--G4Mul_26 replaced by G4Mul


--G4ScaleN_4 replaced by G4ScaleN


--G4Mul_27 replaced by G4Mul


--G4Mul_28 replaced by G4Mul


--G4Mul_29 replaced by G4Mul


--G4ScaleN_5 replaced by G4ScaleN

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


--G4Mul_30 replaced by G4Mul


--G4Mul_31 replaced by G4Mul


--G4Mul_32 replaced by G4Mul


--G4ScaleN_6 replaced by G4ScaleN


--G4Mul_33 replaced by G4Mul


--G4Mul_34 replaced by G4Mul


--G4Mul_35 replaced by G4Mul


--G4ScaleN_7 replaced by G4ScaleN


--G4Mul_36 replaced by G4Mul


--G4Mul_37 replaced by G4Mul


--G4Mul_38 replaced by G4Mul


--G4ScaleN_8 replaced by G4ScaleN


--G4Mul_39 replaced by G4Mul


--G4Mul_40 replaced by G4Mul


--G4Mul_41 replaced by G4Mul


--G4ScaleN_9 replaced by G4ScaleN


--G4Mul_42 replaced by G4Mul


--G4Mul_43 replaced by G4Mul


--G4Mul_44 replaced by G4Mul


--G4ScaleN_10 replaced by G4ScaleN


--G4Mul_45 replaced by G4Mul


--G4Mul_46 replaced by G4Mul


--G4Mul_47 replaced by G4Mul


--G4ScaleN_11 replaced by G4ScaleN


--G4Mul_48 replaced by G4Mul


--G4Mul_49 replaced by G4Mul


--G4Mul_50 replaced by G4Mul


--G4ScaleN_12 replaced by G4ScaleN


--G4Mul_51 replaced by G4Mul


--G4Mul_52 replaced by G4Mul


--G4Mul_53 replaced by G4Mul


--G4ScaleN_13 replaced by G4ScaleN


--G4Mul_54 replaced by G4Mul


--G4Mul_55 replaced by G4Mul

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G4Mul2SharesIndepMul is
  port(
    io_x_0 : in std_logic_vector(1 downto 0);
    io_x_1 : in std_logic_vector(1 downto 0);
    io_y_0 : in std_logic_vector(1 downto 0);
    io_y_1 : in std_logic_vector(1 downto 0);
    io_m : in std_logic_vector(1 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end G4Mul2SharesIndepMul;

architecture arch of G4Mul2SharesIndepMul is
  signal mul1_io_x : std_logic_vector(1 downto 0);
  signal mul2_io_x : std_logic_vector(1 downto 0);
  signal mul3_io_x : std_logic_vector(1 downto 0);
  signal mul4_io_x : std_logic_vector(1 downto 0);

  signal x0y0 : std_logic_vector(1 downto 0);
  signal x0y1 : std_logic_vector(1 downto 0);
  signal x1y0 : std_logic_vector(1 downto 0);
  signal x1y1 : std_logic_vector(1 downto 0);
  signal r0 : std_logic_vector(1 downto 0);
  signal r1 : std_logic_vector(1 downto 0);
  signal r2 : std_logic_vector(1 downto 0);
  signal r3 : std_logic_vector(1 downto 0);
begin
  mul1 : entity work.G4Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_0,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G4Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_1,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G4Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_0,
      io_x => mul3_io_x 
    );
  mul4 : entity work.G4Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_1,
      io_x => mul4_io_x 
    );
  x0y0 <= mul1_io_x;
  x0y1 <= mul2_io_x;
  x1y0 <= mul3_io_x;
  x1y1 <= mul4_io_x;
  io_z_0 <= (r0 xor r1);
  io_z_1 <= (r2 xor r3);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r0 <= pkg_stdLogicVector("00");
      r1 <= pkg_stdLogicVector("00");
      r2 <= pkg_stdLogicVector("00");
      r3 <= pkg_stdLogicVector("00");
    elsif rising_edge(io_clk) then
      r0 <= x0y0;
      r1 <= (x0y1 xor io_m);
      r2 <= (x1y0 xor io_m);
      r3 <= x1y1;
    end if;
  end process;

end arch;


--G4Mul_56 replaced by G4Mul


--G4Mul_57 replaced by G4Mul


--G4Mul2SharesIndepMul_1 replaced by G4Mul2SharesIndepMul


--G4Mul_58 replaced by G4Mul


--G4Mul_59 replaced by G4Mul


--G4Mul2SharesIndepMul_2 replaced by G4Mul2SharesIndepMul


--G16Mul_4 replaced by G16Mul


--G16Mul_5 replaced by G16Mul

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16Mul2SharesIndepMul is
  port(
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_y_0 : in std_logic_vector(3 downto 0);
    io_y_1 : in std_logic_vector(3 downto 0);
    io_m : in std_logic_vector(3 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end G16Mul2SharesIndepMul;

architecture arch of G16Mul2SharesIndepMul is
  signal mul1_io_x : std_logic_vector(3 downto 0);
  signal mul2_io_x : std_logic_vector(3 downto 0);
  signal mul3_io_x : std_logic_vector(3 downto 0);
  signal mul4_io_x : std_logic_vector(3 downto 0);

  signal r0 : std_logic_vector(3 downto 0);
  signal r1 : std_logic_vector(3 downto 0);
  signal r2 : std_logic_vector(3 downto 0);
  signal r3 : std_logic_vector(3 downto 0);
begin
  mul1 : entity work.G16Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_0,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G16Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_1,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G16Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_0,
      io_x => mul3_io_x 
    );
  mul4 : entity work.G16Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_1,
      io_x => mul4_io_x 
    );
  io_z_0 <= (r0 xor r1);
  io_z_1 <= (r2 xor r3);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r0 <= pkg_stdLogicVector("0000");
      r1 <= pkg_stdLogicVector("0000");
      r2 <= pkg_stdLogicVector("0000");
      r3 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      r0 <= mul1_io_x;
      r1 <= (mul2_io_x xor io_m);
      r2 <= (mul3_io_x xor io_m);
      r3 <= mul4_io_x;
    end if;
  end process;

end arch;


--G16Mul_6 replaced by G16Mul


--G16Mul_7 replaced by G16Mul


--G16Mul_8 replaced by G16Mul


--G16Mul_9 replaced by G16Mul


--G16Mul_10 replaced by G16Mul


--G16Mul_11 replaced by G16Mul


--G16Mul_12 replaced by G16Mul


--G16Mul_13 replaced by G16Mul

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G4Mul2SharesDepMul is
  port(
    io_x_0 : in std_logic_vector(1 downto 0);
    io_x_1 : in std_logic_vector(1 downto 0);
    io_y_0 : in std_logic_vector(1 downto 0);
    io_y_1 : in std_logic_vector(1 downto 0);
    io_m : in std_logic_vector(5 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end G4Mul2SharesDepMul;

architecture arch of G4Mul2SharesDepMul is
  signal mul3_io_m : std_logic_vector(1 downto 0);
  signal mul1_io_x : std_logic_vector(1 downto 0);
  signal mul2_io_x : std_logic_vector(1 downto 0);
  signal mul3_io_z_0 : std_logic_vector(1 downto 0);
  signal mul3_io_z_1 : std_logic_vector(1 downto 0);

  signal x_0 : std_logic_vector(1 downto 0);
  signal x_1 : std_logic_vector(1 downto 0);
  signal yz_0 : std_logic_vector(1 downto 0);
  signal yz_1 : std_logic_vector(1 downto 0);
  signal z_0 : std_logic_vector(1 downto 0);
  signal z_1 : std_logic_vector(1 downto 0);
  signal b : std_logic_vector(1 downto 0);
begin
  mul1 : entity work.G4Mul
    port map ( 
      io_a => x_0,
      io_b => b,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G4Mul
    port map ( 
      io_a => x_1,
      io_b => b,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G4Mul2SharesIndepMul
    port map ( 
      io_x_0 => io_x_0,
      io_x_1 => io_x_1,
      io_y_0 => z_0,
      io_y_1 => z_1,
      io_m => mul3_io_m,
      io_z_0 => mul3_io_z_0,
      io_z_1 => mul3_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  z_0 <= pkg_extract(io_m,3,2);
  z_1 <= pkg_extract(io_m,1,0);
  b <= (yz_0 xor yz_1);
  mul3_io_m <= pkg_extract(io_m,5,4);
  io_z_0 <= (mul3_io_z_0 xor mul1_io_x);
  io_z_1 <= (mul3_io_z_1 xor mul2_io_x);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      x_0 <= pkg_stdLogicVector("00");
      x_1 <= pkg_stdLogicVector("00");
      yz_0 <= pkg_stdLogicVector("00");
      yz_1 <= pkg_stdLogicVector("00");
    elsif rising_edge(io_clk) then
      x_0 <= io_x_0;
      yz_0 <= (z_0 xor io_y_0);
      x_1 <= io_x_1;
      yz_1 <= (z_1 xor io_y_1);
    end if;
  end process;

end arch;


--G4Mul2SharesDepMul_1 replaced by G4Mul2SharesDepMul


--G4Mul2SharesDepMul_2 replaced by G4Mul2SharesDepMul

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


--G4ScaleN_14 replaced by G4ScaleN


--G4Sq_1 replaced by G4Sq


--G4Sq_2 replaced by G4Sq


--G4ScaleN_15 replaced by G4ScaleN


--G4Sq_3 replaced by G4Sq


--G4Sq_4 replaced by G4Sq


--G4Sq_5 replaced by G4Sq

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


--G4Sq_6 replaced by G4Sq


--G4Sq_7 replaced by G4Sq


--G4ScaleN2_1 replaced by G4ScaleN2

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16Mul2SharesDepMul is
  port(
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_y_0 : in std_logic_vector(3 downto 0);
    io_y_1 : in std_logic_vector(3 downto 0);
    io_m : in std_logic_vector(11 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end G16Mul2SharesDepMul;

architecture arch of G16Mul2SharesDepMul is
  signal mul3_io_m : std_logic_vector(3 downto 0);
  signal mul1_io_x : std_logic_vector(3 downto 0);
  signal mul2_io_x : std_logic_vector(3 downto 0);
  signal mul3_io_z_0 : std_logic_vector(3 downto 0);
  signal mul3_io_z_1 : std_logic_vector(3 downto 0);

  signal x_0 : std_logic_vector(3 downto 0);
  signal x_1 : std_logic_vector(3 downto 0);
  signal yz_0 : std_logic_vector(3 downto 0);
  signal yz_1 : std_logic_vector(3 downto 0);
  signal z_0 : std_logic_vector(3 downto 0);
  signal z_1 : std_logic_vector(3 downto 0);
  signal b : std_logic_vector(3 downto 0);
begin
  mul1 : entity work.G16Mul
    port map ( 
      io_a => x_0,
      io_b => b,
      io_x => mul1_io_x 
    );
  mul2 : entity work.G16Mul
    port map ( 
      io_a => x_1,
      io_b => b,
      io_x => mul2_io_x 
    );
  mul3 : entity work.G16Mul2SharesIndepMul
    port map ( 
      io_x_0 => io_x_0,
      io_x_1 => io_x_1,
      io_y_0 => z_0,
      io_y_1 => z_1,
      io_m => mul3_io_m,
      io_z_0 => mul3_io_z_0,
      io_z_1 => mul3_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  z_0 <= pkg_extract(io_m,7,4);
  z_1 <= pkg_extract(io_m,3,0);
  b <= (yz_0 xor yz_1);
  mul3_io_m <= pkg_extract(io_m,11,8);
  io_z_0 <= (mul3_io_z_0 xor mul1_io_x);
  io_z_1 <= (mul3_io_z_1 xor mul2_io_x);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      x_0 <= pkg_stdLogicVector("0000");
      x_1 <= pkg_stdLogicVector("0000");
      yz_0 <= pkg_stdLogicVector("0000");
      yz_1 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      x_0 <= io_x_0;
      yz_0 <= (z_0 xor io_y_0);
      x_1 <= io_x_1;
      yz_1 <= (z_1 xor io_y_1);
    end if;
  end process;

end arch;


--G16Mul2SharesIndepMul_1 replaced by G16Mul2SharesIndepMul


--G16Mul2SharesIndepMul_2 replaced by G16Mul2SharesIndepMul

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16Inv2SharesDep is
  port(
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_m : in std_logic_vector(17 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end G16Inv2SharesDep;

architecture arch of G16Inv2SharesDep is
  signal mul1_io_m : std_logic_vector(5 downto 0);
  signal mul2_io_m : std_logic_vector(5 downto 0);
  signal mul3_io_m : std_logic_vector(5 downto 0);
  signal g4Sq_8_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_9_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_10_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_11_io_t : std_logic_vector(1 downto 0);
  signal mul1_io_z_0 : std_logic_vector(1 downto 0);
  signal mul1_io_z_1 : std_logic_vector(1 downto 0);
  signal mul2_io_z_0 : std_logic_vector(1 downto 0);
  signal mul2_io_z_1 : std_logic_vector(1 downto 0);
  signal mul3_io_z_0 : std_logic_vector(1 downto 0);
  signal mul3_io_z_1 : std_logic_vector(1 downto 0);
  signal g4Sq_8_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_16_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_9_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_10_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_17_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_11_io_x : std_logic_vector(1 downto 0);

  signal a_0 : std_logic_vector(1 downto 0);
  signal a_1 : std_logic_vector(1 downto 0);
  signal b_0 : std_logic_vector(1 downto 0);
  signal b_1 : std_logic_vector(1 downto 0);
  signal d_0 : std_logic_vector(1 downto 0);
  signal d_1 : std_logic_vector(1 downto 0);
  signal e_0 : std_logic_vector(1 downto 0);
  signal e_1 : std_logic_vector(1 downto 0);
  signal p_0 : std_logic_vector(1 downto 0);
  signal p_1 : std_logic_vector(1 downto 0);
  signal q_0 : std_logic_vector(1 downto 0);
  signal q_1 : std_logic_vector(1 downto 0);
  signal c_0 : std_logic_vector(1 downto 0);
  signal c_1 : std_logic_vector(1 downto 0);
  signal a1_0 : std_logic_vector(1 downto 0);
  signal a1_1 : std_logic_vector(1 downto 0);
  signal b1_0 : std_logic_vector(1 downto 0);
  signal b1_1 : std_logic_vector(1 downto 0);
begin
  mul1 : entity work.G4Mul2SharesDepMul
    port map ( 
      io_x_0 => a_0,
      io_x_1 => a_1,
      io_y_0 => b_0,
      io_y_1 => b_1,
      io_m => mul1_io_m,
      io_z_0 => mul1_io_z_0,
      io_z_1 => mul1_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  mul2 : entity work.G4Mul2SharesDepMul
    port map ( 
      io_x_0 => b1_0,
      io_x_1 => b1_1,
      io_y_0 => e_0,
      io_y_1 => e_1,
      io_m => mul2_io_m,
      io_z_0 => mul2_io_z_0,
      io_z_1 => mul2_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  mul3 : entity work.G4Mul2SharesDepMul
    port map ( 
      io_x_0 => a1_0,
      io_x_1 => a1_1,
      io_y_0 => e_0,
      io_y_1 => e_1,
      io_m => mul3_io_m,
      io_z_0 => mul3_io_z_0,
      io_z_1 => mul3_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  g4Sq_8 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_8_io_t,
      io_x => g4Sq_8_io_x 
    );
  g4ScaleN_16 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_8_io_x,
      io_x => g4ScaleN_16_io_x 
    );
  g4Sq_9 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_9_io_t,
      io_x => g4Sq_9_io_x 
    );
  g4Sq_10 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_10_io_t,
      io_x => g4Sq_10_io_x 
    );
  g4ScaleN_17 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_10_io_x,
      io_x => g4ScaleN_17_io_x 
    );
  g4Sq_11 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_11_io_t,
      io_x => g4Sq_11_io_x 
    );
  a_0 <= pkg_extract(io_x_0,3,2);
  b_0 <= pkg_extract(io_x_0,1,0);
  g4Sq_8_io_t <= (a_0 xor b_0);
  g4Sq_9_io_t <= (c_0 xor d_0);
  e_0 <= g4Sq_9_io_x;
  a_1 <= pkg_extract(io_x_1,3,2);
  b_1 <= pkg_extract(io_x_1,1,0);
  g4Sq_10_io_t <= (a_1 xor b_1);
  g4Sq_11_io_t <= (c_1 xor d_1);
  e_1 <= g4Sq_11_io_x;
  mul1_io_m <= pkg_extract(io_m,17,12);
  d_0 <= mul1_io_z_0;
  d_1 <= mul1_io_z_1;
  mul2_io_m <= pkg_extract(io_m,11,6);
  p_0 <= mul2_io_z_0;
  p_1 <= mul2_io_z_1;
  mul3_io_m <= pkg_extract(io_m,5,0);
  q_0 <= mul3_io_z_0;
  q_1 <= mul3_io_z_1;
  io_z_0 <= pkg_cat(p_0,q_0);
  io_z_1 <= pkg_cat(p_1,q_1);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      c_0 <= pkg_stdLogicVector("00");
      c_1 <= pkg_stdLogicVector("00");
      a1_0 <= pkg_stdLogicVector("00");
      a1_1 <= pkg_stdLogicVector("00");
      b1_0 <= pkg_stdLogicVector("00");
      b1_1 <= pkg_stdLogicVector("00");
    elsif rising_edge(io_clk) then
      a1_0 <= a_0;
      b1_0 <= b_0;
      c_0 <= g4ScaleN_16_io_x;
      a1_1 <= a_1;
      b1_1 <= b_1;
      c_1 <= g4ScaleN_17_io_x;
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


--NewBasis_2 replaced by NewBasis


--NewBasis_3 replaced by NewBasis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G256Inv2Shares5Stages is
  port(
    io_x_0 : in std_logic_vector(7 downto 0);
    io_x_1 : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(37 downto 0);
    io_z_0 : out std_logic_vector(7 downto 0);
    io_z_1 : out std_logic_vector(7 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end G256Inv2Shares5Stages;

architecture arch of G256Inv2Shares5Stages is
  signal mul1_io_m : std_logic_vector(11 downto 0);
  signal mul2_io_m : std_logic_vector(3 downto 0);
  signal mul3_io_m : std_logic_vector(3 downto 0);
  signal inv_io_x_0 : std_logic_vector(3 downto 0);
  signal inv_io_x_1 : std_logic_vector(3 downto 0);
  signal inv_io_m : std_logic_vector(17 downto 0);
  signal g16SqSc_2_io_t : std_logic_vector(3 downto 0);
  signal g16SqSc_3_io_t : std_logic_vector(3 downto 0);
  signal mul1_io_z_0 : std_logic_vector(3 downto 0);
  signal mul1_io_z_1 : std_logic_vector(3 downto 0);
  signal mul2_io_z_0 : std_logic_vector(3 downto 0);
  signal mul2_io_z_1 : std_logic_vector(3 downto 0);
  signal mul3_io_z_0 : std_logic_vector(3 downto 0);
  signal mul3_io_z_1 : std_logic_vector(3 downto 0);
  signal inv_io_z_0 : std_logic_vector(3 downto 0);
  signal inv_io_z_1 : std_logic_vector(3 downto 0);
  signal g16SqSc_2_io_x : std_logic_vector(3 downto 0);
  signal g16SqSc_3_io_x : std_logic_vector(3 downto 0);

  signal a_0 : std_logic_vector(3 downto 0);
  signal a_1 : std_logic_vector(3 downto 0);
  signal b_0 : std_logic_vector(3 downto 0);
  signal b_1 : std_logic_vector(3 downto 0);
  signal d_0 : std_logic_vector(3 downto 0);
  signal d_1 : std_logic_vector(3 downto 0);
  signal e_0 : std_logic_vector(3 downto 0);
  signal e_1 : std_logic_vector(3 downto 0);
  signal f_0 : std_logic_vector(3 downto 0);
  signal f_1 : std_logic_vector(3 downto 0);
  signal p_0 : std_logic_vector(3 downto 0);
  signal p_1 : std_logic_vector(3 downto 0);
  signal q_0 : std_logic_vector(3 downto 0);
  signal q_1 : std_logic_vector(3 downto 0);
  signal a1_0 : std_logic_vector(3 downto 0);
  signal a1_1 : std_logic_vector(3 downto 0);
  signal a2_0 : std_logic_vector(3 downto 0);
  signal a2_1 : std_logic_vector(3 downto 0);
  signal a3_0 : std_logic_vector(3 downto 0);
  signal a3_1 : std_logic_vector(3 downto 0);
  signal b1_0 : std_logic_vector(3 downto 0);
  signal b1_1 : std_logic_vector(3 downto 0);
  signal b2_0 : std_logic_vector(3 downto 0);
  signal b2_1 : std_logic_vector(3 downto 0);
  signal b3_0 : std_logic_vector(3 downto 0);
  signal b3_1 : std_logic_vector(3 downto 0);
  signal c_0 : std_logic_vector(3 downto 0);
  signal c_1 : std_logic_vector(3 downto 0);
begin
  mul1 : entity work.G16Mul2SharesDepMul
    port map ( 
      io_x_0 => a_0,
      io_x_1 => a_1,
      io_y_0 => b_0,
      io_y_1 => b_1,
      io_m => mul1_io_m,
      io_z_0 => mul1_io_z_0,
      io_z_1 => mul1_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  mul2 : entity work.G16Mul2SharesIndepMul
    port map ( 
      io_x_0 => b3_0,
      io_x_1 => b3_1,
      io_y_0 => f_0,
      io_y_1 => f_1,
      io_m => mul2_io_m,
      io_z_0 => mul2_io_z_0,
      io_z_1 => mul2_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  mul3 : entity work.G16Mul2SharesIndepMul
    port map ( 
      io_x_0 => a3_0,
      io_x_1 => a3_1,
      io_y_0 => f_0,
      io_y_1 => f_1,
      io_m => mul3_io_m,
      io_z_0 => mul3_io_z_0,
      io_z_1 => mul3_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  inv : entity work.G16Inv2SharesDep
    port map ( 
      io_x_0 => inv_io_x_0,
      io_x_1 => inv_io_x_1,
      io_m => inv_io_m,
      io_z_0 => inv_io_z_0,
      io_z_1 => inv_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  g16SqSc_2 : entity work.G16SqSc
    port map ( 
      io_t => g16SqSc_2_io_t,
      io_x => g16SqSc_2_io_x 
    );
  g16SqSc_3 : entity work.G16SqSc
    port map ( 
      io_t => g16SqSc_3_io_t,
      io_x => g16SqSc_3_io_x 
    );
  a_0 <= pkg_extract(io_x_0,7,4);
  b_0 <= pkg_extract(io_x_0,3,0);
  a_1 <= pkg_extract(io_x_1,7,4);
  b_1 <= pkg_extract(io_x_1,3,0);
  g16SqSc_2_io_t <= (a_0 xor b_0);
  g16SqSc_3_io_t <= (a_1 xor b_1);
  mul1_io_m <= pkg_extract(io_m,37,26);
  d_0 <= mul1_io_z_0;
  d_1 <= mul1_io_z_1;
  inv_io_x_0 <= (c_0 xor d_0);
  inv_io_x_1 <= (c_1 xor d_1);
  inv_io_m <= pkg_extract(io_m,25,8);
  f_0 <= inv_io_z_0;
  f_1 <= inv_io_z_1;
  mul2_io_m <= pkg_extract(io_m,7,4);
  p_0 <= mul2_io_z_0;
  p_1 <= mul2_io_z_1;
  mul3_io_m <= pkg_extract(io_m,3,0);
  q_0 <= mul3_io_z_0;
  q_1 <= mul3_io_z_1;
  io_z_0 <= pkg_cat(p_0,q_0);
  io_z_1 <= pkg_cat(p_1,q_1);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      a1_0 <= pkg_stdLogicVector("0000");
      a1_1 <= pkg_stdLogicVector("0000");
      a2_0 <= pkg_stdLogicVector("0000");
      a2_1 <= pkg_stdLogicVector("0000");
      a3_0 <= pkg_stdLogicVector("0000");
      a3_1 <= pkg_stdLogicVector("0000");
      b1_0 <= pkg_stdLogicVector("0000");
      b1_1 <= pkg_stdLogicVector("0000");
      b2_0 <= pkg_stdLogicVector("0000");
      b2_1 <= pkg_stdLogicVector("0000");
      b3_0 <= pkg_stdLogicVector("0000");
      b3_1 <= pkg_stdLogicVector("0000");
      c_0 <= pkg_stdLogicVector("0000");
      c_1 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      a1_0 <= a_0;
      a2_0 <= a1_0;
      a3_0 <= a2_0;
      b1_0 <= b_0;
      b2_0 <= b1_0;
      b3_0 <= b2_0;
      a1_1 <= a_1;
      a2_1 <= a1_1;
      a3_1 <= a2_1;
      b1_1 <= b_1;
      b2_1 <= b1_1;
      b3_1 <= b2_1;
      c_0 <= g16SqSc_2_io_x;
      c_1 <= g16SqSc_3_io_x;
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
    io_a : in std_logic_vector(7 downto 0);
    io_k : in std_logic_vector(7 downto 0);
    io_b : out std_logic_vector(7 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_b <= (io_a xor io_k);
end arch;


--AddRoundKey_1 replaced by AddRoundKey

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity SBoxMasked is
  port(
    io_sbIn0 : in std_logic_vector(7 downto 0);
    io_sbIn1 : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(37 downto 0);
    io_sbOut0 : out std_logic_vector(7 downto 0);
    io_sbOut1 : out std_logic_vector(7 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end SBoxMasked;

architecture arch of SBoxMasked is
  signal convert0_io_output : std_logic_vector(7 downto 0);
  signal convert1_io_output : std_logic_vector(7 downto 0);
  signal convert2_io_output : std_logic_vector(7 downto 0);
  signal convert3_io_output : std_logic_vector(7 downto 0);
  signal inv_io_z_0 : std_logic_vector(7 downto 0);
  signal inv_io_z_1 : std_logic_vector(7 downto 0);

  signal dummy : std_logic;
begin
  convert0 : entity work.NewBasis
    port map ( 
      io_input => io_sbIn0,
      io_direction => pkg_toStdLogic(false),
      io_output => convert0_io_output,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  convert1 : entity work.NewBasis
    port map ( 
      io_input => io_sbIn1,
      io_direction => pkg_toStdLogic(false),
      io_output => convert1_io_output,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  convert2 : entity work.NewBasis
    port map ( 
      io_input => inv_io_z_0,
      io_direction => pkg_toStdLogic(true),
      io_output => convert2_io_output,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  convert3 : entity work.NewBasis
    port map ( 
      io_input => inv_io_z_1,
      io_direction => pkg_toStdLogic(true),
      io_output => convert3_io_output,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  inv : entity work.G256Inv2Shares5Stages
    port map ( 
      io_x_0 => convert0_io_output,
      io_x_1 => convert1_io_output,
      io_m => io_m,
      io_z_0 => inv_io_z_0,
      io_z_1 => inv_io_z_1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  io_sbOut0 <= (convert2_io_output xor pkg_stdLogicVector("01100011"));
  io_sbOut1 <= convert3_io_output;
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


--MixColumns_1 replaced by MixColumns

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AES_Masked is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_pt1_valid : in std_logic;
    io_pt1_ready : out std_logic;
    io_pt1_payload : in std_logic_vector(31 downto 0);
    io_pt2_valid : in std_logic;
    io_pt2_ready : out std_logic;
    io_pt2_payload : in std_logic_vector(31 downto 0);
    io_key1_valid : in std_logic;
    io_key1_ready : out std_logic;
    io_key1_payload : in std_logic_vector(31 downto 0);
    io_key2_valid : in std_logic;
    io_key2_ready : out std_logic;
    io_key2_payload : in std_logic_vector(31 downto 0);
    io_m : in std_logic_vector(37 downto 0);
    io_ct1_valid : out std_logic;
    io_ct1_ready : in std_logic;
    io_ct1_payload : out std_logic_vector(31 downto 0);
    io_ct2_valid : out std_logic;
    io_ct2_ready : in std_logic;
    io_ct2_payload : out std_logic_vector(31 downto 0);
    io_a : in std_logic;
    io_done : out std_logic
  );
end AES_Masked;

architecture arch of AES_Masked is
  signal r_sbox_io_sbIn0 : std_logic_vector(7 downto 0);
  signal r_sbox_io_sbIn1 : std_logic_vector(7 downto 0);
  signal io_pt1_ready_read_buffer : std_logic;
  signal io_pt2_ready_read_buffer : std_logic;
  signal io_key1_ready_read_buffer : std_logic;
  signal io_key2_ready_read_buffer : std_logic;
  signal io_ct1_valid_read_buffer : std_logic;
  signal io_ct2_valid_read_buffer : std_logic;
  signal r_addroundkey1_io_b : std_logic_vector(7 downto 0);
  signal r_addroundkey2_io_b : std_logic_vector(7 downto 0);
  signal r_sbox_io_sbOut0 : std_logic_vector(7 downto 0);
  signal r_sbox_io_sbOut1 : std_logic_vector(7 downto 0);
  signal r_mixcolumns1_io_mcOut1 : std_logic_vector(7 downto 0);
  signal r_mixcolumns1_io_mcOut2 : std_logic_vector(7 downto 0);
  signal r_mixcolumns1_io_mcOut3 : std_logic_vector(7 downto 0);
  signal r_mixcolumns1_io_mcOut4 : std_logic_vector(7 downto 0);
  signal r_mixcolumns2_io_mcOut1 : std_logic_vector(7 downto 0);
  signal r_mixcolumns2_io_mcOut2 : std_logic_vector(7 downto 0);
  signal r_mixcolumns2_io_mcOut3 : std_logic_vector(7 downto 0);
  signal r_mixcolumns2_io_mcOut4 : std_logic_vector(7 downto 0);
  signal zz_io_ct1_payload : std_logic_vector(7 downto 0);
  signal zz_io_ct1_payload_1 : unsigned(1 downto 0);
  signal zz_io_ct1_payload_2 : std_logic_vector(7 downto 0);
  signal zz_io_ct1_payload_3 : unsigned(1 downto 0);
  signal zz_io_ct1_payload_4 : std_logic_vector(7 downto 0);
  signal zz_io_ct1_payload_5 : unsigned(1 downto 0);
  signal zz_io_ct1_payload_6 : std_logic_vector(7 downto 0);
  signal zz_io_ct1_payload_7 : unsigned(1 downto 0);
  signal zz_io_ct2_payload : std_logic_vector(7 downto 0);
  signal zz_io_ct2_payload_1 : unsigned(1 downto 0);
  signal zz_io_ct2_payload_2 : std_logic_vector(7 downto 0);
  signal zz_io_ct2_payload_3 : unsigned(1 downto 0);
  signal zz_io_ct2_payload_4 : std_logic_vector(7 downto 0);
  signal zz_io_ct2_payload_5 : unsigned(1 downto 0);
  signal zz_io_ct2_payload_6 : std_logic_vector(7 downto 0);
  signal zz_io_ct2_payload_7 : unsigned(1 downto 0);

  signal r_stateReg1_0_0 : std_logic_vector(7 downto 0);
  signal r_stateReg1_0_1 : std_logic_vector(7 downto 0);
  signal r_stateReg1_0_2 : std_logic_vector(7 downto 0);
  signal r_stateReg1_0_3 : std_logic_vector(7 downto 0);
  signal r_stateReg1_1_0 : std_logic_vector(7 downto 0);
  signal r_stateReg1_1_1 : std_logic_vector(7 downto 0);
  signal r_stateReg1_1_2 : std_logic_vector(7 downto 0);
  signal r_stateReg1_1_3 : std_logic_vector(7 downto 0);
  signal r_stateReg1_2_0 : std_logic_vector(7 downto 0);
  signal r_stateReg1_2_1 : std_logic_vector(7 downto 0);
  signal r_stateReg1_2_2 : std_logic_vector(7 downto 0);
  signal r_stateReg1_2_3 : std_logic_vector(7 downto 0);
  signal r_stateReg1_3_0 : std_logic_vector(7 downto 0);
  signal r_stateReg1_3_1 : std_logic_vector(7 downto 0);
  signal r_stateReg1_3_2 : std_logic_vector(7 downto 0);
  signal r_stateReg1_3_3 : std_logic_vector(7 downto 0);
  signal r_stateReg2_0_0 : std_logic_vector(7 downto 0);
  signal r_stateReg2_0_1 : std_logic_vector(7 downto 0);
  signal r_stateReg2_0_2 : std_logic_vector(7 downto 0);
  signal r_stateReg2_0_3 : std_logic_vector(7 downto 0);
  signal r_stateReg2_1_0 : std_logic_vector(7 downto 0);
  signal r_stateReg2_1_1 : std_logic_vector(7 downto 0);
  signal r_stateReg2_1_2 : std_logic_vector(7 downto 0);
  signal r_stateReg2_1_3 : std_logic_vector(7 downto 0);
  signal r_stateReg2_2_0 : std_logic_vector(7 downto 0);
  signal r_stateReg2_2_1 : std_logic_vector(7 downto 0);
  signal r_stateReg2_2_2 : std_logic_vector(7 downto 0);
  signal r_stateReg2_2_3 : std_logic_vector(7 downto 0);
  signal r_stateReg2_3_0 : std_logic_vector(7 downto 0);
  signal r_stateReg2_3_1 : std_logic_vector(7 downto 0);
  signal r_stateReg2_3_2 : std_logic_vector(7 downto 0);
  signal r_stateReg2_3_3 : std_logic_vector(7 downto 0);
  signal r_keyReg1_0_0 : std_logic_vector(7 downto 0);
  signal r_keyReg1_0_1 : std_logic_vector(7 downto 0);
  signal r_keyReg1_0_2 : std_logic_vector(7 downto 0);
  signal r_keyReg1_0_3 : std_logic_vector(7 downto 0);
  signal r_keyReg1_1_0 : std_logic_vector(7 downto 0);
  signal r_keyReg1_1_1 : std_logic_vector(7 downto 0);
  signal r_keyReg1_1_2 : std_logic_vector(7 downto 0);
  signal r_keyReg1_1_3 : std_logic_vector(7 downto 0);
  signal r_keyReg1_2_0 : std_logic_vector(7 downto 0);
  signal r_keyReg1_2_1 : std_logic_vector(7 downto 0);
  signal r_keyReg1_2_2 : std_logic_vector(7 downto 0);
  signal r_keyReg1_2_3 : std_logic_vector(7 downto 0);
  signal r_keyReg1_3_0 : std_logic_vector(7 downto 0);
  signal r_keyReg1_3_1 : std_logic_vector(7 downto 0);
  signal r_keyReg1_3_2 : std_logic_vector(7 downto 0);
  signal r_keyReg1_3_3 : std_logic_vector(7 downto 0);
  signal r_keyReg2_0_0 : std_logic_vector(7 downto 0);
  signal r_keyReg2_0_1 : std_logic_vector(7 downto 0);
  signal r_keyReg2_0_2 : std_logic_vector(7 downto 0);
  signal r_keyReg2_0_3 : std_logic_vector(7 downto 0);
  signal r_keyReg2_1_0 : std_logic_vector(7 downto 0);
  signal r_keyReg2_1_1 : std_logic_vector(7 downto 0);
  signal r_keyReg2_1_2 : std_logic_vector(7 downto 0);
  signal r_keyReg2_1_3 : std_logic_vector(7 downto 0);
  signal r_keyReg2_2_0 : std_logic_vector(7 downto 0);
  signal r_keyReg2_2_1 : std_logic_vector(7 downto 0);
  signal r_keyReg2_2_2 : std_logic_vector(7 downto 0);
  signal r_keyReg2_2_3 : std_logic_vector(7 downto 0);
  signal r_keyReg2_3_0 : std_logic_vector(7 downto 0);
  signal r_keyReg2_3_1 : std_logic_vector(7 downto 0);
  signal r_keyReg2_3_2 : std_logic_vector(7 downto 0);
  signal r_keyReg2_3_3 : std_logic_vector(7 downto 0);
  signal r_fsmState : States2;
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
  signal when_AES_Masked_l44 : std_logic;
  signal r_rc : std_logic_vector(7 downto 0);
  signal r_stateRotation : std_logic;
  signal r_shiftRowsRotation : std_logic;
  signal r_mixColumnsRotation : std_logic;
  signal r_keyRotation : std_logic;
  signal r_keyRotation2 : std_logic;
  signal r_keySboxRotation : std_logic;
  signal r_keyRCRotation : std_logic;
  signal r_finalKeyAdd : std_logic;
  signal r_finalRound : std_logic;
  signal when_AES_Masked_l80 : std_logic;
  signal io_pt1_fire : std_logic;
  signal io_pt2_fire : std_logic;
  signal io_key1_fire : std_logic;
  signal io_key2_fire : std_logic;
  signal when_AES_Masked_l334 : std_logic;
  signal zz_1 : unsigned(3 downto 0);
  signal zz_r_stateReg1_0_0 : std_logic_vector(7 downto 0);
  signal zz_2 : unsigned(3 downto 0);
  signal zz_r_stateReg1_1_0 : std_logic_vector(7 downto 0);
  signal zz_3 : unsigned(3 downto 0);
  signal zz_r_stateReg1_2_0 : std_logic_vector(7 downto 0);
  signal zz_4 : unsigned(3 downto 0);
  signal zz_r_stateReg1_3_0 : std_logic_vector(7 downto 0);
  signal zz_5 : unsigned(3 downto 0);
  signal zz_r_stateReg2_0_0 : std_logic_vector(7 downto 0);
  signal zz_6 : unsigned(3 downto 0);
  signal zz_r_stateReg2_1_0 : std_logic_vector(7 downto 0);
  signal zz_7 : unsigned(3 downto 0);
  signal zz_r_stateReg2_2_0 : std_logic_vector(7 downto 0);
  signal zz_8 : unsigned(3 downto 0);
  signal zz_r_stateReg2_3_0 : std_logic_vector(7 downto 0);
  signal zz_9 : unsigned(3 downto 0);
  signal zz_r_keyReg1_0_0 : std_logic_vector(7 downto 0);
  signal zz_10 : unsigned(3 downto 0);
  signal zz_r_keyReg1_1_0 : std_logic_vector(7 downto 0);
  signal zz_11 : unsigned(3 downto 0);
  signal zz_r_keyReg1_2_0 : std_logic_vector(7 downto 0);
  signal zz_12 : unsigned(3 downto 0);
  signal zz_r_keyReg1_3_0 : std_logic_vector(7 downto 0);
  signal zz_13 : unsigned(3 downto 0);
  signal zz_r_keyReg2_0_0 : std_logic_vector(7 downto 0);
  signal zz_14 : unsigned(3 downto 0);
  signal zz_r_keyReg2_1_0 : std_logic_vector(7 downto 0);
  signal zz_15 : unsigned(3 downto 0);
  signal zz_r_keyReg2_2_0 : std_logic_vector(7 downto 0);
  signal zz_16 : unsigned(3 downto 0);
  signal zz_r_keyReg2_3_0 : std_logic_vector(7 downto 0);
  signal when_AES_Masked_l354 : std_logic;
  signal when_AES_Masked_l363 : std_logic;
  signal when_AES_Masked_l365 : std_logic;
  signal when_AES_Masked_l370 : std_logic;
  signal when_AES_Masked_l373 : std_logic;
  signal when_AES_Masked_l376 : std_logic;
  signal when_AES_Masked_l378 : std_logic;
  signal when_AES_Masked_l382 : std_logic;
  signal when_AES_Masked_l385 : std_logic;
  signal when_AES_Masked_l388 : std_logic;
  signal io_ct1_fire : std_logic;
  signal io_ct2_fire : std_logic;
  signal when_AES_Masked_l398 : std_logic;
  signal when_AES_Masked_l400 : std_logic;
begin
  io_pt1_ready <= io_pt1_ready_read_buffer;
  io_pt2_ready <= io_pt2_ready_read_buffer;
  io_key1_ready <= io_key1_ready_read_buffer;
  io_key2_ready <= io_key2_ready_read_buffer;
  io_ct1_valid <= io_ct1_valid_read_buffer;
  io_ct2_valid <= io_ct2_valid_read_buffer;
  zz_io_ct1_payload_1 <= pkg_extract(r_control_value,1,0);
  zz_io_ct1_payload_3 <= pkg_extract(r_control_value,1,0);
  zz_io_ct1_payload_5 <= pkg_extract(r_control_value,1,0);
  zz_io_ct1_payload_7 <= pkg_extract(r_control_value,1,0);
  zz_io_ct2_payload_1 <= pkg_extract(r_control_value,1,0);
  zz_io_ct2_payload_3 <= pkg_extract(r_control_value,1,0);
  zz_io_ct2_payload_5 <= pkg_extract(r_control_value,1,0);
  zz_io_ct2_payload_7 <= pkg_extract(r_control_value,1,0);
  r_addroundkey1 : entity work.AddRoundKey
    port map ( 
      io_a => r_stateReg1_0_0,
      io_k => r_keyReg1_0_0,
      io_b => r_addroundkey1_io_b 
    );
  r_addroundkey2 : entity work.AddRoundKey
    port map ( 
      io_a => r_stateReg2_0_0,
      io_k => r_keyReg2_0_0,
      io_b => r_addroundkey2_io_b 
    );
  r_sbox : entity work.SBoxMasked
    port map ( 
      io_sbIn0 => r_sbox_io_sbIn0,
      io_sbIn1 => r_sbox_io_sbIn1,
      io_m => io_m,
      io_sbOut0 => r_sbox_io_sbOut0,
      io_sbOut1 => r_sbox_io_sbOut1,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_mixcolumns1 : entity work.MixColumns
    port map ( 
      io_mcIn1 => r_stateReg1_0_0,
      io_mcIn2 => r_stateReg1_1_0,
      io_mcIn3 => r_stateReg1_2_0,
      io_mcIn4 => r_stateReg1_3_0,
      io_mcOut1 => r_mixcolumns1_io_mcOut1,
      io_mcOut2 => r_mixcolumns1_io_mcOut2,
      io_mcOut3 => r_mixcolumns1_io_mcOut3,
      io_mcOut4 => r_mixcolumns1_io_mcOut4 
    );
  r_mixcolumns2 : entity work.MixColumns
    port map ( 
      io_mcIn1 => r_stateReg2_0_0,
      io_mcIn2 => r_stateReg2_1_0,
      io_mcIn3 => r_stateReg2_2_0,
      io_mcIn4 => r_stateReg2_3_0,
      io_mcOut1 => r_mixcolumns2_io_mcOut1,
      io_mcOut2 => r_mixcolumns2_io_mcOut2,
      io_mcOut3 => r_mixcolumns2_io_mcOut3,
      io_mcOut4 => r_mixcolumns2_io_mcOut4 
    );
  process(zz_io_ct1_payload_1,r_stateReg1_0_0,r_stateReg1_0_1,r_stateReg1_0_2,r_stateReg1_0_3)
  begin
    case zz_io_ct1_payload_1 is
      when "00" =>
        zz_io_ct1_payload <= r_stateReg1_0_0;
      when "01" =>
        zz_io_ct1_payload <= r_stateReg1_0_1;
      when "10" =>
        zz_io_ct1_payload <= r_stateReg1_0_2;
      when others =>
        zz_io_ct1_payload <= r_stateReg1_0_3;
    end case;
  end process;

  process(zz_io_ct1_payload_3,r_stateReg1_1_0,r_stateReg1_1_1,r_stateReg1_1_2,r_stateReg1_1_3)
  begin
    case zz_io_ct1_payload_3 is
      when "00" =>
        zz_io_ct1_payload_2 <= r_stateReg1_1_0;
      when "01" =>
        zz_io_ct1_payload_2 <= r_stateReg1_1_1;
      when "10" =>
        zz_io_ct1_payload_2 <= r_stateReg1_1_2;
      when others =>
        zz_io_ct1_payload_2 <= r_stateReg1_1_3;
    end case;
  end process;

  process(zz_io_ct1_payload_5,r_stateReg1_2_0,r_stateReg1_2_1,r_stateReg1_2_2,r_stateReg1_2_3)
  begin
    case zz_io_ct1_payload_5 is
      when "00" =>
        zz_io_ct1_payload_4 <= r_stateReg1_2_0;
      when "01" =>
        zz_io_ct1_payload_4 <= r_stateReg1_2_1;
      when "10" =>
        zz_io_ct1_payload_4 <= r_stateReg1_2_2;
      when others =>
        zz_io_ct1_payload_4 <= r_stateReg1_2_3;
    end case;
  end process;

  process(zz_io_ct1_payload_7,r_stateReg1_3_0,r_stateReg1_3_1,r_stateReg1_3_2,r_stateReg1_3_3)
  begin
    case zz_io_ct1_payload_7 is
      when "00" =>
        zz_io_ct1_payload_6 <= r_stateReg1_3_0;
      when "01" =>
        zz_io_ct1_payload_6 <= r_stateReg1_3_1;
      when "10" =>
        zz_io_ct1_payload_6 <= r_stateReg1_3_2;
      when others =>
        zz_io_ct1_payload_6 <= r_stateReg1_3_3;
    end case;
  end process;

  process(zz_io_ct2_payload_1,r_stateReg2_0_0,r_stateReg2_0_1,r_stateReg2_0_2,r_stateReg2_0_3)
  begin
    case zz_io_ct2_payload_1 is
      when "00" =>
        zz_io_ct2_payload <= r_stateReg2_0_0;
      when "01" =>
        zz_io_ct2_payload <= r_stateReg2_0_1;
      when "10" =>
        zz_io_ct2_payload <= r_stateReg2_0_2;
      when others =>
        zz_io_ct2_payload <= r_stateReg2_0_3;
    end case;
  end process;

  process(zz_io_ct2_payload_3,r_stateReg2_1_0,r_stateReg2_1_1,r_stateReg2_1_2,r_stateReg2_1_3)
  begin
    case zz_io_ct2_payload_3 is
      when "00" =>
        zz_io_ct2_payload_2 <= r_stateReg2_1_0;
      when "01" =>
        zz_io_ct2_payload_2 <= r_stateReg2_1_1;
      when "10" =>
        zz_io_ct2_payload_2 <= r_stateReg2_1_2;
      when others =>
        zz_io_ct2_payload_2 <= r_stateReg2_1_3;
    end case;
  end process;

  process(zz_io_ct2_payload_5,r_stateReg2_2_0,r_stateReg2_2_1,r_stateReg2_2_2,r_stateReg2_2_3)
  begin
    case zz_io_ct2_payload_5 is
      when "00" =>
        zz_io_ct2_payload_4 <= r_stateReg2_2_0;
      when "01" =>
        zz_io_ct2_payload_4 <= r_stateReg2_2_1;
      when "10" =>
        zz_io_ct2_payload_4 <= r_stateReg2_2_2;
      when others =>
        zz_io_ct2_payload_4 <= r_stateReg2_2_3;
    end case;
  end process;

  process(zz_io_ct2_payload_7,r_stateReg2_3_0,r_stateReg2_3_1,r_stateReg2_3_2,r_stateReg2_3_3)
  begin
    case zz_io_ct2_payload_7 is
      when "00" =>
        zz_io_ct2_payload_6 <= r_stateReg2_3_0;
      when "01" =>
        zz_io_ct2_payload_6 <= r_stateReg2_3_1;
      when "10" =>
        zz_io_ct2_payload_6 <= r_stateReg2_3_2;
      when others =>
        zz_io_ct2_payload_6 <= r_stateReg2_3_3;
    end case;
  end process;

  process(r_control_willOverflow)
  begin
    r_round_willIncrement <= pkg_toStdLogic(false);
    if r_control_willOverflow = '1' then
      r_round_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  process(r_fsmState)
  begin
    r_round_willClear <= pkg_toStdLogic(false);
    case r_fsmState is
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

  process(r_fsmState,when_AES_Masked_l334,when_AES_Masked_l398)
  begin
    r_control_willIncrement <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        if when_AES_Masked_l334 = '1' then
          r_control_willIncrement <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.sRound =>
        r_control_willIncrement <= pkg_toStdLogic(true);
      when others =>
        if when_AES_Masked_l398 = '1' then
          r_control_willIncrement <= pkg_toStdLogic(true);
        end if;
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l354,when_AES_Masked_l363,when_AES_Masked_l365)
  begin
    r_control_willClear <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
        r_control_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sInit =>
        if when_AES_Masked_l354 = '1' then
          r_control_willClear <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.sRound =>
        if when_AES_Masked_l363 = '1' then
          if when_AES_Masked_l365 = '1' then
            r_control_willClear <= pkg_toStdLogic(true);
          end if;
        end if;
      when others =>
    end case;
  end process;

  r_control_willOverflowIfInc <= pkg_toStdLogic(r_control_value = pkg_unsigned("11000"));
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

  when_AES_Masked_l44 <= pkg_toStdLogic(unsigned(r_roundConstant) < pkg_unsigned("10000000"));
  process(r_fsmState,when_AES_Masked_l385,r_roundConstant)
  begin
    r_rc <= pkg_stdLogicVector("00000000");
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l385 = '1' then
          r_rc <= r_roundConstant;
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l363)
  begin
    r_stateRotation <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l363 = '1' then
          r_stateRotation <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l370)
  begin
    r_shiftRowsRotation <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l370 = '1' then
          r_shiftRowsRotation <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l373)
  begin
    r_mixColumnsRotation <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l373 = '1' then
          r_mixColumnsRotation <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l376)
  begin
    r_keyRotation <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l376 = '1' then
          r_keyRotation <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l376,when_AES_Masked_l378)
  begin
    r_keyRotation2 <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l376 = '1' then
          if when_AES_Masked_l378 = '1' then
            r_keyRotation2 <= pkg_toStdLogic(true);
          end if;
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l382)
  begin
    r_keySboxRotation <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l382 = '1' then
          r_keySboxRotation <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_fsmState,when_AES_Masked_l388)
  begin
    r_keyRCRotation <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
        if when_AES_Masked_l388 = '1' then
          r_keyRCRotation <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  r_finalKeyAdd <= pkg_toStdLogic(r_round_value = pkg_unsigned("1011"));
  r_finalRound <= pkg_toStdLogic(r_round_value = pkg_unsigned("1010"));
  when_AES_Masked_l80 <= pkg_toStdLogic(r_control_value < pkg_unsigned("10000"));
  process(when_AES_Masked_l80,r_addroundkey1_io_b,r_keyReg1_1_3)
  begin
    if when_AES_Masked_l80 = '1' then
      r_sbox_io_sbIn0 <= r_addroundkey1_io_b;
    else
      r_sbox_io_sbIn0 <= r_keyReg1_1_3;
    end if;
  end process;

  process(when_AES_Masked_l80,r_addroundkey2_io_b,r_keyReg2_1_3)
  begin
    if when_AES_Masked_l80 = '1' then
      r_sbox_io_sbIn1 <= r_addroundkey2_io_b;
    else
      r_sbox_io_sbIn1 <= r_keyReg2_1_3;
    end if;
  end process;

  process(r_fsmState)
  begin
    io_pt1_ready_read_buffer <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        io_pt1_ready_read_buffer <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  process(r_fsmState)
  begin
    io_pt2_ready_read_buffer <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        io_pt2_ready_read_buffer <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  process(r_fsmState)
  begin
    io_key1_ready_read_buffer <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        io_key1_ready_read_buffer <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  process(r_fsmState)
  begin
    io_key2_ready_read_buffer <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
        io_key2_ready_read_buffer <= pkg_toStdLogic(true);
      when pkg_enum.sRound =>
      when others =>
    end case;
  end process;

  process(r_fsmState)
  begin
    io_ct1_valid_read_buffer <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
      when others =>
        io_ct1_valid_read_buffer <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_fsmState)
  begin
    io_ct2_valid_read_buffer <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
      when others =>
        io_ct2_valid_read_buffer <= pkg_toStdLogic(true);
    end case;
  end process;

  io_ct1_payload <= pkg_cat(pkg_cat(pkg_cat(zz_io_ct1_payload,zz_io_ct1_payload_2),zz_io_ct1_payload_4),zz_io_ct1_payload_6);
  io_ct2_payload <= pkg_cat(pkg_cat(pkg_cat(zz_io_ct2_payload,zz_io_ct2_payload_2),zz_io_ct2_payload_4),zz_io_ct2_payload_6);
  process(r_fsmState)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_fsmState is
      when pkg_enum.sIdle =>
      when pkg_enum.sInit =>
      when pkg_enum.sRound =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  io_pt1_fire <= (io_pt1_valid and io_pt1_ready_read_buffer);
  io_pt2_fire <= (io_pt2_valid and io_pt2_ready_read_buffer);
  io_key1_fire <= (io_key1_valid and io_key1_ready_read_buffer);
  io_key2_fire <= (io_key2_valid and io_key2_ready_read_buffer);
  when_AES_Masked_l334 <= (((io_pt1_fire and io_pt2_fire) and io_key1_fire) and io_key2_fire);
  zz_1 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg1_0_0 <= pkg_extract(io_pt1_payload,31,24);
  zz_2 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg1_1_0 <= pkg_extract(io_pt1_payload,23,16);
  zz_3 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg1_2_0 <= pkg_extract(io_pt1_payload,15,8);
  zz_4 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg1_3_0 <= pkg_extract(io_pt1_payload,7,0);
  zz_5 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg2_0_0 <= pkg_extract(io_pt2_payload,31,24);
  zz_6 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg2_1_0 <= pkg_extract(io_pt2_payload,23,16);
  zz_7 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg2_2_0 <= pkg_extract(io_pt2_payload,15,8);
  zz_8 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_stateReg2_3_0 <= pkg_extract(io_pt2_payload,7,0);
  zz_9 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg1_0_0 <= pkg_extract(io_key1_payload,31,24);
  zz_10 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg1_1_0 <= pkg_extract(io_key1_payload,23,16);
  zz_11 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg1_2_0 <= pkg_extract(io_key1_payload,15,8);
  zz_12 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg1_3_0 <= pkg_extract(io_key1_payload,7,0);
  zz_13 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg2_0_0 <= pkg_extract(io_key2_payload,31,24);
  zz_14 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg2_1_0 <= pkg_extract(io_key2_payload,23,16);
  zz_15 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg2_2_0 <= pkg_extract(io_key2_payload,15,8);
  zz_16 <= pkg_shiftLeft(pkg_unsigned("1"),pkg_extract(r_control_value,1,0));
  zz_r_keyReg2_3_0 <= pkg_extract(io_key2_payload,7,0);
  when_AES_Masked_l354 <= pkg_toStdLogic(r_control_value = pkg_unsigned("00011"));
  when_AES_Masked_l363 <= pkg_toStdLogic(r_control_value < pkg_unsigned("10100"));
  when_AES_Masked_l365 <= (pkg_toStdLogic(r_control_value = pkg_unsigned("01111")) and pkg_toStdLogic(r_round_value = pkg_unsigned("1011")));
  when_AES_Masked_l370 <= pkg_toStdLogic(r_control_value = pkg_unsigned("10100"));
  when_AES_Masked_l373 <= pkg_toStdLogic(pkg_unsigned("10100") < r_control_value);
  when_AES_Masked_l376 <= pkg_toStdLogic(r_control_value < pkg_unsigned("10000"));
  when_AES_Masked_l378 <= (pkg_toStdLogic(r_control_value < pkg_unsigned("01100")) and pkg_toStdLogic(pkg_unsigned("0001") < r_round_value));
  when_AES_Masked_l382 <= (pkg_toStdLogic(pkg_unsigned("10000") <= r_control_value) and pkg_toStdLogic(r_control_value < pkg_unsigned("10100")));
  when_AES_Masked_l385 <= pkg_toStdLogic(r_control_value = pkg_unsigned("10100"));
  when_AES_Masked_l388 <= (pkg_toStdLogic(pkg_unsigned("10100") <= r_control_value) and pkg_toStdLogic(r_control_value < pkg_unsigned("11000")));
  io_ct1_fire <= (io_ct1_valid_read_buffer and io_ct1_ready);
  io_ct2_fire <= (io_ct2_valid_read_buffer and io_ct2_ready);
  when_AES_Masked_l398 <= (io_ct1_fire and io_ct2_fire);
  when_AES_Masked_l400 <= pkg_toStdLogic(r_control_value = pkg_unsigned("00011"));
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_stateReg1_0_0 <= pkg_stdLogicVector("00000000");
      r_stateReg1_0_1 <= pkg_stdLogicVector("00000000");
      r_stateReg1_0_2 <= pkg_stdLogicVector("00000000");
      r_stateReg1_0_3 <= pkg_stdLogicVector("00000000");
      r_stateReg1_1_0 <= pkg_stdLogicVector("00000000");
      r_stateReg1_1_1 <= pkg_stdLogicVector("00000000");
      r_stateReg1_1_2 <= pkg_stdLogicVector("00000000");
      r_stateReg1_1_3 <= pkg_stdLogicVector("00000000");
      r_stateReg1_2_0 <= pkg_stdLogicVector("00000000");
      r_stateReg1_2_1 <= pkg_stdLogicVector("00000000");
      r_stateReg1_2_2 <= pkg_stdLogicVector("00000000");
      r_stateReg1_2_3 <= pkg_stdLogicVector("00000000");
      r_stateReg1_3_0 <= pkg_stdLogicVector("00000000");
      r_stateReg1_3_1 <= pkg_stdLogicVector("00000000");
      r_stateReg1_3_2 <= pkg_stdLogicVector("00000000");
      r_stateReg1_3_3 <= pkg_stdLogicVector("00000000");
      r_stateReg2_0_0 <= pkg_stdLogicVector("00000000");
      r_stateReg2_0_1 <= pkg_stdLogicVector("00000000");
      r_stateReg2_0_2 <= pkg_stdLogicVector("00000000");
      r_stateReg2_0_3 <= pkg_stdLogicVector("00000000");
      r_stateReg2_1_0 <= pkg_stdLogicVector("00000000");
      r_stateReg2_1_1 <= pkg_stdLogicVector("00000000");
      r_stateReg2_1_2 <= pkg_stdLogicVector("00000000");
      r_stateReg2_1_3 <= pkg_stdLogicVector("00000000");
      r_stateReg2_2_0 <= pkg_stdLogicVector("00000000");
      r_stateReg2_2_1 <= pkg_stdLogicVector("00000000");
      r_stateReg2_2_2 <= pkg_stdLogicVector("00000000");
      r_stateReg2_2_3 <= pkg_stdLogicVector("00000000");
      r_stateReg2_3_0 <= pkg_stdLogicVector("00000000");
      r_stateReg2_3_1 <= pkg_stdLogicVector("00000000");
      r_stateReg2_3_2 <= pkg_stdLogicVector("00000000");
      r_stateReg2_3_3 <= pkg_stdLogicVector("00000000");
      r_keyReg1_0_0 <= pkg_stdLogicVector("00000000");
      r_keyReg1_0_1 <= pkg_stdLogicVector("00000000");
      r_keyReg1_0_2 <= pkg_stdLogicVector("00000000");
      r_keyReg1_0_3 <= pkg_stdLogicVector("00000000");
      r_keyReg1_1_0 <= pkg_stdLogicVector("00000000");
      r_keyReg1_1_1 <= pkg_stdLogicVector("00000000");
      r_keyReg1_1_2 <= pkg_stdLogicVector("00000000");
      r_keyReg1_1_3 <= pkg_stdLogicVector("00000000");
      r_keyReg1_2_0 <= pkg_stdLogicVector("00000000");
      r_keyReg1_2_1 <= pkg_stdLogicVector("00000000");
      r_keyReg1_2_2 <= pkg_stdLogicVector("00000000");
      r_keyReg1_2_3 <= pkg_stdLogicVector("00000000");
      r_keyReg1_3_0 <= pkg_stdLogicVector("00000000");
      r_keyReg1_3_1 <= pkg_stdLogicVector("00000000");
      r_keyReg1_3_2 <= pkg_stdLogicVector("00000000");
      r_keyReg1_3_3 <= pkg_stdLogicVector("00000000");
      r_keyReg2_0_0 <= pkg_stdLogicVector("00000000");
      r_keyReg2_0_1 <= pkg_stdLogicVector("00000000");
      r_keyReg2_0_2 <= pkg_stdLogicVector("00000000");
      r_keyReg2_0_3 <= pkg_stdLogicVector("00000000");
      r_keyReg2_1_0 <= pkg_stdLogicVector("00000000");
      r_keyReg2_1_1 <= pkg_stdLogicVector("00000000");
      r_keyReg2_1_2 <= pkg_stdLogicVector("00000000");
      r_keyReg2_1_3 <= pkg_stdLogicVector("00000000");
      r_keyReg2_2_0 <= pkg_stdLogicVector("00000000");
      r_keyReg2_2_1 <= pkg_stdLogicVector("00000000");
      r_keyReg2_2_2 <= pkg_stdLogicVector("00000000");
      r_keyReg2_2_3 <= pkg_stdLogicVector("00000000");
      r_keyReg2_3_0 <= pkg_stdLogicVector("00000000");
      r_keyReg2_3_1 <= pkg_stdLogicVector("00000000");
      r_keyReg2_3_2 <= pkg_stdLogicVector("00000000");
      r_keyReg2_3_3 <= pkg_stdLogicVector("00000000");
      r_fsmState <= pkg_enum.sIdle;
      r_round_value <= pkg_unsigned("0001");
      r_control_value <= pkg_unsigned("00000");
      r_roundConstant <= pkg_stdLogicVector("00000001");
    elsif rising_edge(io_clk) then
      r_round_value <= r_round_valueNext;
      r_control_value <= r_control_valueNext;
      if r_control_willOverflow = '1' then
        if when_AES_Masked_l44 = '1' then
          r_roundConstant <= std_logic_vector(shift_left(unsigned(r_roundConstant),1));
        else
          r_roundConstant <= (std_logic_vector(shift_left(unsigned(r_roundConstant),1)) xor pkg_stdLogicVector("00011011"));
        end if;
      end if;
      if r_stateRotation = '1' then
        r_stateReg1_0_0 <= r_stateReg1_1_0;
        r_stateReg1_1_0 <= r_stateReg1_2_0;
        r_stateReg1_2_0 <= r_stateReg1_3_0;
        r_stateReg1_3_0 <= r_stateReg1_0_1;
        r_stateReg1_0_1 <= r_stateReg1_1_1;
        r_stateReg1_1_1 <= r_stateReg1_2_1;
        r_stateReg1_2_1 <= r_stateReg1_3_1;
        r_stateReg1_3_1 <= r_stateReg1_0_2;
        r_stateReg1_0_2 <= r_stateReg1_1_2;
        r_stateReg1_1_2 <= r_stateReg1_2_2;
        r_stateReg1_2_2 <= r_stateReg1_3_2;
        r_stateReg1_3_2 <= r_stateReg1_0_3;
        r_stateReg1_0_3 <= r_stateReg1_1_3;
        r_stateReg1_1_3 <= r_stateReg1_2_3;
        r_stateReg1_2_3 <= r_stateReg1_3_3;
        r_stateReg1_3_3 <= r_sbox_io_sbOut0;
        if r_finalKeyAdd = '1' then
          r_stateReg1_3_3 <= r_addroundkey1_io_b;
        end if;
        r_stateReg2_0_0 <= r_stateReg2_1_0;
        r_stateReg2_1_0 <= r_stateReg2_2_0;
        r_stateReg2_2_0 <= r_stateReg2_3_0;
        r_stateReg2_3_0 <= r_stateReg2_0_1;
        r_stateReg2_0_1 <= r_stateReg2_1_1;
        r_stateReg2_1_1 <= r_stateReg2_2_1;
        r_stateReg2_2_1 <= r_stateReg2_3_1;
        r_stateReg2_3_1 <= r_stateReg2_0_2;
        r_stateReg2_0_2 <= r_stateReg2_1_2;
        r_stateReg2_1_2 <= r_stateReg2_2_2;
        r_stateReg2_2_2 <= r_stateReg2_3_2;
        r_stateReg2_3_2 <= r_stateReg2_0_3;
        r_stateReg2_0_3 <= r_stateReg2_1_3;
        r_stateReg2_1_3 <= r_stateReg2_2_3;
        r_stateReg2_2_3 <= r_stateReg2_3_3;
        r_stateReg2_3_3 <= r_sbox_io_sbOut1;
        if r_finalKeyAdd = '1' then
          r_stateReg2_3_3 <= r_addroundkey2_io_b;
        end if;
      else
        if r_shiftRowsRotation = '1' then
          r_stateReg1_0_0 <= r_stateReg1_0_0;
          r_stateReg1_0_1 <= r_stateReg1_0_1;
          r_stateReg1_0_2 <= r_stateReg1_0_2;
          r_stateReg1_0_3 <= r_stateReg1_0_3;
          r_stateReg1_1_0 <= r_stateReg1_1_1;
          r_stateReg1_1_1 <= r_stateReg1_1_2;
          r_stateReg1_1_2 <= r_stateReg1_1_3;
          r_stateReg1_1_3 <= r_stateReg1_1_0;
          r_stateReg1_2_0 <= r_stateReg1_2_2;
          r_stateReg1_2_1 <= r_stateReg1_2_3;
          r_stateReg1_2_2 <= r_stateReg1_2_0;
          r_stateReg1_2_3 <= r_stateReg1_2_1;
          r_stateReg1_3_0 <= r_stateReg1_3_3;
          r_stateReg1_3_1 <= r_stateReg1_3_0;
          r_stateReg1_3_2 <= r_stateReg1_3_1;
          r_stateReg1_3_3 <= r_stateReg1_3_2;
          r_stateReg2_0_0 <= r_stateReg2_0_0;
          r_stateReg2_0_1 <= r_stateReg2_0_1;
          r_stateReg2_0_2 <= r_stateReg2_0_2;
          r_stateReg2_0_3 <= r_stateReg2_0_3;
          r_stateReg2_1_0 <= r_stateReg2_1_1;
          r_stateReg2_1_1 <= r_stateReg2_1_2;
          r_stateReg2_1_2 <= r_stateReg2_1_3;
          r_stateReg2_1_3 <= r_stateReg2_1_0;
          r_stateReg2_2_0 <= r_stateReg2_2_2;
          r_stateReg2_2_1 <= r_stateReg2_2_3;
          r_stateReg2_2_2 <= r_stateReg2_2_0;
          r_stateReg2_2_3 <= r_stateReg2_2_1;
          r_stateReg2_3_0 <= r_stateReg2_3_3;
          r_stateReg2_3_1 <= r_stateReg2_3_0;
          r_stateReg2_3_2 <= r_stateReg2_3_1;
          r_stateReg2_3_3 <= r_stateReg2_3_2;
        else
          if r_mixColumnsRotation = '1' then
            r_stateReg1_0_0 <= r_stateReg1_0_1;
            r_stateReg1_1_0 <= r_stateReg1_1_1;
            r_stateReg1_2_0 <= r_stateReg1_2_1;
            r_stateReg1_3_0 <= r_stateReg1_3_1;
            r_stateReg1_0_1 <= r_stateReg1_0_2;
            r_stateReg1_1_1 <= r_stateReg1_1_2;
            r_stateReg1_2_1 <= r_stateReg1_2_2;
            r_stateReg1_3_1 <= r_stateReg1_3_2;
            r_stateReg1_0_2 <= r_stateReg1_0_3;
            r_stateReg1_1_2 <= r_stateReg1_1_3;
            r_stateReg1_2_2 <= r_stateReg1_2_3;
            r_stateReg1_3_2 <= r_stateReg1_3_3;
            r_stateReg1_0_3 <= r_mixcolumns1_io_mcOut1;
            r_stateReg1_1_3 <= r_mixcolumns1_io_mcOut2;
            r_stateReg1_2_3 <= r_mixcolumns1_io_mcOut3;
            r_stateReg1_3_3 <= r_mixcolumns1_io_mcOut4;
            if r_finalRound = '1' then
              r_stateReg1_0_3 <= r_stateReg1_0_0;
              r_stateReg1_1_3 <= r_stateReg1_1_0;
              r_stateReg1_2_3 <= r_stateReg1_2_0;
              r_stateReg1_3_3 <= r_stateReg1_3_0;
            end if;
            r_stateReg2_0_0 <= r_stateReg2_0_1;
            r_stateReg2_1_0 <= r_stateReg2_1_1;
            r_stateReg2_2_0 <= r_stateReg2_2_1;
            r_stateReg2_3_0 <= r_stateReg2_3_1;
            r_stateReg2_0_1 <= r_stateReg2_0_2;
            r_stateReg2_1_1 <= r_stateReg2_1_2;
            r_stateReg2_2_1 <= r_stateReg2_2_2;
            r_stateReg2_3_1 <= r_stateReg2_3_2;
            r_stateReg2_0_2 <= r_stateReg2_0_3;
            r_stateReg2_1_2 <= r_stateReg2_1_3;
            r_stateReg2_2_2 <= r_stateReg2_2_3;
            r_stateReg2_3_2 <= r_stateReg2_3_3;
            r_stateReg2_0_3 <= r_mixcolumns2_io_mcOut1;
            r_stateReg2_1_3 <= r_mixcolumns2_io_mcOut2;
            r_stateReg2_2_3 <= r_mixcolumns2_io_mcOut3;
            r_stateReg2_3_3 <= r_mixcolumns2_io_mcOut4;
            if r_finalRound = '1' then
              r_stateReg2_0_3 <= r_stateReg2_0_0;
              r_stateReg2_1_3 <= r_stateReg2_1_0;
              r_stateReg2_2_3 <= r_stateReg2_2_0;
              r_stateReg2_3_3 <= r_stateReg2_3_0;
            end if;
          end if;
        end if;
      end if;
      if r_keyRotation = '1' then
        r_keyReg1_0_0 <= r_keyReg1_1_0;
        r_keyReg1_1_0 <= r_keyReg1_2_0;
        r_keyReg1_2_0 <= r_keyReg1_3_0;
        r_keyReg1_0_1 <= r_keyReg1_1_1;
        r_keyReg1_1_1 <= r_keyReg1_2_1;
        r_keyReg1_2_1 <= r_keyReg1_3_1;
        r_keyReg1_0_2 <= r_keyReg1_1_2;
        r_keyReg1_1_2 <= r_keyReg1_2_2;
        r_keyReg1_2_2 <= r_keyReg1_3_2;
        r_keyReg1_0_3 <= r_keyReg1_1_3;
        r_keyReg1_1_3 <= r_keyReg1_2_3;
        r_keyReg1_2_3 <= r_keyReg1_3_3;
        r_keyReg1_3_0 <= r_keyReg1_0_1;
        r_keyReg1_3_1 <= r_keyReg1_0_2;
        r_keyReg1_3_2 <= r_keyReg1_0_3;
        r_keyReg1_3_3 <= r_keyReg1_0_0;
        r_keyReg2_0_0 <= r_keyReg2_1_0;
        r_keyReg2_1_0 <= r_keyReg2_2_0;
        r_keyReg2_2_0 <= r_keyReg2_3_0;
        r_keyReg2_0_1 <= r_keyReg2_1_1;
        r_keyReg2_1_1 <= r_keyReg2_2_1;
        r_keyReg2_2_1 <= r_keyReg2_3_1;
        r_keyReg2_0_2 <= r_keyReg2_1_2;
        r_keyReg2_1_2 <= r_keyReg2_2_2;
        r_keyReg2_2_2 <= r_keyReg2_3_2;
        r_keyReg2_0_3 <= r_keyReg2_1_3;
        r_keyReg2_1_3 <= r_keyReg2_2_3;
        r_keyReg2_2_3 <= r_keyReg2_3_3;
        r_keyReg2_3_0 <= r_keyReg2_0_1;
        r_keyReg2_3_1 <= r_keyReg2_0_2;
        r_keyReg2_3_2 <= r_keyReg2_0_3;
        r_keyReg2_3_3 <= r_keyReg2_0_0;
        if r_keyRotation2 = '1' then
          r_keyReg1_3_0 <= (r_keyReg1_0_0 xor r_keyReg1_0_1);
          r_keyReg1_3_1 <= r_keyReg1_0_2;
          r_keyReg1_3_2 <= r_keyReg1_0_3;
          r_keyReg1_3_3 <= r_keyReg1_0_0;
          r_keyReg2_3_0 <= (r_keyReg2_0_0 xor r_keyReg2_0_1);
          r_keyReg2_3_1 <= r_keyReg2_0_2;
          r_keyReg2_3_2 <= r_keyReg2_0_3;
          r_keyReg2_3_3 <= r_keyReg2_0_0;
        end if;
      else
        if r_keySboxRotation = '1' then
          r_keyReg1_1_3 <= r_keyReg1_2_3;
          r_keyReg1_2_3 <= r_keyReg1_3_3;
          r_keyReg1_3_3 <= r_keyReg1_0_3;
          r_keyReg1_0_3 <= r_keyReg1_1_3;
          r_keyReg2_1_3 <= r_keyReg2_2_3;
          r_keyReg2_2_3 <= r_keyReg2_3_3;
          r_keyReg2_3_3 <= r_keyReg2_0_3;
          r_keyReg2_0_3 <= r_keyReg2_1_3;
        else
          if r_keyRCRotation = '1' then
            r_keyReg1_0_0 <= r_keyReg1_1_0;
            r_keyReg1_1_0 <= r_keyReg1_2_0;
            r_keyReg1_2_0 <= r_keyReg1_3_0;
            r_keyReg1_3_0 <= ((r_sbox_io_sbOut0 xor r_keyReg1_0_0) xor r_rc);
            r_keyReg2_0_0 <= r_keyReg2_1_0;
            r_keyReg2_1_0 <= r_keyReg2_2_0;
            r_keyReg2_2_0 <= r_keyReg2_3_0;
            r_keyReg2_3_0 <= (r_sbox_io_sbOut1 xor r_keyReg2_0_0);
          end if;
        end if;
      end if;
      case r_fsmState is
        when pkg_enum.sIdle =>
          r_fsmState <= pkg_enum.sIdle;
          r_stateReg1_0_0 <= pkg_stdLogicVector("00000000");
          r_stateReg1_0_1 <= pkg_stdLogicVector("00000000");
          r_stateReg1_0_2 <= pkg_stdLogicVector("00000000");
          r_stateReg1_0_3 <= pkg_stdLogicVector("00000000");
          r_stateReg1_1_0 <= pkg_stdLogicVector("00000000");
          r_stateReg1_1_1 <= pkg_stdLogicVector("00000000");
          r_stateReg1_1_2 <= pkg_stdLogicVector("00000000");
          r_stateReg1_1_3 <= pkg_stdLogicVector("00000000");
          r_stateReg1_2_0 <= pkg_stdLogicVector("00000000");
          r_stateReg1_2_1 <= pkg_stdLogicVector("00000000");
          r_stateReg1_2_2 <= pkg_stdLogicVector("00000000");
          r_stateReg1_2_3 <= pkg_stdLogicVector("00000000");
          r_stateReg1_3_0 <= pkg_stdLogicVector("00000000");
          r_stateReg1_3_1 <= pkg_stdLogicVector("00000000");
          r_stateReg1_3_2 <= pkg_stdLogicVector("00000000");
          r_stateReg1_3_3 <= pkg_stdLogicVector("00000000");
          r_stateReg2_0_0 <= pkg_stdLogicVector("00000000");
          r_stateReg2_0_1 <= pkg_stdLogicVector("00000000");
          r_stateReg2_0_2 <= pkg_stdLogicVector("00000000");
          r_stateReg2_0_3 <= pkg_stdLogicVector("00000000");
          r_stateReg2_1_0 <= pkg_stdLogicVector("00000000");
          r_stateReg2_1_1 <= pkg_stdLogicVector("00000000");
          r_stateReg2_1_2 <= pkg_stdLogicVector("00000000");
          r_stateReg2_1_3 <= pkg_stdLogicVector("00000000");
          r_stateReg2_2_0 <= pkg_stdLogicVector("00000000");
          r_stateReg2_2_1 <= pkg_stdLogicVector("00000000");
          r_stateReg2_2_2 <= pkg_stdLogicVector("00000000");
          r_stateReg2_2_3 <= pkg_stdLogicVector("00000000");
          r_stateReg2_3_0 <= pkg_stdLogicVector("00000000");
          r_stateReg2_3_1 <= pkg_stdLogicVector("00000000");
          r_stateReg2_3_2 <= pkg_stdLogicVector("00000000");
          r_stateReg2_3_3 <= pkg_stdLogicVector("00000000");
          r_keyReg1_0_0 <= pkg_stdLogicVector("00000000");
          r_keyReg1_0_1 <= pkg_stdLogicVector("00000000");
          r_keyReg1_0_2 <= pkg_stdLogicVector("00000000");
          r_keyReg1_0_3 <= pkg_stdLogicVector("00000000");
          r_keyReg1_1_0 <= pkg_stdLogicVector("00000000");
          r_keyReg1_1_1 <= pkg_stdLogicVector("00000000");
          r_keyReg1_1_2 <= pkg_stdLogicVector("00000000");
          r_keyReg1_1_3 <= pkg_stdLogicVector("00000000");
          r_keyReg1_2_0 <= pkg_stdLogicVector("00000000");
          r_keyReg1_2_1 <= pkg_stdLogicVector("00000000");
          r_keyReg1_2_2 <= pkg_stdLogicVector("00000000");
          r_keyReg1_2_3 <= pkg_stdLogicVector("00000000");
          r_keyReg1_3_0 <= pkg_stdLogicVector("00000000");
          r_keyReg1_3_1 <= pkg_stdLogicVector("00000000");
          r_keyReg1_3_2 <= pkg_stdLogicVector("00000000");
          r_keyReg1_3_3 <= pkg_stdLogicVector("00000000");
          r_keyReg2_0_0 <= pkg_stdLogicVector("00000000");
          r_keyReg2_0_1 <= pkg_stdLogicVector("00000000");
          r_keyReg2_0_2 <= pkg_stdLogicVector("00000000");
          r_keyReg2_0_3 <= pkg_stdLogicVector("00000000");
          r_keyReg2_1_0 <= pkg_stdLogicVector("00000000");
          r_keyReg2_1_1 <= pkg_stdLogicVector("00000000");
          r_keyReg2_1_2 <= pkg_stdLogicVector("00000000");
          r_keyReg2_1_3 <= pkg_stdLogicVector("00000000");
          r_keyReg2_2_0 <= pkg_stdLogicVector("00000000");
          r_keyReg2_2_1 <= pkg_stdLogicVector("00000000");
          r_keyReg2_2_2 <= pkg_stdLogicVector("00000000");
          r_keyReg2_2_3 <= pkg_stdLogicVector("00000000");
          r_keyReg2_3_0 <= pkg_stdLogicVector("00000000");
          r_keyReg2_3_1 <= pkg_stdLogicVector("00000000");
          r_keyReg2_3_2 <= pkg_stdLogicVector("00000000");
          r_keyReg2_3_3 <= pkg_stdLogicVector("00000000");
          r_roundConstant <= pkg_stdLogicVector("00000001");
          if io_enable = '1' then
            r_fsmState <= pkg_enum.sInit;
          end if;
        when pkg_enum.sInit =>
          r_fsmState <= pkg_enum.sInit;
          if pkg_extract(zz_1,0) = '1' then
            r_stateReg1_0_0 <= zz_r_stateReg1_0_0;
          end if;
          if pkg_extract(zz_1,1) = '1' then
            r_stateReg1_0_1 <= zz_r_stateReg1_0_0;
          end if;
          if pkg_extract(zz_1,2) = '1' then
            r_stateReg1_0_2 <= zz_r_stateReg1_0_0;
          end if;
          if pkg_extract(zz_1,3) = '1' then
            r_stateReg1_0_3 <= zz_r_stateReg1_0_0;
          end if;
          if pkg_extract(zz_2,0) = '1' then
            r_stateReg1_1_0 <= zz_r_stateReg1_1_0;
          end if;
          if pkg_extract(zz_2,1) = '1' then
            r_stateReg1_1_1 <= zz_r_stateReg1_1_0;
          end if;
          if pkg_extract(zz_2,2) = '1' then
            r_stateReg1_1_2 <= zz_r_stateReg1_1_0;
          end if;
          if pkg_extract(zz_2,3) = '1' then
            r_stateReg1_1_3 <= zz_r_stateReg1_1_0;
          end if;
          if pkg_extract(zz_3,0) = '1' then
            r_stateReg1_2_0 <= zz_r_stateReg1_2_0;
          end if;
          if pkg_extract(zz_3,1) = '1' then
            r_stateReg1_2_1 <= zz_r_stateReg1_2_0;
          end if;
          if pkg_extract(zz_3,2) = '1' then
            r_stateReg1_2_2 <= zz_r_stateReg1_2_0;
          end if;
          if pkg_extract(zz_3,3) = '1' then
            r_stateReg1_2_3 <= zz_r_stateReg1_2_0;
          end if;
          if pkg_extract(zz_4,0) = '1' then
            r_stateReg1_3_0 <= zz_r_stateReg1_3_0;
          end if;
          if pkg_extract(zz_4,1) = '1' then
            r_stateReg1_3_1 <= zz_r_stateReg1_3_0;
          end if;
          if pkg_extract(zz_4,2) = '1' then
            r_stateReg1_3_2 <= zz_r_stateReg1_3_0;
          end if;
          if pkg_extract(zz_4,3) = '1' then
            r_stateReg1_3_3 <= zz_r_stateReg1_3_0;
          end if;
          if pkg_extract(zz_5,0) = '1' then
            r_stateReg2_0_0 <= zz_r_stateReg2_0_0;
          end if;
          if pkg_extract(zz_5,1) = '1' then
            r_stateReg2_0_1 <= zz_r_stateReg2_0_0;
          end if;
          if pkg_extract(zz_5,2) = '1' then
            r_stateReg2_0_2 <= zz_r_stateReg2_0_0;
          end if;
          if pkg_extract(zz_5,3) = '1' then
            r_stateReg2_0_3 <= zz_r_stateReg2_0_0;
          end if;
          if pkg_extract(zz_6,0) = '1' then
            r_stateReg2_1_0 <= zz_r_stateReg2_1_0;
          end if;
          if pkg_extract(zz_6,1) = '1' then
            r_stateReg2_1_1 <= zz_r_stateReg2_1_0;
          end if;
          if pkg_extract(zz_6,2) = '1' then
            r_stateReg2_1_2 <= zz_r_stateReg2_1_0;
          end if;
          if pkg_extract(zz_6,3) = '1' then
            r_stateReg2_1_3 <= zz_r_stateReg2_1_0;
          end if;
          if pkg_extract(zz_7,0) = '1' then
            r_stateReg2_2_0 <= zz_r_stateReg2_2_0;
          end if;
          if pkg_extract(zz_7,1) = '1' then
            r_stateReg2_2_1 <= zz_r_stateReg2_2_0;
          end if;
          if pkg_extract(zz_7,2) = '1' then
            r_stateReg2_2_2 <= zz_r_stateReg2_2_0;
          end if;
          if pkg_extract(zz_7,3) = '1' then
            r_stateReg2_2_3 <= zz_r_stateReg2_2_0;
          end if;
          if pkg_extract(zz_8,0) = '1' then
            r_stateReg2_3_0 <= zz_r_stateReg2_3_0;
          end if;
          if pkg_extract(zz_8,1) = '1' then
            r_stateReg2_3_1 <= zz_r_stateReg2_3_0;
          end if;
          if pkg_extract(zz_8,2) = '1' then
            r_stateReg2_3_2 <= zz_r_stateReg2_3_0;
          end if;
          if pkg_extract(zz_8,3) = '1' then
            r_stateReg2_3_3 <= zz_r_stateReg2_3_0;
          end if;
          if pkg_extract(zz_9,0) = '1' then
            r_keyReg1_0_0 <= zz_r_keyReg1_0_0;
          end if;
          if pkg_extract(zz_9,1) = '1' then
            r_keyReg1_0_1 <= zz_r_keyReg1_0_0;
          end if;
          if pkg_extract(zz_9,2) = '1' then
            r_keyReg1_0_2 <= zz_r_keyReg1_0_0;
          end if;
          if pkg_extract(zz_9,3) = '1' then
            r_keyReg1_0_3 <= zz_r_keyReg1_0_0;
          end if;
          if pkg_extract(zz_10,0) = '1' then
            r_keyReg1_1_0 <= zz_r_keyReg1_1_0;
          end if;
          if pkg_extract(zz_10,1) = '1' then
            r_keyReg1_1_1 <= zz_r_keyReg1_1_0;
          end if;
          if pkg_extract(zz_10,2) = '1' then
            r_keyReg1_1_2 <= zz_r_keyReg1_1_0;
          end if;
          if pkg_extract(zz_10,3) = '1' then
            r_keyReg1_1_3 <= zz_r_keyReg1_1_0;
          end if;
          if pkg_extract(zz_11,0) = '1' then
            r_keyReg1_2_0 <= zz_r_keyReg1_2_0;
          end if;
          if pkg_extract(zz_11,1) = '1' then
            r_keyReg1_2_1 <= zz_r_keyReg1_2_0;
          end if;
          if pkg_extract(zz_11,2) = '1' then
            r_keyReg1_2_2 <= zz_r_keyReg1_2_0;
          end if;
          if pkg_extract(zz_11,3) = '1' then
            r_keyReg1_2_3 <= zz_r_keyReg1_2_0;
          end if;
          if pkg_extract(zz_12,0) = '1' then
            r_keyReg1_3_0 <= zz_r_keyReg1_3_0;
          end if;
          if pkg_extract(zz_12,1) = '1' then
            r_keyReg1_3_1 <= zz_r_keyReg1_3_0;
          end if;
          if pkg_extract(zz_12,2) = '1' then
            r_keyReg1_3_2 <= zz_r_keyReg1_3_0;
          end if;
          if pkg_extract(zz_12,3) = '1' then
            r_keyReg1_3_3 <= zz_r_keyReg1_3_0;
          end if;
          if pkg_extract(zz_13,0) = '1' then
            r_keyReg2_0_0 <= zz_r_keyReg2_0_0;
          end if;
          if pkg_extract(zz_13,1) = '1' then
            r_keyReg2_0_1 <= zz_r_keyReg2_0_0;
          end if;
          if pkg_extract(zz_13,2) = '1' then
            r_keyReg2_0_2 <= zz_r_keyReg2_0_0;
          end if;
          if pkg_extract(zz_13,3) = '1' then
            r_keyReg2_0_3 <= zz_r_keyReg2_0_0;
          end if;
          if pkg_extract(zz_14,0) = '1' then
            r_keyReg2_1_0 <= zz_r_keyReg2_1_0;
          end if;
          if pkg_extract(zz_14,1) = '1' then
            r_keyReg2_1_1 <= zz_r_keyReg2_1_0;
          end if;
          if pkg_extract(zz_14,2) = '1' then
            r_keyReg2_1_2 <= zz_r_keyReg2_1_0;
          end if;
          if pkg_extract(zz_14,3) = '1' then
            r_keyReg2_1_3 <= zz_r_keyReg2_1_0;
          end if;
          if pkg_extract(zz_15,0) = '1' then
            r_keyReg2_2_0 <= zz_r_keyReg2_2_0;
          end if;
          if pkg_extract(zz_15,1) = '1' then
            r_keyReg2_2_1 <= zz_r_keyReg2_2_0;
          end if;
          if pkg_extract(zz_15,2) = '1' then
            r_keyReg2_2_2 <= zz_r_keyReg2_2_0;
          end if;
          if pkg_extract(zz_15,3) = '1' then
            r_keyReg2_2_3 <= zz_r_keyReg2_2_0;
          end if;
          if pkg_extract(zz_16,0) = '1' then
            r_keyReg2_3_0 <= zz_r_keyReg2_3_0;
          end if;
          if pkg_extract(zz_16,1) = '1' then
            r_keyReg2_3_1 <= zz_r_keyReg2_3_0;
          end if;
          if pkg_extract(zz_16,2) = '1' then
            r_keyReg2_3_2 <= zz_r_keyReg2_3_0;
          end if;
          if pkg_extract(zz_16,3) = '1' then
            r_keyReg2_3_3 <= zz_r_keyReg2_3_0;
          end if;
          if when_AES_Masked_l354 = '1' then
            r_fsmState <= pkg_enum.sRound;
          end if;
        when pkg_enum.sRound =>
          r_fsmState <= pkg_enum.sRound;
          if when_AES_Masked_l363 = '1' then
            if when_AES_Masked_l365 = '1' then
              r_fsmState <= pkg_enum.sDone;
            end if;
          end if;
        when others =>
          r_fsmState <= pkg_enum.sDone;
          if when_AES_Masked_l398 = '1' then
            if when_AES_Masked_l400 = '1' then
              r_fsmState <= pkg_enum.sIdle;
            end if;
          end if;
      end case;
    end if;
  end process;

end arch;

