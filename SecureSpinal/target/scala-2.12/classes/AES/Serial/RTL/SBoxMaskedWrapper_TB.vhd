library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use std.env.stop;

entity SBoxMaskedWrapper_TB is
end entity SBoxMaskedWrapper_TB;

architecture test of SBoxMaskedWrapper_TB is

  component SBoxMaskedWrapper is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_resetFull : in std_logic;
      io_enable : in std_logic;
      io_dataIn : in std_logic_vector(15 downto 0);
      io_m : in std_logic_vector(27 downto 0);
      io_dataOut : out std_logic_vector(15 downto 0);
      io_done : out std_logic
    );
  end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal resetSBox, resetFullSBox, enableSBox, doneSBox : std_logic;
  signal dataInSBox, dataOutSBox : std_logic_vector(15 downto 0);
  signal mSBox : std_logic_vector(27 downto 0);
  signal challenge, response : std_logic_vector(7 downto 0);

begin

  clk <= not clk after period/2;
  challenge <= dataInSBox(15 downto 8) xor dataInSBox(7 downto 0);
  response <= dataOutSBox(15 downto 8) xor dataOutSBox(7 downto 0);
  mSBox <= (others => '1');

  sbox_dut : SBoxMaskedWrapper
  port map (
    io_clk => clk,
    io_reset => resetSBox,
    io_resetFull => resetFullSBox,
    io_enable => enableSBox,
    io_dataIn => dataInSBox,
    io_m => mSBox,
    io_dataOut => dataOutSBox,
    io_done => doneSBox
  );

  testing : process is
  begin
    resetSBox <= '1';
    enableSBox <= '0';
    wait for 10*period;

    resetSBox <= '0';
    enableSBox <= '1';
    dataInSBox <= x"00" & x"00";

    wait until (doneSBox = '1');
    wait for period;
    assert (response = x"63");

    resetSBox <= '1';
    enableSBox <= '0';

    wait for 10*period;

    resetSBox <= '0';
    enableSBox <= '1';
    dataInSBox <= x"4B" & x"C1";

    wait until (doneSBox = '1');
    wait for period;
    assert (response = x"7E");

    resetSBox <= '1';
    enableSBox <= '0';

    wait for 10*period;

    resetSBox <= '0';
    enableSBox <= '1';
    dataInSBox <= x"CC" & x"18";

    wait until (doneSBox = '1');
    wait for period;
    assert (response = x"48");

    resetSBox <= '1';
    enableSBox <= '0';

    wait for 10*period;

    stop;

  end process;
end test;