library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity ChaCha20_TB is
end entity ChaCha20_TB;

architecture test of ChaCha20_TB is

  component ChaCha20 is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_enable : in std_logic;
      io_plaintext : in std_logic_vector(255 downto 0);
      io_key : in std_logic_vector(255 downto 0);
      io_ctr : in std_logic_vector(31 downto 0);
      io_nonce : in std_logic_vector(95 downto 0);
      io_ciphertext : out std_logic_vector(255 downto 0);
      io_done : out std_logic
    );
    end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal cha_reset, cha_enable, cha_done : std_logic;
  signal cha_pt, cha_key, cha_ct : std_logic_vector(255 downto 0);
  signal cha_ctr : std_logic_vector(31 downto 0);
  signal cha_nonce : std_logic_vector(95 downto 0);

begin

  encryption : ChaCha20
  port map (
    io_clk => clk,
    io_reset => cha_reset,
    io_enable => cha_enable,
    io_plaintext => cha_pt,
    io_key => cha_key,
    io_ctr => cha_ctr,
    io_nonce => cha_nonce,
    io_ciphertext => cha_ct,
    io_done => cha_done
  );

  clk <= not clk after period/2;

  test : process is
  begin
    cha_reset <= '1';
    wait for 10*period;
    cha_reset <= '0';
    cha_enable <= '1';
    
    cha_pt <= (others => '0');
    cha_pt <= x"4c616469657320616e642047656e746c656d656e206f662074686520636c6173";
    cha_key <= x"000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f";
    cha_ctr <= x"00000001";
    cha_nonce <= x"000000090000004A00000000";
    
    wait until cha_done = '1';
    wait for period;

  end process;

end architecture test;