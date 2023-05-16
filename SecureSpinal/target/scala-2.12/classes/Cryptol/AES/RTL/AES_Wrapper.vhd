-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : AES_Wrapper
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type States is (sIdle,sLoadData,sExecute,sDone);
  type States_1 is (sIdle,sExecute,sFinalRound,sDone);

  function pkg_mux (sel : std_logic; one : States; zero : States) return States;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector;
  function pkg_toStates_native (value : std_logic_vector(1 downto 0)) return States;
  function pkg_mux (sel : std_logic; one : States_1; zero : States_1) return States_1;
  function pkg_toStdLogicVector_native (value : States_1) return std_logic_vector;
  function pkg_toStates_1_native (value : std_logic_vector(1 downto 0)) return States_1;
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
      when "01" => return sLoadData;
      when "10" => return sExecute;
      when "11" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector is
  begin
    case value is
      when sIdle => return "00";
      when sLoadData => return "01";
      when sExecute => return "10";
      when sDone => return "11";
      when others => return "00";
    end case;
  end;
  function pkg_mux (sel : std_logic; one : States_1; zero : States_1) return States_1 is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toStates_1_native (value : std_logic_vector(1 downto 0)) return States_1 is
  begin
    case value is
      when "00" => return sIdle;
      when "01" => return sExecute;
      when "10" => return sFinalRound;
      when "11" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States_1) return std_logic_vector is
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


entity SBox is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_sbox_in : in std_logic_vector(15 downto 0);
    io_mask : in std_logic_vector(37 downto 0);
    io_sbox_out : out std_logic_vector(15 downto 0)
  );
end SBox;

architecture arch of SBox is
  signal sb1_sbox_out : std_logic_vector(15 downto 0);

  component aes_sbox_wrapper is
    port( 
      clk : in std_logic;
      reset : in std_logic;
      sbox_in : in std_logic_vector;
      mask : in std_logic_vector;
      sbox_out : out std_logic_vector 
    );
  end component;
  

begin
  sb1 : aes_sbox_wrapper
    port map ( 
      clk => io_clk,
      reset => io_reset,
      sbox_in => io_sbox_in,
      mask => io_mask,
      sbox_out => sb1_sbox_out 
    );
  io_sbox_out <= sb1_sbox_out;
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


--SBox_16 replaced by SBox


--SBox_17 replaced by SBox


--SBox_18 replaced by SBox


--SBox_19 replaced by SBox

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumn is
  port(
    io_mixColumnsInput : in std_logic_vector(31 downto 0);
    io_mixColumnsOutput : out std_logic_vector(31 downto 0)
  );
end MixColumn;

architecture arch of MixColumn is

  signal a1 : std_logic_vector(7 downto 0);
  signal a2 : std_logic_vector(7 downto 0);
  signal a3 : std_logic_vector(7 downto 0);
  signal a0 : std_logic_vector(7 downto 0);
  signal zz_io_mixColumnsOutput : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20 : std_logic;
  signal zz_io_mixColumnsOutput_1 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_1 : std_logic;
  signal zz_io_mixColumnsOutput_2 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_2 : std_logic;
  signal zz_io_mixColumnsOutput_3 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_3 : std_logic;
  signal zz_io_mixColumnsOutput_4 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_4 : std_logic;
  signal zz_io_mixColumnsOutput_5 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_5 : std_logic;
  signal zz_io_mixColumnsOutput_6 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_6 : std_logic;
  signal zz_io_mixColumnsOutput_7 : std_logic_vector(8 downto 0);
  signal when_MixColumn_l20_7 : std_logic;
begin
  a0 <= pkg_extract(io_mixColumnsInput,31,24);
  a1 <= pkg_extract(io_mixColumnsInput,23,16);
  a2 <= pkg_extract(io_mixColumnsInput,15,8);
  a3 <= pkg_extract(io_mixColumnsInput,7,0);
  when_MixColumn_l20 <= pkg_extract(a0,7);
  process(when_MixColumn_l20,a0)
  begin
    if when_MixColumn_l20 = '1' then
      zz_io_mixColumnsOutput <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumn_l20_1 <= pkg_extract(a1,7);
  process(when_MixColumn_l20_1,a1)
  begin
    if when_MixColumn_l20_1 = '1' then
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

  when_MixColumn_l20_2 <= pkg_extract(a1,7);
  process(when_MixColumn_l20_2,a1)
  begin
    if when_MixColumn_l20_2 = '1' then
      zz_io_mixColumnsOutput_2 <= (pkg_shiftLeft(a1,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_2 <= pkg_shiftLeft(a1,1);
    end if;
  end process;

  when_MixColumn_l20_3 <= pkg_extract(a2,7);
  process(when_MixColumn_l20_3,a2)
  begin
    if when_MixColumn_l20_3 = '1' then
      zz_io_mixColumnsOutput_3 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_3 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumn_l20_4 <= pkg_extract(a2,7);
  process(when_MixColumn_l20_4,a2)
  begin
    if when_MixColumn_l20_4 = '1' then
      zz_io_mixColumnsOutput_4 <= (pkg_shiftLeft(a2,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_4 <= pkg_shiftLeft(a2,1);
    end if;
  end process;

  when_MixColumn_l20_5 <= pkg_extract(a3,7);
  process(when_MixColumn_l20_5,a3)
  begin
    if when_MixColumn_l20_5 = '1' then
      zz_io_mixColumnsOutput_5 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_5 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

  when_MixColumn_l20_6 <= pkg_extract(a0,7);
  process(when_MixColumn_l20_6,a0)
  begin
    if when_MixColumn_l20_6 = '1' then
      zz_io_mixColumnsOutput_6 <= (pkg_shiftLeft(a0,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_6 <= pkg_shiftLeft(a0,1);
    end if;
  end process;

  when_MixColumn_l20_7 <= pkg_extract(a3,7);
  process(when_MixColumn_l20_7,a3)
  begin
    if when_MixColumn_l20_7 = '1' then
      zz_io_mixColumnsOutput_7 <= (pkg_shiftLeft(a3,1) xor pkg_stdLogicVector("100011011"));
    else
      zz_io_mixColumnsOutput_7 <= pkg_shiftLeft(a3,1);
    end if;
  end process;

end arch;


--MixColumn_1 replaced by MixColumn


--MixColumn_2 replaced by MixColumn


--MixColumn_3 replaced by MixColumn


--MixColumn_4 replaced by MixColumn


--MixColumn_5 replaced by MixColumn


--MixColumn_6 replaced by MixColumn


--MixColumn_7 replaced by MixColumn

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KeySchedule is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_sampleInput : in std_logic;
    io_keyIn1 : in std_logic_vector(127 downto 0);
    io_keyIn2 : in std_logic_vector(127 downto 0);
    io_roundConstant : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(151 downto 0);
    io_keyOut1 : out std_logic_vector(127 downto 0);
    io_keyOut2 : out std_logic_vector(127 downto 0)
  );
end KeySchedule;

architecture arch of KeySchedule is
  signal sBox_20_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_20_io_mask : std_logic_vector(37 downto 0);
  signal sBox_21_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_21_io_mask : std_logic_vector(37 downto 0);
  signal sBox_22_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_22_io_mask : std_logic_vector(37 downto 0);
  signal sBox_23_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_23_io_mask : std_logic_vector(37 downto 0);
  signal sBox_20_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_21_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_22_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_23_io_sbox_out : std_logic_vector(15 downto 0);

  signal r_reg1 : std_logic_vector(127 downto 0);
  signal r_reg2 : std_logic_vector(127 downto 0);
  signal r_w00 : std_logic_vector(31 downto 0);
  signal r_w01 : std_logic_vector(31 downto 0);
  signal r_w10 : std_logic_vector(31 downto 0);
  signal r_w11 : std_logic_vector(31 downto 0);
  signal r_w20 : std_logic_vector(31 downto 0);
  signal r_w21 : std_logic_vector(31 downto 0);
  signal r_w30 : std_logic_vector(31 downto 0);
  signal r_w31 : std_logic_vector(31 downto 0);
  signal r_rc : std_logic_vector(31 downto 0);
  signal r_sBoxOut0 : std_logic_vector(31 downto 0);
  signal r_sBoxOut1 : std_logic_vector(31 downto 0);
begin
  sBox_20 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_20_io_sbox_in,
      io_mask => sBox_20_io_mask,
      io_sbox_out => sBox_20_io_sbox_out 
    );
  sBox_21 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_21_io_sbox_in,
      io_mask => sBox_21_io_mask,
      io_sbox_out => sBox_21_io_sbox_out 
    );
  sBox_22 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_22_io_sbox_in,
      io_mask => sBox_22_io_mask,
      io_sbox_out => sBox_22_io_sbox_out 
    );
  sBox_23 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_23_io_sbox_in,
      io_mask => sBox_23_io_mask,
      io_sbox_out => sBox_23_io_sbox_out 
    );
  sBox_20_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,31,24),pkg_extract(io_keyIn2,31,24));
  sBox_20_io_mask <= pkg_extract(io_m,151,114);
  process(sBox_20_io_sbox_out,sBox_21_io_sbox_out,sBox_22_io_sbox_out,sBox_23_io_sbox_out)
  begin
    r_sBoxOut0(31 downto 24) <= pkg_extract(sBox_20_io_sbox_out,15,8);
    r_sBoxOut0(23 downto 16) <= pkg_extract(sBox_21_io_sbox_out,15,8);
    r_sBoxOut0(15 downto 8) <= pkg_extract(sBox_22_io_sbox_out,15,8);
    r_sBoxOut0(7 downto 0) <= pkg_extract(sBox_23_io_sbox_out,15,8);
  end process;

  process(sBox_20_io_sbox_out,sBox_21_io_sbox_out,sBox_22_io_sbox_out,sBox_23_io_sbox_out)
  begin
    r_sBoxOut1(31 downto 24) <= pkg_extract(sBox_20_io_sbox_out,7,0);
    r_sBoxOut1(23 downto 16) <= pkg_extract(sBox_21_io_sbox_out,7,0);
    r_sBoxOut1(15 downto 8) <= pkg_extract(sBox_22_io_sbox_out,7,0);
    r_sBoxOut1(7 downto 0) <= pkg_extract(sBox_23_io_sbox_out,7,0);
  end process;

  sBox_21_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,23,16),pkg_extract(io_keyIn2,23,16));
  sBox_21_io_mask <= pkg_extract(io_m,113,76);
  sBox_22_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,15,8),pkg_extract(io_keyIn2,15,8));
  sBox_22_io_mask <= pkg_extract(io_m,75,38);
  sBox_23_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,7,0),pkg_extract(io_keyIn2,7,0));
  sBox_23_io_mask <= pkg_extract(io_m,37,0);
  r_rc <= pkg_shiftLeft(io_roundConstant,24);
  r_w00 <= ((pkg_extract(r_reg1,127,96) xor pkg_cat(pkg_extract(r_sBoxOut0,23,0),pkg_extract(r_sBoxOut0,31,24))) xor r_rc);
  r_w01 <= (pkg_extract(r_reg2,127,96) xor pkg_cat(pkg_extract(r_sBoxOut1,23,0),pkg_extract(r_sBoxOut1,31,24)));
  r_w10 <= (pkg_extract(r_reg1,95,64) xor r_w00);
  r_w11 <= (pkg_extract(r_reg2,95,64) xor r_w01);
  r_w20 <= (pkg_extract(r_reg1,63,32) xor r_w10);
  r_w21 <= (pkg_extract(r_reg2,63,32) xor r_w11);
  r_w30 <= (pkg_extract(r_reg1,31,0) xor r_w20);
  r_w31 <= (pkg_extract(r_reg2,31,0) xor r_w21);
  io_keyOut1 <= pkg_cat(pkg_cat(pkg_cat(r_w00,r_w10),r_w20),r_w30);
  io_keyOut2 <= pkg_cat(pkg_cat(pkg_cat(r_w01,r_w11),r_w21),r_w31);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_reg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_reg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    elsif rising_edge(io_clk) then
      if io_sampleInput = '1' then
        r_reg1 <= io_keyIn1;
        r_reg2 <= io_keyIn2;
      end if;
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
    io_arkIn : in std_logic_vector(127 downto 0);
    io_key : in std_logic_vector(127 downto 0);
    io_arkOut : out std_logic_vector(127 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_arkOut <= (io_arkIn xor io_key);
end arch;


--AddRoundKey_1 replaced by AddRoundKey

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity SubBytes is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_sbIn1 : in std_logic_vector(127 downto 0);
    io_sbIn2 : in std_logic_vector(127 downto 0);
    io_mask : in std_logic_vector(607 downto 0);
    io_sbOut1 : out std_logic_vector(127 downto 0);
    io_sbOut2 : out std_logic_vector(127 downto 0)
  );
end SubBytes;

architecture arch of SubBytes is
  signal sBox_20_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_20_io_mask : std_logic_vector(37 downto 0);
  signal sBox_21_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_21_io_mask : std_logic_vector(37 downto 0);
  signal sBox_22_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_22_io_mask : std_logic_vector(37 downto 0);
  signal sBox_23_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_23_io_mask : std_logic_vector(37 downto 0);
  signal sBox_24_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_24_io_mask : std_logic_vector(37 downto 0);
  signal sBox_25_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_25_io_mask : std_logic_vector(37 downto 0);
  signal sBox_26_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_26_io_mask : std_logic_vector(37 downto 0);
  signal sBox_27_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_27_io_mask : std_logic_vector(37 downto 0);
  signal sBox_28_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_28_io_mask : std_logic_vector(37 downto 0);
  signal sBox_29_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_29_io_mask : std_logic_vector(37 downto 0);
  signal sBox_30_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_30_io_mask : std_logic_vector(37 downto 0);
  signal sBox_31_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_31_io_mask : std_logic_vector(37 downto 0);
  signal sBox_32_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_32_io_mask : std_logic_vector(37 downto 0);
  signal sBox_33_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_33_io_mask : std_logic_vector(37 downto 0);
  signal sBox_34_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_34_io_mask : std_logic_vector(37 downto 0);
  signal sBox_35_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_35_io_mask : std_logic_vector(37 downto 0);
  signal sBox_20_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_21_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_22_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_23_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_24_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_25_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_26_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_27_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_28_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_29_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_30_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_31_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_32_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_33_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_34_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_35_io_sbox_out : std_logic_vector(15 downto 0);

begin
  sBox_20 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_20_io_sbox_in,
      io_mask => sBox_20_io_mask,
      io_sbox_out => sBox_20_io_sbox_out 
    );
  sBox_21 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_21_io_sbox_in,
      io_mask => sBox_21_io_mask,
      io_sbox_out => sBox_21_io_sbox_out 
    );
  sBox_22 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_22_io_sbox_in,
      io_mask => sBox_22_io_mask,
      io_sbox_out => sBox_22_io_sbox_out 
    );
  sBox_23 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_23_io_sbox_in,
      io_mask => sBox_23_io_mask,
      io_sbox_out => sBox_23_io_sbox_out 
    );
  sBox_24 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_24_io_sbox_in,
      io_mask => sBox_24_io_mask,
      io_sbox_out => sBox_24_io_sbox_out 
    );
  sBox_25 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_25_io_sbox_in,
      io_mask => sBox_25_io_mask,
      io_sbox_out => sBox_25_io_sbox_out 
    );
  sBox_26 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_26_io_sbox_in,
      io_mask => sBox_26_io_mask,
      io_sbox_out => sBox_26_io_sbox_out 
    );
  sBox_27 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_27_io_sbox_in,
      io_mask => sBox_27_io_mask,
      io_sbox_out => sBox_27_io_sbox_out 
    );
  sBox_28 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_28_io_sbox_in,
      io_mask => sBox_28_io_mask,
      io_sbox_out => sBox_28_io_sbox_out 
    );
  sBox_29 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_29_io_sbox_in,
      io_mask => sBox_29_io_mask,
      io_sbox_out => sBox_29_io_sbox_out 
    );
  sBox_30 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_30_io_sbox_in,
      io_mask => sBox_30_io_mask,
      io_sbox_out => sBox_30_io_sbox_out 
    );
  sBox_31 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_31_io_sbox_in,
      io_mask => sBox_31_io_mask,
      io_sbox_out => sBox_31_io_sbox_out 
    );
  sBox_32 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_32_io_sbox_in,
      io_mask => sBox_32_io_mask,
      io_sbox_out => sBox_32_io_sbox_out 
    );
  sBox_33 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_33_io_sbox_in,
      io_mask => sBox_33_io_mask,
      io_sbox_out => sBox_33_io_sbox_out 
    );
  sBox_34 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_34_io_sbox_in,
      io_mask => sBox_34_io_mask,
      io_sbox_out => sBox_34_io_sbox_out 
    );
  sBox_35 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_35_io_sbox_in,
      io_mask => sBox_35_io_mask,
      io_sbox_out => sBox_35_io_sbox_out 
    );
  sBox_20_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,127,120),pkg_extract(io_sbIn2,127,120));
  sBox_20_io_mask <= pkg_extract(io_mask,607,570);
  process(sBox_20_io_sbox_out,sBox_21_io_sbox_out,sBox_22_io_sbox_out,sBox_23_io_sbox_out,sBox_24_io_sbox_out,sBox_25_io_sbox_out,sBox_26_io_sbox_out,sBox_27_io_sbox_out,sBox_28_io_sbox_out,sBox_29_io_sbox_out,sBox_30_io_sbox_out,sBox_31_io_sbox_out,sBox_32_io_sbox_out,sBox_33_io_sbox_out,sBox_34_io_sbox_out,sBox_35_io_sbox_out)
  begin
    io_sbOut1(127 downto 120) <= pkg_extract(sBox_20_io_sbox_out,15,8);
    io_sbOut1(119 downto 112) <= pkg_extract(sBox_21_io_sbox_out,15,8);
    io_sbOut1(111 downto 104) <= pkg_extract(sBox_22_io_sbox_out,15,8);
    io_sbOut1(103 downto 96) <= pkg_extract(sBox_23_io_sbox_out,15,8);
    io_sbOut1(95 downto 88) <= pkg_extract(sBox_24_io_sbox_out,15,8);
    io_sbOut1(87 downto 80) <= pkg_extract(sBox_25_io_sbox_out,15,8);
    io_sbOut1(79 downto 72) <= pkg_extract(sBox_26_io_sbox_out,15,8);
    io_sbOut1(71 downto 64) <= pkg_extract(sBox_27_io_sbox_out,15,8);
    io_sbOut1(63 downto 56) <= pkg_extract(sBox_28_io_sbox_out,15,8);
    io_sbOut1(55 downto 48) <= pkg_extract(sBox_29_io_sbox_out,15,8);
    io_sbOut1(47 downto 40) <= pkg_extract(sBox_30_io_sbox_out,15,8);
    io_sbOut1(39 downto 32) <= pkg_extract(sBox_31_io_sbox_out,15,8);
    io_sbOut1(31 downto 24) <= pkg_extract(sBox_32_io_sbox_out,15,8);
    io_sbOut1(23 downto 16) <= pkg_extract(sBox_33_io_sbox_out,15,8);
    io_sbOut1(15 downto 8) <= pkg_extract(sBox_34_io_sbox_out,15,8);
    io_sbOut1(7 downto 0) <= pkg_extract(sBox_35_io_sbox_out,15,8);
  end process;

  process(sBox_20_io_sbox_out,sBox_21_io_sbox_out,sBox_22_io_sbox_out,sBox_23_io_sbox_out,sBox_24_io_sbox_out,sBox_25_io_sbox_out,sBox_26_io_sbox_out,sBox_27_io_sbox_out,sBox_28_io_sbox_out,sBox_29_io_sbox_out,sBox_30_io_sbox_out,sBox_31_io_sbox_out,sBox_32_io_sbox_out,sBox_33_io_sbox_out,sBox_34_io_sbox_out,sBox_35_io_sbox_out)
  begin
    io_sbOut2(127 downto 120) <= pkg_extract(sBox_20_io_sbox_out,7,0);
    io_sbOut2(119 downto 112) <= pkg_extract(sBox_21_io_sbox_out,7,0);
    io_sbOut2(111 downto 104) <= pkg_extract(sBox_22_io_sbox_out,7,0);
    io_sbOut2(103 downto 96) <= pkg_extract(sBox_23_io_sbox_out,7,0);
    io_sbOut2(95 downto 88) <= pkg_extract(sBox_24_io_sbox_out,7,0);
    io_sbOut2(87 downto 80) <= pkg_extract(sBox_25_io_sbox_out,7,0);
    io_sbOut2(79 downto 72) <= pkg_extract(sBox_26_io_sbox_out,7,0);
    io_sbOut2(71 downto 64) <= pkg_extract(sBox_27_io_sbox_out,7,0);
    io_sbOut2(63 downto 56) <= pkg_extract(sBox_28_io_sbox_out,7,0);
    io_sbOut2(55 downto 48) <= pkg_extract(sBox_29_io_sbox_out,7,0);
    io_sbOut2(47 downto 40) <= pkg_extract(sBox_30_io_sbox_out,7,0);
    io_sbOut2(39 downto 32) <= pkg_extract(sBox_31_io_sbox_out,7,0);
    io_sbOut2(31 downto 24) <= pkg_extract(sBox_32_io_sbox_out,7,0);
    io_sbOut2(23 downto 16) <= pkg_extract(sBox_33_io_sbox_out,7,0);
    io_sbOut2(15 downto 8) <= pkg_extract(sBox_34_io_sbox_out,7,0);
    io_sbOut2(7 downto 0) <= pkg_extract(sBox_35_io_sbox_out,7,0);
  end process;

  sBox_21_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,119,112),pkg_extract(io_sbIn2,119,112));
  sBox_21_io_mask <= pkg_extract(io_mask,569,532);
  sBox_22_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,111,104),pkg_extract(io_sbIn2,111,104));
  sBox_22_io_mask <= pkg_extract(io_mask,531,494);
  sBox_23_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,103,96),pkg_extract(io_sbIn2,103,96));
  sBox_23_io_mask <= pkg_extract(io_mask,493,456);
  sBox_24_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,95,88),pkg_extract(io_sbIn2,95,88));
  sBox_24_io_mask <= pkg_extract(io_mask,455,418);
  sBox_25_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,87,80),pkg_extract(io_sbIn2,87,80));
  sBox_25_io_mask <= pkg_extract(io_mask,417,380);
  sBox_26_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,79,72),pkg_extract(io_sbIn2,79,72));
  sBox_26_io_mask <= pkg_extract(io_mask,379,342);
  sBox_27_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,71,64),pkg_extract(io_sbIn2,71,64));
  sBox_27_io_mask <= pkg_extract(io_mask,341,304);
  sBox_28_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,63,56),pkg_extract(io_sbIn2,63,56));
  sBox_28_io_mask <= pkg_extract(io_mask,303,266);
  sBox_29_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,55,48),pkg_extract(io_sbIn2,55,48));
  sBox_29_io_mask <= pkg_extract(io_mask,265,228);
  sBox_30_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,47,40),pkg_extract(io_sbIn2,47,40));
  sBox_30_io_mask <= pkg_extract(io_mask,227,190);
  sBox_31_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,39,32),pkg_extract(io_sbIn2,39,32));
  sBox_31_io_mask <= pkg_extract(io_mask,189,152);
  sBox_32_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,31,24),pkg_extract(io_sbIn2,31,24));
  sBox_32_io_mask <= pkg_extract(io_mask,151,114);
  sBox_33_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,23,16),pkg_extract(io_sbIn2,23,16));
  sBox_33_io_mask <= pkg_extract(io_mask,113,76);
  sBox_34_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,15,8),pkg_extract(io_sbIn2,15,8));
  sBox_34_io_mask <= pkg_extract(io_mask,75,38);
  sBox_35_io_sbox_in <= pkg_cat(pkg_extract(io_sbIn1,7,0),pkg_extract(io_sbIn2,7,0));
  sBox_35_io_mask <= pkg_extract(io_mask,37,0);
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumns is
  port(
    io_mcIn : in std_logic_vector(127 downto 0);
    io_mcOut : out std_logic_vector(127 downto 0)
  );
end MixColumns;

architecture arch of MixColumns is
  signal mixColumn_8_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumn_9_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumn_10_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumn_11_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumn_8_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumn_9_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumn_10_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumn_11_io_mixColumnsOutput : std_logic_vector(31 downto 0);

begin
  mixColumn_8 : entity work.MixColumn
    port map ( 
      io_mixColumnsInput => mixColumn_8_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumn_8_io_mixColumnsOutput 
    );
  mixColumn_9 : entity work.MixColumn
    port map ( 
      io_mixColumnsInput => mixColumn_9_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumn_9_io_mixColumnsOutput 
    );
  mixColumn_10 : entity work.MixColumn
    port map ( 
      io_mixColumnsInput => mixColumn_10_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumn_10_io_mixColumnsOutput 
    );
  mixColumn_11 : entity work.MixColumn
    port map ( 
      io_mixColumnsInput => mixColumn_11_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumn_11_io_mixColumnsOutput 
    );
  mixColumn_8_io_mixColumnsInput <= pkg_extract(io_mcIn,127,96);
  process(mixColumn_8_io_mixColumnsOutput,mixColumn_9_io_mixColumnsOutput,mixColumn_10_io_mixColumnsOutput,mixColumn_11_io_mixColumnsOutput)
  begin
    io_mcOut(127 downto 96) <= mixColumn_8_io_mixColumnsOutput;
    io_mcOut(95 downto 64) <= mixColumn_9_io_mixColumnsOutput;
    io_mcOut(63 downto 32) <= mixColumn_10_io_mixColumnsOutput;
    io_mcOut(31 downto 0) <= mixColumn_11_io_mixColumnsOutput;
  end process;

  mixColumn_9_io_mixColumnsInput <= pkg_extract(io_mcIn,95,64);
  mixColumn_10_io_mixColumnsInput <= pkg_extract(io_mcIn,63,32);
  mixColumn_11_io_mixColumnsInput <= pkg_extract(io_mcIn,31,0);
end arch;


--MixColumns_1 replaced by MixColumns

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
    io_pt1 : in std_logic_vector(127 downto 0);
    io_pt2 : in std_logic_vector(127 downto 0);
    io_key1 : in std_logic_vector(127 downto 0);
    io_key2 : in std_logic_vector(127 downto 0);
    io_m : in std_logic_vector(759 downto 0);
    io_ct1 : out std_logic_vector(127 downto 0);
    io_ct2 : out std_logic_vector(127 downto 0);
    io_done : out std_logic
  );
end AES;

architecture arch of AES is
  signal r_keyschedule_io_sampleInput : std_logic;
  signal r_keyschedule_io_m : std_logic_vector(151 downto 0);
  signal r_subbytes_io_mask : std_logic_vector(607 downto 0);
  signal r_keyschedule_io_keyOut1 : std_logic_vector(127 downto 0);
  signal r_keyschedule_io_keyOut2 : std_logic_vector(127 downto 0);
  signal r_addroundkey1_io_arkOut : std_logic_vector(127 downto 0);
  signal r_addroundkey2_io_arkOut : std_logic_vector(127 downto 0);
  signal r_subbytes_io_sbOut1 : std_logic_vector(127 downto 0);
  signal r_subbytes_io_sbOut2 : std_logic_vector(127 downto 0);
  signal r_shiftrows1_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal r_shiftrows2_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal r_mixcolumns1_io_mcOut : std_logic_vector(127 downto 0);
  signal r_mixcolumns2_io_mcOut : std_logic_vector(127 downto 0);

  signal r_stateReg1 : std_logic_vector(127 downto 0);
  signal r_stateReg2 : std_logic_vector(127 downto 0);
  signal r_keyReg1 : std_logic_vector(127 downto 0);
  signal r_keyReg2 : std_logic_vector(127 downto 0);
  signal r_roundConstant : std_logic_vector(7 downto 0);
  signal r_roundCounter_willIncrement : std_logic;
  signal r_roundCounter_willClear : std_logic;
  signal r_roundCounter_valueNext : unsigned(3 downto 0);
  signal r_roundCounter_value : unsigned(3 downto 0);
  signal r_roundCounter_willOverflowIfInc : std_logic;
  signal r_roundCounter_willOverflow : std_logic;
  signal r_smallCtr_willIncrement : std_logic;
  signal r_smallCtr_willClear : std_logic;
  signal r_smallCtr_valueNext : unsigned(2 downto 0);
  signal r_smallCtr_value : unsigned(2 downto 0);
  signal r_smallCtr_willOverflowIfInc : std_logic;
  signal r_smallCtr_willOverflow : std_logic;
  signal when_AES_l66 : std_logic;
  signal r_aesState : States_1;
  signal when_AES_l95 : std_logic;
  signal when_AES_l100 : std_logic;
begin
  r_keyschedule : entity work.KeySchedule
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sampleInput => r_keyschedule_io_sampleInput,
      io_keyIn1 => r_keyReg1,
      io_keyIn2 => r_keyReg2,
      io_roundConstant => r_roundConstant,
      io_m => r_keyschedule_io_m,
      io_keyOut1 => r_keyschedule_io_keyOut1,
      io_keyOut2 => r_keyschedule_io_keyOut2 
    );
  r_addroundkey1 : entity work.AddRoundKey
    port map ( 
      io_arkIn => r_stateReg1,
      io_key => r_keyReg1,
      io_arkOut => r_addroundkey1_io_arkOut 
    );
  r_addroundkey2 : entity work.AddRoundKey
    port map ( 
      io_arkIn => r_stateReg2,
      io_key => r_keyReg2,
      io_arkOut => r_addroundkey2_io_arkOut 
    );
  r_subbytes : entity work.SubBytes
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbIn1 => r_addroundkey1_io_arkOut,
      io_sbIn2 => r_addroundkey2_io_arkOut,
      io_mask => r_subbytes_io_mask,
      io_sbOut1 => r_subbytes_io_sbOut1,
      io_sbOut2 => r_subbytes_io_sbOut2 
    );
  r_shiftrows1 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_subbytes_io_sbOut1,
      io_shiftRowsOutput => r_shiftrows1_io_shiftRowsOutput 
    );
  r_shiftrows2 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => r_subbytes_io_sbOut2,
      io_shiftRowsOutput => r_shiftrows2_io_shiftRowsOutput 
    );
  r_mixcolumns1 : entity work.MixColumns
    port map ( 
      io_mcIn => r_shiftrows1_io_shiftRowsOutput,
      io_mcOut => r_mixcolumns1_io_mcOut 
    );
  r_mixcolumns2 : entity work.MixColumns
    port map ( 
      io_mcIn => r_shiftrows2_io_shiftRowsOutput,
      io_mcOut => r_mixcolumns2_io_mcOut 
    );
  process(r_aesState)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sDone =>
        io_done <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(r_aesState,r_smallCtr_willOverflow)
  begin
    r_roundCounter_willIncrement <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sExecute =>
        if r_smallCtr_willOverflow = '1' then
          r_roundCounter_willIncrement <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_aesState)
  begin
    r_roundCounter_willClear <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sIdle =>
        r_roundCounter_willClear <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  r_roundCounter_willOverflowIfInc <= pkg_toStdLogic(r_roundCounter_value = pkg_unsigned("1010"));
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
    r_smallCtr_willIncrement <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sExecute =>
        r_smallCtr_willIncrement <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  r_smallCtr_willClear <= pkg_toStdLogic(false);
  r_smallCtr_willOverflowIfInc <= pkg_toStdLogic(r_smallCtr_value = pkg_unsigned("100"));
  r_smallCtr_willOverflow <= (r_smallCtr_willOverflowIfInc and r_smallCtr_willIncrement);
  process(r_smallCtr_willOverflow,r_smallCtr_value,r_smallCtr_willIncrement,r_smallCtr_willClear)
  begin
    if r_smallCtr_willOverflow = '1' then
      r_smallCtr_valueNext <= pkg_unsigned("000");
    else
      r_smallCtr_valueNext <= (r_smallCtr_value + pkg_resize(unsigned(pkg_toStdLogicVector(r_smallCtr_willIncrement)),3));
    end if;
    if r_smallCtr_willClear = '1' then
      r_smallCtr_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  process(r_aesState,when_AES_l95)
  begin
    r_keyschedule_io_sampleInput <= pkg_toStdLogic(false);
    case r_aesState is
      when pkg_enum.sExecute =>
        if when_AES_l95 = '1' then
          r_keyschedule_io_sampleInput <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  r_keyschedule_io_m <= pkg_extract(io_m,759,608);
  r_subbytes_io_mask <= pkg_extract(io_m,607,0);
  when_AES_l66 <= pkg_toStdLogic(r_roundCounter_value = pkg_unsigned("1010"));
  io_ct1 <= r_addroundkey1_io_arkOut;
  io_ct2 <= r_addroundkey2_io_arkOut;
  when_AES_l95 <= pkg_toStdLogic(r_smallCtr_value = pkg_unsigned("000"));
  when_AES_l100 <= pkg_toStdLogic(unsigned(r_roundConstant) < pkg_unsigned("10000000"));
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_stateReg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_stateReg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_roundConstant <= pkg_stdLogicVector("00000001");
      r_roundCounter_value <= pkg_unsigned("0001");
      r_smallCtr_value <= pkg_unsigned("000");
      r_aesState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_smallCtr_value <= r_smallCtr_valueNext;
      r_keyReg1 <= r_keyschedule_io_keyOut1;
      r_keyReg2 <= r_keyschedule_io_keyOut2;
      r_stateReg1 <= r_mixcolumns1_io_mcOut;
      r_stateReg2 <= r_mixcolumns2_io_mcOut;
      if when_AES_l66 = '1' then
        r_stateReg1 <= r_shiftrows1_io_shiftRowsOutput;
        r_stateReg2 <= r_shiftrows2_io_shiftRowsOutput;
      end if;
      case r_aesState is
        when pkg_enum.sIdle =>
          if io_enable = '1' then
            r_aesState <= pkg_enum.sExecute;
            r_keyReg1 <= io_key1;
            r_keyReg2 <= io_key2;
            r_stateReg1 <= io_pt1;
            r_stateReg2 <= io_pt2;
          end if;
        when pkg_enum.sExecute =>
          if r_smallCtr_willOverflow = '1' then
            if when_AES_l100 = '1' then
              r_roundConstant <= std_logic_vector(shift_left(unsigned(r_roundConstant),1));
            else
              r_roundConstant <= (std_logic_vector(shift_left(unsigned(r_roundConstant),1)) xor pkg_stdLogicVector("00011011"));
            end if;
          end if;
          if r_roundCounter_willOverflow = '1' then
            r_aesState <= pkg_enum.sDone;
          end if;
        when others =>
      end case;
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


entity AES_Wrapper is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_resetFull : in std_logic;
    io_enable : in std_logic;
    io_dataIn : in std_logic_vector(255 downto 0);
    io_key : in std_logic_vector(255 downto 0);
    io_mask : in std_logic_vector(759 downto 0);
    io_dataOut : out std_logic_vector(255 downto 0);
    io_done : out std_logic
  );
end AES_Wrapper;

architecture arch of AES_Wrapper is
  signal r_aes_io_reset : std_logic;
  signal r_aes_io_ct1 : std_logic_vector(127 downto 0);
  signal r_aes_io_ct2 : std_logic_vector(127 downto 0);
  signal r_aes_io_done : std_logic;

  signal r_dataInReg_0 : std_logic_vector(127 downto 0);
  signal r_dataInReg_1 : std_logic_vector(127 downto 0);
  signal r_keyReg_0 : std_logic_vector(127 downto 0);
  signal r_keyReg_1 : std_logic_vector(127 downto 0);
  signal r_dataOutReg_0 : std_logic_vector(127 downto 0);
  signal r_dataOutReg_1 : std_logic_vector(127 downto 0);
  signal r_enableAES : std_logic;
  signal r_sampleInputs : std_logic;
  signal r_sampleOutputs : std_logic;
  signal r_dutState : States;
begin
  r_aes : entity work.AES
    port map ( 
      io_clk => io_clk,
      io_reset => r_aes_io_reset,
      io_enable => r_enableAES,
      io_pt1 => r_dataInReg_0,
      io_pt2 => r_dataInReg_1,
      io_key1 => r_keyReg_0,
      io_key2 => r_keyReg_1,
      io_m => io_mask,
      io_ct1 => r_aes_io_ct1,
      io_ct2 => r_aes_io_ct2,
      io_done => r_aes_io_done 
    );
  process(r_dutState)
  begin
    r_sampleInputs <= pkg_toStdLogic(false);
    case r_dutState is
      when pkg_enum.sIdle =>
      when pkg_enum.sLoadData =>
        r_sampleInputs <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  process(r_dutState,r_aes_io_done)
  begin
    r_sampleOutputs <= pkg_toStdLogic(false);
    case r_dutState is
      when pkg_enum.sIdle =>
      when pkg_enum.sLoadData =>
      when pkg_enum.sExecute =>
        if r_aes_io_done = '1' then
          r_sampleOutputs <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(r_dutState)
  begin
    r_aes_io_reset <= pkg_toStdLogic(true);
    case r_dutState is
      when pkg_enum.sIdle =>
      when pkg_enum.sLoadData =>
        r_aes_io_reset <= pkg_toStdLogic(false);
      when pkg_enum.sExecute =>
        r_aes_io_reset <= pkg_toStdLogic(false);
      when others =>
    end case;
  end process;

  process(r_dutState)
  begin
    io_done <= pkg_toStdLogic(false);
    case r_dutState is
      when pkg_enum.sIdle =>
      when pkg_enum.sLoadData =>
      when pkg_enum.sExecute =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  io_dataOut <= pkg_cat(r_dataOutReg_0,r_dataOutReg_1);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_dataInReg_0 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_dataInReg_1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg_0 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_keyReg_1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_dataOutReg_0 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_dataOutReg_1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_enableAES <= pkg_toStdLogic(false);
      r_dutState <= pkg_enum.sIdle;
    elsif rising_edge(io_clk) then
      r_enableAES <= pkg_toStdLogic(false);
      if r_sampleInputs = '1' then
        r_dataInReg_0 <= pkg_extract(io_dataIn,127,0);
        r_keyReg_0 <= pkg_extract(io_key,127,0);
        r_dataInReg_1 <= pkg_extract(io_dataIn,255,128);
        r_keyReg_1 <= pkg_extract(io_key,255,128);
      end if;
      if r_sampleOutputs = '1' then
        r_dataOutReg_0 <= r_aes_io_ct1;
        r_dataOutReg_1 <= r_aes_io_ct2;
      end if;
      case r_dutState is
        when pkg_enum.sIdle =>
          r_dutState <= pkg_enum.sIdle;
          if io_enable = '1' then
            r_dutState <= pkg_enum.sLoadData;
          end if;
        when pkg_enum.sLoadData =>
          r_enableAES <= pkg_toStdLogic(true);
          r_dutState <= pkg_enum.sExecute;
        when pkg_enum.sExecute =>
          r_dutState <= pkg_enum.sExecute;
          if r_aes_io_done = '1' then
            r_dutState <= pkg_enum.sDone;
          end if;
        when others =>
          r_dutState <= pkg_enum.sDone;
      end case;
    end if;
  end process;

end arch;

