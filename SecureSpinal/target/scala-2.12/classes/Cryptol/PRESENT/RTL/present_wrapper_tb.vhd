library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity present_wrapper_tb is
end present_wrapper_tb;

architecture test of present_wrapper_tb is

  component present_wrapper is
    port (
      io_resetFull : in std_logic;
      io_enable : in std_logic;
      io_dataIn : in std_logic_vector(191 downto 0);
      io_key : in std_logic_vector(239 downto 0);
      io_dataOut : out std_logic_vector(191 downto 0);
      io_done : out std_logic;
      clk : in std_logic;
      reset : in std_logic
    );
  end component;

  constant period : time := 10 ns;

  signal clk : std_logic := '0';
  signal present_wrapper_reset, present_wrapper_resetFull, present_wrapper_enable, present_wrapper_done : std_logic;
  signal present_wrapper_dataIn0, present_wrapper_dataIn1, present_wrapper_dataIn2, present_wrapper_dataOut0, present_wrapper_dataOut1, present_wrapper_dataOut2 : std_logic_vector(63 downto 0);
  signal present_wrapper_key0, present_wrapper_key1, present_wrapper_key2 : std_logic_vector(79 downto 0);
  signal plaintext, ciphertext : std_logic_vector(63 downto 0);
  signal key : std_logic_vector(79 downto 0);
  signal present_wrapper_dataOut : std_logic_vector(191 downto 0);

begin

  clk <= not clk after period/2;
  plaintext <= present_wrapper_dataIn0 xor present_wrapper_dataIn1 xor present_wrapper_dataIn2;
  key <= present_wrapper_key0 xor present_wrapper_key1 xor present_wrapper_key2;
  ciphertext <= present_wrapper_dataOut(191 downto 128) xor present_wrapper_dataOut(127 downto 64) xor present_wrapper_dataOut(63 downto 0); --present_wrapper_dataOut0 xor present_wrapper_dataOut1 xor present_wrapper_dataOut2;

  dut : present_wrapper
  port map (
    clk => clk,
    reset => present_wrapper_reset,
    io_resetFull => present_wrapper_resetFull,
    io_enable => present_wrapper_enable,
    --io_dataIn_0 => present_wrapper_dataIn0,
    --io_dataIn_1 => present_wrapper_dataIn1,
    --io_dataIn_2 => present_wrapper_dataIn2,
    io_dataIn => present_wrapper_dataIn0 & present_wrapper_dataIn1 & present_wrapper_dataIn2,
    --io_key_0 => present_wrapper_key0,
    --io_key_1 => present_wrapper_key1,
    --io_key_2 => present_wrapper_key2,
    io_key => present_wrapper_key0 & present_wrapper_key1 & present_wrapper_key2,
    -- io_dataOut_0 => present_wrapper_dataOut0,
    -- io_dataOut_1 => present_wrapper_dataOut1,
    -- io_dataOut_2 => present_wrapper_dataOut2,
    io_dataOut => present_wrapper_dataOut,
    io_done => present_wrapper_done
  );

  tb : process is
  begin
    report "Testing present_wrapper";
    present_wrapper_resetFull <= '1';
    present_wrapper_reset <= '1';
    present_wrapper_enable <= '0';
    wait for period;
    present_wrapper_resetFull <= '0';
    wait for 10*period;

    present_wrapper_reset <= '0';
    present_wrapper_enable <= '1';
    present_wrapper_dataIn0 <= x"0000000000000000";
    present_wrapper_dataIn1 <= x"0000000000000000";
    present_wrapper_dataIn2 <= x"0000000000000000";
    present_wrapper_key0 <= x"00000000000000000000";
    present_wrapper_key1 <= x"00000000000000000000";
    present_wrapper_key2 <= x"00000000000000000000";

    wait until present_wrapper_done = '1';
    wait for period;

    if (ciphertext = x"5579C1387B228445") then
      report "Test 1 passed!";
    end if;
    assert ciphertext = x"5579C1387B228445" report "Wrong result";

    present_wrapper_reset <= '1';
    present_wrapper_enable <= '0';
    wait for 10*period;

    present_wrapper_reset <= '0';
    present_wrapper_enable <= '1';
    present_wrapper_dataIn0 <= x"2446F7B1807292CD";
    present_wrapper_dataIn1 <= x"CAFC2E67380AFBEA";
    present_wrapper_dataIn2 <= x"EEBAD9D6B8786927";
    present_wrapper_key0 <= x"5064F730E261D729EFF4";
    present_wrapper_key1 <= x"FC0FCB331E1BDA5EDDDD";
    present_wrapper_key2 <= x"5394C3FC0385F288CDD6";

    wait until present_wrapper_done = '1';
    wait for period;

    if (ciphertext = x"E72C46C0F5945049") then
      report "Test 2 passed!";
    end if;
    assert ciphertext = x"E72C46C0F5945049" report "Wrong result";

    present_wrapper_reset <= '1';
    present_wrapper_enable <= '0';
    wait for 10*period;

    present_wrapper_reset <= '0';
    present_wrapper_enable <= '1';
    present_wrapper_dataIn0 <= x"BF71DE032D71B215";
    present_wrapper_dataIn1 <= x"6E3DA70CD789663B";
    present_wrapper_dataIn2 <= x"C3782F776A5319C1";
    present_wrapper_key0 <= x"AB3B17FCF2B56B15AFFC";
    present_wrapper_key1 <= x"6F4C36DF2E5DFAED9B20";
    present_wrapper_key2 <= x"3B88DEDC23176E07CB23";

    wait until present_wrapper_done = '1';
    wait for period;

    if (ciphertext = x"BC28817D85561BFC") then
      report "Test 3 passed!";
    end if;
    assert ciphertext = x"BC28817D85561BFC" report "Wrong result";

    assert false report "Test : OK" severity failure;

    --report "Test 1: ";



  end process;

end architecture test;