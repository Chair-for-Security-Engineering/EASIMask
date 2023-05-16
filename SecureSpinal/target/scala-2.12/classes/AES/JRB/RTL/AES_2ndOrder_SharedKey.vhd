-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : AES_2ndOrder_SharedKey
-- Git hash  : a1b6b5a63145512e4e941205dcb42a7ff50d6f21

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


entity SBox is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_a : in std_logic_vector(23 downto 0);
    io_r : in std_logic_vector(53 downto 0);
    io_b : out std_logic_vector(23 downto 0)
  );
end SBox;

architecture arch of SBox is
  signal sbox_16_b : std_logic_vector(23 downto 0);

  component aes_sbox_wrapper is
    port( 
      clk : in std_logic;
      reset : in std_logic;
      a : in std_logic_vector;
      r : in std_logic_vector;
      b : out std_logic_vector 
    );
  end component;
  

begin
  sbox_16 : aes_sbox_wrapper
    port map ( 
      clk => io_clk,
      reset => io_reset,
      a => io_a,
      r => io_r,
      b => sbox_16_b 
    );
  io_b <= sbox_16_b;
end arch;


--SBox_1 replaced by SBox


--SBox_2 replaced by SBox


--SBox_3 replaced by SBox


--SBox_4 replaced by SBox


--SBox_5 replaced by SBox


--SBox_6 replaced by SBox


--SBox_7 replaced by SBox


--SBox_8 replaced by SBox


--SBox_9 replaced by SBox


--SBox_10 replaced by SBox


--SBox_11 replaced by SBox


--SBox_12 replaced by SBox


--SBox_13 replaced by SBox


--SBox_14 replaced by SBox


--SBox_15 replaced by SBox

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity ShiftRows is
  port(
    io_shiftRowsInput : in std_logic_vector(127 downto 0);
    io_shiftRowsOutput : out std_logic_vector(127 downto 0)
  );
end ShiftRows;

architecture arch of ShiftRows is
  signal zz_io_shiftRowsOutput : std_logic_vector(39 downto 0);
  signal zz_io_shiftRowsOutput_1 : std_logic_vector(7 downto 0);

begin
  zz_io_shiftRowsOutput <= pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_extract(io_shiftRowsInput,127,120),pkg_extract(io_shiftRowsInput,87,80)),pkg_extract(io_shiftRowsInput,47,40)),pkg_extract(io_shiftRowsInput,7,0)),pkg_extract(io_shiftRowsInput,95,88));
  zz_io_shiftRowsOutput_1 <= pkg_extract(io_shiftRowsInput,55,48);
  io_shiftRowsOutput <= pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(pkg_cat(zz_io_shiftRowsOutput,zz_io_shiftRowsOutput_1),pkg_extract(io_shiftRowsInput,15,8)),pkg_extract(io_shiftRowsInput,103,96)),pkg_extract(io_shiftRowsInput,63,56)),pkg_extract(io_shiftRowsInput,23,16)),pkg_extract(io_shiftRowsInput,111,104)),pkg_extract(io_shiftRowsInput,71,64)),pkg_extract(io_shiftRowsInput,31,24)),pkg_extract(io_shiftRowsInput,119,112)),pkg_extract(io_shiftRowsInput,79,72)),pkg_extract(io_shiftRowsInput,39,32));
end arch;


--ShiftRows_1 replaced by ShiftRows


--ShiftRows_2 replaced by ShiftRows

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumns is
  port(
    io_mixColumnsInput : in std_logic_vector(31 downto 0);
    io_mixColumnsOutput : out std_logic_vector(31 downto 0)
  );
end MixColumns;

architecture arch of MixColumns is

  signal a1 : std_logic_vector(7 downto 0);
  signal a2 : std_logic_vector(7 downto 0);
  signal a3 : std_logic_vector(7 downto 0);
  signal a0 : std_logic_vector(7 downto 0);
  signal zz_io_mixColumnsOutput : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20 : std_logic;
  signal zz_io_mixColumnsOutput_1 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_1 : std_logic;
  signal zz_io_mixColumnsOutput_2 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_2 : std_logic;
  signal zz_io_mixColumnsOutput_3 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_3 : std_logic;
  signal zz_io_mixColumnsOutput_4 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_4 : std_logic;
  signal zz_io_mixColumnsOutput_5 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_5 : std_logic;
  signal zz_io_mixColumnsOutput_6 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_6 : std_logic;
  signal zz_io_mixColumnsOutput_7 : std_logic_vector(8 downto 0);
  signal when_MixColumns_l20_7 : std_logic;
begin
  a0 <= pkg_extract(io_mixColumnsInput,31,24);
  a1 <= pkg_extract(io_mixColumnsInput,23,16);
  a2 <= pkg_extract(io_mixColumnsInput,15,8);
  a3 <= pkg_extract(io_mixColumnsInput,7,0);
  when_MixColumns_l20 <= pkg_extract(a0,7);
  process(when_MixColumns_l20,a0)
  begin
    if when_MixColumns_l20 = '1' then
      zz_io_mixColumnsOutput <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l20_1 <= pkg_extract(a1,7);
  process(when_MixColumns_l20_1,a1)
  begin
    if when_MixColumns_l20_1 = '1' then
      zz_io_mixColumnsOutput_1 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_1 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  process(zz_io_mixColumnsOutput,zz_io_mixColumnsOutput_1,a1,a2,a3,a0,zz_io_mixColumnsOutput_2,zz_io_mixColumnsOutput_3,zz_io_mixColumnsOutput_4,zz_io_mixColumnsOutput_5,zz_io_mixColumnsOutput_6,zz_io_mixColumnsOutput_7)
  begin
    io_mixColumnsOutput(31 downto 24) <= (((pkg_extract(zz_io_mixColumnsOutput,7,0) xor (pkg_extract(zz_io_mixColumnsOutput_1,7,0) xor a1)) xor a2) xor a3);
    io_mixColumnsOutput(23 downto 16) <= (((a0 xor pkg_extract(zz_io_mixColumnsOutput_2,7,0)) xor (pkg_extract(zz_io_mixColumnsOutput_3,7,0) xor a2)) xor a3);
    io_mixColumnsOutput(15 downto 8) <= (((a0 xor a1) xor pkg_extract(zz_io_mixColumnsOutput_4,7,0)) xor (pkg_extract(zz_io_mixColumnsOutput_5,7,0) xor a3));
    io_mixColumnsOutput(7 downto 0) <= ((((pkg_extract(zz_io_mixColumnsOutput_6,7,0) xor a0) xor a1) xor a2) xor pkg_extract(zz_io_mixColumnsOutput_7,7,0));
  end process;

  when_MixColumns_l20_2 <= pkg_extract(a1,7);
  process(when_MixColumns_l20_2,a1)
  begin
    if when_MixColumns_l20_2 = '1' then
      zz_io_mixColumnsOutput_2 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_2 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  when_MixColumns_l20_3 <= pkg_extract(a2,7);
  process(when_MixColumns_l20_3,a2)
  begin
    if when_MixColumns_l20_3 = '1' then
      zz_io_mixColumnsOutput_3 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_3 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l20_4 <= pkg_extract(a2,7);
  process(when_MixColumns_l20_4,a2)
  begin
    if when_MixColumns_l20_4 = '1' then
      zz_io_mixColumnsOutput_4 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_4 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumns_l20_5 <= pkg_extract(a3,7);
  process(when_MixColumns_l20_5,a3)
  begin
    if when_MixColumns_l20_5 = '1' then
      zz_io_mixColumnsOutput_5 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_5 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  when_MixColumns_l20_6 <= pkg_extract(a0,7);
  process(when_MixColumns_l20_6,a0)
  begin
    if when_MixColumns_l20_6 = '1' then
      zz_io_mixColumnsOutput_6 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_6 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumns_l20_7 <= pkg_extract(a3,7);
  process(when_MixColumns_l20_7,a3)
  begin
    if when_MixColumns_l20_7 = '1' then
      zz_io_mixColumnsOutput_7 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_7 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

end arch;


--MixColumns_1 replaced by MixColumns


--MixColumns_2 replaced by MixColumns


--MixColumns_3 replaced by MixColumns


--MixColumns_4 replaced by MixColumns


--MixColumns_5 replaced by MixColumns


--MixColumns_6 replaced by MixColumns


--MixColumns_7 replaced by MixColumns


--MixColumns_8 replaced by MixColumns


--MixColumns_9 replaced by MixColumns


--MixColumns_10 replaced by MixColumns


--MixColumns_11 replaced by MixColumns

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AES_2ndOrder_SharedKey is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_p_0 : in std_logic_vector(127 downto 0);
    io_p_1 : in std_logic_vector(127 downto 0);
    io_p_2 : in std_logic_vector(127 downto 0);
    io_k_0 : in std_logic_vector(127 downto 0);
    io_k_1 : in std_logic_vector(127 downto 0);
    io_k_2 : in std_logic_vector(127 downto 0);
    io_r : in std_logic_vector(863 downto 0);
    io_c_0 : out std_logic_vector(127 downto 0);
    io_c_1 : out std_logic_vector(127 downto 0);
    io_c_2 : out std_logic_vector(127 downto 0)
  );
end AES_2ndOrder_SharedKey;

architecture arch of AES_2ndOrder_SharedKey is
  signal sBox_16_io_reset : std_logic;
  signal sBox_16_io_a : std_logic_vector(23 downto 0);
  signal sBox_16_io_r : std_logic_vector(53 downto 0);
  signal sBox_17_io_reset : std_logic;
  signal sBox_17_io_a : std_logic_vector(23 downto 0);
  signal sBox_17_io_r : std_logic_vector(53 downto 0);
  signal sBox_18_io_reset : std_logic;
  signal sBox_18_io_a : std_logic_vector(23 downto 0);
  signal sBox_18_io_r : std_logic_vector(53 downto 0);
  signal sBox_19_io_reset : std_logic;
  signal sBox_19_io_a : std_logic_vector(23 downto 0);
  signal sBox_19_io_r : std_logic_vector(53 downto 0);
  signal sBox_20_io_reset : std_logic;
  signal sBox_20_io_a : std_logic_vector(23 downto 0);
  signal sBox_20_io_r : std_logic_vector(53 downto 0);
  signal sBox_21_io_reset : std_logic;
  signal sBox_21_io_a : std_logic_vector(23 downto 0);
  signal sBox_21_io_r : std_logic_vector(53 downto 0);
  signal sBox_22_io_reset : std_logic;
  signal sBox_22_io_a : std_logic_vector(23 downto 0);
  signal sBox_22_io_r : std_logic_vector(53 downto 0);
  signal sBox_23_io_reset : std_logic;
  signal sBox_23_io_a : std_logic_vector(23 downto 0);
  signal sBox_23_io_r : std_logic_vector(53 downto 0);
  signal sBox_24_io_reset : std_logic;
  signal sBox_24_io_a : std_logic_vector(23 downto 0);
  signal sBox_24_io_r : std_logic_vector(53 downto 0);
  signal sBox_25_io_reset : std_logic;
  signal sBox_25_io_a : std_logic_vector(23 downto 0);
  signal sBox_25_io_r : std_logic_vector(53 downto 0);
  signal sBox_26_io_reset : std_logic;
  signal sBox_26_io_a : std_logic_vector(23 downto 0);
  signal sBox_26_io_r : std_logic_vector(53 downto 0);
  signal sBox_27_io_reset : std_logic;
  signal sBox_27_io_a : std_logic_vector(23 downto 0);
  signal sBox_27_io_r : std_logic_vector(53 downto 0);
  signal sBox_28_io_reset : std_logic;
  signal sBox_28_io_a : std_logic_vector(23 downto 0);
  signal sBox_28_io_r : std_logic_vector(53 downto 0);
  signal sBox_29_io_reset : std_logic;
  signal sBox_29_io_a : std_logic_vector(23 downto 0);
  signal sBox_29_io_r : std_logic_vector(53 downto 0);
  signal sBox_30_io_reset : std_logic;
  signal sBox_30_io_a : std_logic_vector(23 downto 0);
  signal sBox_30_io_r : std_logic_vector(53 downto 0);
  signal sBox_31_io_reset : std_logic;
  signal sBox_31_io_a : std_logic_vector(23 downto 0);
  signal sBox_31_io_r : std_logic_vector(53 downto 0);
  signal mixColumns_12_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_13_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_14_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_15_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_16_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_17_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_18_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_19_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_20_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_21_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_22_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_23_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal sBox_16_io_b : std_logic_vector(23 downto 0);
  signal sBox_17_io_b : std_logic_vector(23 downto 0);
  signal sBox_18_io_b : std_logic_vector(23 downto 0);
  signal sBox_19_io_b : std_logic_vector(23 downto 0);
  signal sBox_20_io_b : std_logic_vector(23 downto 0);
  signal sBox_21_io_b : std_logic_vector(23 downto 0);
  signal sBox_22_io_b : std_logic_vector(23 downto 0);
  signal sBox_23_io_b : std_logic_vector(23 downto 0);
  signal sBox_24_io_b : std_logic_vector(23 downto 0);
  signal sBox_25_io_b : std_logic_vector(23 downto 0);
  signal sBox_26_io_b : std_logic_vector(23 downto 0);
  signal sBox_27_io_b : std_logic_vector(23 downto 0);
  signal sBox_28_io_b : std_logic_vector(23 downto 0);
  signal sBox_29_io_b : std_logic_vector(23 downto 0);
  signal sBox_30_io_b : std_logic_vector(23 downto 0);
  signal sBox_31_io_b : std_logic_vector(23 downto 0);
  signal shiftRows_3_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal shiftRows_4_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal shiftRows_5_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal mixColumns_12_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_13_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_14_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_15_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_16_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_17_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_18_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_19_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_20_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_21_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_22_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_23_io_mixColumnsOutput : std_logic_vector(31 downto 0);

  signal r_sboxOut_0 : std_logic_vector(127 downto 0);
  signal r_sboxOut_1 : std_logic_vector(127 downto 0);
  signal r_sboxOut_2 : std_logic_vector(127 downto 0);
  signal r_shiftRowsOut_0 : std_logic_vector(127 downto 0);
  signal r_shiftRowsOut_1 : std_logic_vector(127 downto 0);
  signal r_shiftRowsOut_2 : std_logic_vector(127 downto 0);
  signal r_mixColumnsOut_0 : std_logic_vector(127 downto 0);
  signal r_mixColumnsOut_1 : std_logic_vector(127 downto 0);
  signal r_mixColumnsOut_2 : std_logic_vector(127 downto 0);
begin
  sBox_16 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_16_io_reset,
      io_a => sBox_16_io_a,
      io_r => sBox_16_io_r,
      io_b => sBox_16_io_b 
    );
  sBox_17 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_17_io_reset,
      io_a => sBox_17_io_a,
      io_r => sBox_17_io_r,
      io_b => sBox_17_io_b 
    );
  sBox_18 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_18_io_reset,
      io_a => sBox_18_io_a,
      io_r => sBox_18_io_r,
      io_b => sBox_18_io_b 
    );
  sBox_19 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_19_io_reset,
      io_a => sBox_19_io_a,
      io_r => sBox_19_io_r,
      io_b => sBox_19_io_b 
    );
  sBox_20 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_20_io_reset,
      io_a => sBox_20_io_a,
      io_r => sBox_20_io_r,
      io_b => sBox_20_io_b 
    );
  sBox_21 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_21_io_reset,
      io_a => sBox_21_io_a,
      io_r => sBox_21_io_r,
      io_b => sBox_21_io_b 
    );
  sBox_22 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_22_io_reset,
      io_a => sBox_22_io_a,
      io_r => sBox_22_io_r,
      io_b => sBox_22_io_b 
    );
  sBox_23 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_23_io_reset,
      io_a => sBox_23_io_a,
      io_r => sBox_23_io_r,
      io_b => sBox_23_io_b 
    );
  sBox_24 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_24_io_reset,
      io_a => sBox_24_io_a,
      io_r => sBox_24_io_r,
      io_b => sBox_24_io_b 
    );
  sBox_25 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_25_io_reset,
      io_a => sBox_25_io_a,
      io_r => sBox_25_io_r,
      io_b => sBox_25_io_b 
    );
  sBox_26 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_26_io_reset,
      io_a => sBox_26_io_a,
      io_r => sBox_26_io_r,
      io_b => sBox_26_io_b 
    );
  sBox_27 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_27_io_reset,
      io_a => sBox_27_io_a,
      io_r => sBox_27_io_r,
      io_b => sBox_27_io_b 
    );
  sBox_28 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_28_io_reset,
      io_a => sBox_28_io_a,
      io_r => sBox_28_io_r,
      io_b => sBox_28_io_b 
    );
  sBox_29 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_29_io_reset,
      io_a => sBox_29_io_a,
      io_r => sBox_29_io_r,
      io_b => sBox_29_io_b 
    );
  sBox_30 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_30_io_reset,
      io_a => sBox_30_io_a,
      io_r => sBox_30_io_r,
      io_b => sBox_30_io_b 
    );
  sBox_31 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_31_io_reset,
      io_a => sBox_31_io_a,
      io_r => sBox_31_io_r,
      io_b => sBox_31_io_b 
    );
  shiftRows_3 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_sboxOut_0,
      io_shiftRowsOutput => shiftRows_3_io_shiftRowsOutput 
    );
  shiftRows_4 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_sboxOut_1,
      io_shiftRowsOutput => shiftRows_4_io_shiftRowsOutput 
    );
  shiftRows_5 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_sboxOut_2,
      io_shiftRowsOutput => shiftRows_5_io_shiftRowsOutput 
    );
  mixColumns_12 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_12_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_12_io_mixColumnsOutput 
    );
  mixColumns_13 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_13_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_13_io_mixColumnsOutput 
    );
  mixColumns_14 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_14_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_14_io_mixColumnsOutput 
    );
  mixColumns_15 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_15_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_15_io_mixColumnsOutput 
    );
  mixColumns_16 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_16_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_16_io_mixColumnsOutput 
    );
  mixColumns_17 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_17_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_17_io_mixColumnsOutput 
    );
  mixColumns_18 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_18_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_18_io_mixColumnsOutput 
    );
  mixColumns_19 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_19_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_19_io_mixColumnsOutput 
    );
  mixColumns_20 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_20_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_20_io_mixColumnsOutput 
    );
  mixColumns_21 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_21_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_21_io_mixColumnsOutput 
    );
  mixColumns_22 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_22_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_22_io_mixColumnsOutput 
    );
  mixColumns_23 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_23_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_23_io_mixColumnsOutput 
    );
  sBox_16_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_16_io_a(7 downto 0) <= pkg_extract(io_p_0,7,0);
    sBox_16_io_a(15 downto 8) <= pkg_extract(io_p_1,7,0);
    sBox_16_io_a(23 downto 16) <= pkg_extract(io_p_2,7,0);
  end process;

  sBox_16_io_r <= pkg_extract(io_r,53,0);
  process(sBox_16_io_b,sBox_17_io_b,sBox_18_io_b,sBox_19_io_b,sBox_20_io_b,sBox_21_io_b,sBox_22_io_b,sBox_23_io_b,sBox_24_io_b,sBox_25_io_b,sBox_26_io_b,sBox_27_io_b,sBox_28_io_b,sBox_29_io_b,sBox_30_io_b,sBox_31_io_b)
  begin
    r_sboxOut_0(7 downto 0) <= pkg_extract(sBox_16_io_b,7,0);
    r_sboxOut_0(15 downto 8) <= pkg_extract(sBox_17_io_b,7,0);
    r_sboxOut_0(23 downto 16) <= pkg_extract(sBox_18_io_b,7,0);
    r_sboxOut_0(31 downto 24) <= pkg_extract(sBox_19_io_b,7,0);
    r_sboxOut_0(39 downto 32) <= pkg_extract(sBox_20_io_b,7,0);
    r_sboxOut_0(47 downto 40) <= pkg_extract(sBox_21_io_b,7,0);
    r_sboxOut_0(55 downto 48) <= pkg_extract(sBox_22_io_b,7,0);
    r_sboxOut_0(63 downto 56) <= pkg_extract(sBox_23_io_b,7,0);
    r_sboxOut_0(71 downto 64) <= pkg_extract(sBox_24_io_b,7,0);
    r_sboxOut_0(79 downto 72) <= pkg_extract(sBox_25_io_b,7,0);
    r_sboxOut_0(87 downto 80) <= pkg_extract(sBox_26_io_b,7,0);
    r_sboxOut_0(95 downto 88) <= pkg_extract(sBox_27_io_b,7,0);
    r_sboxOut_0(103 downto 96) <= pkg_extract(sBox_28_io_b,7,0);
    r_sboxOut_0(111 downto 104) <= pkg_extract(sBox_29_io_b,7,0);
    r_sboxOut_0(119 downto 112) <= pkg_extract(sBox_30_io_b,7,0);
    r_sboxOut_0(127 downto 120) <= pkg_extract(sBox_31_io_b,7,0);
  end process;

  process(sBox_16_io_b,sBox_17_io_b,sBox_18_io_b,sBox_19_io_b,sBox_20_io_b,sBox_21_io_b,sBox_22_io_b,sBox_23_io_b,sBox_24_io_b,sBox_25_io_b,sBox_26_io_b,sBox_27_io_b,sBox_28_io_b,sBox_29_io_b,sBox_30_io_b,sBox_31_io_b)
  begin
    r_sboxOut_1(7 downto 0) <= pkg_extract(sBox_16_io_b,15,8);
    r_sboxOut_1(15 downto 8) <= pkg_extract(sBox_17_io_b,15,8);
    r_sboxOut_1(23 downto 16) <= pkg_extract(sBox_18_io_b,15,8);
    r_sboxOut_1(31 downto 24) <= pkg_extract(sBox_19_io_b,15,8);
    r_sboxOut_1(39 downto 32) <= pkg_extract(sBox_20_io_b,15,8);
    r_sboxOut_1(47 downto 40) <= pkg_extract(sBox_21_io_b,15,8);
    r_sboxOut_1(55 downto 48) <= pkg_extract(sBox_22_io_b,15,8);
    r_sboxOut_1(63 downto 56) <= pkg_extract(sBox_23_io_b,15,8);
    r_sboxOut_1(71 downto 64) <= pkg_extract(sBox_24_io_b,15,8);
    r_sboxOut_1(79 downto 72) <= pkg_extract(sBox_25_io_b,15,8);
    r_sboxOut_1(87 downto 80) <= pkg_extract(sBox_26_io_b,15,8);
    r_sboxOut_1(95 downto 88) <= pkg_extract(sBox_27_io_b,15,8);
    r_sboxOut_1(103 downto 96) <= pkg_extract(sBox_28_io_b,15,8);
    r_sboxOut_1(111 downto 104) <= pkg_extract(sBox_29_io_b,15,8);
    r_sboxOut_1(119 downto 112) <= pkg_extract(sBox_30_io_b,15,8);
    r_sboxOut_1(127 downto 120) <= pkg_extract(sBox_31_io_b,15,8);
  end process;

  process(sBox_16_io_b,sBox_17_io_b,sBox_18_io_b,sBox_19_io_b,sBox_20_io_b,sBox_21_io_b,sBox_22_io_b,sBox_23_io_b,sBox_24_io_b,sBox_25_io_b,sBox_26_io_b,sBox_27_io_b,sBox_28_io_b,sBox_29_io_b,sBox_30_io_b,sBox_31_io_b)
  begin
    r_sboxOut_2(7 downto 0) <= pkg_extract(sBox_16_io_b,23,16);
    r_sboxOut_2(15 downto 8) <= pkg_extract(sBox_17_io_b,23,16);
    r_sboxOut_2(23 downto 16) <= pkg_extract(sBox_18_io_b,23,16);
    r_sboxOut_2(31 downto 24) <= pkg_extract(sBox_19_io_b,23,16);
    r_sboxOut_2(39 downto 32) <= pkg_extract(sBox_20_io_b,23,16);
    r_sboxOut_2(47 downto 40) <= pkg_extract(sBox_21_io_b,23,16);
    r_sboxOut_2(55 downto 48) <= pkg_extract(sBox_22_io_b,23,16);
    r_sboxOut_2(63 downto 56) <= pkg_extract(sBox_23_io_b,23,16);
    r_sboxOut_2(71 downto 64) <= pkg_extract(sBox_24_io_b,23,16);
    r_sboxOut_2(79 downto 72) <= pkg_extract(sBox_25_io_b,23,16);
    r_sboxOut_2(87 downto 80) <= pkg_extract(sBox_26_io_b,23,16);
    r_sboxOut_2(95 downto 88) <= pkg_extract(sBox_27_io_b,23,16);
    r_sboxOut_2(103 downto 96) <= pkg_extract(sBox_28_io_b,23,16);
    r_sboxOut_2(111 downto 104) <= pkg_extract(sBox_29_io_b,23,16);
    r_sboxOut_2(119 downto 112) <= pkg_extract(sBox_30_io_b,23,16);
    r_sboxOut_2(127 downto 120) <= pkg_extract(sBox_31_io_b,23,16);
  end process;

  sBox_17_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_17_io_a(7 downto 0) <= pkg_extract(io_p_0,15,8);
    sBox_17_io_a(15 downto 8) <= pkg_extract(io_p_1,15,8);
    sBox_17_io_a(23 downto 16) <= pkg_extract(io_p_2,15,8);
  end process;

  sBox_17_io_r <= pkg_extract(io_r,107,54);
  sBox_18_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_18_io_a(7 downto 0) <= pkg_extract(io_p_0,23,16);
    sBox_18_io_a(15 downto 8) <= pkg_extract(io_p_1,23,16);
    sBox_18_io_a(23 downto 16) <= pkg_extract(io_p_2,23,16);
  end process;

  sBox_18_io_r <= pkg_extract(io_r,161,108);
  sBox_19_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_19_io_a(7 downto 0) <= pkg_extract(io_p_0,31,24);
    sBox_19_io_a(15 downto 8) <= pkg_extract(io_p_1,31,24);
    sBox_19_io_a(23 downto 16) <= pkg_extract(io_p_2,31,24);
  end process;

  sBox_19_io_r <= pkg_extract(io_r,215,162);
  sBox_20_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_20_io_a(7 downto 0) <= pkg_extract(io_p_0,39,32);
    sBox_20_io_a(15 downto 8) <= pkg_extract(io_p_1,39,32);
    sBox_20_io_a(23 downto 16) <= pkg_extract(io_p_2,39,32);
  end process;

  sBox_20_io_r <= pkg_extract(io_r,269,216);
  sBox_21_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_21_io_a(7 downto 0) <= pkg_extract(io_p_0,47,40);
    sBox_21_io_a(15 downto 8) <= pkg_extract(io_p_1,47,40);
    sBox_21_io_a(23 downto 16) <= pkg_extract(io_p_2,47,40);
  end process;

  sBox_21_io_r <= pkg_extract(io_r,323,270);
  sBox_22_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_22_io_a(7 downto 0) <= pkg_extract(io_p_0,55,48);
    sBox_22_io_a(15 downto 8) <= pkg_extract(io_p_1,55,48);
    sBox_22_io_a(23 downto 16) <= pkg_extract(io_p_2,55,48);
  end process;

  sBox_22_io_r <= pkg_extract(io_r,377,324);
  sBox_23_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_23_io_a(7 downto 0) <= pkg_extract(io_p_0,63,56);
    sBox_23_io_a(15 downto 8) <= pkg_extract(io_p_1,63,56);
    sBox_23_io_a(23 downto 16) <= pkg_extract(io_p_2,63,56);
  end process;

  sBox_23_io_r <= pkg_extract(io_r,431,378);
  sBox_24_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_24_io_a(7 downto 0) <= pkg_extract(io_p_0,71,64);
    sBox_24_io_a(15 downto 8) <= pkg_extract(io_p_1,71,64);
    sBox_24_io_a(23 downto 16) <= pkg_extract(io_p_2,71,64);
  end process;

  sBox_24_io_r <= pkg_extract(io_r,485,432);
  sBox_25_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_25_io_a(7 downto 0) <= pkg_extract(io_p_0,79,72);
    sBox_25_io_a(15 downto 8) <= pkg_extract(io_p_1,79,72);
    sBox_25_io_a(23 downto 16) <= pkg_extract(io_p_2,79,72);
  end process;

  sBox_25_io_r <= pkg_extract(io_r,539,486);
  sBox_26_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_26_io_a(7 downto 0) <= pkg_extract(io_p_0,87,80);
    sBox_26_io_a(15 downto 8) <= pkg_extract(io_p_1,87,80);
    sBox_26_io_a(23 downto 16) <= pkg_extract(io_p_2,87,80);
  end process;

  sBox_26_io_r <= pkg_extract(io_r,593,540);
  sBox_27_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_27_io_a(7 downto 0) <= pkg_extract(io_p_0,95,88);
    sBox_27_io_a(15 downto 8) <= pkg_extract(io_p_1,95,88);
    sBox_27_io_a(23 downto 16) <= pkg_extract(io_p_2,95,88);
  end process;

  sBox_27_io_r <= pkg_extract(io_r,647,594);
  sBox_28_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_28_io_a(7 downto 0) <= pkg_extract(io_p_0,103,96);
    sBox_28_io_a(15 downto 8) <= pkg_extract(io_p_1,103,96);
    sBox_28_io_a(23 downto 16) <= pkg_extract(io_p_2,103,96);
  end process;

  sBox_28_io_r <= pkg_extract(io_r,701,648);
  sBox_29_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_29_io_a(7 downto 0) <= pkg_extract(io_p_0,111,104);
    sBox_29_io_a(15 downto 8) <= pkg_extract(io_p_1,111,104);
    sBox_29_io_a(23 downto 16) <= pkg_extract(io_p_2,111,104);
  end process;

  sBox_29_io_r <= pkg_extract(io_r,755,702);
  sBox_30_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_30_io_a(7 downto 0) <= pkg_extract(io_p_0,119,112);
    sBox_30_io_a(15 downto 8) <= pkg_extract(io_p_1,119,112);
    sBox_30_io_a(23 downto 16) <= pkg_extract(io_p_2,119,112);
  end process;

  sBox_30_io_r <= pkg_extract(io_r,809,756);
  sBox_31_io_reset <= (not io_reset);
  process(io_p_0,io_p_1,io_p_2)
  begin
    sBox_31_io_a(7 downto 0) <= pkg_extract(io_p_0,127,120);
    sBox_31_io_a(15 downto 8) <= pkg_extract(io_p_1,127,120);
    sBox_31_io_a(23 downto 16) <= pkg_extract(io_p_2,127,120);
  end process;

  sBox_31_io_r <= pkg_extract(io_r,863,810);
  r_shiftRowsOut_0 <= shiftRows_3_io_shiftRowsOutput;
  r_shiftRowsOut_1 <= shiftRows_4_io_shiftRowsOutput;
  r_shiftRowsOut_2 <= shiftRows_5_io_shiftRowsOutput;
  mixColumns_12_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,31,0);
  process(mixColumns_12_io_mixColumnsOutput,mixColumns_13_io_mixColumnsOutput,mixColumns_14_io_mixColumnsOutput,mixColumns_15_io_mixColumnsOutput)
  begin
    r_mixColumnsOut_0(31 downto 0) <= mixColumns_12_io_mixColumnsOutput;
    r_mixColumnsOut_0(63 downto 32) <= mixColumns_13_io_mixColumnsOutput;
    r_mixColumnsOut_0(95 downto 64) <= mixColumns_14_io_mixColumnsOutput;
    r_mixColumnsOut_0(127 downto 96) <= mixColumns_15_io_mixColumnsOutput;
  end process;

  mixColumns_13_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,63,32);
  mixColumns_14_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,95,64);
  mixColumns_15_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_0,127,96);
  mixColumns_16_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,31,0);
  process(mixColumns_16_io_mixColumnsOutput,mixColumns_17_io_mixColumnsOutput,mixColumns_18_io_mixColumnsOutput,mixColumns_19_io_mixColumnsOutput)
  begin
    r_mixColumnsOut_1(31 downto 0) <= mixColumns_16_io_mixColumnsOutput;
    r_mixColumnsOut_1(63 downto 32) <= mixColumns_17_io_mixColumnsOutput;
    r_mixColumnsOut_1(95 downto 64) <= mixColumns_18_io_mixColumnsOutput;
    r_mixColumnsOut_1(127 downto 96) <= mixColumns_19_io_mixColumnsOutput;
  end process;

  mixColumns_17_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,63,32);
  mixColumns_18_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,95,64);
  mixColumns_19_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_1,127,96);
  mixColumns_20_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_2,31,0);
  process(mixColumns_20_io_mixColumnsOutput,mixColumns_21_io_mixColumnsOutput,mixColumns_22_io_mixColumnsOutput,mixColumns_23_io_mixColumnsOutput)
  begin
    r_mixColumnsOut_2(31 downto 0) <= mixColumns_20_io_mixColumnsOutput;
    r_mixColumnsOut_2(63 downto 32) <= mixColumns_21_io_mixColumnsOutput;
    r_mixColumnsOut_2(95 downto 64) <= mixColumns_22_io_mixColumnsOutput;
    r_mixColumnsOut_2(127 downto 96) <= mixColumns_23_io_mixColumnsOutput;
  end process;

  mixColumns_21_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_2,63,32);
  mixColumns_22_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_2,95,64);
  mixColumns_23_io_mixColumnsInput <= pkg_extract(r_shiftRowsOut_2,127,96);
  io_c_0 <= (r_mixColumnsOut_0 xor io_k_0);
  io_c_1 <= (r_mixColumnsOut_1 xor io_k_1);
  io_c_2 <= (r_mixColumnsOut_2 xor io_k_2);
end arch;

