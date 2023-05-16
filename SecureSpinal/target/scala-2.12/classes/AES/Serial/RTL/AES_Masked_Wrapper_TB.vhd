library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use std.env.stop;

entity AES_Masked_Wrapper_TB is
end entity AES_Masked_Wrapper_TB;

architecture test of AES_Masked_Wrapper_TB is

  component AES_Masked_Wrapper is
    port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_resetFull : in std_logic;
    io_enable : in std_logic;
    io_dataIn : in std_logic_vector(255 downto 0);
    io_key : in std_logic_vector(255 downto 0);
    io_m : in std_logic_vector(27 downto 0);
    io_dataOut : out std_logic_vector(255 downto 0);
    io_done : out std_logic
  );
  end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal reset_aes, resetFull_aes, enable_aes, done_aes : std_logic;
  signal dataIn, key, dataOut : std_logic_vector(255 downto 0);
  signal m : std_logic_vector(27 downto 0) := (others => '1');
  signal plaintext, key_unmasked, ciphertext : std_logic_vector(127 downto 0);

begin

  clk <= not clk after period/2;
  plaintext <= dataIn(255 downto 128) xor dataIn(127 downto 0);
  key_unmasked <= key(255 downto 128) xor dataIn(127 downto 0);

  aes_dut : AES_Masked_Wrapper
  port map (
    io_clk => clk,
    io_reset => reset_aes,
    io_resetFull => resetFull_aes,
    io_enable => enable_aes,
    io_dataIn => dataIn,
    io_key => key,
    io_m => m,
    io_dataOut => dataOut,
    io_done => done_aes
  );

  testing : process is
  begin
    reset_aes <= '1';
    enable_aes <= '0';
    wait for 10*period;

    reset_aes <= '0';
    enable_aes <= '1';
    dataIn <= x"a63d21b8" & x"37dbb8cd" & x"aaac6f87" & x"8d633d23" & x"CDFC9F5A" & x"199B275B" & x"43911196" & x"FEF02A09";
    key <= x"b1fb0ef5" & x"5e6aa618" & x"fac2af34" & x"d4fdd55a" & x"9A851BE3" & x"76C474BE" & x"5135BABC" & x"DD329A66";

    wait until (done_aes = '1');
    ciphertext <= dataOut(255 downto 128) xor dataOut(127 downto 0);
    wait for 1*period;

    assert (ciphertext = x"3AD77BB40D7A3660A89ECAF32466EF97");

    reset_aes <= '1';
    enable_aes <= '0';

    wait for 10*period;

    reset_aes <= '0';
    enable_aes <= '1';
    dataIn <= x"959c7de234c870f09d5122490a75dc9a40DD68912CB4CD2DE8E56576000DAB7D";
    key <= x"05ff2310f2a7b6c21978fc0781c5adab6291E69129BD34B320407F82ED775245";

    wait until (done_aes = '1');
    ciphertext <= dataOut(255 downto 128) xor dataOut(127 downto 0);
    wait for period;

    assert (ciphertext = x"4027679f7f6323c2167f69d08a274c15");

    reset_aes <= '1';
    enable_aes <= '0';
    wait for 10*period;

    reset_aes <= '0';
    enable_aes <= '1';
    dataIn <= x"a63d21b8" & x"37dbb8cd" & x"aaac6f87" & x"8d633d23" & x"CDFC9F5A" & x"199B275B" & x"43911196" & x"FEF02A09";
    key <= x"b1fb0ef5" & x"5e6aa618" & x"fac2af34" & x"d4fdd55a" & x"9A851BE3" & x"76C474BE" & x"5135BABC" & x"DD329A66";

    wait until (done_aes = '1');
    ciphertext <= dataOut(255 downto 128) xor dataOut(127 downto 0);
    wait for 1*period;

    assert (ciphertext = x"3AD77BB40D7A3660A89ECAF32466EF97");
    wait for 10*period;
    
    stop;

  end process;

end test;