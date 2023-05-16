-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : ChaCha20
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type States is (sIdle,sExecute,sFinalAdd,sDone);

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
      when "10" => return sFinalAdd;
      when "11" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector is
  begin
    case value is
      when sIdle => return "00";
      when sExecute => return "01";
      when sFinalAdd => return "10";
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


entity QuarterRound is
  port(
    io_a : in unsigned(31 downto 0);
    io_b : in unsigned(31 downto 0);
    io_c : in unsigned(31 downto 0);
    io_d : in unsigned(31 downto 0);
    io_e : out unsigned(31 downto 0);
    io_f : out unsigned(31 downto 0);
    io_g : out unsigned(31 downto 0);
    io_h : out unsigned(31 downto 0);
    io_clk : in std_logic;
    io_reset : in std_logic
  );
end QuarterRound;

architecture arch of QuarterRound is

  signal dummy : std_logic;
  signal a1 : unsigned(31 downto 0);
  signal zz_d1 : unsigned(31 downto 0);
  signal d1 : unsigned(31 downto 0);
  signal c1 : unsigned(31 downto 0);
  signal zz_b1 : unsigned(31 downto 0);
  signal b1 : unsigned(31 downto 0);
  signal a2 : unsigned(31 downto 0);
  signal zz_d2 : unsigned(31 downto 0);
  signal d2 : unsigned(31 downto 0);
  signal c2 : unsigned(31 downto 0);
  signal zz_b2 : unsigned(31 downto 0);
  signal b2 : unsigned(31 downto 0);
begin
  a1 <= (io_a + io_b);
  zz_d1 <= (a1 xor io_d);
  d1 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(zz_d1,15,0)),std_logic_vector(pkg_extract(zz_d1,31,16))));
  c1 <= (io_c + d1);
  zz_b1 <= (io_b xor c1);
  b1 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(zz_b1,19,0)),std_logic_vector(pkg_extract(zz_b1,31,20))));
  a2 <= (a1 + b1);
  zz_d2 <= (a2 xor d1);
  d2 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(zz_d2,23,0)),std_logic_vector(pkg_extract(zz_d2,31,24))));
  c2 <= (c1 + d2);
  zz_b2 <= (b1 xor c2);
  b2 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(zz_b2,24,0)),std_logic_vector(pkg_extract(zz_b2,31,25))));
  io_e <= a2;
  io_f <= b2;
  io_g <= c2;
  io_h <= d2;
end arch;


--QuarterRound_1 replaced by QuarterRound


--QuarterRound_2 replaced by QuarterRound


--QuarterRound_3 replaced by QuarterRound

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity ChaCha20 is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_enable : in std_logic;
    io_plaintext : in std_logic_vector(255 downto 0);
    io_key : in std_logic_vector(255 downto 0);
    io_ctr : in std_logic_vector(31 downto 0);
    io_nonce : in std_logic_vector(95 downto 0);
    io_ciphertext : out std_logic_vector(255 downto 0);
    io_done : out std_logic
  );
end ChaCha20;

architecture arch of ChaCha20 is
  signal r_qr1_io_a : unsigned(31 downto 0);
  signal r_qr1_io_b : unsigned(31 downto 0);
  signal r_qr1_io_c : unsigned(31 downto 0);
  signal r_qr1_io_d : unsigned(31 downto 0);
  signal r_qr2_io_a : unsigned(31 downto 0);
  signal r_qr2_io_b : unsigned(31 downto 0);
  signal r_qr2_io_c : unsigned(31 downto 0);
  signal r_qr2_io_d : unsigned(31 downto 0);
  signal r_qr3_io_a : unsigned(31 downto 0);
  signal r_qr3_io_b : unsigned(31 downto 0);
  signal r_qr3_io_c : unsigned(31 downto 0);
  signal r_qr3_io_d : unsigned(31 downto 0);
  signal r_qr4_io_a : unsigned(31 downto 0);
  signal r_qr4_io_b : unsigned(31 downto 0);
  signal r_qr4_io_c : unsigned(31 downto 0);
  signal r_qr4_io_d : unsigned(31 downto 0);
  signal r_qr1_io_e : unsigned(31 downto 0);
  signal r_qr1_io_f : unsigned(31 downto 0);
  signal r_qr1_io_g : unsigned(31 downto 0);
  signal r_qr1_io_h : unsigned(31 downto 0);
  signal r_qr2_io_e : unsigned(31 downto 0);
  signal r_qr2_io_f : unsigned(31 downto 0);
  signal r_qr2_io_g : unsigned(31 downto 0);
  signal r_qr2_io_h : unsigned(31 downto 0);
  signal r_qr3_io_e : unsigned(31 downto 0);
  signal r_qr3_io_f : unsigned(31 downto 0);
  signal r_qr3_io_g : unsigned(31 downto 0);
  signal r_qr3_io_h : unsigned(31 downto 0);
  signal r_qr4_io_e : unsigned(31 downto 0);
  signal r_qr4_io_f : unsigned(31 downto 0);
  signal r_qr4_io_g : unsigned(31 downto 0);
  signal r_qr4_io_h : unsigned(31 downto 0);

  signal r_state_0_0 : unsigned(31 downto 0);
  signal r_state_0_1 : unsigned(31 downto 0);
  signal r_state_0_2 : unsigned(31 downto 0);
  signal r_state_0_3 : unsigned(31 downto 0);
  signal r_state_1_0 : unsigned(31 downto 0);
  signal r_state_1_1 : unsigned(31 downto 0);
  signal r_state_1_2 : unsigned(31 downto 0);
  signal r_state_1_3 : unsigned(31 downto 0);
  signal r_state_2_0 : unsigned(31 downto 0);
  signal r_state_2_1 : unsigned(31 downto 0);
  signal r_state_2_2 : unsigned(31 downto 0);
  signal r_state_2_3 : unsigned(31 downto 0);
  signal r_state_3_0 : unsigned(31 downto 0);
  signal r_state_3_1 : unsigned(31 downto 0);
  signal r_state_3_2 : unsigned(31 downto 0);
  signal r_state_3_3 : unsigned(31 downto 0);
  signal r_initialState_0_0 : unsigned(31 downto 0);
  signal r_initialState_0_1 : unsigned(31 downto 0);
  signal r_initialState_0_2 : unsigned(31 downto 0);
  signal r_initialState_0_3 : unsigned(31 downto 0);
  signal r_initialState_1_0 : unsigned(31 downto 0);
  signal r_initialState_1_1 : unsigned(31 downto 0);
  signal r_initialState_1_2 : unsigned(31 downto 0);
  signal r_initialState_1_3 : unsigned(31 downto 0);
  signal r_initialState_2_0 : unsigned(31 downto 0);
  signal r_initialState_2_1 : unsigned(31 downto 0);
  signal r_initialState_2_2 : unsigned(31 downto 0);
  signal r_initialState_2_3 : unsigned(31 downto 0);
  signal r_initialState_3_0 : unsigned(31 downto 0);
  signal r_initialState_3_1 : unsigned(31 downto 0);
  signal r_initialState_3_2 : unsigned(31 downto 0);
  signal r_initialState_3_3 : unsigned(31 downto 0);
  signal r_roundCounter_willIncrement : std_logic;
  signal r_roundCounter_willClear : std_logic;
  signal r_roundCounter_valueNext : unsigned(4 downto 0);
  signal r_roundCounter_value : unsigned(4 downto 0);
  signal r_roundCounter_willOverflowIfInc : std_logic;
  signal r_roundCounter_willOverflow : std_logic;
  signal r_keyStream : std_logic_vector(511 downto 0);
  signal zz_r_initialState_3_1 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_3_2 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_3_3 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_1_0 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_1_1 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_1_2 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_1_3 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_2_0 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_2_1 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_2_2 : std_logic_vector(31 downto 0);
  signal zz_r_initialState_2_3 : std_logic_vector(31 downto 0);
  signal when_ChaCha20_l60 : std_logic;
  signal r_chachaState : States;
begin
  r_qr1 : entity work.QuarterRound
    port map ( 
      io_a => r_qr1_io_a,
      io_b => r_qr1_io_b,
      io_c => r_qr1_io_c,
      io_d => r_qr1_io_d,
      io_e => r_qr1_io_e,
      io_f => r_qr1_io_f,
      io_g => r_qr1_io_g,
      io_h => r_qr1_io_h,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_qr2 : entity work.QuarterRound
    port map ( 
      io_a => r_qr2_io_a,
      io_b => r_qr2_io_b,
      io_c => r_qr2_io_c,
      io_d => r_qr2_io_d,
      io_e => r_qr2_io_e,
      io_f => r_qr2_io_f,
      io_g => r_qr2_io_g,
      io_h => r_qr2_io_h,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_qr3 : entity work.QuarterRound
    port map ( 
      io_a => r_qr3_io_a,
      io_b => r_qr3_io_b,
      io_c => r_qr3_io_c,
      io_d => r_qr3_io_d,
      io_e => r_qr3_io_e,
      io_f => r_qr3_io_f,
      io_g => r_qr3_io_g,
      io_h => r_qr3_io_h,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  r_qr4 : entity work.QuarterRound
    port map ( 
      io_a => r_qr4_io_a,
      io_b => r_qr4_io_b,
      io_c => r_qr4_io_c,
      io_d => r_qr4_io_d,
      io_e => r_qr4_io_e,
      io_f => r_qr4_io_f,
      io_g => r_qr4_io_g,
      io_h => r_qr4_io_h,
      io_clk => io_clk,
      io_reset => io_reset 
    );
  process(r_chachaState)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_chachaState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when pkg_enum.sFinalAdd =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  process(r_chachaState)
  begin
    r_roundCounter_willIncrement <= pkg_toStdLogic(false);
    case r_chachaState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        r_roundCounter_willIncrement <= pkg_toStdLogic(true);
      when pkg_enum.sFinalAdd =>
      when others =>
    end case;
  end process;

  process(r_chachaState)
  begin
    r_roundCounter_willClear <= pkg_toStdLogic(false);
    case r_chachaState is
      when pkg_enum.sIdle =>
        r_roundCounter_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when pkg_enum.sFinalAdd =>
      when others =>
    end case;
  end process;

  r_roundCounter_willOverflowIfInc <= pkg_toStdLogic(r_roundCounter_value = pkg_unsigned("10011"));
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

  process(r_state_0_0,r_state_0_1,r_state_0_2,r_state_0_3,r_state_1_0,r_state_1_1,r_state_1_2,r_state_1_3,r_state_2_0,r_state_2_1,r_state_2_2,r_state_2_3,r_state_3_0,r_state_3_1,r_state_3_2,r_state_3_3)
  begin
    r_keyStream(511 downto 480) <= std_logic_vector(r_state_0_0);
    r_keyStream(479 downto 448) <= std_logic_vector(r_state_0_1);
    r_keyStream(447 downto 416) <= std_logic_vector(r_state_0_2);
    r_keyStream(415 downto 384) <= std_logic_vector(r_state_0_3);
    r_keyStream(383 downto 352) <= std_logic_vector(r_state_1_0);
    r_keyStream(351 downto 320) <= std_logic_vector(r_state_1_1);
    r_keyStream(319 downto 288) <= std_logic_vector(r_state_1_2);
    r_keyStream(287 downto 256) <= std_logic_vector(r_state_1_3);
    r_keyStream(255 downto 224) <= std_logic_vector(r_state_2_0);
    r_keyStream(223 downto 192) <= std_logic_vector(r_state_2_1);
    r_keyStream(191 downto 160) <= std_logic_vector(r_state_2_2);
    r_keyStream(159 downto 128) <= std_logic_vector(r_state_2_3);
    r_keyStream(127 downto 96) <= std_logic_vector(r_state_3_0);
    r_keyStream(95 downto 64) <= std_logic_vector(r_state_3_1);
    r_keyStream(63 downto 32) <= std_logic_vector(r_state_3_2);
    r_keyStream(31 downto 0) <= std_logic_vector(r_state_3_3);
  end process;

  io_ciphertext <= (pkg_extract(r_keyStream,511,256) xor io_plaintext);
  r_initialState_0_0 <= pkg_unsigned("01100001011100000111100001100101");
  r_initialState_0_1 <= pkg_unsigned("00110011001000000110010001101110");
  r_initialState_0_2 <= pkg_unsigned("01111001011000100010110100110010");
  r_initialState_0_3 <= pkg_unsigned("01101011001000000110010101110100");
  r_initialState_3_0 <= unsigned(io_ctr);
  zz_r_initialState_3_1 <= pkg_extract(io_nonce,95,64);
  r_initialState_3_1 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_3_1,7,0),pkg_extract(zz_r_initialState_3_1,15,8)),pkg_extract(zz_r_initialState_3_1,23,16)),pkg_extract(zz_r_initialState_3_1,31,24)));
  zz_r_initialState_3_2 <= pkg_extract(io_nonce,63,32);
  r_initialState_3_2 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_3_2,7,0),pkg_extract(zz_r_initialState_3_2,15,8)),pkg_extract(zz_r_initialState_3_2,23,16)),pkg_extract(zz_r_initialState_3_2,31,24)));
  zz_r_initialState_3_3 <= pkg_extract(io_nonce,31,0);
  r_initialState_3_3 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_3_3,7,0),pkg_extract(zz_r_initialState_3_3,15,8)),pkg_extract(zz_r_initialState_3_3,23,16)),pkg_extract(zz_r_initialState_3_3,31,24)));
  zz_r_initialState_1_0 <= pkg_extract(io_key,255,224);
  r_initialState_1_0 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_1_0,7,0),pkg_extract(zz_r_initialState_1_0,15,8)),pkg_extract(zz_r_initialState_1_0,23,16)),pkg_extract(zz_r_initialState_1_0,31,24)));
  zz_r_initialState_1_1 <= pkg_extract(io_key,223,192);
  r_initialState_1_1 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_1_1,7,0),pkg_extract(zz_r_initialState_1_1,15,8)),pkg_extract(zz_r_initialState_1_1,23,16)),pkg_extract(zz_r_initialState_1_1,31,24)));
  zz_r_initialState_1_2 <= pkg_extract(io_key,191,160);
  r_initialState_1_2 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_1_2,7,0),pkg_extract(zz_r_initialState_1_2,15,8)),pkg_extract(zz_r_initialState_1_2,23,16)),pkg_extract(zz_r_initialState_1_2,31,24)));
  zz_r_initialState_1_3 <= pkg_extract(io_key,159,128);
  r_initialState_1_3 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_1_3,7,0),pkg_extract(zz_r_initialState_1_3,15,8)),pkg_extract(zz_r_initialState_1_3,23,16)),pkg_extract(zz_r_initialState_1_3,31,24)));
  zz_r_initialState_2_0 <= pkg_extract(io_key,127,96);
  r_initialState_2_0 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_2_0,7,0),pkg_extract(zz_r_initialState_2_0,15,8)),pkg_extract(zz_r_initialState_2_0,23,16)),pkg_extract(zz_r_initialState_2_0,31,24)));
  zz_r_initialState_2_1 <= pkg_extract(io_key,95,64);
  r_initialState_2_1 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_2_1,7,0),pkg_extract(zz_r_initialState_2_1,15,8)),pkg_extract(zz_r_initialState_2_1,23,16)),pkg_extract(zz_r_initialState_2_1,31,24)));
  zz_r_initialState_2_2 <= pkg_extract(io_key,63,32);
  r_initialState_2_2 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_2_2,7,0),pkg_extract(zz_r_initialState_2_2,15,8)),pkg_extract(zz_r_initialState_2_2,23,16)),pkg_extract(zz_r_initialState_2_2,31,24)));
  zz_r_initialState_2_3 <= pkg_extract(io_key,31,0);
  r_initialState_2_3 <= unsigned(pkg_cat(pkg_cat(pkg_cat(pkg_extract(zz_r_initialState_2_3,7,0),pkg_extract(zz_r_initialState_2_3,15,8)),pkg_extract(zz_r_initialState_2_3,23,16)),pkg_extract(zz_r_initialState_2_3,31,24)));
  when_ChaCha20_l60 <= (not pkg_extract(r_roundCounter_value,0));
  process(when_ChaCha20_l60,r_state_0_0)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr1_io_a <= r_state_0_0;
    else
      r_qr1_io_a <= r_state_0_0;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_1_0,r_state_1_1)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr1_io_b <= r_state_1_0;
    else
      r_qr1_io_b <= r_state_1_1;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_2_0,r_state_2_2)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr1_io_c <= r_state_2_0;
    else
      r_qr1_io_c <= r_state_2_2;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_3_0,r_state_3_3)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr1_io_d <= r_state_3_0;
    else
      r_qr1_io_d <= r_state_3_3;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_0_1)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr2_io_a <= r_state_0_1;
    else
      r_qr2_io_a <= r_state_0_1;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_1_1,r_state_1_2)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr2_io_b <= r_state_1_1;
    else
      r_qr2_io_b <= r_state_1_2;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_2_1,r_state_2_3)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr2_io_c <= r_state_2_1;
    else
      r_qr2_io_c <= r_state_2_3;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_3_1,r_state_3_0)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr2_io_d <= r_state_3_1;
    else
      r_qr2_io_d <= r_state_3_0;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_0_2)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr3_io_a <= r_state_0_2;
    else
      r_qr3_io_a <= r_state_0_2;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_1_2,r_state_1_3)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr3_io_b <= r_state_1_2;
    else
      r_qr3_io_b <= r_state_1_3;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_2_2,r_state_2_0)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr3_io_c <= r_state_2_2;
    else
      r_qr3_io_c <= r_state_2_0;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_3_2,r_state_3_1)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr3_io_d <= r_state_3_2;
    else
      r_qr3_io_d <= r_state_3_1;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_0_3)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr4_io_a <= r_state_0_3;
    else
      r_qr4_io_a <= r_state_0_3;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_1_3,r_state_1_0)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr4_io_b <= r_state_1_3;
    else
      r_qr4_io_b <= r_state_1_0;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_2_3,r_state_2_1)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr4_io_c <= r_state_2_3;
    else
      r_qr4_io_c <= r_state_2_1;
    end if;
  end process;

  process(when_ChaCha20_l60,r_state_3_3,r_state_3_2)
  begin
    if when_ChaCha20_l60 = '1' then
      r_qr4_io_d <= r_state_3_3;
    else
      r_qr4_io_d <= r_state_3_2;
    end if;
  end process;

  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_state_0_0 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_0_1 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_0_2 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_0_3 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_1_0 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_1_1 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_1_2 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_1_3 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_2_0 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_2_1 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_2_2 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_2_3 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_3_0 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_3_1 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_3_2 <= pkg_unsigned("00000000000000000000000000000000");
      r_state_3_3 <= pkg_unsigned("00000000000000000000000000000000");
      r_roundCounter_value <= pkg_unsigned("00000");
      r_chachaState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_roundCounter_value <= r_roundCounter_valueNext;
      if when_ChaCha20_l60 = '1' then
        r_state_0_0 <= r_qr1_io_e;
        r_state_1_0 <= r_qr1_io_f;
        r_state_2_0 <= r_qr1_io_g;
        r_state_3_0 <= r_qr1_io_h;
        r_state_0_1 <= r_qr2_io_e;
        r_state_1_1 <= r_qr2_io_f;
        r_state_2_1 <= r_qr2_io_g;
        r_state_3_1 <= r_qr2_io_h;
        r_state_0_2 <= r_qr3_io_e;
        r_state_1_2 <= r_qr3_io_f;
        r_state_2_2 <= r_qr3_io_g;
        r_state_3_2 <= r_qr3_io_h;
        r_state_0_3 <= r_qr4_io_e;
        r_state_1_3 <= r_qr4_io_f;
        r_state_2_3 <= r_qr4_io_g;
        r_state_3_3 <= r_qr4_io_h;
      else
        r_state_0_0 <= r_qr1_io_e;
        r_state_1_1 <= r_qr1_io_f;
        r_state_2_2 <= r_qr1_io_g;
        r_state_3_3 <= r_qr1_io_h;
        r_state_0_1 <= r_qr2_io_e;
        r_state_1_2 <= r_qr2_io_f;
        r_state_2_3 <= r_qr2_io_g;
        r_state_3_0 <= r_qr2_io_h;
        r_state_0_2 <= r_qr3_io_e;
        r_state_1_3 <= r_qr3_io_f;
        r_state_2_0 <= r_qr3_io_g;
        r_state_3_1 <= r_qr3_io_h;
        r_state_0_3 <= r_qr4_io_e;
        r_state_1_0 <= r_qr4_io_f;
        r_state_2_1 <= r_qr4_io_g;
        r_state_3_2 <= r_qr4_io_h;
      end if;
      case r_chachaState is
        when pkg_enum.sIdle =>
          r_chachaState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_chachaState <= pkg_enum.sExecute;
            r_state_0_0 <= r_initialState_0_0;
            r_state_0_1 <= r_initialState_0_1;
            r_state_0_2 <= r_initialState_0_2;
            r_state_0_3 <= r_initialState_0_3;
            r_state_1_0 <= r_initialState_1_0;
            r_state_1_1 <= r_initialState_1_1;
            r_state_1_2 <= r_initialState_1_2;
            r_state_1_3 <= r_initialState_1_3;
            r_state_2_0 <= r_initialState_2_0;
            r_state_2_1 <= r_initialState_2_1;
            r_state_2_2 <= r_initialState_2_2;
            r_state_2_3 <= r_initialState_2_3;
            r_state_3_0 <= r_initialState_3_0;
            r_state_3_1 <= r_initialState_3_1;
            r_state_3_2 <= r_initialState_3_2;
            r_state_3_3 <= r_initialState_3_3;
          end if;
        when pkg_enum.sExecute =>
          r_chachaState <= pkg_enum.sExecute;
          if r_roundCounter_willOverflow = '1' then
            r_chachaState <= pkg_enum.sFinalAdd;
          end if;
        when pkg_enum.sFinalAdd =>
          r_state_0_0 <= (r_state_0_0 + r_initialState_0_0);
          r_state_0_1 <= (r_state_0_1 + r_initialState_0_1);
          r_state_0_2 <= (r_state_0_2 + r_initialState_0_2);
          r_state_0_3 <= (r_state_0_3 + r_initialState_0_3);
          r_state_1_0 <= (r_state_1_0 + r_initialState_1_0);
          r_state_1_1 <= (r_state_1_1 + r_initialState_1_1);
          r_state_1_2 <= (r_state_1_2 + r_initialState_1_2);
          r_state_1_3 <= (r_state_1_3 + r_initialState_1_3);
          r_state_2_0 <= (r_state_2_0 + r_initialState_2_0);
          r_state_2_1 <= (r_state_2_1 + r_initialState_2_1);
          r_state_2_2 <= (r_state_2_2 + r_initialState_2_2);
          r_state_2_3 <= (r_state_2_3 + r_initialState_2_3);
          r_state_3_0 <= (r_state_3_0 + r_initialState_3_0);
          r_state_3_1 <= (r_state_3_1 + r_initialState_3_1);
          r_state_3_2 <= (r_state_3_2 + r_initialState_3_2);
          r_state_3_3 <= (r_state_3_3 + r_initialState_3_3);
          r_chachaState <= pkg_enum.sDone;
        when others =>
          r_chachaState <= pkg_enum.sDone;
      end case;
    end if;
  end process;

end arch;

