-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : presentEncrypt
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type fsm_enumDef is (BOOT,sIdle,sExecute,sDone);

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
      when "01" => return sIdle;
      when "10" => return sExecute;
      when "11" => return sDone;
      when others => return BOOT;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector is
  begin
    case value is
      when BOOT => return "00";
      when sIdle => return "01";
      when sExecute => return "10";
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
    io_input : in unsigned(3 downto 0);
    io_output : out unsigned(3 downto 0)
  );
end SBox;

architecture arch of SBox is

begin
  process(io_input)
  begin
    case io_input is
      when "0000" =>
        io_output <= pkg_unsigned("1100");
      when "0001" =>
        io_output <= pkg_unsigned("0101");
      when "0010" =>
        io_output <= pkg_unsigned("0110");
      when "0011" =>
        io_output <= pkg_unsigned("1011");
      when "0100" =>
        io_output <= pkg_unsigned("1001");
      when "0101" =>
        io_output <= pkg_unsigned("0000");
      when "0110" =>
        io_output <= pkg_unsigned("1010");
      when "0111" =>
        io_output <= pkg_unsigned("1101");
      when "1000" =>
        io_output <= pkg_unsigned("0011");
      when "1001" =>
        io_output <= pkg_unsigned("1110");
      when "1010" =>
        io_output <= pkg_unsigned("1111");
      when "1011" =>
        io_output <= pkg_unsigned("1000");
      when "1100" =>
        io_output <= pkg_unsigned("0100");
      when "1101" =>
        io_output <= pkg_unsigned("0111");
      when "1110" =>
        io_output <= pkg_unsigned("0001");
      when others =>
        io_output <= pkg_unsigned("0010");
    end case;
  end process;

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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity addRoundKey is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_key : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end addRoundKey;

architecture arch of addRoundKey is

begin
  io_stateOut <= (io_stateIn xor io_key);
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity updateKey is
  port(
    io_keyIn : in std_logic_vector(79 downto 0);
    io_round : in unsigned(4 downto 0);
    io_keyOut : out std_logic_vector(79 downto 0)
  );
end updateKey;

architecture arch of updateKey is
  signal sbox_17_io_input : unsigned(3 downto 0);
  signal sbox_17_io_output : unsigned(3 downto 0);

  signal k1 : std_logic_vector(79 downto 0);
  signal k2 : std_logic_vector(79 downto 0);
  signal k3 : std_logic_vector(79 downto 0);
begin
  sbox_17 : entity work.SBox
    port map ( 
      io_input => sbox_17_io_input,
      io_output => sbox_17_io_output 
    );
  sbox_17_io_input <= unsigned(pkg_extract(k1,79,76));
  k1 <= pkg_cat(pkg_extract(io_keyIn,18,0),pkg_extract(io_keyIn,79,19));
  k2 <= pkg_cat(std_logic_vector(sbox_17_io_output),pkg_extract(k1,75,0));
  k3 <= pkg_cat(pkg_cat(pkg_extract(k2,79,20),(pkg_extract(k2,19,15) xor std_logic_vector(io_round))),pkg_extract(k2,14,0));
  io_keyOut <= k3;
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity sboxLayer is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end sboxLayer;

architecture arch of sboxLayer is
  signal sBox_17_io_input : unsigned(3 downto 0);
  signal sBox_18_io_input : unsigned(3 downto 0);
  signal sBox_19_io_input : unsigned(3 downto 0);
  signal sBox_20_io_input : unsigned(3 downto 0);
  signal sBox_21_io_input : unsigned(3 downto 0);
  signal sBox_22_io_input : unsigned(3 downto 0);
  signal sBox_23_io_input : unsigned(3 downto 0);
  signal sBox_24_io_input : unsigned(3 downto 0);
  signal sBox_25_io_input : unsigned(3 downto 0);
  signal sBox_26_io_input : unsigned(3 downto 0);
  signal sBox_27_io_input : unsigned(3 downto 0);
  signal sBox_28_io_input : unsigned(3 downto 0);
  signal sBox_29_io_input : unsigned(3 downto 0);
  signal sBox_30_io_input : unsigned(3 downto 0);
  signal sBox_31_io_input : unsigned(3 downto 0);
  signal sBox_32_io_input : unsigned(3 downto 0);
  signal sBox_17_io_output : unsigned(3 downto 0);
  signal sBox_18_io_output : unsigned(3 downto 0);
  signal sBox_19_io_output : unsigned(3 downto 0);
  signal sBox_20_io_output : unsigned(3 downto 0);
  signal sBox_21_io_output : unsigned(3 downto 0);
  signal sBox_22_io_output : unsigned(3 downto 0);
  signal sBox_23_io_output : unsigned(3 downto 0);
  signal sBox_24_io_output : unsigned(3 downto 0);
  signal sBox_25_io_output : unsigned(3 downto 0);
  signal sBox_26_io_output : unsigned(3 downto 0);
  signal sBox_27_io_output : unsigned(3 downto 0);
  signal sBox_28_io_output : unsigned(3 downto 0);
  signal sBox_29_io_output : unsigned(3 downto 0);
  signal sBox_30_io_output : unsigned(3 downto 0);
  signal sBox_31_io_output : unsigned(3 downto 0);
  signal sBox_32_io_output : unsigned(3 downto 0);

begin
  sBox_17 : entity work.SBox
    port map ( 
      io_input => sBox_17_io_input,
      io_output => sBox_17_io_output 
    );
  sBox_18 : entity work.SBox
    port map ( 
      io_input => sBox_18_io_input,
      io_output => sBox_18_io_output 
    );
  sBox_19 : entity work.SBox
    port map ( 
      io_input => sBox_19_io_input,
      io_output => sBox_19_io_output 
    );
  sBox_20 : entity work.SBox
    port map ( 
      io_input => sBox_20_io_input,
      io_output => sBox_20_io_output 
    );
  sBox_21 : entity work.SBox
    port map ( 
      io_input => sBox_21_io_input,
      io_output => sBox_21_io_output 
    );
  sBox_22 : entity work.SBox
    port map ( 
      io_input => sBox_22_io_input,
      io_output => sBox_22_io_output 
    );
  sBox_23 : entity work.SBox
    port map ( 
      io_input => sBox_23_io_input,
      io_output => sBox_23_io_output 
    );
  sBox_24 : entity work.SBox
    port map ( 
      io_input => sBox_24_io_input,
      io_output => sBox_24_io_output 
    );
  sBox_25 : entity work.SBox
    port map ( 
      io_input => sBox_25_io_input,
      io_output => sBox_25_io_output 
    );
  sBox_26 : entity work.SBox
    port map ( 
      io_input => sBox_26_io_input,
      io_output => sBox_26_io_output 
    );
  sBox_27 : entity work.SBox
    port map ( 
      io_input => sBox_27_io_input,
      io_output => sBox_27_io_output 
    );
  sBox_28 : entity work.SBox
    port map ( 
      io_input => sBox_28_io_input,
      io_output => sBox_28_io_output 
    );
  sBox_29 : entity work.SBox
    port map ( 
      io_input => sBox_29_io_input,
      io_output => sBox_29_io_output 
    );
  sBox_30 : entity work.SBox
    port map ( 
      io_input => sBox_30_io_input,
      io_output => sBox_30_io_output 
    );
  sBox_31 : entity work.SBox
    port map ( 
      io_input => sBox_31_io_input,
      io_output => sBox_31_io_output 
    );
  sBox_32 : entity work.SBox
    port map ( 
      io_input => sBox_32_io_input,
      io_output => sBox_32_io_output 
    );
  sBox_17_io_input <= unsigned(pkg_extract(io_stateIn,3,0));
  process(sBox_17_io_output,sBox_18_io_output,sBox_19_io_output,sBox_20_io_output,sBox_21_io_output,sBox_22_io_output,sBox_23_io_output,sBox_24_io_output,sBox_25_io_output,sBox_26_io_output,sBox_27_io_output,sBox_28_io_output,sBox_29_io_output,sBox_30_io_output,sBox_31_io_output,sBox_32_io_output)
  begin
    io_stateOut(3 downto 0) <= std_logic_vector(sBox_17_io_output);
    io_stateOut(7 downto 4) <= std_logic_vector(sBox_18_io_output);
    io_stateOut(11 downto 8) <= std_logic_vector(sBox_19_io_output);
    io_stateOut(15 downto 12) <= std_logic_vector(sBox_20_io_output);
    io_stateOut(19 downto 16) <= std_logic_vector(sBox_21_io_output);
    io_stateOut(23 downto 20) <= std_logic_vector(sBox_22_io_output);
    io_stateOut(27 downto 24) <= std_logic_vector(sBox_23_io_output);
    io_stateOut(31 downto 28) <= std_logic_vector(sBox_24_io_output);
    io_stateOut(35 downto 32) <= std_logic_vector(sBox_25_io_output);
    io_stateOut(39 downto 36) <= std_logic_vector(sBox_26_io_output);
    io_stateOut(43 downto 40) <= std_logic_vector(sBox_27_io_output);
    io_stateOut(47 downto 44) <= std_logic_vector(sBox_28_io_output);
    io_stateOut(51 downto 48) <= std_logic_vector(sBox_29_io_output);
    io_stateOut(55 downto 52) <= std_logic_vector(sBox_30_io_output);
    io_stateOut(59 downto 56) <= std_logic_vector(sBox_31_io_output);
    io_stateOut(63 downto 60) <= std_logic_vector(sBox_32_io_output);
  end process;

  sBox_18_io_input <= unsigned(pkg_extract(io_stateIn,7,4));
  sBox_19_io_input <= unsigned(pkg_extract(io_stateIn,11,8));
  sBox_20_io_input <= unsigned(pkg_extract(io_stateIn,15,12));
  sBox_21_io_input <= unsigned(pkg_extract(io_stateIn,19,16));
  sBox_22_io_input <= unsigned(pkg_extract(io_stateIn,23,20));
  sBox_23_io_input <= unsigned(pkg_extract(io_stateIn,27,24));
  sBox_24_io_input <= unsigned(pkg_extract(io_stateIn,31,28));
  sBox_25_io_input <= unsigned(pkg_extract(io_stateIn,35,32));
  sBox_26_io_input <= unsigned(pkg_extract(io_stateIn,39,36));
  sBox_27_io_input <= unsigned(pkg_extract(io_stateIn,43,40));
  sBox_28_io_input <= unsigned(pkg_extract(io_stateIn,47,44));
  sBox_29_io_input <= unsigned(pkg_extract(io_stateIn,51,48));
  sBox_30_io_input <= unsigned(pkg_extract(io_stateIn,55,52));
  sBox_31_io_input <= unsigned(pkg_extract(io_stateIn,59,56));
  sBox_32_io_input <= unsigned(pkg_extract(io_stateIn,63,60));
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity permutation is
  port(
    io_stateIn : in std_logic_vector(63 downto 0);
    io_stateOut : out std_logic_vector(63 downto 0)
  );
end permutation;

architecture arch of permutation is

begin
  process(io_stateIn)
  begin
    io_stateOut(0) <= pkg_extract(io_stateIn,0);
    io_stateOut(16) <= pkg_extract(io_stateIn,1);
    io_stateOut(32) <= pkg_extract(io_stateIn,2);
    io_stateOut(48) <= pkg_extract(io_stateIn,3);
    io_stateOut(1) <= pkg_extract(io_stateIn,4);
    io_stateOut(17) <= pkg_extract(io_stateIn,5);
    io_stateOut(33) <= pkg_extract(io_stateIn,6);
    io_stateOut(49) <= pkg_extract(io_stateIn,7);
    io_stateOut(2) <= pkg_extract(io_stateIn,8);
    io_stateOut(18) <= pkg_extract(io_stateIn,9);
    io_stateOut(34) <= pkg_extract(io_stateIn,10);
    io_stateOut(50) <= pkg_extract(io_stateIn,11);
    io_stateOut(3) <= pkg_extract(io_stateIn,12);
    io_stateOut(19) <= pkg_extract(io_stateIn,13);
    io_stateOut(35) <= pkg_extract(io_stateIn,14);
    io_stateOut(51) <= pkg_extract(io_stateIn,15);
    io_stateOut(4) <= pkg_extract(io_stateIn,16);
    io_stateOut(20) <= pkg_extract(io_stateIn,17);
    io_stateOut(36) <= pkg_extract(io_stateIn,18);
    io_stateOut(52) <= pkg_extract(io_stateIn,19);
    io_stateOut(5) <= pkg_extract(io_stateIn,20);
    io_stateOut(21) <= pkg_extract(io_stateIn,21);
    io_stateOut(37) <= pkg_extract(io_stateIn,22);
    io_stateOut(53) <= pkg_extract(io_stateIn,23);
    io_stateOut(6) <= pkg_extract(io_stateIn,24);
    io_stateOut(22) <= pkg_extract(io_stateIn,25);
    io_stateOut(38) <= pkg_extract(io_stateIn,26);
    io_stateOut(54) <= pkg_extract(io_stateIn,27);
    io_stateOut(7) <= pkg_extract(io_stateIn,28);
    io_stateOut(23) <= pkg_extract(io_stateIn,29);
    io_stateOut(39) <= pkg_extract(io_stateIn,30);
    io_stateOut(55) <= pkg_extract(io_stateIn,31);
    io_stateOut(8) <= pkg_extract(io_stateIn,32);
    io_stateOut(24) <= pkg_extract(io_stateIn,33);
    io_stateOut(40) <= pkg_extract(io_stateIn,34);
    io_stateOut(56) <= pkg_extract(io_stateIn,35);
    io_stateOut(9) <= pkg_extract(io_stateIn,36);
    io_stateOut(25) <= pkg_extract(io_stateIn,37);
    io_stateOut(41) <= pkg_extract(io_stateIn,38);
    io_stateOut(57) <= pkg_extract(io_stateIn,39);
    io_stateOut(10) <= pkg_extract(io_stateIn,40);
    io_stateOut(26) <= pkg_extract(io_stateIn,41);
    io_stateOut(42) <= pkg_extract(io_stateIn,42);
    io_stateOut(58) <= pkg_extract(io_stateIn,43);
    io_stateOut(11) <= pkg_extract(io_stateIn,44);
    io_stateOut(27) <= pkg_extract(io_stateIn,45);
    io_stateOut(43) <= pkg_extract(io_stateIn,46);
    io_stateOut(59) <= pkg_extract(io_stateIn,47);
    io_stateOut(12) <= pkg_extract(io_stateIn,48);
    io_stateOut(28) <= pkg_extract(io_stateIn,49);
    io_stateOut(44) <= pkg_extract(io_stateIn,50);
    io_stateOut(60) <= pkg_extract(io_stateIn,51);
    io_stateOut(13) <= pkg_extract(io_stateIn,52);
    io_stateOut(29) <= pkg_extract(io_stateIn,53);
    io_stateOut(45) <= pkg_extract(io_stateIn,54);
    io_stateOut(61) <= pkg_extract(io_stateIn,55);
    io_stateOut(14) <= pkg_extract(io_stateIn,56);
    io_stateOut(30) <= pkg_extract(io_stateIn,57);
    io_stateOut(46) <= pkg_extract(io_stateIn,58);
    io_stateOut(62) <= pkg_extract(io_stateIn,59);
    io_stateOut(15) <= pkg_extract(io_stateIn,60);
    io_stateOut(31) <= pkg_extract(io_stateIn,61);
    io_stateOut(47) <= pkg_extract(io_stateIn,62);
    io_stateOut(63) <= pkg_extract(io_stateIn,63);
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity presentEncrypt is
  port(
    io_enable : in std_logic;
    io_plaintext : in std_logic_vector(63 downto 0);
    io_key : in std_logic_vector(79 downto 0);
    io_ciphertext : out std_logic_vector(63 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end presentEncrypt;

architecture arch of presentEncrypt is
  signal addroundkey_1_io_stateOut : std_logic_vector(63 downto 0);
  signal updatekey_1_io_keyOut : std_logic_vector(79 downto 0);
  signal sboxlayer_1_io_stateOut : std_logic_vector(63 downto 0);
  signal permutation_1_io_stateOut : std_logic_vector(63 downto 0);

  signal state : std_logic_vector(63 downto 0);
  signal keyReg : std_logic_vector(79 downto 0);
  signal roundKey : std_logic_vector(63 downto 0);
  signal ctr_willIncrement : std_logic;
  signal ctr_willClear : std_logic;
  signal ctr_valueNext : unsigned(4 downto 0);
  signal ctr_value : unsigned(4 downto 0);
  signal ctr_willOverflowIfInc : std_logic;
  signal ctr_willOverflow : std_logic;
  signal fsm_wantExit : std_logic;
  signal fsm_wantStart : std_logic;
  signal fsm_wantKill : std_logic;
  signal fsm_stateReg : fsm_enumDef;
  signal fsm_stateNext : fsm_enumDef;
  signal when_StateMachine_l219 : std_logic;
begin
  addroundkey_1 : entity work.addRoundKey
    port map ( 
      io_stateIn => state,
      io_key => roundKey,
      io_stateOut => addroundkey_1_io_stateOut 
    );
  updatekey_1 : entity work.updateKey
    port map ( 
      io_keyIn => keyReg,
      io_round => ctr_value,
      io_keyOut => updatekey_1_io_keyOut 
    );
  sboxlayer_1 : entity work.sboxLayer
    port map ( 
      io_stateIn => addroundkey_1_io_stateOut,
      io_stateOut => sboxlayer_1_io_stateOut 
    );
  permutation_1 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayer_1_io_stateOut,
      io_stateOut => permutation_1_io_stateOut 
    );
  process(fsm_stateReg,addroundkey_1_io_stateOut)
  begin
    io_ciphertext <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case fsm_stateReg is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when pkg_enum.sDone =>
        io_ciphertext <= addroundkey_1_io_stateOut;
      when others =>
    end case;
  end process;

  process(fsm_stateReg)
  begin
    io_done <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when pkg_enum.sDone =>
        io_done <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(fsm_stateReg)
  begin
    ctr_willIncrement <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        ctr_willIncrement <= pkg_toStdLogic(true);
      when pkg_enum.sDone =>
      when others =>
    end case;
  end process;

  process(fsm_stateReg)
  begin
    ctr_willClear <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sIdle =>
        ctr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when pkg_enum.sDone =>
      when others =>
    end case;
  end process;

  ctr_willOverflowIfInc <= pkg_toStdLogic(ctr_value = pkg_unsigned("11111"));
  ctr_willOverflow <= (ctr_willOverflowIfInc and ctr_willIncrement);
  process(ctr_willOverflow,ctr_value,ctr_willIncrement,ctr_willClear)
  begin
    if ctr_willOverflow = '1' then
      ctr_valueNext <= pkg_unsigned("00001");
    else
      ctr_valueNext <= (ctr_value + pkg_resize(unsigned(pkg_toStdLogicVector(ctr_willIncrement)),5));
    end if;
    if ctr_willClear = '1' then
      ctr_valueNext <= pkg_unsigned("00001");
    end if;
  end process;

  roundKey <= pkg_extract(keyReg,79,16);
  fsm_wantExit <= pkg_toStdLogic(false);
  process(fsm_stateReg)
  begin
    fsm_wantStart <= pkg_toStdLogic(false);
    case fsm_stateReg is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when pkg_enum.sDone =>
      when others =>
        fsm_wantStart <= pkg_toStdLogic(true);
    end case;
  end process;

  fsm_wantKill <= pkg_toStdLogic(false);
  process(fsm_stateReg,io_enable,ctr_willOverflow,fsm_wantStart,fsm_wantKill)
  begin
    fsm_stateNext <= fsm_stateReg;
    case fsm_stateReg is
      when pkg_enum.sIdle =>
        if io_enable = '1' then
          fsm_stateNext <= pkg_enum.sExecute;
        end if;
      when pkg_enum.sExecute =>
        if ctr_willOverflow = '1' then
          fsm_stateNext <= pkg_enum.sDone;
        end if;
      when pkg_enum.sDone =>
      when others =>
    end case;
    if fsm_wantStart = '1' then
      fsm_stateNext <= pkg_enum.sIdle;
    end if;
    if fsm_wantKill = '1' then
      fsm_stateNext <= pkg_enum.BOOT;
    end if;
  end process;

  when_StateMachine_l219 <= (pkg_toStdLogic(fsm_stateReg = pkg_enum.sIdle) and (not pkg_toStdLogic(fsm_stateNext = pkg_enum.sIdle)));
  process(clk, reset)
  begin
    if reset = '1' then
      state <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      keyReg <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ctr_value <= pkg_unsigned("00001");
      fsm_stateReg <= pkg_enum.BOOT;
    elsif rising_edge(clk) then
      ctr_value <= ctr_valueNext;
      keyReg <= updatekey_1_io_keyOut;
      state <= permutation_1_io_stateOut;
      fsm_stateReg <= fsm_stateNext;
      if when_StateMachine_l219 = '1' then
        state <= io_plaintext;
        keyReg <= io_key;
      end if;
    end if;
  end process;

end arch;

