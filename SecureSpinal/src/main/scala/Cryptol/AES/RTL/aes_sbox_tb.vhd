library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use work.masked_aes_pkg.all;

entity aes_sbox_tb is
end entity aes_sbox_tb;

architecture tb of aes_sbox_tb is

  component aes_sbox is
    generic (
      PIPELINED    : string  := "yes";    -- use pipeline stages
      -- Only if pipelined variant is used!
      EIGHT_STAGED : string  := "no";    -- use 8 stages instead of 5
      SHARES       : integer := 2
    );
    port (
      ClkxCI  : in  std_logic;
      RstxBI  : in  std_logic;
      -- Inputs: X and random data
      XxDI     : in  t_shared_gf8(SHARES-1 downto 0);
      -- Fresh masks
      Zmul1xDI : in  t_shared_gf4((SHARES*(SHARES-1)/2)-1 downto 0); -- for y1 * y0
      Zmul2xDI : in  t_shared_gf4((SHARES*(SHARES-1)/2)-1 downto 0); -- for O * y1
      Zmul3xDI : in  t_shared_gf4((SHARES*(SHARES-1)/2)-1 downto 0); -- for O * y0
      Zinv1xDI : in  t_shared_gf2((SHARES*(SHARES-1)/2)-1 downto 0); -- for inverter
      Zinv2xDI : in  t_shared_gf2((SHARES*(SHARES-1)/2)-1 downto 0);
      Zinv3xDI : in  t_shared_gf2((SHARES*(SHARES-1)/2)-1 downto 0);
      -- Blinding values for Y0*Y1 and Inverter (for 5 stage Sbox only)
      Bmul1xDI : in  t_shared_gf4(SHARES-1 downto 0);                -- for y1 * y0
      Binv1xDI : in  t_shared_gf2(SHARES-1 downto 0);                -- for inverter
      Binv2xDI : in  t_shared_gf2(SHARES-1 downto 0);                -- ...
      Binv3xDI : in  t_shared_gf2(SHARES-1 downto 0);                -- ...
      -- Output Q = SBOX(X)
      QxDO     : out t_shared_gf8(SHARES-1 downto 0)
    );
  end component aes_sbox;

  constant period : time := 10 ns;
  constant shares : natural := 2;

  signal clk : std_logic := '1';
  signal reset_sbox : std_logic;
  signal input_sbox, output_sbox : t_shared_gf8(shares-1 downto 0) := (others => (others => '0'));
  signal mulmask1, mulmask2, mulmask3 : t_shared_gf4(shares*(shares-1)/2-1 downto 0) := (others => (others => '0'));
  signal invmask1, invmask2, invmask3 : t_shared_gf2((shares*(shares-1)/2)-1 downto 0) := (others => (others => '0'));
  signal mulblind : t_shared_gf4(shares-1 downto 0) := (others => (others => '0'));
  signal invblind1, invblind2, invblind3 : t_shared_gf2(shares-1 downto 0) := (others => (others => '0'));
  signal result_unmasked : std_logic_vector(7 downto 0);

begin

  clk <= not clk after period/2;
  result_unmasked <= output_sbox(0) xor output_sbox(1);

  sbox : aes_sbox
  generic map(
    pipelined => "yes",
    eight_staged => "no",
    shares => shares
  )
  port map(
    ClkxCI => clk,
    RstxBI => not reset_sbox,
    XxDI => input_sbox,
    Zmul1xDI => mulmask1,
    Zmul2xDI => mulmask2,
    Zmul3xDI => mulmask3,
    Zinv1xDI => invmask1,
    Zinv2xDI => invmask2,
    Zinv3xDI => invmask3,
    Bmul1xDI => mulblind,
    Binv1xDI => invblind1,
    Binv2xDI => invblind2,
    Binv3xDI => invblind3,
    QxDO => output_sbox
  );

  testing : process is
  begin
    report "Testing DOM-AES-SBox";
    reset_sbox <= '1';
    wait for 10*period;
    reset_sbox <= '0';
    wait for 10*period;
    reset_sbox <= '1';
    wait for 10*period;
    input_sbox(0) <= x"01";
    input_sbox(1) <= x"00";
    reset_sbox <= '0';
    wait for 10*period;
    reset_sbox <= '1';
    wait for 10*period;
    input_sbox(0) <= x"02";
    input_sbox(1) <= x"00";
    reset_sbox <= '0';
    wait for 10*period;
  end process;

end tb;