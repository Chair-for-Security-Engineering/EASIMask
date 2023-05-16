-- Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
-- Component : DomDepMul3Shares
-- Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

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


entity DomIndepMul3Shares is
  port(
    io_x_0 : in std_logic;
    io_x_1 : in std_logic;
    io_x_2 : in std_logic;
    io_y_0 : in std_logic;
    io_y_1 : in std_logic;
    io_y_2 : in std_logic;
    io_m_0 : in std_logic;
    io_m_1 : in std_logic;
    io_m_2 : in std_logic;
    io_z_0 : out std_logic;
    io_z_1 : out std_logic;
    io_z_2 : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end DomIndepMul3Shares;

architecture arch of DomIndepMul3Shares is

  signal xy_0 : std_logic;
  signal xy_1 : std_logic;
  signal xy_2 : std_logic;
  signal xy_3 : std_logic;
  signal xy_4 : std_logic;
  signal xy_5 : std_logic;
  signal xy_6 : std_logic;
  signal xy_7 : std_logic;
  signal xy_8 : std_logic;
  signal a_0 : std_logic;
  signal a_1 : std_logic;
  signal a_2 : std_logic;
  signal a_3 : std_logic;
  signal a_4 : std_logic;
  signal a_5 : std_logic;
  signal a_6 : std_logic;
  signal a_7 : std_logic;
  signal a_8 : std_logic;
begin
  xy_0 <= (io_x_0 and io_y_0);
  xy_1 <= (io_x_0 and io_y_1);
  xy_2 <= (io_x_0 and io_y_2);
  xy_3 <= (io_x_1 and io_y_0);
  xy_4 <= (io_x_1 and io_y_1);
  xy_5 <= (io_x_1 and io_y_2);
  xy_6 <= (io_x_2 and io_y_0);
  xy_7 <= (io_x_2 and io_y_1);
  xy_8 <= (io_x_2 and io_y_2);
  io_z_0 <= (((pkg_toStdLogic(false) xor a_0) xor a_1) xor a_2);
  io_z_1 <= (((pkg_toStdLogic(false) xor a_3) xor a_4) xor a_5);
  io_z_2 <= (((pkg_toStdLogic(false) xor a_6) xor a_7) xor a_8);
  process(clk, reset)
  begin
    if reset = '1' then
      a_0 <= pkg_toStdLogic(false);
      a_1 <= pkg_toStdLogic(false);
      a_2 <= pkg_toStdLogic(false);
      a_3 <= pkg_toStdLogic(false);
      a_4 <= pkg_toStdLogic(false);
      a_5 <= pkg_toStdLogic(false);
      a_6 <= pkg_toStdLogic(false);
      a_7 <= pkg_toStdLogic(false);
      a_8 <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      a_0 <= xy_0;
      a_1 <= (xy_1 xor io_m_0);
      a_2 <= (xy_2 xor io_m_1);
      a_3 <= (xy_3 xor io_m_0);
      a_4 <= xy_4;
      a_5 <= (xy_5 xor io_m_2);
      a_6 <= (xy_6 xor io_m_1);
      a_7 <= (xy_7 xor io_m_2);
      a_8 <= xy_8;
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


entity DomDepMul3Shares is
  port(
    io_x_0 : in std_logic;
    io_x_1 : in std_logic;
    io_x_2 : in std_logic;
    io_y_0 : in std_logic;
    io_y_1 : in std_logic;
    io_y_2 : in std_logic;
    io_m_0 : in std_logic;
    io_m_1 : in std_logic;
    io_m_2 : in std_logic;
    io_m_3 : in std_logic;
    io_m_4 : in std_logic;
    io_m_5 : in std_logic;
    io_z_0 : out std_logic;
    io_z_1 : out std_logic;
    io_z_2 : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end DomDepMul3Shares;

architecture arch of DomDepMul3Shares is
  signal mul_io_z_0 : std_logic;
  signal mul_io_z_1 : std_logic;
  signal mul_io_z_2 : std_logic;

  signal a_0 : std_logic;
  signal a_1 : std_logic;
  signal a_2 : std_logic;
  signal x_0 : std_logic;
  signal x_1 : std_logic;
  signal x_2 : std_logic;
  signal b : std_logic;
  signal c_0 : std_logic;
  signal c_1 : std_logic;
  signal c_2 : std_logic;
  signal d_0 : std_logic;
  signal d_1 : std_logic;
  signal d_2 : std_logic;
begin
  mul : entity work.DomIndepMul3Shares
    port map ( 
      io_x_0 => io_x_0,
      io_x_1 => io_x_1,
      io_x_2 => io_x_2,
      io_y_0 => io_m_0,
      io_y_1 => io_m_1,
      io_y_2 => io_m_2,
      io_m_0 => io_m_3,
      io_m_1 => io_m_4,
      io_m_2 => io_m_5,
      io_z_0 => mul_io_z_0,
      io_z_1 => mul_io_z_1,
      io_z_2 => mul_io_z_2,
      clk => clk,
      reset => reset 
    );
  b <= ((a_0 xor a_1) xor a_2);
  d_0 <= mul_io_z_0;
  d_1 <= mul_io_z_1;
  d_2 <= mul_io_z_2;
  c_0 <= (x_0 and b);
  c_1 <= (x_1 and b);
  c_2 <= (x_2 and b);
  io_z_0 <= (c_0 xor d_0);
  io_z_1 <= (c_1 xor d_1);
  io_z_2 <= (c_2 xor d_2);
  process(clk, reset)
  begin
    if reset = '1' then
      a_0 <= pkg_toStdLogic(false);
      a_1 <= pkg_toStdLogic(false);
      a_2 <= pkg_toStdLogic(false);
      x_0 <= pkg_toStdLogic(false);
      x_1 <= pkg_toStdLogic(false);
      x_2 <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      a_0 <= (io_y_0 xor io_m_0);
      a_1 <= (io_y_1 xor io_m_1);
      a_2 <= (io_y_2 xor io_m_2);
      x_0 <= io_x_0;
      x_1 <= io_x_1;
      x_2 <= io_x_2;
    end if;
  end process;

end arch;

