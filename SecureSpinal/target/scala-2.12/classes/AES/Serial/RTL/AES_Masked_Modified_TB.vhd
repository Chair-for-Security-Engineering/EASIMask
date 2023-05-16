library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

use std.env.stop;

entity AES_Masked_Modified_TB is
end entity AES_Masked_Modified_TB;

architecture test of AES_Masked_Modified_TB is

	component AES_Masked_Modified is
		port(
			io_clk : in std_logic;
			io_reset : in std_logic;
			io_enable : in std_logic;
			io_pt1 : in std_logic_vector(127 downto 0);
			io_pt2 : in std_logic_vector(127 downto 0);
			io_key1 : in std_logic_vector(127 downto 0);
			io_key2 : in std_logic_vector(127 downto 0);
			io_m : in std_logic_vector(27 downto 0);
			io_ct1 : out std_logic_vector(127 downto 0);
			io_ct2 : out std_logic_vector(127 downto 0);
			io_done : out std_logic
		);
	end component;

  signal period : time := 10 ns;
  signal clk : std_logic := '1';
  signal reset_aes, enable_aes, done_aes : std_logic;
  signal pt1_valid, pt2_valid, pt1_ready, pt2_ready, key1_valid, key2_valid, key1_ready, key2_ready, ct1_valid, ct2_valid, ct1_ready, ct2_ready : std_logic;
	signal pt1_payload, pt2_payload, key1_payload, key2_payload : std_logic_vector(31 downto 0);
	signal ct1_payload, ct2_payload : std_logic_vector(31 downto 0);
	signal m : std_logic_vector(27 downto 0) := (others => '0');
  type T_4x32 is array (0 to 3) of std_logic_vector(31 downto 0);
  signal plaintext, key : T_4x32 := (others => (others => '0'));
	signal ct1, ct2, pt1, pt2, key1, key2, ciphertext : std_logic_vector(127 downto 0);

begin

  clk <= not clk after period/2;
	ciphertext <= ct1 xor ct2;

  aes_dut : AES_Masked_Modified
  port map(
		io_clk => clk,
		io_reset => reset_aes,
		io_enable => enable_aes,
		io_pt1 => pt1,
		io_pt2 => pt2,
		io_key1 => key1,
		io_key2 => key2,
		io_m => m,
		io_ct1 => ct1,
		io_ct2 => ct2,
		io_done => done_aes
		);

  testing : process is
  begin
    reset_aes <= '1';
    enable_aes <= '0';
    wait for 10*period;

    reset_aes <= '0';
    enable_aes <= '1';
		plaintext <= (x"6BC1BEE2", x"2E409F96", x"E93D7E11", x"7393172A");
		pt1 			<= (x"a63d21b8" & x"37dbb8cd" & x"aaac6f87" & x"8d633d23");
		pt2 			<= (x"CDFC9F5A" & x"199B275B" & x"43911196" & x"FEF02A09");
		key 			<= (x"2B7E1516", x"28AED2A6", x"ABF71588", x"09CF4F3C");
		key1 			<= (x"b1fb0ef5" & x"5e6aa618" & x"fac2af34" & x"d4fdd55a");
		key2 			<= (x"9A851BE3" & x"76C474BE" & x"5135BABC" & x"DD329A66");

    wait until (done_aes = '1');
		wait for period;

		assert(ciphertext = x"3AD77BB4" & x"0D7A3660" & X"A89ECAF3" & x"2466EF97");

		wait for 10*period;

		reset_aes <= '1';
    enable_aes <= '0';
    pt1_valid <= '0';
		pt2_valid <= '0';
    key1_valid <= '0';
		key2_valid <= '0';
    ct1_ready <= '1';
		ct2_ready <= '1';

		wait for 10*period;

		wait for 10*period;

		stop;
    -- plaintext_valid_aes <= '0';
    -- key_valid_aes <= '0';
		-- wait for 10*period;

		-- plaintext <= (x"06d20cf5", x"7113ce54", x"6aa47981", x"745fdcd8");
		-- key <= (x"9d4e3904", x"ee701de0", x"8bed82f0", x"8e797930");

		-- reset_aes <= '0';
		-- enable_aes <= '1';

		-- wait until (plaintext_ready_aes = '1' and key_ready_aes = '1');
		-- plaintext_valid_aes <= '1';
    -- key_valid_aes <= '1';
    -- write_pt2 : for i in 0 to 3 loop
    --   plaintext_payload <= plaintext(i);
    --   key_payload <= key(i);
    --   wait for period;
    -- end loop ; -- write_pt

    -- --wait for 300*period;
    -- wait until (done_aes = '1');
    -- write_ct2 : for i in 0 to 3 loop
		-- 	wait for period;
    --  	ciphertext(i) <= ciphertext_payload;
    -- end loop;

		-- reset_aes <= '1';
		-- enable_aes <= '0';
    -- plaintext_valid_aes <= '0';
    -- key_valid_aes <= '0';
		-- wait for 10*period;

  end process;

end test;