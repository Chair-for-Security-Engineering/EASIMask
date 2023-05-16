-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : ModeTest_ECB
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


entity ModeTest is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_pt : in std_logic_vector(127 downto 0);
    io_key : in std_logic_vector(127 downto 0);
    io_ct : out std_logic_vector(127 downto 0);
    io_done : out std_logic
  );
end ModeTest;

architecture arch of ModeTest is

  signal clockingArea_state : std_logic_vector(127 downto 0);
  signal clockingArea_ctr_willIncrement : std_logic;
  signal clockingArea_ctr_willClear : std_logic;
  signal clockingArea_ctr_valueNext : unsigned(3 downto 0);
  signal clockingArea_ctr_value : unsigned(3 downto 0);
  signal clockingArea_ctr_willOverflowIfInc : std_logic;
  signal clockingArea_ctr_willOverflow : std_logic;
  signal io_reset_regNext : std_logic;
  signal when_tests_l209 : std_logic;
  function zz_clockingArea_ctr_willIncrement return std_logic is
    variable clockingArea_ctr_willIncrement : std_logic;
  begin
    clockingArea_ctr_willIncrement := pkg_toStdLogic(false);
    clockingArea_ctr_willIncrement := pkg_toStdLogic(true);
    return clockingArea_ctr_willIncrement;
  end function;
begin
  clockingArea_ctr_willIncrement <= zz_clockingArea_ctr_willIncrement;
  process(io_reset)
  begin
    clockingArea_ctr_willClear <= pkg_toStdLogic(false);
    if io_reset = '1' then
      clockingArea_ctr_willClear <= pkg_toStdLogic(true);
    end if;
  end process;

  clockingArea_ctr_willOverflowIfInc <= pkg_toStdLogic(clockingArea_ctr_value = pkg_unsigned("1001"));
  clockingArea_ctr_willOverflow <= (clockingArea_ctr_willOverflowIfInc and clockingArea_ctr_willIncrement);
  process(clockingArea_ctr_willOverflow,clockingArea_ctr_value,clockingArea_ctr_willIncrement,clockingArea_ctr_willClear)
  begin
    if clockingArea_ctr_willOverflow = '1' then
      clockingArea_ctr_valueNext <= pkg_unsigned("0000");
    else
      clockingArea_ctr_valueNext <= (clockingArea_ctr_value + pkg_resize(unsigned(pkg_toStdLogicVector(clockingArea_ctr_willIncrement)),4));
    end if;
    if clockingArea_ctr_willClear = '1' then
      clockingArea_ctr_valueNext <= pkg_unsigned("0000");
    end if;
  end process;

  process(clockingArea_ctr_willOverflow)
  begin
    io_done <= pkg_toStdLogic(false);
    if clockingArea_ctr_willOverflow = '1' then
      io_done <= pkg_toStdLogic(true);
    end if;
  end process;

  process(clockingArea_ctr_willOverflow,clockingArea_state)
  begin
    io_ct <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    if clockingArea_ctr_willOverflow = '1' then
      io_ct <= clockingArea_state;
    end if;
  end process;

  when_tests_l209 <= ((not io_reset) and io_reset_regNext);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      clockingArea_state <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      clockingArea_ctr_value <= pkg_unsigned("0000");
    elsif rising_edge(io_clk) then
      clockingArea_ctr_value <= clockingArea_ctr_valueNext;
      if when_tests_l209 = '1' then
        clockingArea_state <= pkg_not((io_pt xor io_key));
      else
        if io_reset = '1' then
          clockingArea_state <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        end if;
      end if;
    end if;
  end process;

  process(io_clk)
  begin
    if rising_edge(io_clk) then
      io_reset_regNext <= io_reset;
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


entity ModeTest_ECB is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_blockReady : in std_logic;
    io_pt : in std_logic_vector(127 downto 0);
    io_blocks : in unsigned(63 downto 0);
    io_finalBlock : in std_logic;
    io_key : in std_logic_vector(127 downto 0);
    io_ct : out std_logic_vector(127 downto 0);
    io_blockDone : out std_logic;
    io_done : out std_logic
  );
end ModeTest_ECB;

architecture arch of ModeTest_ECB is
  signal clockingArea_bc_io_reset : std_logic;
  signal clockingArea_bc_io_ct : std_logic_vector(127 downto 0);
  signal clockingArea_bc_io_done : std_logic;

  signal clockingArea_reset : std_logic;
begin
  clockingArea_bc : entity work.ModeTest
    port map ( 
      io_clk => io_clk,
      io_reset => clockingArea_bc_io_reset,
      io_pt => io_pt,
      io_key => io_key,
      io_ct => clockingArea_bc_io_ct,
      io_done => clockingArea_bc_io_done 
    );
  process(clockingArea_reset,clockingArea_bc_io_done)
  begin
    clockingArea_bc_io_reset <= clockingArea_reset;
    if clockingArea_bc_io_done = '1' then
      clockingArea_bc_io_reset <= pkg_toStdLogic(true);
    end if;
  end process;

  process(clockingArea_bc_io_done)
  begin
    io_blockDone <= pkg_toStdLogic(false);
    if clockingArea_bc_io_done = '1' then
      io_blockDone <= pkg_toStdLogic(true);
    end if;
  end process;

  process(clockingArea_bc_io_done,io_finalBlock)
  begin
    io_done <= pkg_toStdLogic(false);
    if clockingArea_bc_io_done = '1' then
      if io_finalBlock = '1' then
        io_done <= pkg_toStdLogic(true);
      end if;
    end if;
  end process;

  io_ct <= clockingArea_bc_io_ct;
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      clockingArea_reset <= pkg_toStdLogic(true);
    elsif rising_edge(io_clk) then
      if io_reset = '1' then
        clockingArea_reset <= pkg_toStdLogic(true);
      else
        if io_blockReady = '1' then
          clockingArea_reset <= pkg_toStdLogic(false);
        end if;
      end if;
    end if;
  end process;

end arch;

