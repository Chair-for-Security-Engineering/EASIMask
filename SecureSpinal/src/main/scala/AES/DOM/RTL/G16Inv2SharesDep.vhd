-- Generator : SpinalHDL v1.6.2    git head : 47ae50d83f8f2535f984ba8e55c890dbe0ae9cc7
-- Component : G16Inv2SharesDep
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


--G4Mul_3 replaced by G4Mul


--G4Mul_4 replaced by G4Mul


--G4Mul_5 replaced by G4Mul


--G4Mul_6 replaced by G4Mul


--G4Mul_7 replaced by G4Mul


--G4Mul_8 replaced by G4Mul


--G4Mul_9 replaced by G4Mul


--G4Mul_10 replaced by G4Mul


--G4Mul_11 replaced by G4Mul


--G4Mul_12 replaced by G4Mul


--G4Mul_13 replaced by G4Mul


--G4Mul_14 replaced by G4Mul


--G4Mul_15 replaced by G4Mul


--G4Mul_16 replaced by G4Mul


--G4Mul_17 replaced by G4Mul

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
    io_m : in std_logic_vector(3 downto 0);
    io_z_0 : out std_logic_vector(1 downto 0);
    io_z_1 : out std_logic_vector(1 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G4Mul2SharesDepMul;

architecture arch of G4Mul2SharesDepMul is
  signal g4Mul_18_io_b : std_logic_vector(1 downto 0);
  signal g4Mul_21_io_b : std_logic_vector(1 downto 0);
  signal g4Mul_18_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_19_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_20_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_21_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_22_io_x : std_logic_vector(1 downto 0);
  signal g4Mul_23_io_x : std_logic_vector(1 downto 0);

  signal yRemasked_0 : std_logic_vector(1 downto 0);
  signal yRemasked_1 : std_logic_vector(1 downto 0);
  signal xRemasked_0 : std_logic_vector(1 downto 0);
  signal xRemasked_1 : std_logic_vector(1 downto 0);
begin
  g4Mul_18 : entity work.G4Mul
    port map ( 
      io_a => io_x_0,
      io_b => g4Mul_18_io_b,
      io_x => g4Mul_18_io_x 
    );
  g4Mul_19 : entity work.G4Mul
    port map ( 
      io_a => io_x_0,
      io_b => io_y_0,
      io_x => g4Mul_19_io_x 
    );
  g4Mul_20 : entity work.G4Mul
    port map ( 
      io_a => yRemasked_0,
      io_b => io_x_0,
      io_x => g4Mul_20_io_x 
    );
  g4Mul_21 : entity work.G4Mul
    port map ( 
      io_a => io_x_1,
      io_b => g4Mul_21_io_b,
      io_x => g4Mul_21_io_x 
    );
  g4Mul_22 : entity work.G4Mul
    port map ( 
      io_a => io_x_1,
      io_b => io_y_1,
      io_x => g4Mul_22_io_x 
    );
  g4Mul_23 : entity work.G4Mul
    port map ( 
      io_a => yRemasked_1,
      io_b => io_x_1,
      io_x => g4Mul_23_io_x 
    );
  g4Mul_18_io_b <= pkg_extract(io_m,3,2);
  io_z_0 <= ((g4Mul_19_io_x xor g4Mul_20_io_x) xor xRemasked_0);
  g4Mul_21_io_b <= pkg_extract(io_m,3,2);
  io_z_1 <= ((g4Mul_22_io_x xor g4Mul_23_io_x) xor xRemasked_1);
  process(clk, reset)
  begin
    if reset = '1' then
      yRemasked_0 <= pkg_stdLogicVector("00");
      yRemasked_1 <= pkg_stdLogicVector("00");
      xRemasked_0 <= pkg_stdLogicVector("00");
      xRemasked_1 <= pkg_stdLogicVector("00");
    elsif rising_edge(clk) then
      yRemasked_0 <= (io_y_1 xor pkg_extract(io_m,3,2));
      yRemasked_1 <= (io_y_0 xor pkg_extract(io_m,3,2));
      xRemasked_0 <= (g4Mul_18_io_x xor pkg_extract(io_m,1,0));
      xRemasked_1 <= (g4Mul_21_io_x xor pkg_extract(io_m,1,0));
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


--G4Sq_1 replaced by G4Sq


--G4Sq_2 replaced by G4Sq


--G4ScaleN_1 replaced by G4ScaleN


--G4Sq_3 replaced by G4Sq

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
    io_m : in std_logic_vector(11 downto 0);
    io_z_0 : out std_logic_vector(3 downto 0);
    io_z_1 : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end G16Inv2SharesDep;

architecture arch of G16Inv2SharesDep is
  signal mul1_io_m : std_logic_vector(3 downto 0);
  signal mul2_io_m : std_logic_vector(3 downto 0);
  signal mul3_io_m : std_logic_vector(3 downto 0);
  signal g4Sq_4_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_5_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_6_io_t : std_logic_vector(1 downto 0);
  signal g4Sq_7_io_t : std_logic_vector(1 downto 0);
  signal mul1_io_z_0 : std_logic_vector(1 downto 0);
  signal mul1_io_z_1 : std_logic_vector(1 downto 0);
  signal mul2_io_z_0 : std_logic_vector(1 downto 0);
  signal mul2_io_z_1 : std_logic_vector(1 downto 0);
  signal mul3_io_z_0 : std_logic_vector(1 downto 0);
  signal mul3_io_z_1 : std_logic_vector(1 downto 0);
  signal g4Sq_4_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_2_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_5_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_6_io_x : std_logic_vector(1 downto 0);
  signal g4ScaleN_3_io_x : std_logic_vector(1 downto 0);
  signal g4Sq_7_io_x : std_logic_vector(1 downto 0);

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
      clk => clk,
      reset => reset 
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
      clk => clk,
      reset => reset 
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
      clk => clk,
      reset => reset 
    );
  g4Sq_4 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_4_io_t,
      io_x => g4Sq_4_io_x 
    );
  g4ScaleN_2 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_4_io_x,
      io_x => g4ScaleN_2_io_x 
    );
  g4Sq_5 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_5_io_t,
      io_x => g4Sq_5_io_x 
    );
  g4Sq_6 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_6_io_t,
      io_x => g4Sq_6_io_x 
    );
  g4ScaleN_3 : entity work.G4ScaleN
    port map ( 
      io_t => g4Sq_6_io_x,
      io_x => g4ScaleN_3_io_x 
    );
  g4Sq_7 : entity work.G4Sq
    port map ( 
      io_t => g4Sq_7_io_t,
      io_x => g4Sq_7_io_x 
    );
  a_0 <= pkg_extract(io_x_0,3,2);
  b_0 <= pkg_extract(io_x_0,1,0);
  g4Sq_4_io_t <= (a_0 xor b_0);
  g4Sq_5_io_t <= (c_0 xor d_0);
  e_0 <= g4Sq_5_io_x;
  a_1 <= pkg_extract(io_x_1,3,2);
  b_1 <= pkg_extract(io_x_1,1,0);
  g4Sq_6_io_t <= (a_1 xor b_1);
  g4Sq_7_io_t <= (c_1 xor d_1);
  e_1 <= g4Sq_7_io_x;
  mul1_io_m <= pkg_extract(io_m,11,8);
  d_0 <= mul1_io_z_0;
  d_1 <= mul1_io_z_1;
  mul2_io_m <= pkg_extract(io_m,7,4);
  p_0 <= mul2_io_z_0;
  p_1 <= mul2_io_z_1;
  mul3_io_m <= pkg_extract(io_m,3,0);
  q_0 <= mul3_io_z_0;
  q_1 <= mul3_io_z_1;
  io_z_0 <= pkg_cat(p_0,q_0);
  io_z_1 <= pkg_cat(p_1,q_1);
  process(clk, reset)
  begin
    if reset = '1' then
      c_0 <= pkg_stdLogicVector("00");
      c_1 <= pkg_stdLogicVector("00");
      a1_0 <= pkg_stdLogicVector("00");
      a1_1 <= pkg_stdLogicVector("00");
      b1_0 <= pkg_stdLogicVector("00");
      b1_1 <= pkg_stdLogicVector("00");
    elsif rising_edge(clk) then
      a1_0 <= a_0;
      b1_0 <= b_0;
      c_0 <= g4ScaleN_2_io_x;
      a1_1 <= a_1;
      b1_1 <= b_1;
      c_1 <= g4ScaleN_3_io_x;
    end if;
  end process;

end arch;

