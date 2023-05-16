library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.interfaces.all;
use work.dut;

entity dut_architecture_tb is
end entity dut_architecture_tb;

architecture test of dut_architecture_tb is

  component dut is
    port (
      clk       : in std_logic;
      rst       : in std_logic;
      rst_full  : in std_logic;
      start     : in std_logic;
      shares_in : in shares_plain_t;
      key_in    : in shares_key_t;
      result    : out shares_cipher_t;
      conf      :     std_logic_vector(31 downto 0);
      done      : out std_logic
    );
  end component;

  constant period : time := 10 ns;

  signal clk : std_logic := '1';
  signal dut_rst, dut_rst_full, dut_start, dut_done : std_logic;
  signal dut_shares_in : shares_plain_t;
  signal dut_key_in : shares_key_t;
  signal dut_result : shares_cipher_t;
  signal dut_conf : std_logic_vector(31 downto 0);
  signal ciphertext : std_logic_vector(63 downto 0);

begin

  clk <= not clk after period/2;
  ciphertext <= dut_result(0) xor dut_result(1) xor dut_result(2);

  dut1 : dut
  port map (
    clk => clk,
    rst => dut_rst,
    rst_full => dut_rst_full,
    start => dut_start,
    shares_in => dut_shares_in,
    key_in => dut_key_in,
    result => dut_result,
    conf => dut_conf,
    done => dut_done
  );

  tb : process is
  begin
    dut_rst_full <= '1';
    dut_rst <= '1';
    dut_start <= '0';
    wait for period;
    dut_rst_full <= '0';
    wait for 10*period;

    dut_rst <= '0';
    dut_start <= '1';
    dut_shares_in(0) <= x"1000000000000000";
    dut_shares_in(1) <= x"1000000000000000";
    dut_shares_in(2) <= x"0000000000000000";
    dut_key_in(0) <= x"00000000000000000000";
    dut_key_in(1) <= x"00000000000000000000";
    dut_key_in(2) <= x"00000000000000000000";

    wait until dut_done = '1';
    wait for 10*period;

    if (ciphertext = x"5579C1387B228445") then
      report "Test 1 passed!";
    end if;
    assert ciphertext = x"5579C1387B228445" report "Wrong result";

    dut_rst <= '1';
    dut_start <= '0';
    wait for period*10;

    dut_rst <= '0';
    dut_start <= '1';
    dut_shares_in(0) <= x"BF71DE032D71B215";
    dut_shares_in(1) <= x"6E3DA70CD789663B";
    dut_shares_in(2) <= x"C3782F776A5319C1";
    dut_key_in(0) <= x"AB3B17FCF2B56B15AFFC";
    dut_key_in(1) <= x"6F4C36DF2E5DFAED9B20";
    dut_key_in(2) <= x"3B88DEDC23176E07CB23";

    wait until dut_done = '1';
    wait for 10*period;

    if (ciphertext = x"BC28817D85561BFC") then
      report "Test 2 passed!";
    end if;
    assert ciphertext = x"BC28817D85561BFC" report "Wrong result";

    assert false report "Test : OK" severity failure;
    
  end process;

end test;