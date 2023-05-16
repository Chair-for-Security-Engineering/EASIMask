library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity AES_Serial_TB is
end entity AES_Serial_TB;

architecture test of AES_Serial_TB is

  component AES_Serial is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_enable : in std_logic;
      io_plaintext_valid : in std_logic;
      io_plaintext_ready : out std_logic;
      io_plaintext_payload : in std_logic_vector(7 downto 0);
      io_key_valid : in std_logic;
      io_key_ready : out std_logic;
      io_key_payload : in std_logic_vector(7 downto 0);
      io_ciphertext_valid : out std_logic;
      io_ciphertext_ready : in std_logic;
      io_ciphertext_payload : out std_logic_vector(7 downto 0);
      io_done : out std_logic
    );
  end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal reset_aes, enable_aes, plaintext_valid_aes, plaintext_ready_aes, key_valid_aes, key_ready_aes, ciphertext_valid_aes, ciphertext_ready_aes, done_aes : std_logic;
  signal plaintext_payload, key_payload, ciphertext_payload : std_logic_vector(7 downto 0);
  type T_16x8 is array (0 to 15) of std_logic_vector(7 downto 0);
  signal plaintext, key, ciphertext : T_16x8 := (others => (others => '0'));

begin

  clk <= not clk after period/2;
  plaintext <= (x"6B", x"C1", x"BE", x"E2", x"2E", x"40", x"9F", x"96", x"E9", x"3D", x"7E", x"11", x"73", x"93", x"17", x"2A");
  key <= (x"2B", x"7E", x"15", x"16", x"28", x"AE", x"D2", x"A6", x"AB", x"F7", x"15", x"88", x"09", x"CF", x"4F", x"3C");

  aes : AES_Serial
  port map(
    io_clk => clk,
    io_reset => reset_aes,
    io_enable => enable_aes,
    io_plaintext_valid => plaintext_valid_aes,
    io_plaintext_ready => plaintext_ready_aes,
    io_plaintext_payload => plaintext_payload,
    io_key_valid => key_valid_aes,
    io_key_ready => key_ready_aes,
    io_key_payload => key_payload,
    io_ciphertext_valid => ciphertext_valid_aes,
    io_ciphertext_ready => ciphertext_ready_aes,
    io_ciphertext_payload => ciphertext_payload,
    io_done => done_aes
  );

  testing : process is
  begin
    reset_aes <= '1';
    enable_aes <= '0';
    plaintext_valid_aes <= '0';
    key_valid_aes <= '0';
    ciphertext_ready_aes <= '1';
    wait for 10*period;

    reset_aes <= '0';
    enable_aes <= '1';

    wait until (plaintext_ready_aes = '1' and key_ready_aes = '1');
    plaintext_valid_aes <= '1';
    key_valid_aes <= '1';
    write_pt : for i in 0 to 15 loop
      plaintext_payload <= plaintext(i);
      key_payload <= key(i);
      wait for period;
    end loop ; -- write_pt

    --wait for 300*period;
    wait until (ciphertext_valid_aes = '1');
    write_ct : for i in 0 to 15 loop
      ciphertext(i) <= ciphertext_payload;
      wait for period;
    end loop;

  end process;

end test;