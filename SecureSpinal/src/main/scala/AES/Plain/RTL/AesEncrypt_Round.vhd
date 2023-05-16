-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : aesEncrypt_Round
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type fsm_enumDef is (BOOT,sReset,sAESRound,sAESFinalRound);

  function pkg_mux (sel : std_logic; one : fsm_enumDef; zero : fsm_enumDef) return fsm_enumDef;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector;
  function pkg_tofsm_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_enumDef;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : fsm_enumDef; zero : fsm_enumDef) return fsm_enumDef is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tofsm_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_enumDef is
  begin
    case value is
      when "00" => return BOOT;
      when "01" => return sReset;
      when "10" => return sAESRound;
      when "11" => return sAESFinalRound;
      when others => return BOOT;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector is
  begin
    case value is
      when BOOT => return "00";
      when sReset => return "01";
      when sAESRound => return "10";
      when sAESFinalRound => return "11";
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


entity SubByte is
  port(
    io_b : in std_logic_vector(7 downto 0);
    io_ret : out std_logic_vector(7 downto 0)
  );
end SubByte;

architecture arch of SubByte is

  signal zz_io_ret : std_logic_vector(7 downto 0);
begin
  process(io_b)
  begin
    case io_b is
      when "00000000" =>
        zz_io_ret <= pkg_stdLogicVector("01100011");
      when "00000001" =>
        zz_io_ret <= pkg_stdLogicVector("01111100");
      when "00000010" =>
        zz_io_ret <= pkg_stdLogicVector("01110111");
      when "00000011" =>
        zz_io_ret <= pkg_stdLogicVector("01111011");
      when "00000100" =>
        zz_io_ret <= pkg_stdLogicVector("11110010");
      when "00000101" =>
        zz_io_ret <= pkg_stdLogicVector("01101011");
      when "00000110" =>
        zz_io_ret <= pkg_stdLogicVector("01101111");
      when "00000111" =>
        zz_io_ret <= pkg_stdLogicVector("11000101");
      when "00001000" =>
        zz_io_ret <= pkg_stdLogicVector("00110000");
      when "00001001" =>
        zz_io_ret <= pkg_stdLogicVector("00000001");
      when "00001010" =>
        zz_io_ret <= pkg_stdLogicVector("01100111");
      when "00001011" =>
        zz_io_ret <= pkg_stdLogicVector("00101011");
      when "00001100" =>
        zz_io_ret <= pkg_stdLogicVector("11111110");
      when "00001101" =>
        zz_io_ret <= pkg_stdLogicVector("11010111");
      when "00001110" =>
        zz_io_ret <= pkg_stdLogicVector("10101011");
      when "00001111" =>
        zz_io_ret <= pkg_stdLogicVector("01110110");
      when "00010000" =>
        zz_io_ret <= pkg_stdLogicVector("11001010");
      when "00010001" =>
        zz_io_ret <= pkg_stdLogicVector("10000010");
      when "00010010" =>
        zz_io_ret <= pkg_stdLogicVector("11001001");
      when "00010011" =>
        zz_io_ret <= pkg_stdLogicVector("01111101");
      when "00010100" =>
        zz_io_ret <= pkg_stdLogicVector("11111010");
      when "00010101" =>
        zz_io_ret <= pkg_stdLogicVector("01011001");
      when "00010110" =>
        zz_io_ret <= pkg_stdLogicVector("01000111");
      when "00010111" =>
        zz_io_ret <= pkg_stdLogicVector("11110000");
      when "00011000" =>
        zz_io_ret <= pkg_stdLogicVector("10101101");
      when "00011001" =>
        zz_io_ret <= pkg_stdLogicVector("11010100");
      when "00011010" =>
        zz_io_ret <= pkg_stdLogicVector("10100010");
      when "00011011" =>
        zz_io_ret <= pkg_stdLogicVector("10101111");
      when "00011100" =>
        zz_io_ret <= pkg_stdLogicVector("10011100");
      when "00011101" =>
        zz_io_ret <= pkg_stdLogicVector("10100100");
      when "00011110" =>
        zz_io_ret <= pkg_stdLogicVector("01110010");
      when "00011111" =>
        zz_io_ret <= pkg_stdLogicVector("11000000");
      when "00100000" =>
        zz_io_ret <= pkg_stdLogicVector("10110111");
      when "00100001" =>
        zz_io_ret <= pkg_stdLogicVector("11111101");
      when "00100010" =>
        zz_io_ret <= pkg_stdLogicVector("10010011");
      when "00100011" =>
        zz_io_ret <= pkg_stdLogicVector("00100110");
      when "00100100" =>
        zz_io_ret <= pkg_stdLogicVector("00110110");
      when "00100101" =>
        zz_io_ret <= pkg_stdLogicVector("00111111");
      when "00100110" =>
        zz_io_ret <= pkg_stdLogicVector("11110111");
      when "00100111" =>
        zz_io_ret <= pkg_stdLogicVector("11001100");
      when "00101000" =>
        zz_io_ret <= pkg_stdLogicVector("00110100");
      when "00101001" =>
        zz_io_ret <= pkg_stdLogicVector("10100101");
      when "00101010" =>
        zz_io_ret <= pkg_stdLogicVector("11100101");
      when "00101011" =>
        zz_io_ret <= pkg_stdLogicVector("11110001");
      when "00101100" =>
        zz_io_ret <= pkg_stdLogicVector("01110001");
      when "00101101" =>
        zz_io_ret <= pkg_stdLogicVector("11011000");
      when "00101110" =>
        zz_io_ret <= pkg_stdLogicVector("00110001");
      when "00101111" =>
        zz_io_ret <= pkg_stdLogicVector("00010101");
      when "00110000" =>
        zz_io_ret <= pkg_stdLogicVector("00000100");
      when "00110001" =>
        zz_io_ret <= pkg_stdLogicVector("11000111");
      when "00110010" =>
        zz_io_ret <= pkg_stdLogicVector("00100011");
      when "00110011" =>
        zz_io_ret <= pkg_stdLogicVector("11000011");
      when "00110100" =>
        zz_io_ret <= pkg_stdLogicVector("00011000");
      when "00110101" =>
        zz_io_ret <= pkg_stdLogicVector("10010110");
      when "00110110" =>
        zz_io_ret <= pkg_stdLogicVector("00000101");
      when "00110111" =>
        zz_io_ret <= pkg_stdLogicVector("10011010");
      when "00111000" =>
        zz_io_ret <= pkg_stdLogicVector("00000111");
      when "00111001" =>
        zz_io_ret <= pkg_stdLogicVector("00010010");
      when "00111010" =>
        zz_io_ret <= pkg_stdLogicVector("10000000");
      when "00111011" =>
        zz_io_ret <= pkg_stdLogicVector("11100010");
      when "00111100" =>
        zz_io_ret <= pkg_stdLogicVector("11101011");
      when "00111101" =>
        zz_io_ret <= pkg_stdLogicVector("00100111");
      when "00111110" =>
        zz_io_ret <= pkg_stdLogicVector("10110010");
      when "00111111" =>
        zz_io_ret <= pkg_stdLogicVector("01110101");
      when "01000000" =>
        zz_io_ret <= pkg_stdLogicVector("00001001");
      when "01000001" =>
        zz_io_ret <= pkg_stdLogicVector("10000011");
      when "01000010" =>
        zz_io_ret <= pkg_stdLogicVector("00101100");
      when "01000011" =>
        zz_io_ret <= pkg_stdLogicVector("00011010");
      when "01000100" =>
        zz_io_ret <= pkg_stdLogicVector("00011011");
      when "01000101" =>
        zz_io_ret <= pkg_stdLogicVector("01101110");
      when "01000110" =>
        zz_io_ret <= pkg_stdLogicVector("01011010");
      when "01000111" =>
        zz_io_ret <= pkg_stdLogicVector("10100000");
      when "01001000" =>
        zz_io_ret <= pkg_stdLogicVector("01010010");
      when "01001001" =>
        zz_io_ret <= pkg_stdLogicVector("00111011");
      when "01001010" =>
        zz_io_ret <= pkg_stdLogicVector("11010110");
      when "01001011" =>
        zz_io_ret <= pkg_stdLogicVector("10110011");
      when "01001100" =>
        zz_io_ret <= pkg_stdLogicVector("00101001");
      when "01001101" =>
        zz_io_ret <= pkg_stdLogicVector("11100011");
      when "01001110" =>
        zz_io_ret <= pkg_stdLogicVector("00101111");
      when "01001111" =>
        zz_io_ret <= pkg_stdLogicVector("10000100");
      when "01010000" =>
        zz_io_ret <= pkg_stdLogicVector("01010011");
      when "01010001" =>
        zz_io_ret <= pkg_stdLogicVector("11010001");
      when "01010010" =>
        zz_io_ret <= pkg_stdLogicVector("00000000");
      when "01010011" =>
        zz_io_ret <= pkg_stdLogicVector("11101101");
      when "01010100" =>
        zz_io_ret <= pkg_stdLogicVector("00100000");
      when "01010101" =>
        zz_io_ret <= pkg_stdLogicVector("11111100");
      when "01010110" =>
        zz_io_ret <= pkg_stdLogicVector("10110001");
      when "01010111" =>
        zz_io_ret <= pkg_stdLogicVector("01011011");
      when "01011000" =>
        zz_io_ret <= pkg_stdLogicVector("01101010");
      when "01011001" =>
        zz_io_ret <= pkg_stdLogicVector("11001011");
      when "01011010" =>
        zz_io_ret <= pkg_stdLogicVector("10111110");
      when "01011011" =>
        zz_io_ret <= pkg_stdLogicVector("00111001");
      when "01011100" =>
        zz_io_ret <= pkg_stdLogicVector("01001010");
      when "01011101" =>
        zz_io_ret <= pkg_stdLogicVector("01001100");
      when "01011110" =>
        zz_io_ret <= pkg_stdLogicVector("01011000");
      when "01011111" =>
        zz_io_ret <= pkg_stdLogicVector("11001111");
      when "01100000" =>
        zz_io_ret <= pkg_stdLogicVector("11010000");
      when "01100001" =>
        zz_io_ret <= pkg_stdLogicVector("11101111");
      when "01100010" =>
        zz_io_ret <= pkg_stdLogicVector("10101010");
      when "01100011" =>
        zz_io_ret <= pkg_stdLogicVector("11111011");
      when "01100100" =>
        zz_io_ret <= pkg_stdLogicVector("01000011");
      when "01100101" =>
        zz_io_ret <= pkg_stdLogicVector("01001101");
      when "01100110" =>
        zz_io_ret <= pkg_stdLogicVector("00110011");
      when "01100111" =>
        zz_io_ret <= pkg_stdLogicVector("10000101");
      when "01101000" =>
        zz_io_ret <= pkg_stdLogicVector("01000101");
      when "01101001" =>
        zz_io_ret <= pkg_stdLogicVector("11111001");
      when "01101010" =>
        zz_io_ret <= pkg_stdLogicVector("00000010");
      when "01101011" =>
        zz_io_ret <= pkg_stdLogicVector("01111111");
      when "01101100" =>
        zz_io_ret <= pkg_stdLogicVector("01010000");
      when "01101101" =>
        zz_io_ret <= pkg_stdLogicVector("00111100");
      when "01101110" =>
        zz_io_ret <= pkg_stdLogicVector("10011111");
      when "01101111" =>
        zz_io_ret <= pkg_stdLogicVector("10101000");
      when "01110000" =>
        zz_io_ret <= pkg_stdLogicVector("01010001");
      when "01110001" =>
        zz_io_ret <= pkg_stdLogicVector("10100011");
      when "01110010" =>
        zz_io_ret <= pkg_stdLogicVector("01000000");
      when "01110011" =>
        zz_io_ret <= pkg_stdLogicVector("10001111");
      when "01110100" =>
        zz_io_ret <= pkg_stdLogicVector("10010010");
      when "01110101" =>
        zz_io_ret <= pkg_stdLogicVector("10011101");
      when "01110110" =>
        zz_io_ret <= pkg_stdLogicVector("00111000");
      when "01110111" =>
        zz_io_ret <= pkg_stdLogicVector("11110101");
      when "01111000" =>
        zz_io_ret <= pkg_stdLogicVector("10111100");
      when "01111001" =>
        zz_io_ret <= pkg_stdLogicVector("10110110");
      when "01111010" =>
        zz_io_ret <= pkg_stdLogicVector("11011010");
      when "01111011" =>
        zz_io_ret <= pkg_stdLogicVector("00100001");
      when "01111100" =>
        zz_io_ret <= pkg_stdLogicVector("00010000");
      when "01111101" =>
        zz_io_ret <= pkg_stdLogicVector("11111111");
      when "01111110" =>
        zz_io_ret <= pkg_stdLogicVector("11110011");
      when "01111111" =>
        zz_io_ret <= pkg_stdLogicVector("11010010");
      when "10000000" =>
        zz_io_ret <= pkg_stdLogicVector("11001101");
      when "10000001" =>
        zz_io_ret <= pkg_stdLogicVector("00001100");
      when "10000010" =>
        zz_io_ret <= pkg_stdLogicVector("00010011");
      when "10000011" =>
        zz_io_ret <= pkg_stdLogicVector("11101100");
      when "10000100" =>
        zz_io_ret <= pkg_stdLogicVector("01011111");
      when "10000101" =>
        zz_io_ret <= pkg_stdLogicVector("10010111");
      when "10000110" =>
        zz_io_ret <= pkg_stdLogicVector("01000100");
      when "10000111" =>
        zz_io_ret <= pkg_stdLogicVector("00010111");
      when "10001000" =>
        zz_io_ret <= pkg_stdLogicVector("11000100");
      when "10001001" =>
        zz_io_ret <= pkg_stdLogicVector("10100111");
      when "10001010" =>
        zz_io_ret <= pkg_stdLogicVector("01111110");
      when "10001011" =>
        zz_io_ret <= pkg_stdLogicVector("00111101");
      when "10001100" =>
        zz_io_ret <= pkg_stdLogicVector("01100100");
      when "10001101" =>
        zz_io_ret <= pkg_stdLogicVector("01011101");
      when "10001110" =>
        zz_io_ret <= pkg_stdLogicVector("00011001");
      when "10001111" =>
        zz_io_ret <= pkg_stdLogicVector("01110011");
      when "10010000" =>
        zz_io_ret <= pkg_stdLogicVector("01100000");
      when "10010001" =>
        zz_io_ret <= pkg_stdLogicVector("10000001");
      when "10010010" =>
        zz_io_ret <= pkg_stdLogicVector("01001111");
      when "10010011" =>
        zz_io_ret <= pkg_stdLogicVector("11011100");
      when "10010100" =>
        zz_io_ret <= pkg_stdLogicVector("00100010");
      when "10010101" =>
        zz_io_ret <= pkg_stdLogicVector("00101010");
      when "10010110" =>
        zz_io_ret <= pkg_stdLogicVector("10010000");
      when "10010111" =>
        zz_io_ret <= pkg_stdLogicVector("10001000");
      when "10011000" =>
        zz_io_ret <= pkg_stdLogicVector("01000110");
      when "10011001" =>
        zz_io_ret <= pkg_stdLogicVector("11101110");
      when "10011010" =>
        zz_io_ret <= pkg_stdLogicVector("10111000");
      when "10011011" =>
        zz_io_ret <= pkg_stdLogicVector("00010100");
      when "10011100" =>
        zz_io_ret <= pkg_stdLogicVector("11011110");
      when "10011101" =>
        zz_io_ret <= pkg_stdLogicVector("01011110");
      when "10011110" =>
        zz_io_ret <= pkg_stdLogicVector("00001011");
      when "10011111" =>
        zz_io_ret <= pkg_stdLogicVector("11011011");
      when "10100000" =>
        zz_io_ret <= pkg_stdLogicVector("11100000");
      when "10100001" =>
        zz_io_ret <= pkg_stdLogicVector("00110010");
      when "10100010" =>
        zz_io_ret <= pkg_stdLogicVector("00111010");
      when "10100011" =>
        zz_io_ret <= pkg_stdLogicVector("00001010");
      when "10100100" =>
        zz_io_ret <= pkg_stdLogicVector("01001001");
      when "10100101" =>
        zz_io_ret <= pkg_stdLogicVector("00000110");
      when "10100110" =>
        zz_io_ret <= pkg_stdLogicVector("00100100");
      when "10100111" =>
        zz_io_ret <= pkg_stdLogicVector("01011100");
      when "10101000" =>
        zz_io_ret <= pkg_stdLogicVector("11000010");
      when "10101001" =>
        zz_io_ret <= pkg_stdLogicVector("11010011");
      when "10101010" =>
        zz_io_ret <= pkg_stdLogicVector("10101100");
      when "10101011" =>
        zz_io_ret <= pkg_stdLogicVector("01100010");
      when "10101100" =>
        zz_io_ret <= pkg_stdLogicVector("10010001");
      when "10101101" =>
        zz_io_ret <= pkg_stdLogicVector("10010101");
      when "10101110" =>
        zz_io_ret <= pkg_stdLogicVector("11100100");
      when "10101111" =>
        zz_io_ret <= pkg_stdLogicVector("01111001");
      when "10110000" =>
        zz_io_ret <= pkg_stdLogicVector("11100111");
      when "10110001" =>
        zz_io_ret <= pkg_stdLogicVector("11001000");
      when "10110010" =>
        zz_io_ret <= pkg_stdLogicVector("00110111");
      when "10110011" =>
        zz_io_ret <= pkg_stdLogicVector("01101101");
      when "10110100" =>
        zz_io_ret <= pkg_stdLogicVector("10001101");
      when "10110101" =>
        zz_io_ret <= pkg_stdLogicVector("11010101");
      when "10110110" =>
        zz_io_ret <= pkg_stdLogicVector("01001110");
      when "10110111" =>
        zz_io_ret <= pkg_stdLogicVector("10101001");
      when "10111000" =>
        zz_io_ret <= pkg_stdLogicVector("01101100");
      when "10111001" =>
        zz_io_ret <= pkg_stdLogicVector("01010110");
      when "10111010" =>
        zz_io_ret <= pkg_stdLogicVector("11110100");
      when "10111011" =>
        zz_io_ret <= pkg_stdLogicVector("11101010");
      when "10111100" =>
        zz_io_ret <= pkg_stdLogicVector("01100101");
      when "10111101" =>
        zz_io_ret <= pkg_stdLogicVector("01111010");
      when "10111110" =>
        zz_io_ret <= pkg_stdLogicVector("10101110");
      when "10111111" =>
        zz_io_ret <= pkg_stdLogicVector("00001000");
      when "11000000" =>
        zz_io_ret <= pkg_stdLogicVector("10111010");
      when "11000001" =>
        zz_io_ret <= pkg_stdLogicVector("01111000");
      when "11000010" =>
        zz_io_ret <= pkg_stdLogicVector("00100101");
      when "11000011" =>
        zz_io_ret <= pkg_stdLogicVector("00101110");
      when "11000100" =>
        zz_io_ret <= pkg_stdLogicVector("00011100");
      when "11000101" =>
        zz_io_ret <= pkg_stdLogicVector("10100110");
      when "11000110" =>
        zz_io_ret <= pkg_stdLogicVector("10110100");
      when "11000111" =>
        zz_io_ret <= pkg_stdLogicVector("11000110");
      when "11001000" =>
        zz_io_ret <= pkg_stdLogicVector("11101000");
      when "11001001" =>
        zz_io_ret <= pkg_stdLogicVector("11011101");
      when "11001010" =>
        zz_io_ret <= pkg_stdLogicVector("01110100");
      when "11001011" =>
        zz_io_ret <= pkg_stdLogicVector("00011111");
      when "11001100" =>
        zz_io_ret <= pkg_stdLogicVector("01001011");
      when "11001101" =>
        zz_io_ret <= pkg_stdLogicVector("10111101");
      when "11001110" =>
        zz_io_ret <= pkg_stdLogicVector("10001011");
      when "11001111" =>
        zz_io_ret <= pkg_stdLogicVector("10001010");
      when "11010000" =>
        zz_io_ret <= pkg_stdLogicVector("01110000");
      when "11010001" =>
        zz_io_ret <= pkg_stdLogicVector("00111110");
      when "11010010" =>
        zz_io_ret <= pkg_stdLogicVector("10110101");
      when "11010011" =>
        zz_io_ret <= pkg_stdLogicVector("01100110");
      when "11010100" =>
        zz_io_ret <= pkg_stdLogicVector("01001000");
      when "11010101" =>
        zz_io_ret <= pkg_stdLogicVector("00000011");
      when "11010110" =>
        zz_io_ret <= pkg_stdLogicVector("11110110");
      when "11010111" =>
        zz_io_ret <= pkg_stdLogicVector("00001110");
      when "11011000" =>
        zz_io_ret <= pkg_stdLogicVector("01100001");
      when "11011001" =>
        zz_io_ret <= pkg_stdLogicVector("00110101");
      when "11011010" =>
        zz_io_ret <= pkg_stdLogicVector("01010111");
      when "11011011" =>
        zz_io_ret <= pkg_stdLogicVector("10111001");
      when "11011100" =>
        zz_io_ret <= pkg_stdLogicVector("10000110");
      when "11011101" =>
        zz_io_ret <= pkg_stdLogicVector("11000001");
      when "11011110" =>
        zz_io_ret <= pkg_stdLogicVector("00011101");
      when "11011111" =>
        zz_io_ret <= pkg_stdLogicVector("10011110");
      when "11100000" =>
        zz_io_ret <= pkg_stdLogicVector("11100001");
      when "11100001" =>
        zz_io_ret <= pkg_stdLogicVector("11111000");
      when "11100010" =>
        zz_io_ret <= pkg_stdLogicVector("10011000");
      when "11100011" =>
        zz_io_ret <= pkg_stdLogicVector("00010001");
      when "11100100" =>
        zz_io_ret <= pkg_stdLogicVector("01101001");
      when "11100101" =>
        zz_io_ret <= pkg_stdLogicVector("11011001");
      when "11100110" =>
        zz_io_ret <= pkg_stdLogicVector("10001110");
      when "11100111" =>
        zz_io_ret <= pkg_stdLogicVector("10010100");
      when "11101000" =>
        zz_io_ret <= pkg_stdLogicVector("10011011");
      when "11101001" =>
        zz_io_ret <= pkg_stdLogicVector("00011110");
      when "11101010" =>
        zz_io_ret <= pkg_stdLogicVector("10000111");
      when "11101011" =>
        zz_io_ret <= pkg_stdLogicVector("11101001");
      when "11101100" =>
        zz_io_ret <= pkg_stdLogicVector("11001110");
      when "11101101" =>
        zz_io_ret <= pkg_stdLogicVector("01010101");
      when "11101110" =>
        zz_io_ret <= pkg_stdLogicVector("00101000");
      when "11101111" =>
        zz_io_ret <= pkg_stdLogicVector("11011111");
      when "11110000" =>
        zz_io_ret <= pkg_stdLogicVector("10001100");
      when "11110001" =>
        zz_io_ret <= pkg_stdLogicVector("10100001");
      when "11110010" =>
        zz_io_ret <= pkg_stdLogicVector("10001001");
      when "11110011" =>
        zz_io_ret <= pkg_stdLogicVector("00001101");
      when "11110100" =>
        zz_io_ret <= pkg_stdLogicVector("10111111");
      when "11110101" =>
        zz_io_ret <= pkg_stdLogicVector("11100110");
      when "11110110" =>
        zz_io_ret <= pkg_stdLogicVector("01000010");
      when "11110111" =>
        zz_io_ret <= pkg_stdLogicVector("01101000");
      when "11111000" =>
        zz_io_ret <= pkg_stdLogicVector("01000001");
      when "11111001" =>
        zz_io_ret <= pkg_stdLogicVector("10011001");
      when "11111010" =>
        zz_io_ret <= pkg_stdLogicVector("00101101");
      when "11111011" =>
        zz_io_ret <= pkg_stdLogicVector("00001111");
      when "11111100" =>
        zz_io_ret <= pkg_stdLogicVector("10110000");
      when "11111101" =>
        zz_io_ret <= pkg_stdLogicVector("01010100");
      when "11111110" =>
        zz_io_ret <= pkg_stdLogicVector("10111011");
      when others =>
        zz_io_ret <= pkg_stdLogicVector("00010110");
    end case;
  end process;

  io_ret <= zz_io_ret;
end arch;


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte


--SubByte replaced by SubByte

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MixColumn is
  port(
    io_c_0 : in std_logic_vector(7 downto 0);
    io_c_1 : in std_logic_vector(7 downto 0);
    io_c_2 : in std_logic_vector(7 downto 0);
    io_c_3 : in std_logic_vector(7 downto 0);
    io_ret_0 : out std_logic_vector(7 downto 0);
    io_ret_1 : out std_logic_vector(7 downto 0);
    io_ret_2 : out std_logic_vector(7 downto 0);
    io_ret_3 : out std_logic_vector(7 downto 0)
  );
end MixColumn;

architecture arch of MixColumn is

  signal zz_io_ret_0 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159 : std_logic;
  signal zz_io_ret_0_1 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_1 : std_logic;
  signal zz_io_ret_1 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_2 : std_logic;
  signal zz_io_ret_1_1 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_3 : std_logic;
  signal zz_io_ret_2 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_4 : std_logic;
  signal zz_io_ret_2_1 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_5 : std_logic;
  signal zz_io_ret_3 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_6 : std_logic;
  signal zz_io_ret_3_1 : std_logic_vector(7 downto 0);
  signal when_AES_Round_l159_7 : std_logic;
begin
  when_AES_Round_l159 <= pkg_toStdLogic(pkg_extract(io_c_0,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159,io_c_0)
  begin
    if when_AES_Round_l159 = '1' then
      zz_io_ret_0 <= std_logic_vector(shift_left(unsigned(io_c_0),1));
    else
      zz_io_ret_0 <= (std_logic_vector(shift_left(unsigned(io_c_0),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  when_AES_Round_l159_1 <= pkg_toStdLogic(pkg_extract(io_c_1,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_1,io_c_1)
  begin
    if when_AES_Round_l159_1 = '1' then
      zz_io_ret_0_1 <= std_logic_vector(shift_left(unsigned(io_c_1),1));
    else
      zz_io_ret_0_1 <= (std_logic_vector(shift_left(unsigned(io_c_1),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  io_ret_0 <= (((zz_io_ret_0 xor (zz_io_ret_0_1 xor io_c_1)) xor io_c_2) xor io_c_3);
  when_AES_Round_l159_2 <= pkg_toStdLogic(pkg_extract(io_c_1,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_2,io_c_1)
  begin
    if when_AES_Round_l159_2 = '1' then
      zz_io_ret_1 <= std_logic_vector(shift_left(unsigned(io_c_1),1));
    else
      zz_io_ret_1 <= (std_logic_vector(shift_left(unsigned(io_c_1),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  when_AES_Round_l159_3 <= pkg_toStdLogic(pkg_extract(io_c_2,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_3,io_c_2)
  begin
    if when_AES_Round_l159_3 = '1' then
      zz_io_ret_1_1 <= std_logic_vector(shift_left(unsigned(io_c_2),1));
    else
      zz_io_ret_1_1 <= (std_logic_vector(shift_left(unsigned(io_c_2),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  io_ret_1 <= (((io_c_0 xor zz_io_ret_1) xor (zz_io_ret_1_1 xor io_c_2)) xor io_c_3);
  when_AES_Round_l159_4 <= pkg_toStdLogic(pkg_extract(io_c_2,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_4,io_c_2)
  begin
    if when_AES_Round_l159_4 = '1' then
      zz_io_ret_2 <= std_logic_vector(shift_left(unsigned(io_c_2),1));
    else
      zz_io_ret_2 <= (std_logic_vector(shift_left(unsigned(io_c_2),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  when_AES_Round_l159_5 <= pkg_toStdLogic(pkg_extract(io_c_3,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_5,io_c_3)
  begin
    if when_AES_Round_l159_5 = '1' then
      zz_io_ret_2_1 <= std_logic_vector(shift_left(unsigned(io_c_3),1));
    else
      zz_io_ret_2_1 <= (std_logic_vector(shift_left(unsigned(io_c_3),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  io_ret_2 <= (((io_c_0 xor io_c_1) xor zz_io_ret_2) xor (zz_io_ret_2_1 xor io_c_3));
  when_AES_Round_l159_6 <= pkg_toStdLogic(pkg_extract(io_c_0,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_6,io_c_0)
  begin
    if when_AES_Round_l159_6 = '1' then
      zz_io_ret_3 <= std_logic_vector(shift_left(unsigned(io_c_0),1));
    else
      zz_io_ret_3 <= (std_logic_vector(shift_left(unsigned(io_c_0),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  when_AES_Round_l159_7 <= pkg_toStdLogic(pkg_extract(io_c_3,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l159_7,io_c_3)
  begin
    if when_AES_Round_l159_7 = '1' then
      zz_io_ret_3_1 <= std_logic_vector(shift_left(unsigned(io_c_3),1));
    else
      zz_io_ret_3_1 <= (std_logic_vector(shift_left(unsigned(io_c_3),1)) xor pkg_stdLogicVector("00011011"));
    end if;
  end process;

  io_ret_3 <= ((((zz_io_ret_3 xor io_c_0) xor io_c_1) xor io_c_2) xor zz_io_ret_3_1);
end arch;


--MixColumn_1 replaced by MixColumn


--MixColumn_2 replaced by MixColumn


--MixColumn_3 replaced by MixColumn

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity SubWord is
  port(
    io_bs_0 : in std_logic_vector(7 downto 0);
    io_bs_1 : in std_logic_vector(7 downto 0);
    io_bs_2 : in std_logic_vector(7 downto 0);
    io_bs_3 : in std_logic_vector(7 downto 0);
    io_ret_0 : out std_logic_vector(7 downto 0);
    io_ret_1 : out std_logic_vector(7 downto 0);
    io_ret_2 : out std_logic_vector(7 downto 0);
    io_ret_3 : out std_logic_vector(7 downto 0)
  );
end SubWord;

architecture arch of SubWord is
  signal subByte_io_ret : std_logic_vector(7 downto 0);
  signal subByte_1_io_ret : std_logic_vector(7 downto 0);
  signal subByte_2_io_ret : std_logic_vector(7 downto 0);
  signal subByte_3_io_ret : std_logic_vector(7 downto 0);

begin
  subByte : entity work.SubByte
    port map ( 
      io_b => io_bs_0,
      io_ret => subByte_io_ret 
    );
  subByte_1 : entity work.SubByte
    port map ( 
      io_b => io_bs_1,
      io_ret => subByte_1_io_ret 
    );
  subByte_2 : entity work.SubByte
    port map ( 
      io_b => io_bs_2,
      io_ret => subByte_2_io_ret 
    );
  subByte_3 : entity work.SubByte
    port map ( 
      io_b => io_bs_3,
      io_ret => subByte_3_io_ret 
    );
  io_ret_0 <= subByte_io_ret;
  io_ret_1 <= subByte_1_io_ret;
  io_ret_2 <= subByte_2_io_ret;
  io_ret_3 <= subByte_3_io_ret;
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
    io_rk_0_0 : in std_logic_vector(7 downto 0);
    io_rk_0_1 : in std_logic_vector(7 downto 0);
    io_rk_0_2 : in std_logic_vector(7 downto 0);
    io_rk_0_3 : in std_logic_vector(7 downto 0);
    io_rk_1_0 : in std_logic_vector(7 downto 0);
    io_rk_1_1 : in std_logic_vector(7 downto 0);
    io_rk_1_2 : in std_logic_vector(7 downto 0);
    io_rk_1_3 : in std_logic_vector(7 downto 0);
    io_rk_2_0 : in std_logic_vector(7 downto 0);
    io_rk_2_1 : in std_logic_vector(7 downto 0);
    io_rk_2_2 : in std_logic_vector(7 downto 0);
    io_rk_2_3 : in std_logic_vector(7 downto 0);
    io_rk_3_0 : in std_logic_vector(7 downto 0);
    io_rk_3_1 : in std_logic_vector(7 downto 0);
    io_rk_3_2 : in std_logic_vector(7 downto 0);
    io_rk_3_3 : in std_logic_vector(7 downto 0);
    io_s_0_0 : in std_logic_vector(7 downto 0);
    io_s_0_1 : in std_logic_vector(7 downto 0);
    io_s_0_2 : in std_logic_vector(7 downto 0);
    io_s_0_3 : in std_logic_vector(7 downto 0);
    io_s_1_0 : in std_logic_vector(7 downto 0);
    io_s_1_1 : in std_logic_vector(7 downto 0);
    io_s_1_2 : in std_logic_vector(7 downto 0);
    io_s_1_3 : in std_logic_vector(7 downto 0);
    io_s_2_0 : in std_logic_vector(7 downto 0);
    io_s_2_1 : in std_logic_vector(7 downto 0);
    io_s_2_2 : in std_logic_vector(7 downto 0);
    io_s_2_3 : in std_logic_vector(7 downto 0);
    io_s_3_0 : in std_logic_vector(7 downto 0);
    io_s_3_1 : in std_logic_vector(7 downto 0);
    io_s_3_2 : in std_logic_vector(7 downto 0);
    io_s_3_3 : in std_logic_vector(7 downto 0);
    io_ret_0_0 : out std_logic_vector(7 downto 0);
    io_ret_0_1 : out std_logic_vector(7 downto 0);
    io_ret_0_2 : out std_logic_vector(7 downto 0);
    io_ret_0_3 : out std_logic_vector(7 downto 0);
    io_ret_1_0 : out std_logic_vector(7 downto 0);
    io_ret_1_1 : out std_logic_vector(7 downto 0);
    io_ret_1_2 : out std_logic_vector(7 downto 0);
    io_ret_1_3 : out std_logic_vector(7 downto 0);
    io_ret_2_0 : out std_logic_vector(7 downto 0);
    io_ret_2_1 : out std_logic_vector(7 downto 0);
    io_ret_2_2 : out std_logic_vector(7 downto 0);
    io_ret_2_3 : out std_logic_vector(7 downto 0);
    io_ret_3_0 : out std_logic_vector(7 downto 0);
    io_ret_3_1 : out std_logic_vector(7 downto 0);
    io_ret_3_2 : out std_logic_vector(7 downto 0);
    io_ret_3_3 : out std_logic_vector(7 downto 0)
  );
end AddRoundKey;

architecture arch of AddRoundKey is

begin
  io_ret_0_0 <= (io_rk_0_0 xor io_s_0_0);
  io_ret_0_1 <= (io_rk_0_1 xor io_s_0_1);
  io_ret_0_2 <= (io_rk_0_2 xor io_s_0_2);
  io_ret_0_3 <= (io_rk_0_3 xor io_s_0_3);
  io_ret_1_0 <= (io_rk_1_0 xor io_s_1_0);
  io_ret_1_1 <= (io_rk_1_1 xor io_s_1_1);
  io_ret_1_2 <= (io_rk_1_2 xor io_s_1_2);
  io_ret_1_3 <= (io_rk_1_3 xor io_s_1_3);
  io_ret_2_0 <= (io_rk_2_0 xor io_s_2_0);
  io_ret_2_1 <= (io_rk_2_1 xor io_s_2_1);
  io_ret_2_2 <= (io_rk_2_2 xor io_s_2_2);
  io_ret_2_3 <= (io_rk_2_3 xor io_s_2_3);
  io_ret_3_0 <= (io_rk_3_0 xor io_s_3_0);
  io_ret_3_1 <= (io_rk_3_1 xor io_s_3_1);
  io_ret_3_2 <= (io_rk_3_2 xor io_s_3_2);
  io_ret_3_3 <= (io_rk_3_3 xor io_s_3_3);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity SubBytes is
  port(
    io_state_0_0 : in std_logic_vector(7 downto 0);
    io_state_0_1 : in std_logic_vector(7 downto 0);
    io_state_0_2 : in std_logic_vector(7 downto 0);
    io_state_0_3 : in std_logic_vector(7 downto 0);
    io_state_1_0 : in std_logic_vector(7 downto 0);
    io_state_1_1 : in std_logic_vector(7 downto 0);
    io_state_1_2 : in std_logic_vector(7 downto 0);
    io_state_1_3 : in std_logic_vector(7 downto 0);
    io_state_2_0 : in std_logic_vector(7 downto 0);
    io_state_2_1 : in std_logic_vector(7 downto 0);
    io_state_2_2 : in std_logic_vector(7 downto 0);
    io_state_2_3 : in std_logic_vector(7 downto 0);
    io_state_3_0 : in std_logic_vector(7 downto 0);
    io_state_3_1 : in std_logic_vector(7 downto 0);
    io_state_3_2 : in std_logic_vector(7 downto 0);
    io_state_3_3 : in std_logic_vector(7 downto 0);
    io_ret_0_0 : out std_logic_vector(7 downto 0);
    io_ret_0_1 : out std_logic_vector(7 downto 0);
    io_ret_0_2 : out std_logic_vector(7 downto 0);
    io_ret_0_3 : out std_logic_vector(7 downto 0);
    io_ret_1_0 : out std_logic_vector(7 downto 0);
    io_ret_1_1 : out std_logic_vector(7 downto 0);
    io_ret_1_2 : out std_logic_vector(7 downto 0);
    io_ret_1_3 : out std_logic_vector(7 downto 0);
    io_ret_2_0 : out std_logic_vector(7 downto 0);
    io_ret_2_1 : out std_logic_vector(7 downto 0);
    io_ret_2_2 : out std_logic_vector(7 downto 0);
    io_ret_2_3 : out std_logic_vector(7 downto 0);
    io_ret_3_0 : out std_logic_vector(7 downto 0);
    io_ret_3_1 : out std_logic_vector(7 downto 0);
    io_ret_3_2 : out std_logic_vector(7 downto 0);
    io_ret_3_3 : out std_logic_vector(7 downto 0)
  );
end SubBytes;

architecture arch of SubBytes is
  signal subByte_io_ret : std_logic_vector(7 downto 0);
  signal subByte_1_io_ret : std_logic_vector(7 downto 0);
  signal subByte_2_io_ret : std_logic_vector(7 downto 0);
  signal subByte_3_io_ret : std_logic_vector(7 downto 0);
  signal subByte_4_io_ret : std_logic_vector(7 downto 0);
  signal subByte_5_io_ret : std_logic_vector(7 downto 0);
  signal subByte_6_io_ret : std_logic_vector(7 downto 0);
  signal subByte_7_io_ret : std_logic_vector(7 downto 0);
  signal subByte_8_io_ret : std_logic_vector(7 downto 0);
  signal subByte_9_io_ret : std_logic_vector(7 downto 0);
  signal subByte_10_io_ret : std_logic_vector(7 downto 0);
  signal subByte_11_io_ret : std_logic_vector(7 downto 0);
  signal subByte_12_io_ret : std_logic_vector(7 downto 0);
  signal subByte_13_io_ret : std_logic_vector(7 downto 0);
  signal subByte_14_io_ret : std_logic_vector(7 downto 0);
  signal subByte_15_io_ret : std_logic_vector(7 downto 0);

begin
  subByte : entity work.SubByte
    port map ( 
      io_b => io_state_0_0,
      io_ret => subByte_io_ret 
    );
  subByte_1 : entity work.SubByte
    port map ( 
      io_b => io_state_0_1,
      io_ret => subByte_1_io_ret 
    );
  subByte_2 : entity work.SubByte
    port map ( 
      io_b => io_state_0_2,
      io_ret => subByte_2_io_ret 
    );
  subByte_3 : entity work.SubByte
    port map ( 
      io_b => io_state_0_3,
      io_ret => subByte_3_io_ret 
    );
  subByte_4 : entity work.SubByte
    port map ( 
      io_b => io_state_1_0,
      io_ret => subByte_4_io_ret 
    );
  subByte_5 : entity work.SubByte
    port map ( 
      io_b => io_state_1_1,
      io_ret => subByte_5_io_ret 
    );
  subByte_6 : entity work.SubByte
    port map ( 
      io_b => io_state_1_2,
      io_ret => subByte_6_io_ret 
    );
  subByte_7 : entity work.SubByte
    port map ( 
      io_b => io_state_1_3,
      io_ret => subByte_7_io_ret 
    );
  subByte_8 : entity work.SubByte
    port map ( 
      io_b => io_state_2_0,
      io_ret => subByte_8_io_ret 
    );
  subByte_9 : entity work.SubByte
    port map ( 
      io_b => io_state_2_1,
      io_ret => subByte_9_io_ret 
    );
  subByte_10 : entity work.SubByte
    port map ( 
      io_b => io_state_2_2,
      io_ret => subByte_10_io_ret 
    );
  subByte_11 : entity work.SubByte
    port map ( 
      io_b => io_state_2_3,
      io_ret => subByte_11_io_ret 
    );
  subByte_12 : entity work.SubByte
    port map ( 
      io_b => io_state_3_0,
      io_ret => subByte_12_io_ret 
    );
  subByte_13 : entity work.SubByte
    port map ( 
      io_b => io_state_3_1,
      io_ret => subByte_13_io_ret 
    );
  subByte_14 : entity work.SubByte
    port map ( 
      io_b => io_state_3_2,
      io_ret => subByte_14_io_ret 
    );
  subByte_15 : entity work.SubByte
    port map ( 
      io_b => io_state_3_3,
      io_ret => subByte_15_io_ret 
    );
  io_ret_0_0 <= subByte_io_ret;
  io_ret_0_1 <= subByte_1_io_ret;
  io_ret_0_2 <= subByte_2_io_ret;
  io_ret_0_3 <= subByte_3_io_ret;
  io_ret_1_0 <= subByte_4_io_ret;
  io_ret_1_1 <= subByte_5_io_ret;
  io_ret_1_2 <= subByte_6_io_ret;
  io_ret_1_3 <= subByte_7_io_ret;
  io_ret_2_0 <= subByte_8_io_ret;
  io_ret_2_1 <= subByte_9_io_ret;
  io_ret_2_2 <= subByte_10_io_ret;
  io_ret_2_3 <= subByte_11_io_ret;
  io_ret_3_0 <= subByte_12_io_ret;
  io_ret_3_1 <= subByte_13_io_ret;
  io_ret_3_2 <= subByte_14_io_ret;
  io_ret_3_3 <= subByte_15_io_ret;
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
    io_state_0_0 : in std_logic_vector(7 downto 0);
    io_state_0_1 : in std_logic_vector(7 downto 0);
    io_state_0_2 : in std_logic_vector(7 downto 0);
    io_state_0_3 : in std_logic_vector(7 downto 0);
    io_state_1_0 : in std_logic_vector(7 downto 0);
    io_state_1_1 : in std_logic_vector(7 downto 0);
    io_state_1_2 : in std_logic_vector(7 downto 0);
    io_state_1_3 : in std_logic_vector(7 downto 0);
    io_state_2_0 : in std_logic_vector(7 downto 0);
    io_state_2_1 : in std_logic_vector(7 downto 0);
    io_state_2_2 : in std_logic_vector(7 downto 0);
    io_state_2_3 : in std_logic_vector(7 downto 0);
    io_state_3_0 : in std_logic_vector(7 downto 0);
    io_state_3_1 : in std_logic_vector(7 downto 0);
    io_state_3_2 : in std_logic_vector(7 downto 0);
    io_state_3_3 : in std_logic_vector(7 downto 0);
    io_ret_0_0 : out std_logic_vector(7 downto 0);
    io_ret_0_1 : out std_logic_vector(7 downto 0);
    io_ret_0_2 : out std_logic_vector(7 downto 0);
    io_ret_0_3 : out std_logic_vector(7 downto 0);
    io_ret_1_0 : out std_logic_vector(7 downto 0);
    io_ret_1_1 : out std_logic_vector(7 downto 0);
    io_ret_1_2 : out std_logic_vector(7 downto 0);
    io_ret_1_3 : out std_logic_vector(7 downto 0);
    io_ret_2_0 : out std_logic_vector(7 downto 0);
    io_ret_2_1 : out std_logic_vector(7 downto 0);
    io_ret_2_2 : out std_logic_vector(7 downto 0);
    io_ret_2_3 : out std_logic_vector(7 downto 0);
    io_ret_3_0 : out std_logic_vector(7 downto 0);
    io_ret_3_1 : out std_logic_vector(7 downto 0);
    io_ret_3_2 : out std_logic_vector(7 downto 0);
    io_ret_3_3 : out std_logic_vector(7 downto 0)
  );
end ShiftRows;

architecture arch of ShiftRows is

begin
  io_ret_0_0 <= io_state_0_0;
  io_ret_0_1 <= io_state_0_1;
  io_ret_0_2 <= io_state_0_2;
  io_ret_0_3 <= io_state_0_3;
  io_ret_1_0 <= io_state_1_1;
  io_ret_1_1 <= io_state_1_2;
  io_ret_1_2 <= io_state_1_3;
  io_ret_1_3 <= io_state_1_0;
  io_ret_2_0 <= io_state_2_2;
  io_ret_2_1 <= io_state_2_3;
  io_ret_2_2 <= io_state_2_0;
  io_ret_2_3 <= io_state_2_1;
  io_ret_3_0 <= io_state_3_3;
  io_ret_3_1 <= io_state_3_0;
  io_ret_3_2 <= io_state_3_1;
  io_ret_3_3 <= io_state_3_2;
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
    io_state_0_0 : in std_logic_vector(7 downto 0);
    io_state_0_1 : in std_logic_vector(7 downto 0);
    io_state_0_2 : in std_logic_vector(7 downto 0);
    io_state_0_3 : in std_logic_vector(7 downto 0);
    io_state_1_0 : in std_logic_vector(7 downto 0);
    io_state_1_1 : in std_logic_vector(7 downto 0);
    io_state_1_2 : in std_logic_vector(7 downto 0);
    io_state_1_3 : in std_logic_vector(7 downto 0);
    io_state_2_0 : in std_logic_vector(7 downto 0);
    io_state_2_1 : in std_logic_vector(7 downto 0);
    io_state_2_2 : in std_logic_vector(7 downto 0);
    io_state_2_3 : in std_logic_vector(7 downto 0);
    io_state_3_0 : in std_logic_vector(7 downto 0);
    io_state_3_1 : in std_logic_vector(7 downto 0);
    io_state_3_2 : in std_logic_vector(7 downto 0);
    io_state_3_3 : in std_logic_vector(7 downto 0);
    io_ret_0_0 : out std_logic_vector(7 downto 0);
    io_ret_0_1 : out std_logic_vector(7 downto 0);
    io_ret_0_2 : out std_logic_vector(7 downto 0);
    io_ret_0_3 : out std_logic_vector(7 downto 0);
    io_ret_1_0 : out std_logic_vector(7 downto 0);
    io_ret_1_1 : out std_logic_vector(7 downto 0);
    io_ret_1_2 : out std_logic_vector(7 downto 0);
    io_ret_1_3 : out std_logic_vector(7 downto 0);
    io_ret_2_0 : out std_logic_vector(7 downto 0);
    io_ret_2_1 : out std_logic_vector(7 downto 0);
    io_ret_2_2 : out std_logic_vector(7 downto 0);
    io_ret_2_3 : out std_logic_vector(7 downto 0);
    io_ret_3_0 : out std_logic_vector(7 downto 0);
    io_ret_3_1 : out std_logic_vector(7 downto 0);
    io_ret_3_2 : out std_logic_vector(7 downto 0);
    io_ret_3_3 : out std_logic_vector(7 downto 0)
  );
end MixColumns;

architecture arch of MixColumns is
  signal mixColumn_4_io_ret_0 : std_logic_vector(7 downto 0);
  signal mixColumn_4_io_ret_1 : std_logic_vector(7 downto 0);
  signal mixColumn_4_io_ret_2 : std_logic_vector(7 downto 0);
  signal mixColumn_4_io_ret_3 : std_logic_vector(7 downto 0);
  signal mixColumn_5_io_ret_0 : std_logic_vector(7 downto 0);
  signal mixColumn_5_io_ret_1 : std_logic_vector(7 downto 0);
  signal mixColumn_5_io_ret_2 : std_logic_vector(7 downto 0);
  signal mixColumn_5_io_ret_3 : std_logic_vector(7 downto 0);
  signal mixColumn_6_io_ret_0 : std_logic_vector(7 downto 0);
  signal mixColumn_6_io_ret_1 : std_logic_vector(7 downto 0);
  signal mixColumn_6_io_ret_2 : std_logic_vector(7 downto 0);
  signal mixColumn_6_io_ret_3 : std_logic_vector(7 downto 0);
  signal mixColumn_7_io_ret_0 : std_logic_vector(7 downto 0);
  signal mixColumn_7_io_ret_1 : std_logic_vector(7 downto 0);
  signal mixColumn_7_io_ret_2 : std_logic_vector(7 downto 0);
  signal mixColumn_7_io_ret_3 : std_logic_vector(7 downto 0);

  signal ret_0_0 : std_logic_vector(7 downto 0);
  signal ret_0_1 : std_logic_vector(7 downto 0);
  signal ret_0_2 : std_logic_vector(7 downto 0);
  signal ret_0_3 : std_logic_vector(7 downto 0);
  signal ret_1_0 : std_logic_vector(7 downto 0);
  signal ret_1_1 : std_logic_vector(7 downto 0);
  signal ret_1_2 : std_logic_vector(7 downto 0);
  signal ret_1_3 : std_logic_vector(7 downto 0);
  signal ret_2_0 : std_logic_vector(7 downto 0);
  signal ret_2_1 : std_logic_vector(7 downto 0);
  signal ret_2_2 : std_logic_vector(7 downto 0);
  signal ret_2_3 : std_logic_vector(7 downto 0);
  signal ret_3_0 : std_logic_vector(7 downto 0);
  signal ret_3_1 : std_logic_vector(7 downto 0);
  signal ret_3_2 : std_logic_vector(7 downto 0);
  signal ret_3_3 : std_logic_vector(7 downto 0);
begin
  mixColumn_4 : entity work.MixColumn
    port map ( 
      io_c_0 => io_state_0_0,
      io_c_1 => io_state_1_0,
      io_c_2 => io_state_2_0,
      io_c_3 => io_state_3_0,
      io_ret_0 => mixColumn_4_io_ret_0,
      io_ret_1 => mixColumn_4_io_ret_1,
      io_ret_2 => mixColumn_4_io_ret_2,
      io_ret_3 => mixColumn_4_io_ret_3 
    );
  mixColumn_5 : entity work.MixColumn
    port map ( 
      io_c_0 => io_state_0_1,
      io_c_1 => io_state_1_1,
      io_c_2 => io_state_2_1,
      io_c_3 => io_state_3_1,
      io_ret_0 => mixColumn_5_io_ret_0,
      io_ret_1 => mixColumn_5_io_ret_1,
      io_ret_2 => mixColumn_5_io_ret_2,
      io_ret_3 => mixColumn_5_io_ret_3 
    );
  mixColumn_6 : entity work.MixColumn
    port map ( 
      io_c_0 => io_state_0_2,
      io_c_1 => io_state_1_2,
      io_c_2 => io_state_2_2,
      io_c_3 => io_state_3_2,
      io_ret_0 => mixColumn_6_io_ret_0,
      io_ret_1 => mixColumn_6_io_ret_1,
      io_ret_2 => mixColumn_6_io_ret_2,
      io_ret_3 => mixColumn_6_io_ret_3 
    );
  mixColumn_7 : entity work.MixColumn
    port map ( 
      io_c_0 => io_state_0_3,
      io_c_1 => io_state_1_3,
      io_c_2 => io_state_2_3,
      io_c_3 => io_state_3_3,
      io_ret_0 => mixColumn_7_io_ret_0,
      io_ret_1 => mixColumn_7_io_ret_1,
      io_ret_2 => mixColumn_7_io_ret_2,
      io_ret_3 => mixColumn_7_io_ret_3 
    );
  ret_0_0 <= mixColumn_4_io_ret_0;
  ret_0_1 <= mixColumn_4_io_ret_1;
  ret_0_2 <= mixColumn_4_io_ret_2;
  ret_0_3 <= mixColumn_4_io_ret_3;
  ret_1_0 <= mixColumn_5_io_ret_0;
  ret_1_1 <= mixColumn_5_io_ret_1;
  ret_1_2 <= mixColumn_5_io_ret_2;
  ret_1_3 <= mixColumn_5_io_ret_3;
  ret_2_0 <= mixColumn_6_io_ret_0;
  ret_2_1 <= mixColumn_6_io_ret_1;
  ret_2_2 <= mixColumn_6_io_ret_2;
  ret_2_3 <= mixColumn_6_io_ret_3;
  ret_3_0 <= mixColumn_7_io_ret_0;
  ret_3_1 <= mixColumn_7_io_ret_1;
  ret_3_2 <= mixColumn_7_io_ret_2;
  ret_3_3 <= mixColumn_7_io_ret_3;
  io_ret_0_0 <= ret_0_0;
  io_ret_0_1 <= ret_1_0;
  io_ret_0_2 <= ret_2_0;
  io_ret_0_3 <= ret_3_0;
  io_ret_1_0 <= ret_0_1;
  io_ret_1_1 <= ret_1_1;
  io_ret_1_2 <= ret_2_1;
  io_ret_1_3 <= ret_3_1;
  io_ret_2_0 <= ret_0_2;
  io_ret_2_1 <= ret_1_2;
  io_ret_2_2 <= ret_2_2;
  io_ret_2_3 <= ret_3_2;
  io_ret_3_0 <= ret_0_3;
  io_ret_3_1 <= ret_1_3;
  io_ret_3_2 <= ret_2_3;
  io_ret_3_3 <= ret_3_3;
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KeySchedule is
  port(
    io_key_0_0 : in std_logic_vector(7 downto 0);
    io_key_0_1 : in std_logic_vector(7 downto 0);
    io_key_0_2 : in std_logic_vector(7 downto 0);
    io_key_0_3 : in std_logic_vector(7 downto 0);
    io_key_1_0 : in std_logic_vector(7 downto 0);
    io_key_1_1 : in std_logic_vector(7 downto 0);
    io_key_1_2 : in std_logic_vector(7 downto 0);
    io_key_1_3 : in std_logic_vector(7 downto 0);
    io_key_2_0 : in std_logic_vector(7 downto 0);
    io_key_2_1 : in std_logic_vector(7 downto 0);
    io_key_2_2 : in std_logic_vector(7 downto 0);
    io_key_2_3 : in std_logic_vector(7 downto 0);
    io_key_3_0 : in std_logic_vector(7 downto 0);
    io_key_3_1 : in std_logic_vector(7 downto 0);
    io_key_3_2 : in std_logic_vector(7 downto 0);
    io_key_3_3 : in std_logic_vector(7 downto 0);
    io_c : in std_logic_vector(7 downto 0);
    io_ret_0_0 : out std_logic_vector(7 downto 0);
    io_ret_0_1 : out std_logic_vector(7 downto 0);
    io_ret_0_2 : out std_logic_vector(7 downto 0);
    io_ret_0_3 : out std_logic_vector(7 downto 0);
    io_ret_1_0 : out std_logic_vector(7 downto 0);
    io_ret_1_1 : out std_logic_vector(7 downto 0);
    io_ret_1_2 : out std_logic_vector(7 downto 0);
    io_ret_1_3 : out std_logic_vector(7 downto 0);
    io_ret_2_0 : out std_logic_vector(7 downto 0);
    io_ret_2_1 : out std_logic_vector(7 downto 0);
    io_ret_2_2 : out std_logic_vector(7 downto 0);
    io_ret_2_3 : out std_logic_vector(7 downto 0);
    io_ret_3_0 : out std_logic_vector(7 downto 0);
    io_ret_3_1 : out std_logic_vector(7 downto 0);
    io_ret_3_2 : out std_logic_vector(7 downto 0);
    io_ret_3_3 : out std_logic_vector(7 downto 0)
  );
end KeySchedule;

architecture arch of KeySchedule is
  signal subword_1_io_ret_0 : std_logic_vector(7 downto 0);
  signal subword_1_io_ret_1 : std_logic_vector(7 downto 0);
  signal subword_1_io_ret_2 : std_logic_vector(7 downto 0);
  signal subword_1_io_ret_3 : std_logic_vector(7 downto 0);

  signal keyT_0_0 : std_logic_vector(7 downto 0);
  signal keyT_0_1 : std_logic_vector(7 downto 0);
  signal keyT_0_2 : std_logic_vector(7 downto 0);
  signal keyT_0_3 : std_logic_vector(7 downto 0);
  signal keyT_1_0 : std_logic_vector(7 downto 0);
  signal keyT_1_1 : std_logic_vector(7 downto 0);
  signal keyT_1_2 : std_logic_vector(7 downto 0);
  signal keyT_1_3 : std_logic_vector(7 downto 0);
  signal keyT_2_0 : std_logic_vector(7 downto 0);
  signal keyT_2_1 : std_logic_vector(7 downto 0);
  signal keyT_2_2 : std_logic_vector(7 downto 0);
  signal keyT_2_3 : std_logic_vector(7 downto 0);
  signal keyT_3_0 : std_logic_vector(7 downto 0);
  signal keyT_3_1 : std_logic_vector(7 downto 0);
  signal keyT_3_2 : std_logic_vector(7 downto 0);
  signal keyT_3_3 : std_logic_vector(7 downto 0);
  signal w0_0 : std_logic_vector(7 downto 0);
  signal w0_1 : std_logic_vector(7 downto 0);
  signal w0_2 : std_logic_vector(7 downto 0);
  signal w0_3 : std_logic_vector(7 downto 0);
  signal w1_0 : std_logic_vector(7 downto 0);
  signal w1_1 : std_logic_vector(7 downto 0);
  signal w1_2 : std_logic_vector(7 downto 0);
  signal w1_3 : std_logic_vector(7 downto 0);
  signal w2_0 : std_logic_vector(7 downto 0);
  signal w2_1 : std_logic_vector(7 downto 0);
  signal w2_2 : std_logic_vector(7 downto 0);
  signal w2_3 : std_logic_vector(7 downto 0);
  signal w3_0 : std_logic_vector(7 downto 0);
  signal w3_1 : std_logic_vector(7 downto 0);
  signal w3_2 : std_logic_vector(7 downto 0);
  signal w3_3 : std_logic_vector(7 downto 0);
begin
  subword_1 : entity work.SubWord
    port map ( 
      io_bs_0 => keyT_3_0,
      io_bs_1 => keyT_3_1,
      io_bs_2 => keyT_3_2,
      io_bs_3 => keyT_3_3,
      io_ret_0 => subword_1_io_ret_0,
      io_ret_1 => subword_1_io_ret_1,
      io_ret_2 => subword_1_io_ret_2,
      io_ret_3 => subword_1_io_ret_3 
    );
  keyT_0_0 <= io_key_0_0;
  keyT_0_1 <= io_key_1_0;
  keyT_0_2 <= io_key_2_0;
  keyT_0_3 <= io_key_3_0;
  keyT_1_0 <= io_key_0_1;
  keyT_1_1 <= io_key_1_1;
  keyT_1_2 <= io_key_2_1;
  keyT_1_3 <= io_key_3_1;
  keyT_2_0 <= io_key_0_2;
  keyT_2_1 <= io_key_1_2;
  keyT_2_2 <= io_key_2_2;
  keyT_2_3 <= io_key_3_2;
  keyT_3_0 <= io_key_0_3;
  keyT_3_1 <= io_key_1_3;
  keyT_3_2 <= io_key_2_3;
  keyT_3_3 <= io_key_3_3;
  w0_0 <= ((keyT_0_0 xor subword_1_io_ret_1) xor io_c);
  w0_1 <= ((keyT_0_1 xor subword_1_io_ret_2) xor pkg_stdLogicVector("00000000"));
  w0_2 <= ((keyT_0_2 xor subword_1_io_ret_3) xor pkg_stdLogicVector("00000000"));
  w0_3 <= ((keyT_0_3 xor subword_1_io_ret_0) xor pkg_stdLogicVector("00000000"));
  w1_0 <= (keyT_1_0 xor w0_0);
  w1_1 <= (keyT_1_1 xor w0_1);
  w1_2 <= (keyT_1_2 xor w0_2);
  w1_3 <= (keyT_1_3 xor w0_3);
  w2_0 <= (keyT_2_0 xor w1_0);
  w2_1 <= (keyT_2_1 xor w1_1);
  w2_2 <= (keyT_2_2 xor w1_2);
  w2_3 <= (keyT_2_3 xor w1_3);
  w3_0 <= (keyT_3_0 xor w2_0);
  w3_1 <= (keyT_3_1 xor w2_1);
  w3_2 <= (keyT_3_2 xor w2_2);
  w3_3 <= (keyT_3_3 xor w2_3);
  io_ret_0_0 <= w0_0;
  io_ret_0_1 <= w1_0;
  io_ret_0_2 <= w2_0;
  io_ret_0_3 <= w3_0;
  io_ret_1_0 <= w0_1;
  io_ret_1_1 <= w1_1;
  io_ret_1_2 <= w2_1;
  io_ret_1_3 <= w3_1;
  io_ret_2_0 <= w0_2;
  io_ret_2_1 <= w1_2;
  io_ret_2_2 <= w2_2;
  io_ret_2_3 <= w3_2;
  io_ret_3_0 <= w0_3;
  io_ret_3_1 <= w1_3;
  io_ret_3_2 <= w2_3;
  io_ret_3_3 <= w3_3;
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity NextRC is
  port(
    io_rc : in std_logic_vector(7 downto 0);
    io_ret : out std_logic_vector(7 downto 0)
  );
end NextRC;

architecture arch of NextRC is

  signal when_AES_Round_l198 : std_logic;
begin
  when_AES_Round_l198 <= pkg_toStdLogic(pkg_extract(io_rc,7) = pkg_toStdLogic(false));
  process(when_AES_Round_l198,io_rc)
  begin
    if when_AES_Round_l198 = '1' then
      io_ret <= std_logic_vector(shift_left(unsigned(io_rc),1));
    else
      io_ret <= (std_logic_vector(shift_left(unsigned(io_rc),1)) xor pkg_stdLogicVector("00011011"));
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


entity aesEncrypt_Round is
  port(
    io_reset : in std_logic;
    io_pt : in std_logic_vector(127 downto 0);
    io_key : in std_logic_vector(127 downto 0);
    io_ret : out std_logic_vector(127 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end aesEncrypt_Round;

architecture arch of aesEncrypt_Round is
  signal addroundkey_io_rk_0_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_0_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_0_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_0_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_1_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_1_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_1_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_1_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_2_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_2_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_2_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_2_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_3_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_3_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_3_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_rk_3_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_0_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_0_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_0_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_0_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_1_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_1_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_1_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_1_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_2_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_2_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_2_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_2_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_3_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_3_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_3_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_s_3_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_0_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_0_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_0_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_0_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_1_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_1_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_1_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_1_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_2_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_2_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_2_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_2_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_3_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_3_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_3_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_key_3_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_0_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_0_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_0_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_0_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_1_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_1_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_1_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_1_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_2_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_2_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_2_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_2_3 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_3_0 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_3_1 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_3_2 : std_logic_vector(7 downto 0);
  signal addroundkey_io_ret_3_3 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_0_0 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_0_1 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_0_2 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_0_3 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_1_0 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_1_1 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_1_2 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_1_3 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_2_0 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_2_1 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_2_2 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_2_3 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_3_0 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_3_1 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_3_2 : std_logic_vector(7 downto 0);
  signal subbytes_1_io_ret_3_3 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_0_0 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_0_1 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_0_2 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_0_3 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_1_0 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_1_1 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_1_2 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_1_3 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_2_0 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_2_1 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_2_2 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_2_3 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_3_0 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_3_1 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_3_2 : std_logic_vector(7 downto 0);
  signal shiftrows_io_ret_3_3 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_0_0 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_0_1 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_0_2 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_0_3 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_1_0 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_1_1 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_1_2 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_1_3 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_2_0 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_2_1 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_2_2 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_2_3 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_3_0 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_3_1 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_3_2 : std_logic_vector(7 downto 0);
  signal mixcolumns_io_ret_3_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_0_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_0_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_0_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_0_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_1_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_1_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_1_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_1_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_2_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_2_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_2_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_2_3 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_3_0 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_3_1 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_3_2 : std_logic_vector(7 downto 0);
  signal keyschedule_1_io_ret_3_3 : std_logic_vector(7 downto 0);
  signal nextrc_1_io_ret : std_logic_vector(7 downto 0);

  signal state0_0_0 : std_logic_vector(7 downto 0);
  signal state0_0_1 : std_logic_vector(7 downto 0);
  signal state0_0_2 : std_logic_vector(7 downto 0);
  signal state0_0_3 : std_logic_vector(7 downto 0);
  signal state0_1_0 : std_logic_vector(7 downto 0);
  signal state0_1_1 : std_logic_vector(7 downto 0);
  signal state0_1_2 : std_logic_vector(7 downto 0);
  signal state0_1_3 : std_logic_vector(7 downto 0);
  signal state0_2_0 : std_logic_vector(7 downto 0);
  signal state0_2_1 : std_logic_vector(7 downto 0);
  signal state0_2_2 : std_logic_vector(7 downto 0);
  signal state0_2_3 : std_logic_vector(7 downto 0);
  signal state0_3_0 : std_logic_vector(7 downto 0);
  signal state0_3_1 : std_logic_vector(7 downto 0);
  signal state0_3_2 : std_logic_vector(7 downto 0);
  signal state0_3_3 : std_logic_vector(7 downto 0);
  signal rounds_0_0 : std_logic_vector(7 downto 0);
  signal rounds_0_1 : std_logic_vector(7 downto 0);
  signal rounds_0_2 : std_logic_vector(7 downto 0);
  signal rounds_0_3 : std_logic_vector(7 downto 0);
  signal rounds_1_0 : std_logic_vector(7 downto 0);
  signal rounds_1_1 : std_logic_vector(7 downto 0);
  signal rounds_1_2 : std_logic_vector(7 downto 0);
  signal rounds_1_3 : std_logic_vector(7 downto 0);
  signal rounds_2_0 : std_logic_vector(7 downto 0);
  signal rounds_2_1 : std_logic_vector(7 downto 0);
  signal rounds_2_2 : std_logic_vector(7 downto 0);
  signal rounds_2_3 : std_logic_vector(7 downto 0);
  signal rounds_3_0 : std_logic_vector(7 downto 0);
  signal rounds_3_1 : std_logic_vector(7 downto 0);
  signal rounds_3_2 : std_logic_vector(7 downto 0);
  signal rounds_3_3 : std_logic_vector(7 downto 0);
  signal keys_0_0 : std_logic_vector(7 downto 0);
  signal keys_0_1 : std_logic_vector(7 downto 0);
  signal keys_0_2 : std_logic_vector(7 downto 0);
  signal keys_0_3 : std_logic_vector(7 downto 0);
  signal keys_1_0 : std_logic_vector(7 downto 0);
  signal keys_1_1 : std_logic_vector(7 downto 0);
  signal keys_1_2 : std_logic_vector(7 downto 0);
  signal keys_1_3 : std_logic_vector(7 downto 0);
  signal keys_2_0 : std_logic_vector(7 downto 0);
  signal keys_2_1 : std_logic_vector(7 downto 0);
  signal keys_2_2 : std_logic_vector(7 downto 0);
  signal keys_2_3 : std_logic_vector(7 downto 0);
  signal keys_3_0 : std_logic_vector(7 downto 0);
  signal keys_3_1 : std_logic_vector(7 downto 0);
  signal keys_3_2 : std_logic_vector(7 downto 0);
  signal keys_3_3 : std_logic_vector(7 downto 0);
  signal rcs : std_logic_vector(7 downto 0);
  signal counter_willIncrement : std_logic;
  signal counter_willClear : std_logic;
  signal counter_valueNext : unsigned(3 downto 0);
  signal counter_value : unsigned(3 downto 0);
  signal counter_willOverflowIfInc : std_logic;
  signal counter_willOverflow : std_logic;
  signal fsm_wantExit : std_logic;
  signal fsm_wantStart : std_logic;
  signal fsm_wantKill : std_logic;
  signal fsm_stateReg : fsm_enumDef;
  signal fsm_stateNext : fsm_enumDef;
  signal io_reset_regNext : std_logic;
  signal when_AES_Round_l52 : std_logic;
  signal zz_io_ret : std_logic_vector(127 downto 0);
  signal when_StateMachine_l235 : std_logic;
begin
  addroundkey : entity work.AddRoundKey
    port map ( 
      io_rk_0_0 => addroundkey_io_rk_0_0,
      io_rk_0_1 => addroundkey_io_rk_0_1,
      io_rk_0_2 => addroundkey_io_rk_0_2,
      io_rk_0_3 => addroundkey_io_rk_0_3,
      io_rk_1_0 => addroundkey_io_rk_1_0,
      io_rk_1_1 => addroundkey_io_rk_1_1,
      io_rk_1_2 => addroundkey_io_rk_1_2,
      io_rk_1_3 => addroundkey_io_rk_1_3,
      io_rk_2_0 => addroundkey_io_rk_2_0,
      io_rk_2_1 => addroundkey_io_rk_2_1,
      io_rk_2_2 => addroundkey_io_rk_2_2,
      io_rk_2_3 => addroundkey_io_rk_2_3,
      io_rk_3_0 => addroundkey_io_rk_3_0,
      io_rk_3_1 => addroundkey_io_rk_3_1,
      io_rk_3_2 => addroundkey_io_rk_3_2,
      io_rk_3_3 => addroundkey_io_rk_3_3,
      io_s_0_0 => addroundkey_io_s_0_0,
      io_s_0_1 => addroundkey_io_s_0_1,
      io_s_0_2 => addroundkey_io_s_0_2,
      io_s_0_3 => addroundkey_io_s_0_3,
      io_s_1_0 => addroundkey_io_s_1_0,
      io_s_1_1 => addroundkey_io_s_1_1,
      io_s_1_2 => addroundkey_io_s_1_2,
      io_s_1_3 => addroundkey_io_s_1_3,
      io_s_2_0 => addroundkey_io_s_2_0,
      io_s_2_1 => addroundkey_io_s_2_1,
      io_s_2_2 => addroundkey_io_s_2_2,
      io_s_2_3 => addroundkey_io_s_2_3,
      io_s_3_0 => addroundkey_io_s_3_0,
      io_s_3_1 => addroundkey_io_s_3_1,
      io_s_3_2 => addroundkey_io_s_3_2,
      io_s_3_3 => addroundkey_io_s_3_3,
      io_ret_0_0 => addroundkey_io_ret_0_0,
      io_ret_0_1 => addroundkey_io_ret_0_1,
      io_ret_0_2 => addroundkey_io_ret_0_2,
      io_ret_0_3 => addroundkey_io_ret_0_3,
      io_ret_1_0 => addroundkey_io_ret_1_0,
      io_ret_1_1 => addroundkey_io_ret_1_1,
      io_ret_1_2 => addroundkey_io_ret_1_2,
      io_ret_1_3 => addroundkey_io_ret_1_3,
      io_ret_2_0 => addroundkey_io_ret_2_0,
      io_ret_2_1 => addroundkey_io_ret_2_1,
      io_ret_2_2 => addroundkey_io_ret_2_2,
      io_ret_2_3 => addroundkey_io_ret_2_3,
      io_ret_3_0 => addroundkey_io_ret_3_0,
      io_ret_3_1 => addroundkey_io_ret_3_1,
      io_ret_3_2 => addroundkey_io_ret_3_2,
      io_ret_3_3 => addroundkey_io_ret_3_3 
    );
  subbytes_1 : entity work.SubBytes
    port map ( 
      io_state_0_0 => rounds_0_0,
      io_state_0_1 => rounds_0_1,
      io_state_0_2 => rounds_0_2,
      io_state_0_3 => rounds_0_3,
      io_state_1_0 => rounds_1_0,
      io_state_1_1 => rounds_1_1,
      io_state_1_2 => rounds_1_2,
      io_state_1_3 => rounds_1_3,
      io_state_2_0 => rounds_2_0,
      io_state_2_1 => rounds_2_1,
      io_state_2_2 => rounds_2_2,
      io_state_2_3 => rounds_2_3,
      io_state_3_0 => rounds_3_0,
      io_state_3_1 => rounds_3_1,
      io_state_3_2 => rounds_3_2,
      io_state_3_3 => rounds_3_3,
      io_ret_0_0 => subbytes_1_io_ret_0_0,
      io_ret_0_1 => subbytes_1_io_ret_0_1,
      io_ret_0_2 => subbytes_1_io_ret_0_2,
      io_ret_0_3 => subbytes_1_io_ret_0_3,
      io_ret_1_0 => subbytes_1_io_ret_1_0,
      io_ret_1_1 => subbytes_1_io_ret_1_1,
      io_ret_1_2 => subbytes_1_io_ret_1_2,
      io_ret_1_3 => subbytes_1_io_ret_1_3,
      io_ret_2_0 => subbytes_1_io_ret_2_0,
      io_ret_2_1 => subbytes_1_io_ret_2_1,
      io_ret_2_2 => subbytes_1_io_ret_2_2,
      io_ret_2_3 => subbytes_1_io_ret_2_3,
      io_ret_3_0 => subbytes_1_io_ret_3_0,
      io_ret_3_1 => subbytes_1_io_ret_3_1,
      io_ret_3_2 => subbytes_1_io_ret_3_2,
      io_ret_3_3 => subbytes_1_io_ret_3_3 
    );
  shiftrows : entity work.ShiftRows
    port map ( 
      io_state_0_0 => subbytes_1_io_ret_0_0,
      io_state_0_1 => subbytes_1_io_ret_0_1,
      io_state_0_2 => subbytes_1_io_ret_0_2,
      io_state_0_3 => subbytes_1_io_ret_0_3,
      io_state_1_0 => subbytes_1_io_ret_1_0,
      io_state_1_1 => subbytes_1_io_ret_1_1,
      io_state_1_2 => subbytes_1_io_ret_1_2,
      io_state_1_3 => subbytes_1_io_ret_1_3,
      io_state_2_0 => subbytes_1_io_ret_2_0,
      io_state_2_1 => subbytes_1_io_ret_2_1,
      io_state_2_2 => subbytes_1_io_ret_2_2,
      io_state_2_3 => subbytes_1_io_ret_2_3,
      io_state_3_0 => subbytes_1_io_ret_3_0,
      io_state_3_1 => subbytes_1_io_ret_3_1,
      io_state_3_2 => subbytes_1_io_ret_3_2,
      io_state_3_3 => subbytes_1_io_ret_3_3,
      io_ret_0_0 => shiftrows_io_ret_0_0,
      io_ret_0_1 => shiftrows_io_ret_0_1,
      io_ret_0_2 => shiftrows_io_ret_0_2,
      io_ret_0_3 => shiftrows_io_ret_0_3,
      io_ret_1_0 => shiftrows_io_ret_1_0,
      io_ret_1_1 => shiftrows_io_ret_1_1,
      io_ret_1_2 => shiftrows_io_ret_1_2,
      io_ret_1_3 => shiftrows_io_ret_1_3,
      io_ret_2_0 => shiftrows_io_ret_2_0,
      io_ret_2_1 => shiftrows_io_ret_2_1,
      io_ret_2_2 => shiftrows_io_ret_2_2,
      io_ret_2_3 => shiftrows_io_ret_2_3,
      io_ret_3_0 => shiftrows_io_ret_3_0,
      io_ret_3_1 => shiftrows_io_ret_3_1,
      io_ret_3_2 => shiftrows_io_ret_3_2,
      io_ret_3_3 => shiftrows_io_ret_3_3 
    );
  mixcolumns : entity work.MixColumns
    port map ( 
      io_state_0_0 => shiftrows_io_ret_0_0,
      io_state_0_1 => shiftrows_io_ret_0_1,
      io_state_0_2 => shiftrows_io_ret_0_2,
      io_state_0_3 => shiftrows_io_ret_0_3,
      io_state_1_0 => shiftrows_io_ret_1_0,
      io_state_1_1 => shiftrows_io_ret_1_1,
      io_state_1_2 => shiftrows_io_ret_1_2,
      io_state_1_3 => shiftrows_io_ret_1_3,
      io_state_2_0 => shiftrows_io_ret_2_0,
      io_state_2_1 => shiftrows_io_ret_2_1,
      io_state_2_2 => shiftrows_io_ret_2_2,
      io_state_2_3 => shiftrows_io_ret_2_3,
      io_state_3_0 => shiftrows_io_ret_3_0,
      io_state_3_1 => shiftrows_io_ret_3_1,
      io_state_3_2 => shiftrows_io_ret_3_2,
      io_state_3_3 => shiftrows_io_ret_3_3,
      io_ret_0_0 => mixcolumns_io_ret_0_0,
      io_ret_0_1 => mixcolumns_io_ret_0_1,
      io_ret_0_2 => mixcolumns_io_ret_0_2,
      io_ret_0_3 => mixcolumns_io_ret_0_3,
      io_ret_1_0 => mixcolumns_io_ret_1_0,
      io_ret_1_1 => mixcolumns_io_ret_1_1,
      io_ret_1_2 => mixcolumns_io_ret_1_2,
      io_ret_1_3 => mixcolumns_io_ret_1_3,
      io_ret_2_0 => mixcolumns_io_ret_2_0,
      io_ret_2_1 => mixcolumns_io_ret_2_1,
      io_ret_2_2 => mixcolumns_io_ret_2_2,
      io_ret_2_3 => mixcolumns_io_ret_2_3,
      io_ret_3_0 => mixcolumns_io_ret_3_0,
      io_ret_3_1 => mixcolumns_io_ret_3_1,
      io_ret_3_2 => mixcolumns_io_ret_3_2,
      io_ret_3_3 => mixcolumns_io_ret_3_3 
    );
  keyschedule_1 : entity work.KeySchedule
    port map ( 
      io_key_0_0 => keyschedule_1_io_key_0_0,
      io_key_0_1 => keyschedule_1_io_key_0_1,
      io_key_0_2 => keyschedule_1_io_key_0_2,
      io_key_0_3 => keyschedule_1_io_key_0_3,
      io_key_1_0 => keyschedule_1_io_key_1_0,
      io_key_1_1 => keyschedule_1_io_key_1_1,
      io_key_1_2 => keyschedule_1_io_key_1_2,
      io_key_1_3 => keyschedule_1_io_key_1_3,
      io_key_2_0 => keyschedule_1_io_key_2_0,
      io_key_2_1 => keyschedule_1_io_key_2_1,
      io_key_2_2 => keyschedule_1_io_key_2_2,
      io_key_2_3 => keyschedule_1_io_key_2_3,
      io_key_3_0 => keyschedule_1_io_key_3_0,
      io_key_3_1 => keyschedule_1_io_key_3_1,
      io_key_3_2 => keyschedule_1_io_key_3_2,
      io_key_3_3 => keyschedule_1_io_key_3_3,
      io_c => rcs,
      io_ret_0_0 => keyschedule_1_io_ret_0_0,
      io_ret_0_1 => keyschedule_1_io_ret_0_1,
      io_ret_0_2 => keyschedule_1_io_ret_0_2,
      io_ret_0_3 => keyschedule_1_io_ret_0_3,
      io_ret_1_0 => keyschedule_1_io_ret_1_0,
      io_ret_1_1 => keyschedule_1_io_ret_1_1,
      io_ret_1_2 => keyschedule_1_io_ret_1_2,
      io_ret_1_3 => keyschedule_1_io_ret_1_3,
      io_ret_2_0 => keyschedule_1_io_ret_2_0,
      io_ret_2_1 => keyschedule_1_io_ret_2_1,
      io_ret_2_2 => keyschedule_1_io_ret_2_2,
      io_ret_2_3 => keyschedule_1_io_ret_2_3,
      io_ret_3_0 => keyschedule_1_io_ret_3_0,
      io_ret_3_1 => keyschedule_1_io_ret_3_1,
      io_ret_3_2 => keyschedule_1_io_ret_3_2,
      io_ret_3_3 => keyschedule_1_io_ret_3_3 
    );
  nextrc_1 : entity work.NextRC
    port map ( 
      io_rc => rcs,
      io_ret => nextrc_1_io_ret 
    );
  process(fsm_stateReg)
  begin
    counter_willIncrement <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sReset =>
      when pkg_enum.sAESRound =>
        counter_willIncrement <= pkg_toStdLogic(true);
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  counter_willClear <= pkg_toStdLogic(false);
  counter_willOverflowIfInc <= pkg_toStdLogic(counter_value = pkg_unsigned("1000"));
  counter_willOverflow <= (counter_willOverflowIfInc and counter_willIncrement);
  process(counter_willOverflow,counter_value,counter_willIncrement,counter_willClear)
  begin
    if counter_willOverflow = '1' then
      counter_valueNext <= pkg_unsigned("0000");
    else
      counter_valueNext <= (counter_value + pkg_resize(unsigned(pkg_toStdLogicVector(counter_willIncrement)),4));
    end if;
    if counter_willClear = '1' then
      counter_valueNext <= pkg_unsigned("0000");
    end if;
  end process;

  process(fsm_stateReg,zz_io_ret)
  begin
    io_ret <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    case fsm_stateReg is
      when pkg_enum.sReset =>
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        io_ret <= zz_io_ret;
      when others =>
    end case;
  end process;

  process(fsm_stateReg)
  begin
    io_done <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sReset =>
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        io_done <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_0_0,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_0_0)
  begin
    addroundkey_io_s_0_0 <= mixcolumns_io_ret_0_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_0_0 <= pkg_extract(io_pt,127,120);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_0_0 <= shiftrows_io_ret_0_0;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_0_1,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_0_1)
  begin
    addroundkey_io_s_0_1 <= mixcolumns_io_ret_0_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_0_1 <= pkg_extract(io_pt,95,88);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_0_1 <= shiftrows_io_ret_0_1;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_0_2,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_0_2)
  begin
    addroundkey_io_s_0_2 <= mixcolumns_io_ret_0_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_0_2 <= pkg_extract(io_pt,63,56);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_0_2 <= shiftrows_io_ret_0_2;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_0_3,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_0_3)
  begin
    addroundkey_io_s_0_3 <= mixcolumns_io_ret_0_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_0_3 <= pkg_extract(io_pt,31,24);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_0_3 <= shiftrows_io_ret_0_3;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_1_0,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_1_0)
  begin
    addroundkey_io_s_1_0 <= mixcolumns_io_ret_1_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_1_0 <= pkg_extract(io_pt,119,112);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_1_0 <= shiftrows_io_ret_1_0;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_1_1,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_1_1)
  begin
    addroundkey_io_s_1_1 <= mixcolumns_io_ret_1_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_1_1 <= pkg_extract(io_pt,87,80);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_1_1 <= shiftrows_io_ret_1_1;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_1_2,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_1_2)
  begin
    addroundkey_io_s_1_2 <= mixcolumns_io_ret_1_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_1_2 <= pkg_extract(io_pt,55,48);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_1_2 <= shiftrows_io_ret_1_2;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_1_3,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_1_3)
  begin
    addroundkey_io_s_1_3 <= mixcolumns_io_ret_1_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_1_3 <= pkg_extract(io_pt,23,16);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_1_3 <= shiftrows_io_ret_1_3;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_2_0,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_2_0)
  begin
    addroundkey_io_s_2_0 <= mixcolumns_io_ret_2_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_2_0 <= pkg_extract(io_pt,111,104);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_2_0 <= shiftrows_io_ret_2_0;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_2_1,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_2_1)
  begin
    addroundkey_io_s_2_1 <= mixcolumns_io_ret_2_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_2_1 <= pkg_extract(io_pt,79,72);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_2_1 <= shiftrows_io_ret_2_1;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_2_2,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_2_2)
  begin
    addroundkey_io_s_2_2 <= mixcolumns_io_ret_2_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_2_2 <= pkg_extract(io_pt,47,40);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_2_2 <= shiftrows_io_ret_2_2;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_2_3,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_2_3)
  begin
    addroundkey_io_s_2_3 <= mixcolumns_io_ret_2_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_2_3 <= pkg_extract(io_pt,15,8);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_2_3 <= shiftrows_io_ret_2_3;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_3_0,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_3_0)
  begin
    addroundkey_io_s_3_0 <= mixcolumns_io_ret_3_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_3_0 <= pkg_extract(io_pt,103,96);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_3_0 <= shiftrows_io_ret_3_0;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_3_1,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_3_1)
  begin
    addroundkey_io_s_3_1 <= mixcolumns_io_ret_3_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_3_1 <= pkg_extract(io_pt,71,64);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_3_1 <= shiftrows_io_ret_3_1;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_3_2,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_3_2)
  begin
    addroundkey_io_s_3_2 <= mixcolumns_io_ret_3_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_3_2 <= pkg_extract(io_pt,39,32);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_3_2 <= shiftrows_io_ret_3_2;
      when others =>
    end case;
  end process;

  process(mixcolumns_io_ret_3_3,fsm_stateReg,when_AES_Round_l52,io_pt,shiftrows_io_ret_3_3)
  begin
    addroundkey_io_s_3_3 <= mixcolumns_io_ret_3_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_s_3_3 <= pkg_extract(io_pt,7,0);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        addroundkey_io_s_3_3 <= shiftrows_io_ret_3_3;
      when others =>
    end case;
  end process;

  process(keys_0_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_0_0 <= keys_0_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_0_0 <= pkg_extract(io_key,127,120);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_0_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_0_1 <= keys_0_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_0_1 <= pkg_extract(io_key,95,88);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_0_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_0_2 <= keys_0_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_0_2 <= pkg_extract(io_key,63,56);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_0_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_0_3 <= keys_0_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_0_3 <= pkg_extract(io_key,31,24);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_1_0 <= keys_1_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_1_0 <= pkg_extract(io_key,119,112);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_1_1 <= keys_1_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_1_1 <= pkg_extract(io_key,87,80);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_1_2 <= keys_1_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_1_2 <= pkg_extract(io_key,55,48);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_1_3 <= keys_1_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_1_3 <= pkg_extract(io_key,23,16);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_2_0 <= keys_2_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_2_0 <= pkg_extract(io_key,111,104);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_2_1 <= keys_2_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_2_1 <= pkg_extract(io_key,79,72);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_2_2 <= keys_2_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_2_2 <= pkg_extract(io_key,47,40);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_2_3 <= keys_2_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_2_3 <= pkg_extract(io_key,15,8);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_3_0 <= keys_3_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_3_0 <= pkg_extract(io_key,103,96);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_3_1 <= keys_3_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_3_1 <= pkg_extract(io_key,71,64);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_3_2 <= keys_3_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_3_2 <= pkg_extract(io_key,39,32);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    addroundkey_io_rk_3_3 <= keys_3_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          addroundkey_io_rk_3_3 <= pkg_extract(io_key,7,0);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  state0_0_0 <= addroundkey_io_ret_0_0;
  state0_0_1 <= addroundkey_io_ret_0_1;
  state0_0_2 <= addroundkey_io_ret_0_2;
  state0_0_3 <= addroundkey_io_ret_0_3;
  state0_1_0 <= addroundkey_io_ret_1_0;
  state0_1_1 <= addroundkey_io_ret_1_1;
  state0_1_2 <= addroundkey_io_ret_1_2;
  state0_1_3 <= addroundkey_io_ret_1_3;
  state0_2_0 <= addroundkey_io_ret_2_0;
  state0_2_1 <= addroundkey_io_ret_2_1;
  state0_2_2 <= addroundkey_io_ret_2_2;
  state0_2_3 <= addroundkey_io_ret_2_3;
  state0_3_0 <= addroundkey_io_ret_3_0;
  state0_3_1 <= addroundkey_io_ret_3_1;
  state0_3_2 <= addroundkey_io_ret_3_2;
  state0_3_3 <= addroundkey_io_ret_3_3;
  process(keys_0_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_0_0 <= keys_0_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_0_0 <= pkg_extract(io_key,127,120);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_0_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_0_1 <= keys_0_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_0_1 <= pkg_extract(io_key,95,88);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_0_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_0_2 <= keys_0_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_0_2 <= pkg_extract(io_key,63,56);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_0_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_0_3 <= keys_0_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_0_3 <= pkg_extract(io_key,31,24);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_1_0 <= keys_1_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_1_0 <= pkg_extract(io_key,119,112);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_1_1 <= keys_1_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_1_1 <= pkg_extract(io_key,87,80);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_1_2 <= keys_1_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_1_2 <= pkg_extract(io_key,55,48);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_1_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_1_3 <= keys_1_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_1_3 <= pkg_extract(io_key,23,16);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_2_0 <= keys_2_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_2_0 <= pkg_extract(io_key,111,104);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_2_1 <= keys_2_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_2_1 <= pkg_extract(io_key,79,72);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_2_2 <= keys_2_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_2_2 <= pkg_extract(io_key,47,40);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_2_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_2_3 <= keys_2_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_2_3 <= pkg_extract(io_key,15,8);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_0,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_3_0 <= keys_3_0;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_3_0 <= pkg_extract(io_key,103,96);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_1,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_3_1 <= keys_3_1;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_3_1 <= pkg_extract(io_key,71,64);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_2,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_3_2 <= keys_3_2;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_3_2 <= pkg_extract(io_key,39,32);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(keys_3_3,fsm_stateReg,when_AES_Round_l52,io_key)
  begin
    keyschedule_1_io_key_3_3 <= keys_3_3;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          keyschedule_1_io_key_3_3 <= pkg_extract(io_key,7,0);
        end if;
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
    end case;
  end process;

  process(fsm_stateReg)
  begin
    fsm_wantExit <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sReset =>
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
        fsm_wantExit <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(fsm_stateReg)
  begin
    fsm_wantStart <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sReset =>
      when pkg_enum.sAESRound =>
      when pkg_enum.sAESFinalRound =>
      when others =>
        fsm_wantStart <= pkg_toStdLogic(true);
    end case;
  end process;

  fsm_wantKill <= pkg_toStdLogic(false);
  process(fsm_stateReg,when_AES_Round_l52,counter_willOverflow,fsm_wantStart,fsm_wantKill)
  begin
    fsm_stateNext <= fsm_stateReg;
    case fsm_stateReg is
      when pkg_enum.sReset =>
        if when_AES_Round_l52 = '1' then
          fsm_stateNext <= pkg_enum.sAESRound;
        end if;
      when pkg_enum.sAESRound =>
        if counter_willOverflow = '1' then
          fsm_stateNext <= pkg_enum.sAESFinalRound;
        end if;
      when pkg_enum.sAESFinalRound =>
        fsm_stateNext <= pkg_enum.BOOT;
      when others =>
    end case;
    if fsm_wantStart = '1' then
      fsm_stateNext <= pkg_enum.sReset;
    end if;
    if fsm_wantKill = '1' then
      fsm_stateNext <= pkg_enum.BOOT;
    end if;
  end process;

  when_AES_Round_l52 <= ((not io_reset) and io_reset_regNext);
  process(addroundkey_io_ret_0_0,addroundkey_io_ret_0_1,addroundkey_io_ret_0_2,addroundkey_io_ret_0_3,addroundkey_io_ret_1_0,addroundkey_io_ret_1_1,addroundkey_io_ret_1_2,addroundkey_io_ret_1_3,addroundkey_io_ret_2_0,addroundkey_io_ret_2_1,addroundkey_io_ret_2_2,addroundkey_io_ret_2_3,addroundkey_io_ret_3_0,addroundkey_io_ret_3_1,addroundkey_io_ret_3_2,addroundkey_io_ret_3_3)
  begin
    zz_io_ret(127 downto 120) <= addroundkey_io_ret_0_0;
    zz_io_ret(95 downto 88) <= addroundkey_io_ret_0_1;
    zz_io_ret(63 downto 56) <= addroundkey_io_ret_0_2;
    zz_io_ret(31 downto 24) <= addroundkey_io_ret_0_3;
    zz_io_ret(119 downto 112) <= addroundkey_io_ret_1_0;
    zz_io_ret(87 downto 80) <= addroundkey_io_ret_1_1;
    zz_io_ret(55 downto 48) <= addroundkey_io_ret_1_2;
    zz_io_ret(23 downto 16) <= addroundkey_io_ret_1_3;
    zz_io_ret(111 downto 104) <= addroundkey_io_ret_2_0;
    zz_io_ret(79 downto 72) <= addroundkey_io_ret_2_1;
    zz_io_ret(47 downto 40) <= addroundkey_io_ret_2_2;
    zz_io_ret(15 downto 8) <= addroundkey_io_ret_2_3;
    zz_io_ret(103 downto 96) <= addroundkey_io_ret_3_0;
    zz_io_ret(71 downto 64) <= addroundkey_io_ret_3_1;
    zz_io_ret(39 downto 32) <= addroundkey_io_ret_3_2;
    zz_io_ret(7 downto 0) <= addroundkey_io_ret_3_3;
  end process;

  when_StateMachine_l235 <= ((not pkg_toStdLogic(fsm_stateReg = pkg_enum.sReset)) and pkg_toStdLogic(fsm_stateNext = pkg_enum.sReset));
  process(clk, reset)
  begin
    if reset = '1' then
      counter_value <= pkg_unsigned("0000");
      fsm_stateReg <= pkg_enum.BOOT;
    elsif rising_edge(clk) then
      counter_value <= counter_valueNext;
      fsm_stateReg <= fsm_stateNext;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      rounds_0_0 <= addroundkey_io_ret_0_0;
      rounds_0_1 <= addroundkey_io_ret_0_1;
      rounds_0_2 <= addroundkey_io_ret_0_2;
      rounds_0_3 <= addroundkey_io_ret_0_3;
      rounds_1_0 <= addroundkey_io_ret_1_0;
      rounds_1_1 <= addroundkey_io_ret_1_1;
      rounds_1_2 <= addroundkey_io_ret_1_2;
      rounds_1_3 <= addroundkey_io_ret_1_3;
      rounds_2_0 <= addroundkey_io_ret_2_0;
      rounds_2_1 <= addroundkey_io_ret_2_1;
      rounds_2_2 <= addroundkey_io_ret_2_2;
      rounds_2_3 <= addroundkey_io_ret_2_3;
      rounds_3_0 <= addroundkey_io_ret_3_0;
      rounds_3_1 <= addroundkey_io_ret_3_1;
      rounds_3_2 <= addroundkey_io_ret_3_2;
      rounds_3_3 <= addroundkey_io_ret_3_3;
      keys_0_0 <= keyschedule_1_io_ret_0_0;
      keys_0_1 <= keyschedule_1_io_ret_0_1;
      keys_0_2 <= keyschedule_1_io_ret_0_2;
      keys_0_3 <= keyschedule_1_io_ret_0_3;
      keys_1_0 <= keyschedule_1_io_ret_1_0;
      keys_1_1 <= keyschedule_1_io_ret_1_1;
      keys_1_2 <= keyschedule_1_io_ret_1_2;
      keys_1_3 <= keyschedule_1_io_ret_1_3;
      keys_2_0 <= keyschedule_1_io_ret_2_0;
      keys_2_1 <= keyschedule_1_io_ret_2_1;
      keys_2_2 <= keyschedule_1_io_ret_2_2;
      keys_2_3 <= keyschedule_1_io_ret_2_3;
      keys_3_0 <= keyschedule_1_io_ret_3_0;
      keys_3_1 <= keyschedule_1_io_ret_3_1;
      keys_3_2 <= keyschedule_1_io_ret_3_2;
      keys_3_3 <= keyschedule_1_io_ret_3_3;
      rcs <= nextrc_1_io_ret;
      case fsm_stateReg is
        when pkg_enum.sReset =>
          if when_AES_Round_l52 = '1' then
            rounds_0_0 <= state0_0_0;
            rounds_0_1 <= state0_0_1;
            rounds_0_2 <= state0_0_2;
            rounds_0_3 <= state0_0_3;
            rounds_1_0 <= state0_1_0;
            rounds_1_1 <= state0_1_1;
            rounds_1_2 <= state0_1_2;
            rounds_1_3 <= state0_1_3;
            rounds_2_0 <= state0_2_0;
            rounds_2_1 <= state0_2_1;
            rounds_2_2 <= state0_2_2;
            rounds_2_3 <= state0_2_3;
            rounds_3_0 <= state0_3_0;
            rounds_3_1 <= state0_3_1;
            rounds_3_2 <= state0_3_2;
            rounds_3_3 <= state0_3_3;
            rcs <= nextrc_1_io_ret;
          end if;
        when pkg_enum.sAESRound =>
        when pkg_enum.sAESFinalRound =>
        when others =>
      end case;
      if when_StateMachine_l235 = '1' then
        rcs <= pkg_stdLogicVector("00000001");
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      io_reset_regNext <= io_reset;
    end if;
  end process;

end arch;

