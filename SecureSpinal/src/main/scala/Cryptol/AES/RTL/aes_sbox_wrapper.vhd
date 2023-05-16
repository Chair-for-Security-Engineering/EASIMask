library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use work.masked_aes_pkg.all;

entity aes_sbox_wrapper is
  port (
    clk       : in std_logic;
    reset     : in std_logic;
    sbox_in   : in std_logic_vector(15 downto 0);
    mask      : in std_logic_vector(37 downto 0);
    sbox_out  : out std_logic_vector(15 downto 0)
  );
end entity aes_sbox_wrapper;

architecture behave of aes_sbox_wrapper is

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
  end component;

  signal sbox_xxdi, sbox_qxdo : t_shared_gf8(1 downto 0);
  signal sbox_zmul1xdi, sbox_zmul2xdi, sbox_zmul3xdi : t_shared_gf4(0 downto 0);
  signal sbox_zinv1xdi, sbox_zinv2xdi, sbox_zinv3xdi : t_shared_gf2(0 downto 0);
  signal sbox_bmul1xdi : t_shared_gf4(1 downto 0);
  signal sbox_binv1xdi, sbox_binv2xdi, sbox_binv3xdi : t_shared_gf2(1 downto 0);

begin

  sbox_xxdi(0) <= sbox_in(15 downto 8);
  sbox_xxdi(1) <= sbox_in( 7 downto 0);
  sbox_zmul1xdi(0) <= mask(37 downto 34);
  sbox_zmul2xdi(0) <= mask(33 downto 30);
  sbox_zmul3xdi(0) <= mask(29 downto 26);
  sbox_zinv1xdi(0) <= mask(25 downto 24);
  sbox_zinv2xdi(0) <= mask(23 downto 22);
  sbox_zinv3xdi(0) <= mask(21 downto 20);
  sbox_bmul1xdi(0) <= mask(19 downto 16);
  sbox_bmul1xdi(1) <= mask(15 downto 12);
  sbox_binv1xdi(0) <= mask(11 downto 10);
  sbox_binv1xdi(1) <= mask( 9 downto  8);
  sbox_binv2xdi(0) <= mask( 7 downto  6);
  sbox_binv2xdi(1) <= mask( 5 downto  4);
  sbox_binv3xdi(0) <= mask( 3 downto  2);
  sbox_binv3xdi(1) <= mask( 1 downto  0);
  sbox_out(15 downto 8) <= sbox_qxdo(0);
  sbox_out( 7 downto 0) <= sbox_qxdo(1);

  sbox : aes_sbox
  generic map(
    pipelined => "yes",
    eight_staged => "no",
    shares => 2
  )
  port map(
    ClkxCI  => clk,
    RstxBI  => not reset,
    -- Inputs: X and random data
    XxDI     => sbox_xxdi,
    -- Fresh masks
    Zmul1xDI => sbox_zmul1xdi,
    Zmul2xDI => sbox_zmul2xdi,
    Zmul3xDI => sbox_zmul3xdi,
    Zinv1xDI => sbox_zinv1xdi,
    Zinv2xDI => sbox_zinv2xdi,
    Zinv3xDI => sbox_zinv3xdi,
    -- Blinding values for Y0*Y1 and Inverter (for 5 stage Sbox only)
    Bmul1xDI => sbox_bmul1xdi,
    Binv1xDI => sbox_binv1xdi,
    Binv2xDI => sbox_binv2xdi,
    Binv3xDI => sbox_binv3xdi,
    -- Output Q = SBOX(X)
    QxDO     => sbox_qxdo
  );

end behave;