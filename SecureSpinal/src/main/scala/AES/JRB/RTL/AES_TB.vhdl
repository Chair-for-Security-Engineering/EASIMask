library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity AES_TB is
end AES_TB;

architecture test of AES_TB is

  component AES_1stOrder_UnsharedKey is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_p_0 : in std_logic_vector(127 downto 0);
      io_p_1 : in std_logic_vector(127 downto 0);
      io_k : in std_logic_vector(127 downto 0);
      io_r : in std_logic_vector(287 downto 0);
      io_c_0 : out std_logic_vector(127 downto 0);
      io_c_1 : out std_logic_vector(127 downto 0)
    );
  end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal reset : std_logic;
  signal p0, p1, k, c0, c1, p, c : std_logic_vector(127 downto 0);
  signal r : std_logic_vector(287 downto 0);

begin

  clk <= not clk after period/2;
  p <= p0 xor p1;
  c <= c0 xor c1;
  r <= (others => '1');
  k <= (others => '0');

  aes_dut : AES_1stOrder_UnsharedKey
  port map (
    io_clk => clk,
    io_reset => reset,
    io_p_0 => p0,
    io_p_1 => p1,
    io_k => k,
    io_r => r,
    io_c_0 => c0,
    io_c_1 => c1
  );

  testing : process is
  begin
    reset <= '1';
    wait for 10*period;
    reset <= '0';
    p0 <= x"40BFABF406EE4D3042CA6B997A5C5816";
    p1 <= (others => '0');
    wait for 10*period;
  end process;

end test;