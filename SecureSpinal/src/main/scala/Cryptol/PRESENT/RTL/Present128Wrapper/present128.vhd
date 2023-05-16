-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : present128_wrapper
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity present128 is
  port(
    io_enable : in std_logic;
    io_plaintext1 : in std_logic_vector(63 downto 0);
    io_plaintext2 : in std_logic_vector(63 downto 0);
    io_plaintext3 : in std_logic_vector(63 downto 0);
    io_key1 : in std_logic_vector(127 downto 0);
    io_key2 : in std_logic_vector(127 downto 0);
    io_key3 : in std_logic_vector(127 downto 0);
    io_ciphertext1 : out std_logic_vector(63 downto 0);
    io_ciphertext2 : out std_logic_vector(63 downto 0);
    io_ciphertext3 : out std_logic_vector(63 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end present128;

architecture arch of present128 is
  signal updatekeyshared_io_round : std_logic_vector(4 downto 0);
  signal addroundkey1_io_stateOut : std_logic_vector(63 downto 0);
  signal addroundkey2_io_stateOut : std_logic_vector(63 downto 0);
  signal addroundkey3_io_stateOut : std_logic_vector(63 downto 0);
  signal updatekeyshared_io_keyOut1 : std_logic_vector(127 downto 0);
  signal updatekeyshared_io_keyOut2 : std_logic_vector(127 downto 0);
  signal updatekeyshared_io_keyOut3 : std_logic_vector(127 downto 0);
  signal sboxlayershared_1_io_stateOut1 : std_logic_vector(63 downto 0);
  signal sboxlayershared_1_io_stateOut2 : std_logic_vector(63 downto 0);
  signal sboxlayershared_1_io_stateOut3 : std_logic_vector(63 downto 0);
  signal permutation1_io_stateOut : std_logic_vector(63 downto 0);
  signal permutation2_io_stateOut : std_logic_vector(63 downto 0);
  signal permutation3_io_stateOut : std_logic_vector(63 downto 0);

  signal state1 : std_logic_vector(63 downto 0);
  signal state2 : std_logic_vector(63 downto 0);
  signal state3 : std_logic_vector(63 downto 0);
  signal keyReg1 : std_logic_vector(127 downto 0);
  signal keyReg2 : std_logic_vector(127 downto 0);
  signal keyReg3 : std_logic_vector(127 downto 0);
  signal roundKey1 : std_logic_vector(63 downto 0);
  signal roundKey2 : std_logic_vector(63 downto 0);
  signal roundKey3 : std_logic_vector(63 downto 0);
  signal ctr_willIncrement : std_logic;
  signal ctr_willClear : std_logic;
  signal ctr_valueNext : unsigned(4 downto 0);
  signal ctr_value : unsigned(4 downto 0);
  signal ctr_willOverflowIfInc : std_logic;
  signal ctr_willOverflow : std_logic;
  signal smallCtr_willIncrement : std_logic;
  signal smallCtr_willClear : std_logic;
  signal smallCtr_valueNext : unsigned(0 downto 0);
  signal smallCtr_value : unsigned(0 downto 0);
  signal smallCtr_willOverflowIfInc : std_logic;
  signal smallCtr_willOverflow : std_logic;
  signal presentState : States_1;
begin
  addroundkey1 : entity work.addRoundKey
    port map ( 
      io_stateIn => state1,
      io_key => roundKey1,
      io_stateOut => addroundkey1_io_stateOut 
    );
  addroundkey2 : entity work.addRoundKey
    port map ( 
      io_stateIn => state2,
      io_key => roundKey2,
      io_stateOut => addroundkey2_io_stateOut 
    );
  addroundkey3 : entity work.addRoundKey
    port map ( 
      io_stateIn => state3,
      io_key => roundKey3,
      io_stateOut => addroundkey3_io_stateOut 
    );
  updatekeyshared : entity work.updateKey128Shared
    port map ( 
      io_keyIn1 => keyReg1,
      io_keyIn2 => keyReg2,
      io_keyIn3 => keyReg3,
      io_round => updatekeyshared_io_round,
      io_keyOut1 => updatekeyshared_io_keyOut1,
      io_keyOut2 => updatekeyshared_io_keyOut2,
      io_keyOut3 => updatekeyshared_io_keyOut3,
      clk => clk,
      reset => reset 
    );
  sboxlayershared_1 : entity work.sboxLayerShared
    port map ( 
      io_stateIn1 => addroundkey1_io_stateOut,
      io_stateIn2 => addroundkey2_io_stateOut,
      io_stateIn3 => addroundkey3_io_stateOut,
      io_stateOut1 => sboxlayershared_1_io_stateOut1,
      io_stateOut2 => sboxlayershared_1_io_stateOut2,
      io_stateOut3 => sboxlayershared_1_io_stateOut3,
      clk => clk,
      reset => reset 
    );
  permutation1 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayershared_1_io_stateOut1,
      io_stateOut => permutation1_io_stateOut 
    );
  permutation2 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayershared_1_io_stateOut2,
      io_stateOut => permutation2_io_stateOut 
    );
  permutation3 : entity work.permutation
    port map ( 
      io_stateIn => sboxlayershared_1_io_stateOut3,
      io_stateOut => permutation3_io_stateOut 
    );
  process(presentState,addroundkey1_io_stateOut)
  begin
    io_ciphertext1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_ciphertext1 <= addroundkey1_io_stateOut;
    end case;
  end process;

  process(presentState,addroundkey2_io_stateOut)
  begin
    io_ciphertext2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_ciphertext2 <= addroundkey2_io_stateOut;
    end case;
  end process;

  process(presentState,addroundkey3_io_stateOut)
  begin
    io_ciphertext3 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_ciphertext3 <= addroundkey3_io_stateOut;
    end case;
  end process;

  process(presentState)
  begin
    io_done <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  process(presentState,smallCtr_willOverflow)
  begin
    ctr_willIncrement <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        if smallCtr_willOverflow = '1' then
          ctr_willIncrement <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(presentState)
  begin
    ctr_willClear <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
        ctr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
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

  process(presentState)
  begin
    smallCtr_willIncrement <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
      when pkg_enum.sExecute =>
        smallCtr_willIncrement <= pkg_toStdLogic(true);
      when others =>
    end case;
  end process;

  process(presentState)
  begin
    smallCtr_willClear <= pkg_toStdLogic(false);
    case presentState is
      when pkg_enum.sIdle =>
        smallCtr_willClear <= pkg_toStdLogic(true);
      when pkg_enum.sExecute =>
      when others =>
    end case;
  end process;

  smallCtr_willOverflowIfInc <= pkg_toStdLogic(smallCtr_value = pkg_unsigned("1"));
  smallCtr_willOverflow <= (smallCtr_willOverflowIfInc and smallCtr_willIncrement);
  process(smallCtr_value,smallCtr_willIncrement,smallCtr_willClear)
  begin
    smallCtr_valueNext <= (smallCtr_value + unsigned(pkg_toStdLogicVector(smallCtr_willIncrement)));
    if smallCtr_willClear = '1' then
      smallCtr_valueNext <= pkg_unsigned("0");
    end if;
  end process;

  roundKey1 <= pkg_extract(keyReg1,127,64);
  roundKey2 <= pkg_extract(keyReg2,127,64);
  roundKey3 <= pkg_extract(keyReg3,127,64);
  updatekeyshared_io_round <= std_logic_vector(ctr_value);
  process(clk, reset)
  begin
    if reset = '1' then
      state1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      state2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      state3 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      keyReg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyReg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyReg3 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      ctr_value <= pkg_unsigned("00001");
      smallCtr_value <= pkg_unsigned("0");
      presentState <= pkg_enum.sIdle;
    elsif rising_edge(clk) then
      ctr_value <= ctr_valueNext;
      smallCtr_value <= smallCtr_valueNext;
      keyReg1 <= updatekeyshared_io_keyOut1;
      keyReg2 <= updatekeyshared_io_keyOut2;
      keyReg3 <= updatekeyshared_io_keyOut3;
      state1 <= permutation1_io_stateOut;
      state2 <= permutation2_io_stateOut;
      state3 <= permutation3_io_stateOut;
      case presentState is
        when pkg_enum.sIdle =>
          presentState <= pkg_enum.sIdle;
          if io_enable = '1' then
            presentState <= pkg_enum.sExecute;
            state1 <= io_plaintext1;
            state2 <= io_plaintext2;
            state3 <= io_plaintext3;
            keyReg1 <= io_key1;
            keyReg2 <= io_key2;
            keyReg3 <= io_key3;
          end if;
        when pkg_enum.sExecute =>
          presentState <= pkg_enum.sExecute;
          if ctr_willOverflow = '1' then
            presentState <= pkg_enum.sDone;
          end if;
        when others =>
      end case;
    end if;
  end process;

end arch;

