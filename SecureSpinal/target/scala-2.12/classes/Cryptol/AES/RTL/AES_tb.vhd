library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity AES_tb is
end entity AES_tb;

architecture test of AES_tb is

  component AES is
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
  end component AES;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal aes_reset, aes_enable, aes_done : std_logic;
  signal aes_pt1, aes_pt2, aes_key1, aes_key2, aes_ct1, aes_ct2 : std_logic_vector(127 downto 0);
  signal aes_m : std_logic_vector(759 downto 0);
  signal ciphertext : std_logic_vector(127 downto 0);
  signal plaintext, key : std_logic_vector(127 downto 0);

begin

  encryption : AES
  port map (
    io_clk => clk,
    io_reset => aes_reset,
    io_enable => aes_enable,
    io_pt1 => aes_pt1, 
    io_pt2 => aes_pt2,
    io_key1 => aes_key1,
    io_key2 => aes_key2,
    io_m => aes_m,
    io_ct1 => aes_ct1,
    io_ct2 => aes_ct2,
    io_done => aes_done
  );

  clk <= not clk after period/2;
  ciphertext <= aes_ct1 xor aes_ct2;
  plaintext <= x"6BC1BEE22E409F96E93D7E117393172A";
  key <= x"2B7E151628AED2A6ABF7158809CF4F3C";

  test : process is
  begin
    aes_reset <= '1';
    wait for 10*period;
    aes_reset <= '0';
    aes_enable <= '1';
    aes_pt2 <= b"11011101111111001001111110111110010110100010011001110010101110001100011101010011100011110110101111111101010010010100000100100101";
    aes_pt1 <= x"6BC1BEE22E409F96E93D7E117393172A" xor b"11011101111111001001111110111110010110100010011001110010101110001100011101010011100011110110101111111101010010010100000100100101";
    --aes_pt1 <= x"6BC1BEE22E409F96E93D7E117393172A";
    --aes_pt2 <= (others => '0');
    aes_key1 <= b"00100100010100010110001101111101010011101110001111000011101111110010100101100000110001110001001111010100101101101101111101100000";
    aes_key2 <= x"2B7E151628AED2A6ABF7158809CF4F3C" xor b"00100100010100010110001101111101010011101110001111000011101111110010100101100000110001110001001111010100101101101101111101100000";
    --aes_key1 <= x"2B7E151628AED2A6ABF7158809CF4F3C";
    --aes_key2 <= (others => '0');
    aes_m <= b"1100111111100110010000100000101111011001011110111100110010111010110110000010101001111000011001001100101010000110001010011011101000000101000010000111111111011011101001110010110001001000110001001010110011101000100000000111101101000110111111100110011111010101111101000011100000000000100110111001010110110101000011001010001111001111111110010010110011110011011101100001000100001001010000100111011100110011001001000011100001100101001000000100100111110111101011101000111111110111110001111111011111010111101000110011011000011111111001110101001001100110111101111010011101101001011001100100000010011000010000110110110100100111101101110010101111110001000000001011000111000000010001001001001100001011010010000011001100001101110101111110101011011100110110110100110111001011";
    wait until aes_done = '1';
    wait for period;

  end process;
00000000000000000000000000000000
end architecture test;