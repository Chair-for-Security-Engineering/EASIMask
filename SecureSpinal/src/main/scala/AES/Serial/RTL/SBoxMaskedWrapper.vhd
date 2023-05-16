-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : SBoxMaskedWrapper
-- Git hash  : 5dddc5a360ffe28dad22b1b12d714c1fa8824bd3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type SBoxMaskedWrapperStates is (sIdle,sLoadData,sExecute,sWriteData,sDone);

  function pkg_mux (sel : std_logic; one : SBoxMaskedWrapperStates; zero : SBoxMaskedWrapperStates) return SBoxMaskedWrapperStates;
  function pkg_toStdLogicVector_native (value : SBoxMaskedWrapperStates) return std_logic_vector;
  function pkg_toSBoxMaskedWrapperStates_native (value : std_logic_vector(2 downto 0)) return SBoxMaskedWrapperStates;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : SBoxMaskedWrapperStates; zero : SBoxMaskedWrapperStates) return SBoxMaskedWrapperStates is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toSBoxMaskedWrapperStates_native (value : std_logic_vector(2 downto 0)) return SBoxMaskedWrapperStates is
  begin
    case value is
      when "000" => return sIdle;
      when "001" => return sLoadData;
      when "010" => return sExecute;
      when "011" => return sWriteData;
      when "100" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : SBoxMaskedWrapperStates) return std_logic_vector is
  begin
    case value is
      when sIdle => return "000";
      when sLoadData => return "001";
      when sExecute => return "010";
      when sWriteData => return "011";
      when sDone => return "100";
      when others => return "000";
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


--G4Mul_33 replaced by G4Mul


--G4Mul_34 replaced by G4Mul


--G4Mul_35 replaced by G4Mul


--G4ScaleN_11 replaced by G4ScaleN


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


--G4Mul_45 replaced by G4Mul


--G4Mul_46 replaced by G4Mul


--G4Mul_47 replaced by G4Mul


--G4Mul_48 replaced by G4Mul


--G4Mul_49 replaced by G4Mul


--G4Mul_50 replaced by G4Mul


--G4Mul_51 replaced by G4Mul


--G4Mul_52 replaced by G4Mul


--G4Mul_53 replaced by G4Mul


--G4Mul_54 replaced by G4Mul


--G4Mul_55 replaced by G4Mul


--G4Mul_56 replaced by G4Mul


--G4Mul_57 replaced by G4Mul


--G4Mul_58 replaced by G4Mul


--G4Mul_59 replaced by G4Mul

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
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_x_0 : in std_logic_vector(1 downto 0);
    io_x_1 : in std_logic_vector(1 downto 0);
    io_y_0 : in std_logic_vector(1 downto 0);
    io_y_1 : in std_logic_vector(1 downto 0);
    io_m : in std_logic_vector(3 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0)
  );
end G4Mul2SharesDepMul;

architecture arch of G4Mul2SharesDepMul is
  signal g4Mul_64_io_b : std_logic_vector(1 downto 0);
  signal g4Mul_65_io_b : std_logic_vector(1 downto 0);
  signal g4Mul_60_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_61_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_62_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_63_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_64_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_65_io_x : std_logic_vector(1 downto 0);

  signal r_xTimesBlindedY_0 : std_logic_vector(1 downto 0);
  signal r_xTimesBlindedY_1 : std_logic_vector(1 downto 0);
  signal r_xTimesM_0 : std_logic_vector(1 downto 0);
  signal r_xTimesM_1 : std_logic_vector(1 downto 0);
  signal r_xTimesY_0 : std_logic_vector(1 downto 0);
  signal r_xTimesY_1 : std_logic_vector(1 downto 0);
  signal r_blindedY_0 : std_logic_vector(1 downto 0);
  signal r_blindedY_1 : std_logic_vector(1 downto 0);
  signal r_xTimesMBlinded_0 : std_logic_vector(1 downto 0);
  signal r_xTimesMBlinded_1 : std_logic_vector(1 downto 0);
  signal r_X_0 : std_logic_vector(1 downto 0);
  signal r_X_1 : std_logic_vector(1 downto 0);
  signal r_Y_0 : std_logic_vector(1 downto 0);
  signal r_Y_1 : std_logic_vector(1 downto 0);
begin
  g4Mul_60 : entity work.G4Mul
    port map ( 
      io_a => r_X_0,
      io_b => r_blindedY_0,
      io_x => g4Mul_60_io_x 
    );
  g4Mul_61 : entity work.G4Mul
    port map ( 
      io_a => r_X_1,
      io_b => r_blindedY_1,
      io_x => g4Mul_61_io_x 
    );
  g4Mul_62 : entity work.G4Mul
    port map ( 
      io_a => r_X_0,
      io_b => r_Y_0,
      io_x => g4Mul_62_io_x 
    );
  g4Mul_63 : entity work.G4Mul
    port map ( 
      io_a => r_X_1,
      io_b => r_Y_1,
      io_x => g4Mul_63_io_x 
    );
  g4Mul_64 : entity work.G4Mul
    port map ( 
      io_a => io_x_0,
      io_b => g4Mul_64_io_b,
      io_x => g4Mul_64_io_x 
    );
  g4Mul_65 : entity work.G4Mul
    port map ( 
      io_a => io_x_1,
      io_b => g4Mul_65_io_b,
      io_x => g4Mul_65_io_x 
    );
  io_z_0 <= ((r_xTimesY_0 xor r_xTimesBlindedY_0) xor r_xTimesMBlinded_0);
  io_z_1 <= ((r_xTimesY_1 xor r_xTimesBlindedY_1) xor r_xTimesMBlinded_1);
  r_xTimesBlindedY_0 <= g4Mul_60_io_x;
  r_xTimesBlindedY_1 <= g4Mul_61_io_x;
  r_xTimesY_0 <= g4Mul_62_io_x;
  r_xTimesY_1 <= g4Mul_63_io_x;
  g4Mul_64_io_b <= pkg_extract(io_m,3,2);
  r_xTimesM_0 <= g4Mul_64_io_x;
  g4Mul_65_io_b <= pkg_extract(io_m,3,2);
  r_xTimesM_1 <= g4Mul_65_io_x;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_blindedY_0 <= pkg_stdLogicVector("00");
      r_blindedY_1 <= pkg_stdLogicVector("00");
      r_xTimesMBlinded_0 <= pkg_stdLogicVector("00");
      r_xTimesMBlinded_1 <= pkg_stdLogicVector("00");
      r_X_0 <= pkg_stdLogicVector("00");
      r_X_1 <= pkg_stdLogicVector("00");
      r_Y_0 <= pkg_stdLogicVector("00");
      r_Y_1 <= pkg_stdLogicVector("00");
    elsif rising_edge(io_clk) then
      r_X_0 <= io_x_0;
      r_X_1 <= io_x_1;
      r_Y_0 <= io_y_0;
      r_Y_1 <= io_y_1;
      r_blindedY_0 <= (io_y_1 xor pkg_extract(io_m,3,2));
      r_blindedY_1 <= (io_y_0 xor pkg_extract(io_m,3,2));
      r_xTimesMBlinded_0 <= (r_xTimesM_0 xor pkg_extract(io_m,1,0));
      r_xTimesMBlinded_1 <= (r_xTimesM_1 xor pkg_extract(io_m,1,0));
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
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_y_0 : in std_logic_vector(3 downto 0);
    io_y_1 : in std_logic_vector(3 downto 0);
    io_m : in std_logic_vector(7 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0)
  );
end G16Mul2SharesDepMul;

architecture arch of G16Mul2SharesDepMul is
  signal g16Mul_18_io_b : std_logic_vector(3 downto 0);
  signal g16Mul_19_io_b : std_logic_vector(3 downto 0);
  signal g16Mul_14_io_x : std_logic_vector(3 downto 0);
  signal g16Mul_15_io_x : std_logic_vector(3 downto 0);
  signal g16Mul_16_io_x : std_logic_vector(3 downto 0);
  signal g16Mul_17_io_x : std_logic_vector(3 downto 0);
  signal g16Mul_18_io_x : std_logic_vector(3 downto 0);
  signal g16Mul_19_io_x : std_logic_vector(3 downto 0);

  signal r_xTimesBlindedY_0 : std_logic_vector(3 downto 0);
  signal r_xTimesBlindedY_1 : std_logic_vector(3 downto 0);
  signal r_xTimesM_0 : std_logic_vector(3 downto 0);
  signal r_xTimesM_1 : std_logic_vector(3 downto 0);
  signal r_xTimesY_0 : std_logic_vector(3 downto 0);
  signal r_xTimesY_1 : std_logic_vector(3 downto 0);
  signal r_blindedY_0 : std_logic_vector(3 downto 0);
  signal r_blindedY_1 : std_logic_vector(3 downto 0);
  signal r_xTimesMBlinded_0 : std_logic_vector(3 downto 0);
  signal r_xTimesMBlinded_1 : std_logic_vector(3 downto 0);
  signal r_X_0 : std_logic_vector(3 downto 0);
  signal r_X_1 : std_logic_vector(3 downto 0);
  signal r_Y_0 : std_logic_vector(3 downto 0);
  signal r_Y_1 : std_logic_vector(3 downto 0);
begin
  g16Mul_14 : entity work.G16Mul
    port map ( 
      io_a => r_X_0,
      io_b => r_blindedY_0,
      io_x => g16Mul_14_io_x 
    );
  g16Mul_15 : entity work.G16Mul
    port map ( 
      io_a => r_X_1,
      io_b => r_blindedY_1,
      io_x => g16Mul_15_io_x 
    );
  g16Mul_16 : entity work.G16Mul
    port map ( 
      io_a => r_X_0,
      io_b => r_Y_0,
      io_x => g16Mul_16_io_x 
    );
  g16Mul_17 : entity work.G16Mul
    port map ( 
      io_a => r_X_1,
      io_b => r_Y_1,
      io_x => g16Mul_17_io_x 
    );
  g16Mul_18 : entity work.G16Mul
    port map ( 
      io_a => io_x_0,
      io_b => g16Mul_18_io_b,
      io_x => g16Mul_18_io_x 
    );
  g16Mul_19 : entity work.G16Mul
    port map ( 
      io_a => io_x_1,
      io_b => g16Mul_19_io_b,
      io_x => g16Mul_19_io_x 
    );
  io_z_0 <= ((r_xTimesY_0 xor r_xTimesBlindedY_0) xor r_xTimesMBlinded_0);
  io_z_1 <= ((r_xTimesY_1 xor r_xTimesBlindedY_1) xor r_xTimesMBlinded_1);
  r_xTimesBlindedY_0 <= g16Mul_14_io_x;
  r_xTimesBlindedY_1 <= g16Mul_15_io_x;
  r_xTimesY_0 <= g16Mul_16_io_x;
  r_xTimesY_1 <= g16Mul_17_io_x;
  g16Mul_18_io_b <= pkg_extract(io_m,7,4);
  r_xTimesM_0 <= g16Mul_18_io_x;
  g16Mul_19_io_b <= pkg_extract(io_m,7,4);
  r_xTimesM_1 <= g16Mul_19_io_x;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_blindedY_0 <= pkg_stdLogicVector("0000");
      r_blindedY_1 <= pkg_stdLogicVector("0000");
      r_xTimesMBlinded_0 <= pkg_stdLogicVector("0000");
      r_xTimesMBlinded_1 <= pkg_stdLogicVector("0000");
      r_X_0 <= pkg_stdLogicVector("0000");
      r_X_1 <= pkg_stdLogicVector("0000");
      r_Y_0 <= pkg_stdLogicVector("0000");
      r_Y_1 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      r_X_0 <= io_x_0;
      r_X_1 <= io_x_1;
      r_Y_0 <= io_y_0;
      r_Y_1 <= io_y_1;
      r_blindedY_0 <= (io_y_1 xor pkg_extract(io_m,7,4));
      r_blindedY_1 <= (io_y_0 xor pkg_extract(io_m,7,4));
      r_xTimesMBlinded_0 <= (r_xTimesM_0 xor pkg_extract(io_m,3,0));
      r_xTimesMBlinded_1 <= (r_xTimesM_1 xor pkg_extract(io_m,3,0));
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


entity G16Mul2SharesIndepMul is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_y_0 : in std_logic_vector(3 downto 0);
    io_y_1 : in std_logic_vector(3 downto 0);
    io_m : in std_logic_vector(3 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0)
  );
end G16Mul2SharesIndepMul;

architecture arch of G16Mul2SharesIndepMul is
  signal r_mul1_io_x : std_logic_vector(3 downto 0);
  signal r_mul2_io_x : std_logic_vector(3 downto 0);
  signal r_mul3_io_x : std_logic_vector(3 downto 0);
  signal r_mul4_io_x : std_logic_vector(3 downto 0);

  signal r_r0 : std_logic_vector(3 downto 0);
  signal r_r1 : std_logic_vector(3 downto 0);
  signal r_r2 : std_logic_vector(3 downto 0);
  signal r_r3 : std_logic_vector(3 downto 0);
begin
  r_mul1 : entity work.G16Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_0,
      io_x => r_mul1_io_x 
    );
  r_mul2 : entity work.G16Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_1,
      io_x => r_mul2_io_x 
    );
  r_mul3 : entity work.G16Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_0,
      io_x => r_mul3_io_x 
    );
  r_mul4 : entity work.G16Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_1,
      io_x => r_mul4_io_x 
    );
  io_z_0 <= (r_r0 xor r_r1);
  io_z_1 <= (r_r2 xor r_r3);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_r0 <= pkg_stdLogicVector("0000");
      r_r1 <= pkg_stdLogicVector("0000");
      r_r2 <= pkg_stdLogicVector("0000");
      r_r3 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      r_r0 <= r_mul1_io_x;
      r_r1 <= (r_mul2_io_x xor io_m);
      r_r2 <= (r_mul3_io_x xor io_m);
      r_r3 <= r_mul4_io_x;
    end if;
  end process;

end arch;


--G16Mul2SharesIndepMul_1 replaced by G16Mul2SharesIndepMul

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity G16Inv2SharesDep is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_x_0 : in std_logic_vector(3 downto 0);
    io_x_1 : in std_logic_vector(3 downto 0);
    io_m : in std_logic_vector(11 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0)
  );
end G16Inv2SharesDep;

architecture arch of G16Inv2SharesDep is
  signal r_mul1_io_m : std_logic_vector(3 downto 0);
  signal r_mul2_io_m : std_logic_vector(3 downto 0);
  signal r_mul3_io_m : std_logic_vector(3 downto 0);
  signal g4Sq_8_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_9_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_10_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_11_io_t : std_logic_vector(1 downto 0);
  signal r_mul1_io_z_0 : std_logic_vector(1 downto 0);
  signal r_mul1_io_z_1 : std_logic_vector(1 downto 0);
  signal r_mul2_io_z_0 : std_logic_vector(1 downto 0);
  signal r_mul2_io_z_1 : std_logic_vector(1 downto 0);
  signal r_mul3_io_z_0 : std_logic_vector(1 downto 0);
  signal r_mul3_io_z_1 : std_logic_vector(1 downto 0);
  signal g4Sq_8_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_16_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_9_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_10_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_17_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_11_io_x : std_logic_vector(1 downto 0);

  signal r_a_0 : std_logic_vector(1 downto 0);
  signal r_a_1 : std_logic_vector(1 downto 0);
  signal r_b_0 : std_logic_vector(1 downto 0);
  signal r_b_1 : std_logic_vector(1 downto 0);
  signal r_d_0 : std_logic_vector(1 downto 0);
  signal r_d_1 : std_logic_vector(1 downto 0);
  signal r_e_0 : std_logic_vector(1 downto 0);
  signal r_e_1 : std_logic_vector(1 downto 0);
  signal r_p_0 : std_logic_vector(1 downto 0);
  signal r_p_1 : std_logic_vector(1 downto 0);
  signal r_q_0 : std_logic_vector(1 downto 0);
  signal r_q_1 : std_logic_vector(1 downto 0);
  signal r_c_0 : std_logic_vector(1 downto 0);
  signal r_c_1 : std_logic_vector(1 downto 0);
  signal r_a1_0 : std_logic_vector(1 downto 0);
  signal r_a1_1 : std_logic_vector(1 downto 0);
  signal r_b1_0 : std_logic_vector(1 downto 0);
  signal r_b1_1 : std_logic_vector(1 downto 0);
begin
  r_mul1 : entity work.G4Mul2SharesDepMul
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_a_0,
      io_x_1 => r_a_1,
      io_y_0 => r_b_0,
      io_y_1 => r_b_1,
      io_m => r_mul1_io_m,
      io_z_0 => r_mul1_io_z_0,
      io_z_1 => r_mul1_io_z_1 
    );
  r_mul2 : entity work.G4Mul2SharesDepMul
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_b1_0,
      io_x_1 => r_b1_1,
      io_y_0 => r_e_0,
      io_y_1 => r_e_1,
      io_m => r_mul2_io_m,
      io_z_0 => r_mul2_io_z_0,
      io_z_1 => r_mul2_io_z_1 
    );
  r_mul3 : entity work.G4Mul2SharesDepMul
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_a1_0,
      io_x_1 => r_a1_1,
      io_y_0 => r_e_0,
      io_y_1 => r_e_1,
      io_m => r_mul3_io_m,
      io_z_0 => r_mul3_io_z_0,
      io_z_1 => r_mul3_io_z_1 
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
  r_a_0 <= pkg_extract(io_x_0,3,2);
  r_b_0 <= pkg_extract(io_x_0,1,0);
  g4Sq_8_io_t <= (r_a_0 xor r_b_0);
  g4Sq_9_io_t <= (r_c_0 xor r_d_0);
  r_e_0 <= g4Sq_9_io_x;
  r_a_1 <= pkg_extract(io_x_1,3,2);
  r_b_1 <= pkg_extract(io_x_1,1,0);
  g4Sq_10_io_t <= (r_a_1 xor r_b_1);
  g4Sq_11_io_t <= (r_c_1 xor r_d_1);
  r_e_1 <= g4Sq_11_io_x;
  r_mul1_io_m <= pkg_extract(io_m,11,8);
  r_d_0 <= r_mul1_io_z_0;
  r_d_1 <= r_mul1_io_z_1;
  r_mul2_io_m <= pkg_extract(io_m,7,4);
  r_p_0 <= r_mul2_io_z_0;
  r_p_1 <= r_mul2_io_z_1;
  r_mul3_io_m <= pkg_extract(io_m,3,0);
  r_q_0 <= r_mul3_io_z_0;
  r_q_1 <= r_mul3_io_z_1;
  io_z_0 <= pkg_cat(r_p_0,r_q_0);
  io_z_1 <= pkg_cat(r_p_1,r_q_1);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_c_0 <= pkg_stdLogicVector("00");
      r_c_1 <= pkg_stdLogicVector("00");
      r_a1_0 <= pkg_stdLogicVector("00");
      r_a1_1 <= pkg_stdLogicVector("00");
      r_b1_0 <= pkg_stdLogicVector("00");
      r_b1_1 <= pkg_stdLogicVector("00");
    elsif rising_edge(io_clk) then
      r_a1_0 <= r_a_0;
      r_b1_0 <= r_b_0;
      r_c_0 <= g4ScaleN_16_io_x;
      r_a1_1 <= r_a_1;
      r_b1_1 <= r_b_1;
      r_c_1 <= g4ScaleN_17_io_x;
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
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_x_0 : in std_logic_vector(7 downto 0);
    io_x_1 : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(27 downto 0);
    io_z_0 : out std_logic_vector(7 downto 0);
    io_z_1 : out std_logic_vector(7 downto 0)
  );
end G256Inv2Shares5Stages;

architecture arch of G256Inv2Shares5Stages is
  signal r_mul1_io_m : std_logic_vector(7 downto 0);
  signal r_mul2_io_m : std_logic_vector(3 downto 0);
  signal r_mul3_io_m : std_logic_vector(3 downto 0);
  signal r_inv_io_x_0 : std_logic_vector(3 downto 0);
  signal r_inv_io_x_1 : std_logic_vector(3 downto 0);
  signal r_inv_io_m : std_logic_vector(11 downto 0);
  signal g16SqSc_2_io_t : std_logic_vector(3 downto 0);
  signal g16SqSc_3_io_t : std_logic_vector(3 downto 0);
  signal r_mul1_io_z_0 : std_logic_vector(3 downto 0);
  signal r_mul1_io_z_1 : std_logic_vector(3 downto 0);
  signal r_mul2_io_z_0 : std_logic_vector(3 downto 0);
  signal r_mul2_io_z_1 : std_logic_vector(3 downto 0);
  signal r_mul3_io_z_0 : std_logic_vector(3 downto 0);
  signal r_mul3_io_z_1 : std_logic_vector(3 downto 0);
  signal r_inv_io_z_0 : std_logic_vector(3 downto 0);
  signal r_inv_io_z_1 : std_logic_vector(3 downto 0);
  signal g16SqSc_2_io_x : std_logic_vector(3 downto 0);
  signal g16SqSc_3_io_x : std_logic_vector(3 downto 0);

  signal r_a_0 : std_logic_vector(3 downto 0);
  signal r_a_1 : std_logic_vector(3 downto 0);
  signal r_b_0 : std_logic_vector(3 downto 0);
  signal r_b_1 : std_logic_vector(3 downto 0);
  signal r_d_0 : std_logic_vector(3 downto 0);
  signal r_d_1 : std_logic_vector(3 downto 0);
  signal r_e_0 : std_logic_vector(3 downto 0);
  signal r_e_1 : std_logic_vector(3 downto 0);
  signal r_f_0 : std_logic_vector(3 downto 0);
  signal r_f_1 : std_logic_vector(3 downto 0);
  signal r_p_0 : std_logic_vector(3 downto 0);
  signal r_p_1 : std_logic_vector(3 downto 0);
  signal r_q_0 : std_logic_vector(3 downto 0);
  signal r_q_1 : std_logic_vector(3 downto 0);
  signal r_a1_0 : std_logic_vector(3 downto 0);
  signal r_a1_1 : std_logic_vector(3 downto 0);
  signal r_a2_0 : std_logic_vector(3 downto 0);
  signal r_a2_1 : std_logic_vector(3 downto 0);
  signal r_a3_0 : std_logic_vector(3 downto 0);
  signal r_a3_1 : std_logic_vector(3 downto 0);
  signal r_b1_0 : std_logic_vector(3 downto 0);
  signal r_b1_1 : std_logic_vector(3 downto 0);
  signal r_b2_0 : std_logic_vector(3 downto 0);
  signal r_b2_1 : std_logic_vector(3 downto 0);
  signal r_b3_0 : std_logic_vector(3 downto 0);
  signal r_b3_1 : std_logic_vector(3 downto 0);
  signal r_c_0 : std_logic_vector(3 downto 0);
  signal r_c_1 : std_logic_vector(3 downto 0);
begin
  r_mul1 : entity work.G16Mul2SharesDepMul
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_a_0,
      io_x_1 => r_a_1,
      io_y_0 => r_b_0,
      io_y_1 => r_b_1,
      io_m => r_mul1_io_m,
      io_z_0 => r_mul1_io_z_0,
      io_z_1 => r_mul1_io_z_1 
    );
  r_mul2 : entity work.G16Mul2SharesIndepMul
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_b3_0,
      io_x_1 => r_b3_1,
      io_y_0 => r_f_0,
      io_y_1 => r_f_1,
      io_m => r_mul2_io_m,
      io_z_0 => r_mul2_io_z_0,
      io_z_1 => r_mul2_io_z_1 
    );
  r_mul3 : entity work.G16Mul2SharesIndepMul
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_a3_0,
      io_x_1 => r_a3_1,
      io_y_0 => r_f_0,
      io_y_1 => r_f_1,
      io_m => r_mul3_io_m,
      io_z_0 => r_mul3_io_z_0,
      io_z_1 => r_mul3_io_z_1 
    );
  r_inv : entity work.G16Inv2SharesDep
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => r_inv_io_x_0,
      io_x_1 => r_inv_io_x_1,
      io_m => r_inv_io_m,
      io_z_0 => r_inv_io_z_0,
      io_z_1 => r_inv_io_z_1 
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
  r_a_0 <= pkg_extract(io_x_0,7,4);
  r_b_0 <= pkg_extract(io_x_0,3,0);
  r_a_1 <= pkg_extract(io_x_1,7,4);
  r_b_1 <= pkg_extract(io_x_1,3,0);
  g16SqSc_2_io_t <= (r_a_0 xor r_b_0);
  g16SqSc_3_io_t <= (r_a_1 xor r_b_1);
  r_mul1_io_m <= pkg_extract(io_m,27,20);
  r_d_0 <= r_mul1_io_z_0;
  r_d_1 <= r_mul1_io_z_1;
  r_inv_io_x_0 <= (r_c_0 xor r_d_0);
  r_inv_io_x_1 <= (r_c_1 xor r_d_1);
  r_inv_io_m <= pkg_extract(io_m,19,8);
  r_f_0 <= r_inv_io_z_0;
  r_f_1 <= r_inv_io_z_1;
  r_mul2_io_m <= pkg_extract(io_m,7,4);
  r_p_0 <= r_mul2_io_z_0;
  r_p_1 <= r_mul2_io_z_1;
  r_mul3_io_m <= pkg_extract(io_m,3,0);
  r_q_0 <= r_mul3_io_z_0;
  r_q_1 <= r_mul3_io_z_1;
  io_z_0 <= pkg_cat(r_p_0,r_q_0);
  io_z_1 <= pkg_cat(r_p_1,r_q_1);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_a1_0 <= pkg_stdLogicVector("0000");
      r_a1_1 <= pkg_stdLogicVector("0000");
      r_a2_0 <= pkg_stdLogicVector("0000");
      r_a2_1 <= pkg_stdLogicVector("0000");
      r_a3_0 <= pkg_stdLogicVector("0000");
      r_a3_1 <= pkg_stdLogicVector("0000");
      r_b1_0 <= pkg_stdLogicVector("0000");
      r_b1_1 <= pkg_stdLogicVector("0000");
      r_b2_0 <= pkg_stdLogicVector("0000");
      r_b2_1 <= pkg_stdLogicVector("0000");
      r_b3_0 <= pkg_stdLogicVector("0000");
      r_b3_1 <= pkg_stdLogicVector("0000");
      r_c_0 <= pkg_stdLogicVector("0000");
      r_c_1 <= pkg_stdLogicVector("0000");
    elsif rising_edge(io_clk) then
      r_a1_0 <= r_a_0;
      r_a2_0 <= r_a1_0;
      r_a3_0 <= r_a2_0;
      r_b1_0 <= r_b_0;
      r_b2_0 <= r_b1_0;
      r_b3_0 <= r_b2_0;
      r_a1_1 <= r_a_1;
      r_a2_1 <= r_a1_1;
      r_a3_1 <= r_a2_1;
      r_b1_1 <= r_b_1;
      r_b2_1 <= r_b1_1;
      r_b3_1 <= r_b2_1;
      r_c_0 <= g16SqSc_2_io_x;
      r_c_1 <= g16SqSc_3_io_x;
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


entity SBoxMasked is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_sbIn0 : in std_logic_vector(7 downto 0);
    io_sbIn1 : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(27 downto 0);
    io_sbOut0 : out std_logic_vector(7 downto 0);
    io_sbOut1 : out std_logic_vector(7 downto 0)
  );
end SBoxMasked;

architecture arch of SBoxMasked is
  signal convert0_io_output : std_logic_vector(7 downto 0);
  signal convert1_io_output : std_logic_vector(7 downto 0);
  signal convert2_io_output : std_logic_vector(7 downto 0);
  signal convert3_io_output : std_logic_vector(7 downto 0);
  signal inv_io_z_0 : std_logic_vector(7 downto 0);
  signal inv_io_z_1 : std_logic_vector(7 downto 0);

begin
  convert0 : entity work.NewBasis
    port map ( 
      io_input => io_sbIn0,
      io_direction => pkg_toStdLogic(false),
      io_output => convert0_io_output 
    );
  convert1 : entity work.NewBasis
    port map ( 
      io_input => io_sbIn1,
      io_direction => pkg_toStdLogic(false),
      io_output => convert1_io_output 
    );
  convert2 : entity work.NewBasis
    port map ( 
      io_input => inv_io_z_0,
      io_direction => pkg_toStdLogic(true),
      io_output => convert2_io_output 
    );
  convert3 : entity work.NewBasis
    port map ( 
      io_input => inv_io_z_1,
      io_direction => pkg_toStdLogic(true),
      io_output => convert3_io_output 
    );
  inv : entity work.G256Inv2Shares5Stages
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_x_0 => convert0_io_output,
      io_x_1 => convert1_io_output,
      io_m => io_m,
      io_z_0 => inv_io_z_0,
      io_z_1 => inv_io_z_1 
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


entity SBoxMaskedWrapper is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_resetFull : in std_logic;
    io_enable : in std_logic;
    io_dataIn : in std_logic_vector(15 downto 0);
    io_m : in std_logic_vector(27 downto 0);
    io_dataOut : out std_logic_vector(15 downto 0);
    io_done : out std_logic
  );
end SBoxMaskedWrapper;

architecture arch of SBoxMaskedWrapper is
  signal r_sbox_io_sbOut0 : std_logic_vector(7 downto 0);
  signal r_sbox_io_sbOut1 : std_logic_vector(7 downto 0);

  signal r_dataInReg_0 : std_logic_vector(7 downto 0);
  signal r_dataInReg_1 : std_logic_vector(7 downto 0);
  signal r_dataOutReg_0 : std_logic_vector(7 downto 0);
  signal r_dataOutReg_1 : std_logic_vector(7 downto 0);
  signal r_resetSBox : std_logic;
  signal r_sampleInputs : std_logic;
  signal r_sampleOutputs : std_logic;
  signal r_ctr_willIncrement : std_logic;
  signal r_ctr_willClear : std_logic;
  signal r_ctr_valueNext : unsigned(1 downto 0);
  signal r_ctr_value : unsigned(1 downto 0);
  signal r_ctr_willOverflowIfInc : std_logic;
  signal r_ctr_willOverflow : std_logic;
  signal r_dutState : SBoxMaskedWrapperStates;
begin
  r_sbox : entity work.SBoxMasked
    port map ( 
      io_clk => io_clk,
      io_reset => r_resetSBox,
      io_sbIn0 => r_dataInReg_0,
      io_sbIn1 => r_dataInReg_1,
      io_m => io_m,
      io_sbOut0 => r_sbox_io_sbOut0,
      io_sbOut1 => r_sbox_io_sbOut1 
    );
  process(r_dutState)
  begin
    r_ctr_willIncrement <= pkg_toStdLogic(false);
    case r_dutState is
      when pkg_enum.sIdle =>
      when pkg_enum.sLoadData =>
      when pkg_enum.sExecute =>
        r_ctr_willIncrement <= pkg_toStdLogic(true);
      when pkg_enum.sWriteData =>
      when others =>
    end case;
  end process;

  process(r_dutState,r_ctr_willOverflow)
  begin
    r_ctr_willClear <= pkg_toStdLogic(false);
    case r_dutState is
      when pkg_enum.sIdle =>
        r_ctr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sLoadData =>
        r_ctr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
        if r_ctr_willOverflow = '1' then
          r_ctr_willClear <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.sWriteData =>
      when others =>
    end case;
  end process;

  r_ctr_willOverflowIfInc <= pkg_toStdLogic(r_ctr_value = pkg_unsigned("11"));
  r_ctr_willOverflow <= (r_ctr_willOverflowIfInc and r_ctr_willIncrement);
  process(r_ctr_value,r_ctr_willIncrement,r_ctr_willClear)
  begin
    r_ctr_valueNext <= (r_ctr_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_ctr_willIncrement)),2));
    if r_ctr_willClear = '1' then
      r_ctr_valueNext <= pkg_unsigned("00");
    end if;
  end process;

  io_dataOut <= pkg_cat(r_dataOutReg_0,r_dataOutReg_1);
  process(r_dutState)
  begin
    case r_dutState is
      when pkg_enum.sIdle =>
        r_resetSBox <= pkg_toStdLogic(true);
      when pkg_enum.sLoadData =>
        r_resetSBox <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
        r_resetSBox <= pkg_toStdLogic(false);
      when pkg_enum.sWriteData =>
        r_resetSBox <= pkg_toStdLogic(false);
      when others =>
        r_resetSBox <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_dutState)
  begin
    case r_dutState is
      when pkg_enum.sIdle =>
        r_sampleInputs <= pkg_toStdLogic(false);
      when pkg_enum.sLoadData =>
        r_sampleInputs <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
        r_sampleInputs <= pkg_toStdLogic(false);
      when pkg_enum.sWriteData =>
        r_sampleInputs <= pkg_toStdLogic(false);
      when others =>
        r_sampleInputs <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_dutState)
  begin
    case r_dutState is
      when pkg_enum.sIdle =>
        r_sampleOutputs <= pkg_toStdLogic(false);
      when pkg_enum.sLoadData =>
        r_sampleOutputs <= pkg_toStdLogic(false);
      when pkg_enum.sExecute =>
        r_sampleOutputs <= pkg_toStdLogic(false);
      when pkg_enum.sWriteData =>
        r_sampleOutputs <= pkg_toStdLogic(true);
      when others =>
        r_sampleOutputs <= pkg_toStdLogic(false);
    end case;
  end process;

  process(r_dutState)
  begin
    case r_dutState is
      when pkg_enum.sIdle =>
        io_done <= pkg_toStdLogic(false);
      when pkg_enum.sLoadData =>
        io_done <= pkg_toStdLogic(false);
      when pkg_enum.sExecute =>
        io_done <= pkg_toStdLogic(false);
      when pkg_enum.sWriteData =>
        io_done <= pkg_toStdLogic(false);
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_dataInReg_0 <= pkg_stdLogicVector("00000000");
      r_dataInReg_1 <= pkg_stdLogicVector("00000000");
      r_dataOutReg_0 <= pkg_stdLogicVector("00000000");
      r_dataOutReg_1 <= pkg_stdLogicVector("00000000");
      r_ctr_value <= pkg_unsigned("00");
      r_dutState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_ctr_value <= r_ctr_valueNext;
      if r_sampleInputs = '1' then
        r_dataInReg_0 <= pkg_extract(io_dataIn,15,8);
        r_dataInReg_1 <= pkg_extract(io_dataIn,7,0);
      else
        r_dataInReg_0 <= r_dataInReg_0;
        r_dataInReg_1 <= r_dataInReg_1;
      end if;
      if r_sampleOutputs = '1' then
        r_dataOutReg_0 <= r_sbox_io_sbOut0;
        r_dataOutReg_1 <= r_sbox_io_sbOut1;
      else
        r_dataOutReg_0 <= r_dataOutReg_0;
        r_dataOutReg_1 <= r_dataOutReg_1;
      end if;
      case r_dutState is
        when pkg_enum.sIdle =>
          r_dutState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_dutState <= pkg_enum.sLoadData;
          end if;
        when pkg_enum.sLoadData =>
          r_dutState <= pkg_enum.sExecute;
        when pkg_enum.sExecute =>
          r_dutState <= pkg_enum.sExecute;
          if r_ctr_willOverflow = '1' then
            r_dutState <= pkg_enum.sWriteData;
          end if;
        when pkg_enum.sWriteData =>
          r_dutState <= pkg_enum.sDone;
        when others =>
          r_dutState <= pkg_enum.sDone;
      end case;
    end if;
  end process;

end arch;

