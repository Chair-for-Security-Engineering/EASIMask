library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use work.masked_aes_pkg.all;

entity aes_sbox_wrapper_tb is
end entity aes_sbox_wrapper_tb;

architecture test of aes_sbox_wrapper_tb is

  component Wrapper is
    port(
      io_clk : in std_logic;
      io_reset : in std_logic;
      io_sbox_in : in std_logic_vector(15 downto 0);
      io_mask : in std_logic_vector(37 downto 0);
      io_sbox_out : out std_logic_vector(15 downto 0)
    );
  end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal wrapper_reset : std_logic;
  signal wrapper_sbox_in, wrapper_sbox_out : std_logic_vector(15 downto 0);
  signal wrapper_mask : std_logic_vector(37 downto 0) := b"10110110100010101000111010001100111110";
  signal result_unmasked : std_logic_vector(7 downto 0);

begin

  clk <= not clk after period/2;
  result_unmasked <= wrapper_sbox_out(15 downto 8) xor wrapper_sbox_out(7 downto 0);

  sbox_wrapper : Wrapper
  port map(
    io_clk => clk,
    io_reset => wrapper_reset,
    io_sbox_in => wrapper_sbox_in,
    io_mask => wrapper_mask,
    io_sbox_out => wrapper_sbox_out
  );

  testing : process is
  begin
    wrapper_reset <= '1';
    wrapper_sbox_in <= (others => '0');
    --wrapper_mask <= (others => '0');
    wait for 10*period;
    --wrapper_mask <= b"10110110100010101000111010001100111110";
    wrapper_reset <= '0';
    wait for 10*period;
    wrapper_reset <= '1';
    wait for 10*period;
    wrapper_reset <= '0';
    wrapper_sbox_in <= x"0001";
    wait for 10*period;
  end process;

end test;