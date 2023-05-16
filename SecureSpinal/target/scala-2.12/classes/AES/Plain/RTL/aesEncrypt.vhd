-- Generator : SpinalHDL v1.6.1    git head : 8addf7fa9969a9cb92e967e4bc42178878175609
-- Component : AESEncrypt
-- Git hash  : 8addf7fa9969a9cb92e967e4bc42178878175609

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
  begin
    return that(bitId);
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
  begin
    return that(bitId);
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
  begin
    return that(bitId);
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


entity SubBytes is
  port(
    io_subBytesInput : in std_logic_vector(7 downto 0);
    io_subBytesOutput : out std_logic_vector(7 downto 0)
  );
end SubBytes;

architecture arch of SubBytes is
  signal zz_sbox_port0 : std_logic_vector(7 downto 0);
  attribute ram_style : string;

  signal zz_io_subBytesOutput : unsigned(7 downto 0);
  type sbox_type is array (0 to 255) of std_logic_vector(7 downto 0);
  signal sbox : sbox_type := (
     "01100011","01111100","01110111","01111011","11110010","01101011","01101111","11000101","00110000","00000001","01100111","00101011","11111110","11010111","10101011","01110110",
     "11001010","10000010","11001001","01111101","11111010","01011001","01000111","11110000","10101101","11010100","10100010","10101111","10011100","10100100","01110010","11000000",
     "10110111","11111101","10010011","00100110","00110110","00111111","11110111","11001100","00110100","10100101","11100101","11110001","01110001","11011000","00110001","00010101",
     "00000100","11000111","00100011","11000011","00011000","10010110","00000101","10011010","00000111","00010010","10000000","11100010","11101011","00100111","10110010","01110101",
     "00001001","10000011","00101100","00011010","00011011","01101110","01011010","10100000","01010010","00111011","11010110","10110011","00101001","11100011","00101111","10000100",
     "01010011","11010001","00000000","11101101","00100000","11111100","10110001","01011011","01101010","11001011","10111110","00111001","01001010","01001100","01011000","11001111",
     "11010000","11101111","10101010","11111011","01000011","01001101","00110011","10000101","01000101","11111001","00000010","01111111","01010000","00111100","10011111","10101000",
     "01010001","10100011","01000000","10001111","10010010","10011101","00111000","11110101","10111100","10110110","11011010","00100001","00010000","11111111","11110011","11010010",
     "11001101","00001100","00010011","11101100","01011111","10010111","01000100","00010111","11000100","10100111","01111110","00111101","01100100","01011101","00011001","01110011",
     "01100000","10000001","01001111","11011100","00100010","00101010","10010000","10001000","01000110","11101110","10111000","00010100","11011110","01011110","00001011","11011011",
     "11100000","00110010","00111010","00001010","01001001","00000110","00100100","01011100","11000010","11010011","10101100","01100010","10010001","10010101","11100100","01111001",
     "11100111","11001000","00110111","01101101","10001101","11010101","01001110","10101001","01101100","01010110","11110100","11101010","01100101","01111010","10101110","00001000",
     "10111010","01111000","00100101","00101110","00011100","10100110","10110100","11000110","11101000","11011101","01110100","00011111","01001011","10111101","10001011","10001010",
     "01110000","00111110","10110101","01100110","01001000","00000011","11110110","00001110","01100001","00110101","01010111","10111001","10000110","11000001","00011101","10011110",
     "11100001","11111000","10011000","00010001","01101001","11011001","10001110","10010100","10011011","00011110","10000111","11101001","11001110","01010101","00101000","11011111",
     "10001100","10100001","10001001","00001101","10111111","11100110","01000010","01101000","01000001","10011001","00101101","00001111","10110000","01010100","10111011","00010110");
  attribute ram_style of sbox : signal is "distributed";
begin
  zz_sbox_port0 <= sbox(to_integer(zz_io_subBytesOutput));
  zz_io_subBytesOutput <= unsigned(io_subBytesInput);
  io_subBytesOutput <= std_logic_vector(unsigned(zz_sbox_port0));
end arch;


--SubBytes_1 replaced by SubBytes


--SubBytes_2 replaced by SubBytes


--SubBytes_3 replaced by SubBytes

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AddRoundKey is
  port(
    io_addRoundKeyInput : in std_logic_vector(127 downto 0);
    io_roundKey : in std_logic_vector(127 downto 0);
    io_addRoundKeyOutput : out std_logic_vector(127 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_addRoundKeyOutput <= (io_addRoundKeyInput xor io_roundKey);
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KeySchedule is
  port(
    io_keyScheduleInput : in std_logic_vector(127 downto 0);
    io_roundConstant : in std_logic_vector(7 downto 0);
    io_keyScheduleOutput : out std_logic_vector(127 downto 0)
  );
end KeySchedule;

architecture arch of KeySchedule is
  signal subBytes_20_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_21_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_22_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_23_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_20_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_21_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_22_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_23_io_subBytesOutput : std_logic_vector(7 downto 0);

  signal w1 : std_logic_vector(31 downto 0);
  signal w2 : std_logic_vector(31 downto 0);
  signal w3 : std_logic_vector(31 downto 0);
  signal w0 : std_logic_vector(31 downto 0);
  signal sBoxOut : std_logic_vector(31 downto 0);
begin
  subBytes_20 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_20_io_subBytesInput,
      io_subBytesOutput => subBytes_20_io_subBytesOutput 
    );
  subBytes_21 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_21_io_subBytesInput,
      io_subBytesOutput => subBytes_21_io_subBytesOutput 
    );
  subBytes_22 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_22_io_subBytesInput,
      io_subBytesOutput => subBytes_22_io_subBytesOutput 
    );
  subBytes_23 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_23_io_subBytesInput,
      io_subBytesOutput => subBytes_23_io_subBytesOutput 
    );
  subBytes_20_io_subBytesInput <= pkg_extract(io_keyScheduleInput,31,24);
  process(subBytes_20_io_subBytesOutput,subBytes_21_io_subBytesOutput,subBytes_22_io_subBytesOutput,subBytes_23_io_subBytesOutput)
  begin
    sBoxOut(31 downto 24) <= subBytes_20_io_subBytesOutput;
    sBoxOut(23 downto 16) <= subBytes_21_io_subBytesOutput;
    sBoxOut(15 downto 8) <= subBytes_22_io_subBytesOutput;
    sBoxOut(7 downto 0) <= subBytes_23_io_subBytesOutput;
  end process;

  subBytes_21_io_subBytesInput <= pkg_extract(io_keyScheduleInput,23,16);
  subBytes_22_io_subBytesInput <= pkg_extract(io_keyScheduleInput,15,8);
  subBytes_23_io_subBytesInput <= pkg_extract(io_keyScheduleInput,7,0);
  w0 <= ((pkg_extract(io_keyScheduleInput,127,96) xor pkg_cat(pkg_extract(sBoxOut,23,0),pkg_extract(sBoxOut,31,24))) xor pkg_cat(io_roundConstant,pkg_stdLogicVector("000000000000000000000000")));
  w1 <= (pkg_extract(io_keyScheduleInput,95,64) xor w0);
  w2 <= (pkg_extract(io_keyScheduleInput,63,32) xor w1);
  w3 <= (pkg_extract(io_keyScheduleInput,31,0) xor w2);
  io_keyScheduleOutput <= pkg_cat(pkg_cat(pkg_cat(w0,w1),w2),w3);
end arch;


--SubBytes_4 replaced by SubBytes


--SubBytes_5 replaced by SubBytes


--SubBytes_6 replaced by SubBytes


--SubBytes_7 replaced by SubBytes


--SubBytes_8 replaced by SubBytes


--SubBytes_9 replaced by SubBytes


--SubBytes_10 replaced by SubBytes


--SubBytes_11 replaced by SubBytes


--SubBytes_12 replaced by SubBytes


--SubBytes_13 replaced by SubBytes


--SubBytes_14 replaced by SubBytes


--SubBytes_15 replaced by SubBytes


--SubBytes_16 replaced by SubBytes


--SubBytes_17 replaced by SubBytes


--SubBytes_18 replaced by SubBytes


--SubBytes_19 replaced by SubBytes

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity AESEncrypt is
  port(
    io_reset : in std_logic;
    io_plaintext : in std_logic_vector(127 downto 0);
    io_key : in std_logic_vector(127 downto 0);
    io_ciphertext : out std_logic_vector(127 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end AESEncrypt;

architecture arch of AESEncrypt is
  signal addRoundKey_1_io_addRoundKeyInput : std_logic_vector(127 downto 0);
  signal addRoundKey_1_io_roundKey : std_logic_vector(127 downto 0);
  signal mixColumns_4_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_5_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_6_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal mixColumns_7_io_mixColumnsInput : std_logic_vector(31 downto 0);
  signal keySchedule_1_io_keyScheduleInput : std_logic_vector(127 downto 0);
  signal subBytes_20_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_21_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_22_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_23_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_24_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_25_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_26_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_27_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_28_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_29_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_30_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_31_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_32_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_33_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_34_io_subBytesInput : std_logic_vector(7 downto 0);
  signal subBytes_35_io_subBytesInput : std_logic_vector(7 downto 0);
  signal addRoundKey_1_io_addRoundKeyOutput : std_logic_vector(127 downto 0);
  signal shiftRows_1_io_shiftRowsOutput : std_logic_vector(127 downto 0);
  signal mixColumns_4_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_5_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_6_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal mixColumns_7_io_mixColumnsOutput : std_logic_vector(31 downto 0);
  signal keySchedule_1_io_keyScheduleOutput : std_logic_vector(127 downto 0);
  signal subBytes_20_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_21_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_22_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_23_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_24_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_25_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_26_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_27_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_28_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_29_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_30_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_31_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_32_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_33_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_34_io_subBytesOutput : std_logic_vector(7 downto 0);
  signal subBytes_35_io_subBytesOutput : std_logic_vector(7 downto 0);

  signal dummy : std_logic;
  signal roundKey : std_logic_vector(127 downto 0);
  signal state : std_logic_vector(127 downto 0);
  signal round : unsigned(3 downto 0);
  signal roundConstant : std_logic_vector(7 downto 0);
  signal subBytesOut : std_logic_vector(127 downto 0);
  signal shiftRowsOut : std_logic_vector(127 downto 0);
  signal mixColumnsOut : std_logic_vector(127 downto 0);
  signal when_AESEncrypt_l27 : std_logic;
  signal io_reset_regNext : std_logic;
  signal when_AESEncrypt_l44 : std_logic;
  signal io_reset_regNext_1 : std_logic;
  signal when_AESEncrypt_l58 : std_logic;
  signal when_AESEncrypt_l64 : std_logic;
  signal io_reset_regNext_2 : std_logic;
  signal when_AESEncrypt_l68 : std_logic;
  signal when_AESEncrypt_l69 : std_logic;
  signal when_AESEncrypt_l77 : std_logic;
begin
  addRoundKey_1 : entity work.AddRoundKey
    port map ( 
      io_addRoundKeyInput => addRoundKey_1_io_addRoundKeyInput,
      io_roundKey => addRoundKey_1_io_roundKey,
      io_addRoundKeyOutput => addRoundKey_1_io_addRoundKeyOutput 
    );
  shiftRows_1 : entity work.ShiftRows
    port map ( 
      io_shiftRowsInput => subBytesOut,
      io_shiftRowsOutput => shiftRows_1_io_shiftRowsOutput 
    );
  mixColumns_4 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_4_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_4_io_mixColumnsOutput 
    );
  mixColumns_5 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_5_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_5_io_mixColumnsOutput 
    );
  mixColumns_6 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_6_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_6_io_mixColumnsOutput 
    );
  mixColumns_7 : entity work.MixColumns
    port map ( 
      io_mixColumnsInput => mixColumns_7_io_mixColumnsInput,
      io_mixColumnsOutput => mixColumns_7_io_mixColumnsOutput 
    );
  keySchedule_1 : entity work.KeySchedule
    port map ( 
      io_keyScheduleInput => keySchedule_1_io_keyScheduleInput,
      io_roundConstant => roundConstant,
      io_keyScheduleOutput => keySchedule_1_io_keyScheduleOutput 
    );
  subBytes_20 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_20_io_subBytesInput,
      io_subBytesOutput => subBytes_20_io_subBytesOutput 
    );
  subBytes_21 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_21_io_subBytesInput,
      io_subBytesOutput => subBytes_21_io_subBytesOutput 
    );
  subBytes_22 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_22_io_subBytesInput,
      io_subBytesOutput => subBytes_22_io_subBytesOutput 
    );
  subBytes_23 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_23_io_subBytesInput,
      io_subBytesOutput => subBytes_23_io_subBytesOutput 
    );
  subBytes_24 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_24_io_subBytesInput,
      io_subBytesOutput => subBytes_24_io_subBytesOutput 
    );
  subBytes_25 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_25_io_subBytesInput,
      io_subBytesOutput => subBytes_25_io_subBytesOutput 
    );
  subBytes_26 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_26_io_subBytesInput,
      io_subBytesOutput => subBytes_26_io_subBytesOutput 
    );
  subBytes_27 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_27_io_subBytesInput,
      io_subBytesOutput => subBytes_27_io_subBytesOutput 
    );
  subBytes_28 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_28_io_subBytesInput,
      io_subBytesOutput => subBytes_28_io_subBytesOutput 
    );
  subBytes_29 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_29_io_subBytesInput,
      io_subBytesOutput => subBytes_29_io_subBytesOutput 
    );
  subBytes_30 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_30_io_subBytesInput,
      io_subBytesOutput => subBytes_30_io_subBytesOutput 
    );
  subBytes_31 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_31_io_subBytesInput,
      io_subBytesOutput => subBytes_31_io_subBytesOutput 
    );
  subBytes_32 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_32_io_subBytesInput,
      io_subBytesOutput => subBytes_32_io_subBytesOutput 
    );
  subBytes_33 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_33_io_subBytesInput,
      io_subBytesOutput => subBytes_33_io_subBytesOutput 
    );
  subBytes_34 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_34_io_subBytesInput,
      io_subBytesOutput => subBytes_34_io_subBytesOutput 
    );
  subBytes_35 : entity work.SubBytes
    port map ( 
      io_subBytesInput => subBytes_35_io_subBytesInput,
      io_subBytesOutput => subBytes_35_io_subBytesOutput 
    );
  dummy <= pkg_toStdLogic(false);
  process(mixColumnsOut,when_AESEncrypt_l27,shiftRowsOut,when_AESEncrypt_l58,io_plaintext)
  begin
    addRoundKey_1_io_addRoundKeyInput <= mixColumnsOut;
    if when_AESEncrypt_l27 = '1' then
      addRoundKey_1_io_addRoundKeyInput <= shiftRowsOut;
    end if;
    if when_AESEncrypt_l58 = '1' then
      addRoundKey_1_io_addRoundKeyInput <= io_plaintext;
    end if;
  end process;

  when_AESEncrypt_l27 <= pkg_toStdLogic(round = pkg_unsigned("1010"));
  process(roundKey,when_AESEncrypt_l58,io_key)
  begin
    addRoundKey_1_io_roundKey <= roundKey;
    if when_AESEncrypt_l58 = '1' then
      addRoundKey_1_io_roundKey <= io_key;
    end if;
  end process;

  process(shiftRows_1_io_shiftRowsOutput,io_reset)
  begin
    shiftRowsOut <= shiftRows_1_io_shiftRowsOutput;
    if io_reset = '1' then
      shiftRowsOut <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    end if;
  end process;

  mixColumns_4_io_mixColumnsInput <= pkg_extract(shiftRowsOut,127,96);
  process(mixColumns_4_io_mixColumnsOutput,mixColumns_5_io_mixColumnsOutput,mixColumns_6_io_mixColumnsOutput,mixColumns_7_io_mixColumnsOutput,io_reset)
  begin
    mixColumnsOut(127 downto 96) <= mixColumns_4_io_mixColumnsOutput;
    mixColumnsOut(95 downto 64) <= mixColumns_5_io_mixColumnsOutput;
    mixColumnsOut(63 downto 32) <= mixColumns_6_io_mixColumnsOutput;
    mixColumnsOut(31 downto 0) <= mixColumns_7_io_mixColumnsOutput;
    if io_reset = '1' then
      mixColumnsOut <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    end if;
  end process;

  mixColumns_5_io_mixColumnsInput <= pkg_extract(shiftRowsOut,95,64);
  mixColumns_6_io_mixColumnsInput <= pkg_extract(shiftRowsOut,63,32);
  mixColumns_7_io_mixColumnsInput <= pkg_extract(shiftRowsOut,31,0);
  when_AESEncrypt_l44 <= ((not io_reset) and io_reset_regNext);
  process(when_AESEncrypt_l44,io_key,roundKey)
  begin
    if when_AESEncrypt_l44 = '1' then
      keySchedule_1_io_keyScheduleInput <= io_key;
    else
      keySchedule_1_io_keyScheduleInput <= roundKey;
    end if;
  end process;

  subBytes_20_io_subBytesInput <= pkg_extract(state,7,0);
  process(subBytes_20_io_subBytesOutput,subBytes_21_io_subBytesOutput,subBytes_22_io_subBytesOutput,subBytes_23_io_subBytesOutput,subBytes_24_io_subBytesOutput,subBytes_25_io_subBytesOutput,subBytes_26_io_subBytesOutput,subBytes_27_io_subBytesOutput,subBytes_28_io_subBytesOutput,subBytes_29_io_subBytesOutput,subBytes_30_io_subBytesOutput,subBytes_31_io_subBytesOutput,subBytes_32_io_subBytesOutput,subBytes_33_io_subBytesOutput,subBytes_34_io_subBytesOutput,subBytes_35_io_subBytesOutput,io_reset)
  begin
    subBytesOut(7 downto 0) <= subBytes_20_io_subBytesOutput;
    subBytesOut(15 downto 8) <= subBytes_21_io_subBytesOutput;
    subBytesOut(23 downto 16) <= subBytes_22_io_subBytesOutput;
    subBytesOut(31 downto 24) <= subBytes_23_io_subBytesOutput;
    subBytesOut(39 downto 32) <= subBytes_24_io_subBytesOutput;
    subBytesOut(47 downto 40) <= subBytes_25_io_subBytesOutput;
    subBytesOut(55 downto 48) <= subBytes_26_io_subBytesOutput;
    subBytesOut(63 downto 56) <= subBytes_27_io_subBytesOutput;
    subBytesOut(71 downto 64) <= subBytes_28_io_subBytesOutput;
    subBytesOut(79 downto 72) <= subBytes_29_io_subBytesOutput;
    subBytesOut(87 downto 80) <= subBytes_30_io_subBytesOutput;
    subBytesOut(95 downto 88) <= subBytes_31_io_subBytesOutput;
    subBytesOut(103 downto 96) <= subBytes_32_io_subBytesOutput;
    subBytesOut(111 downto 104) <= subBytes_33_io_subBytesOutput;
    subBytesOut(119 downto 112) <= subBytes_34_io_subBytesOutput;
    subBytesOut(127 downto 120) <= subBytes_35_io_subBytesOutput;
    if io_reset = '1' then
      subBytesOut <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    end if;
  end process;

  subBytes_21_io_subBytesInput <= pkg_extract(state,15,8);
  subBytes_22_io_subBytesInput <= pkg_extract(state,23,16);
  subBytes_23_io_subBytesInput <= pkg_extract(state,31,24);
  subBytes_24_io_subBytesInput <= pkg_extract(state,39,32);
  subBytes_25_io_subBytesInput <= pkg_extract(state,47,40);
  subBytes_26_io_subBytesInput <= pkg_extract(state,55,48);
  subBytes_27_io_subBytesInput <= pkg_extract(state,63,56);
  subBytes_28_io_subBytesInput <= pkg_extract(state,71,64);
  subBytes_29_io_subBytesInput <= pkg_extract(state,79,72);
  subBytes_30_io_subBytesInput <= pkg_extract(state,87,80);
  subBytes_31_io_subBytesInput <= pkg_extract(state,95,88);
  subBytes_32_io_subBytesInput <= pkg_extract(state,103,96);
  subBytes_33_io_subBytesInput <= pkg_extract(state,111,104);
  subBytes_34_io_subBytesInput <= pkg_extract(state,119,112);
  subBytes_35_io_subBytesInput <= pkg_extract(state,127,120);
  when_AESEncrypt_l58 <= ((not io_reset) and io_reset_regNext_1);
  when_AESEncrypt_l64 <= pkg_toStdLogic(pkg_unsigned("0001") <= round);
  when_AESEncrypt_l68 <= (((not io_reset) and io_reset_regNext_2) or pkg_toStdLogic(pkg_unsigned("00000001") < unsigned(roundConstant)));
  when_AESEncrypt_l69 <= pkg_toStdLogic(unsigned(roundConstant) < pkg_unsigned("10000000"));
  process(when_AESEncrypt_l77)
  begin
    io_done <= pkg_toStdLogic(false);
    if when_AESEncrypt_l77 = '1' then
      io_done <= pkg_toStdLogic(true);
    end if;
  end process;

  when_AESEncrypt_l77 <= pkg_toStdLogic(round = pkg_unsigned("1011"));
  io_ciphertext <= state;
  process(clk, reset)
  begin
    if reset = '1' then
      roundKey <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      state <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      round <= pkg_unsigned("0000");
      roundConstant <= pkg_stdLogicVector("00000001");
    elsif rising_edge(clk) then
      state <= addRoundKey_1_io_addRoundKeyOutput;
      roundKey <= keySchedule_1_io_keyScheduleOutput;
      if when_AESEncrypt_l58 = '1' then
        state <= addRoundKey_1_io_addRoundKeyOutput;
        round <= (round + pkg_unsigned("0001"));
      else
        if when_AESEncrypt_l64 = '1' then
          round <= (round + pkg_unsigned("0001"));
        end if;
      end if;
      if when_AESEncrypt_l68 = '1' then
        if when_AESEncrypt_l69 = '1' then
          roundConstant <= pkg_extract(pkg_shiftLeft(roundConstant,1),7,0);
        else
          roundConstant <= (pkg_extract(pkg_shiftLeft(roundConstant,1),7,0) xor pkg_stdLogicVector("00011011"));
        end if;
      end if;
      if io_reset = '1' then
        roundKey <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        state <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
        round <= pkg_unsigned("0000");
        roundConstant <= pkg_stdLogicVector("00000001");
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      io_reset_regNext <= io_reset;
      io_reset_regNext_1 <= io_reset;
      io_reset_regNext_2 <= io_reset;
    end if;
  end process;

end arch;

