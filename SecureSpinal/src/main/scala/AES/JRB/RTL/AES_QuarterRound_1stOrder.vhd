-- Generator : SpinalHDL v1.6.2    git head : b35dce327aac7da3d63fe591d87ab216ac6ce79b
-- Component : AES_QuarterRound_1stOrder
-- Git hash  : b35dce327aac7da3d63fe591d87ab216ac6ce79b

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
    io_a : in std_logic_vector(15 downto 0);
    io_r : in std_logic_vector(17 downto 0);
    io_b : out std_logic_vector(15 downto 0)
  );
end SBox;

architecture arch of SBox is
  signal sbox_4_b : std_logic_vector(15 downto 0);

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
  sbox_4 : aes_sbox_wrapper
    port map ( 
      clk => io_clk,
      reset => io_reset,
      a => io_a,
      r => io_r,
      b => sbox_4_b 
    );
  io_b <= sbox_4_b;
end arch;


--SBox_1 replaced by SBox


--SBox_2 replaced by SBox


--SBox_3 replaced by SBox

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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AES_QuarterRound_1stOrder is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_p_0 : in std_logic_vector(31 downto 0);
    io_p_1 : in std_logic_vector(31 downto 0);
    io_r : in std_logic_vector(71 downto 0);
    io_c_0 : out std_logic_vector(31 downto 0);
    io_c_1 : out std_logic_vector(31 downto 0)
  );
end AES_QuarterRound_1stOrder;

architecture arch of AES_QuarterRound_1stOrder is
  signal sBox_4_io_reset : std_logic;
  signal sBox_4_io_a : std_logic_vector(15 downto 0);
  signal sBox_4_io_r : std_logic_vector(17 downto 0);
  signal sBox_5_io_reset : std_logic;
  signal sBox_5_io_a : std_logic_vector(15 downto 0);
  signal sBox_5_io_r : std_logic_vector(17 downto 0);
  signal sBox_6_io_reset : std_logic;
  signal sBox_6_io_a : std_logic_vector(15 downto 0);
  signal sBox_6_io_r : std_logic_vector(17 downto 0);
  signal sBox_7_io_reset : std_logic;
  signal sBox_7_io_a : std_logic_vector(15 downto 0);
  signal sBox_7_io_r : std_logic_vector(17 downto 0);
  signal sBox_4_io_b : std_logic_vector(15 downto 0);
  signal sBox_5_io_b : std_logic_vector(15 downto 0);
  signal sBox_6_io_b : std_logic_vector(15 downto 0);
  signal sBox_7_io_b : std_logic_vector(15 downto 0);
  signal mixColumns_2_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_3_io_mixColumnsOutput : std_logic_vector(31 downto 0);

  signal sboxOut_0 : std_logic_vector(31 downto 0);
  signal sboxOut_1 : std_logic_vector(31 downto 0);
  signal mixColumnsOut_0 : std_logic_vector(31 downto 0);
  signal mixColumnsOut_1 : std_logic_vector(31 downto 0);
begin
  sBox_4 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_4_io_reset,
      io_a => sBox_4_io_a,
      io_r => sBox_4_io_r,
      io_b => sBox_4_io_b 
    );
  sBox_5 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_5_io_reset,
      io_a => sBox_5_io_a,
      io_r => sBox_5_io_r,
      io_b => sBox_5_io_b 
    );
  sBox_6 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_6_io_reset,
      io_a => sBox_6_io_a,
      io_r => sBox_6_io_r,
      io_b => sBox_6_io_b 
    );
  sBox_7 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => sBox_7_io_reset,
      io_a => sBox_7_io_a,
      io_r => sBox_7_io_r,
      io_b => sBox_7_io_b 
    );
  mixColumns_2 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => sboxOut_0,
      io_mixColumnsOutput => mixColumns_2_io_mixColumnsOutput 
    );
  mixColumns_3 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => sboxOut_1,
      io_mixColumnsOutput => mixColumns_3_io_mixColumnsOutput 
    );
  sBox_4_io_reset <= (not io_reset);
  process(io_p_0,io_p_1)
  begin
    sBox_4_io_a(7 downto 0) <= pkg_extract(io_p_0,7,0);
    sBox_4_io_a(15 downto 8) <= pkg_extract(io_p_1,7,0);
  end process;

  sBox_4_io_r <= pkg_extract(io_r,17,0);
  process(sBox_4_io_b,sBox_5_io_b,sBox_6_io_b,sBox_7_io_b)
  begin
    sboxOut_0(7 downto 0) <= pkg_extract(sBox_4_io_b,7,0);
    sboxOut_0(15 downto 8) <= pkg_extract(sBox_5_io_b,7,0);
    sboxOut_0(23 downto 16) <= pkg_extract(sBox_6_io_b,7,0);
    sboxOut_0(31 downto 24) <= pkg_extract(sBox_7_io_b,7,0);
  end process;

  process(sBox_4_io_b,sBox_5_io_b,sBox_6_io_b,sBox_7_io_b)
  begin
    sboxOut_1(7 downto 0) <= pkg_extract(sBox_4_io_b,15,8);
    sboxOut_1(15 downto 8) <= pkg_extract(sBox_5_io_b,15,8);
    sboxOut_1(23 downto 16) <= pkg_extract(sBox_6_io_b,15,8);
    sboxOut_1(31 downto 24) <= pkg_extract(sBox_7_io_b,15,8);
  end process;

  sBox_5_io_reset <= (not io_reset);
  process(io_p_0,io_p_1)
  begin
    sBox_5_io_a(7 downto 0) <= pkg_extract(io_p_0,15,8);
    sBox_5_io_a(15 downto 8) <= pkg_extract(io_p_1,15,8);
  end process;

  sBox_5_io_r <= pkg_extract(io_r,35,18);
  sBox_6_io_reset <= (not io_reset);
  process(io_p_0,io_p_1)
  begin
    sBox_6_io_a(7 downto 0) <= pkg_extract(io_p_0,23,16);
    sBox_6_io_a(15 downto 8) <= pkg_extract(io_p_1,23,16);
  end process;

  sBox_6_io_r <= pkg_extract(io_r,53,36);
  sBox_7_io_reset <= (not io_reset);
  process(io_p_0,io_p_1)
  begin
    sBox_7_io_a(7 downto 0) <= pkg_extract(io_p_0,31,24);
    sBox_7_io_a(15 downto 8) <= pkg_extract(io_p_1,31,24);
  end process;

  sBox_7_io_r <= pkg_extract(io_r,71,54);
  mixColumnsOut_0 <= mixColumns_2_io_mixColumnsOutput;
  mixColumnsOut_1 <= mixColumns_3_io_mixColumnsOutput;
  io_c_0 <= mixColumnsOut_0;
  io_c_1 <= mixColumnsOut_1;
end arch;

