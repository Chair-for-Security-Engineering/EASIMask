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


entity present128_wrapper is
  port(
    io_resetFull : in std_logic;
    io_enable : in std_logic;
    io_dataIn : in std_logic_vector(191 downto 0);
    io_key : in std_logic_vector(383 downto 0);
    io_dataOut : out std_logic_vector(191 downto 0);
    io_done : out std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end present128_wrapper;

architecture arch of present128_wrapper is
  signal presentEncrypt_io_ciphertext1 : std_logic_vector(63 downto 0);
  signal presentEncrypt_io_ciphertext2 : std_logic_vector(63 downto 0);
  signal presentEncrypt_io_ciphertext3 : std_logic_vector(63 downto 0);
  signal presentEncrypt_io_done : std_logic;

  signal dataInReg_0 : std_logic_vector(63 downto 0);
  signal dataInReg_1 : std_logic_vector(63 downto 0);
  signal dataInReg_2 : std_logic_vector(63 downto 0);
  signal keyReg_0 : std_logic_vector(127 downto 0);
  signal keyReg_1 : std_logic_vector(127 downto 0);
  signal keyReg_2 : std_logic_vector(127 downto 0);
  signal dataOutReg_0 : std_logic_vector(63 downto 0);
  signal dataOutReg_1 : std_logic_vector(63 downto 0);
  signal dataOutReg_2 : std_logic_vector(63 downto 0);
  signal enablePresentEncrypt : std_logic;
  signal sampleInputs : std_logic;
  signal sampleOutputs : std_logic;
  signal dutState : States;
begin
  presentEncrypt : entity work.present128
    port map ( 
      io_enable => enablePresentEncrypt,
      io_plaintext1 => dataInReg_0,
      io_plaintext2 => dataInReg_1,
      io_plaintext3 => dataInReg_2,
      io_key1 => keyReg_0,
      io_key2 => keyReg_1,
      io_key3 => keyReg_2,
      io_ciphertext1 => presentEncrypt_io_ciphertext1,
      io_ciphertext2 => presentEncrypt_io_ciphertext2,
      io_ciphertext3 => presentEncrypt_io_ciphertext3,
      io_done => presentEncrypt_io_done,
      clk => clk,
      reset => reset 
    );
  sampleInputs <= pkg_toStdLogic(false);
  sampleOutputs <= pkg_toStdLogic(false);
  process(dutState)
  begin
    io_done <= pkg_toStdLogic(false);
    case dutState is
      when pkg_enum.sIdle =>
      when pkg_enum.sLoadData =>
      when pkg_enum.sExecute =>
      when others =>
        io_done <= pkg_toStdLogic(true);
    end case;
  end process;

  io_dataOut <= pkg_cat(pkg_cat(dataOutReg_0,dataOutReg_1),dataOutReg_2);
  process(clk, reset)
  begin
    if reset = '1' then
      dataInReg_0 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      dataInReg_1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      dataInReg_2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      keyReg_0 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyReg_1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      keyReg_2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      dataOutReg_0 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      dataOutReg_1 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      dataOutReg_2 <= pkg_stdLogicVector("0000000000000000000000000000000000000000000000000000000000000000");
      enablePresentEncrypt <= pkg_toStdLogic(false);
      dutState <= pkg_enum.sIdle;
    elsif rising_edge(clk) then
      enablePresentEncrypt <= pkg_toStdLogic(false);
      case dutState is
        when pkg_enum.sIdle =>
          dutState <= pkg_enum.sIdle;
          if io_enable = '1' then
            dutState <= pkg_enum.sLoadData;
          end if;
        when pkg_enum.sLoadData =>
          dataInReg_0 <= pkg_extract(io_dataIn,63,0);
          keyReg_0 <= pkg_extract(io_key,127,0);
          dataInReg_1 <= pkg_extract(io_dataIn,127,64);
          keyReg_1 <= pkg_extract(io_key,255,128);
          dataInReg_2 <= pkg_extract(io_dataIn,191,128);
          keyReg_2 <= pkg_extract(io_key,383,256);
          enablePresentEncrypt <= pkg_toStdLogic(true);
          dutState <= pkg_enum.sExecute;
        when pkg_enum.sExecute =>
          dutState <= pkg_enum.sExecute;
          if presentEncrypt_io_done = '1' then
            dataOutReg_0 <= presentEncrypt_io_ciphertext1;
            dataOutReg_1 <= presentEncrypt_io_ciphertext2;
            dataOutReg_2 <= presentEncrypt_io_ciphertext3;
            dutState <= pkg_enum.sDone;
          end if;
        when others =>
      end case;
    end if;
  end process;

end arch;

