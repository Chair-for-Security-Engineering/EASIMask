library ieee;
use ieee.STD_LOGIC_1164.all;
use std.env.stop;

entity AES_Quarterround_TB is
end entity AES_Quarterround_TB;

architecture test of AES_Quarterround_TB is

  component AES_Quarterround is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_enable : in std_logic;
      io_p : in std_logic_vector(31 downto 0);
      io_k : in std_logic_vector(31 downto 0);
      io_c : out std_logic_vector(31 downto 0);
      io_done : out std_logic
    );
  end component;

  component AES_Quarterround_Masked is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_enable : in std_logic;
      io_p1 : in std_logic_vector(31 downto 0);
      io_p2 : in std_logic_vector(31 downto 0);
      io_k1 : in std_logic_vector(31 downto 0);
      io_k2 : in std_logic_vector(31 downto 0);
      io_r : in std_logic_vector(27 downto 0);
      io_c1 : out std_logic_vector(31 downto 0);
      io_c2 : out std_logic_vector(31 downto 0);
      io_done : out std_logic
    );
  end component;

  signal clk : std_logic := '1';
  signal period : time := 10 ns;
  signal reset_aes, reset_aesM, enable_aes, enable_aesM, done_aes, done_aesM : std_logic;
  signal p, p1, p2, k, k1, k2, c, c1, c2, res, resM : std_logic_vector(31 downto 0);
  signal r : std_logic_vector(27 downto 0);

begin

  clk <= not clk after period/2;
  p <= p1 xor p2;
  k <= k1 xor k2;
  r <= (others => '1');

  aes_dut : AES_Quarterround
  port map (
    io_clk => clk,
    io_reset => reset_aes,
    io_enable => enable_aes,
    io_p => p,
    io_k => k,
    io_c => c,
    io_done => done_aes
  );

  aesM_dut : AES_Quarterround_Masked
  port map (
    io_clk => clk,
    io_reset => reset_aesM,
    io_enable => enable_aesM,
    io_p1 => p1,
    io_p2 => p2,
    io_k1 => k1,
    io_k2 => k2,
    io_r => r,
    io_c1 => c1,
    io_c2 => c2,
    io_done => done_aesM
  );

  testing : process is
  begin
    reset_aes <= '1';
    reset_aesM <= '1';
    enable_aes <= '0';
    enable_aesM <= '0';

    wait for 10*period;
    reset_aes <= '0';
    enable_aes <= '1';
    p1 <= x"01234567";
    p2 <= x"456789AB";
    k1 <= x"89ABCDEF";
    k2 <= x"CDEF0123";
    wait until (done_aes = '1');
    res <= c;

    reset_aesM <= '0';
    enable_aesM <= '1';
    wait until (done_aesM <= '1');
    resM <= c1 xor c2;

    wait for 10*period;

  end process;

end architecture test;