--
library ieee;  
use ieee.std_logic_1164.all; 
use work.masked_aes_pkg.all;

entity aes_sbox_wrapper is
  generic (
    SHARES : integer := 2
  );
  port (
    clk : in std_logic;
    reset : in std_logic;
    a : in std_logic_vector(8*SHARES-1 downto 0);
    r : in std_logic_vector(18*(SHARES*(SHARES-1)/2)-1 downto 0);
    b : out std_logic_vector(8*SHARES-1 downto 0)
  );
end aes_sbox_wrapper;

architecture behave of aes_sbox_wrapper is

  component aes_sbox is
    generic (
      PIPELINED    : string  := "yes";    -- use pipeline stages
      -- Only if pipelined variant is used!
      EIGHT_STAGED : string  := "yes";    -- use 8 stages instead of 5
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

  signal s_xxdi, s_qxdo : t_shared_gf8(SHARES-1 downto 0);
  signal s_zmul1, s_zmul2, s_zmul3 : t_shared_gf4((SHARES*(SHARES-1)/2)-1 downto 0);
  signal s_zinv1, s_zinv2, s_zinv3 : t_shared_gf2((SHARES*(SHARES-1)/2)-1 downto 0);

begin

  first_order : if (SHARES = 2) generate 
    s_xxdi(1) <= a(15 downto 8);
    s_xxdi(0) <= a( 7 downto 0);
    s_zmul1(0) <= r(17 downto 14);
    s_zmul2(0) <= r(13 downto 10);
    s_zmul3(0) <= r( 9 downto  6);
    s_zinv1(0) <= r( 5 downto  4);
    s_zinv2(0) <= r( 3 downto  2);
    s_zinv3(0) <= r( 1 downto  0);
    b(15 downto 8) <= s_qxdo(1);
    b( 7 downto 0) <= s_qxdo(0);
  end generate;

  second_order : if (SHARES = 3) generate
    s_xxdi(2) <= a(23 downto 16);
    s_xxdi(1) <= a(15 downto  8);
    s_xxdi(0) <= a( 7 downto  0);
    s_zmul1(2) <= r(53 downto 50);
    s_zmul1(1) <= r(49 downto 46);
    s_zmul1(0) <= r(45 downto 42);
    s_zmul2(2) <= r(41 downto 38);
    s_zmul2(1) <= r(37 downto 34);
    s_zmul2(0) <= r(33 downto 30);
    s_zmul3(2) <= r(29 downto 26);
    s_zmul3(1) <= r(25 downto 22);
    s_zmul3(0) <= r(21 downto 18);
    s_zinv1(2) <= r(17 downto 16);
    s_zinv1(1) <= r(15 downto 14);
    s_zinv1(0) <= r(13 downto 12);
    s_zinv2(2) <= r(11 downto 10);
    s_zinv2(1) <= r( 9 downto  8);
    s_zinv2(0) <= r( 7 downto  6);
    s_zinv3(2) <= r( 5 downto  4);
    s_zinv3(1) <= r( 3 downto  2);
    s_zinv3(0) <= r( 1 downto  0);
  end generate;

  sbox : aes_sbox
  generic map (
    pipelined => "yes",
    eight_staged => "yes",
    shares => shares
  )
  port map (
    ClkxCI => clk,
    RstxBI => reset,
    XxDI => s_xxdi,
    Zmul1xDI => s_zmul1,
    Zmul2xDI => s_zmul2,
    Zmul3xDI => s_zmul3,
    Zinv1xDI => s_zinv1,
    Zinv2xDI => s_zinv2,
    Zinv3xDI => s_zinv3,
    Bmul1xDI => (others => (others => '0')),
    Binv1xDI => (others => (others => '0')),
    Binv2xDI => (others => (others => '0')),
    Binv3xDI => (others => (others => '0')),
    QxDO => s_qxdo
  );

end behave;