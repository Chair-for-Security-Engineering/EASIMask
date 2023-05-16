library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

use std.env.stop;

entity AES_Masked_TB is
end entity AES_Masked_TB;

architecture test of AES_Masked_TB is

	component AES_Masked is
		port(
			io_clk : in std_logic;
			io_reset : in std_logic;
			io_enable : in std_logic;
			io_pt1_valid : in std_logic;
			io_pt1_ready : out std_logic;
			io_pt1_payload : in std_logic_vector(31 downto 0);
			io_pt2_valid : in std_logic;
			io_pt2_ready : out std_logic;
			io_pt2_payload : in std_logic_vector(31 downto 0);
			io_key1_valid : in std_logic;
			io_key1_ready : out std_logic;
			io_key1_payload : in std_logic_vector(31 downto 0);
			io_key2_valid : in std_logic;
			io_key2_ready : out std_logic;
			io_key2_payload : in std_logic_vector(31 downto 0);
			io_m : in std_logic_vector(27 downto 0);
			io_ct1_valid : out std_logic;
			io_ct1_ready : in std_logic;
			io_ct1_payload : out std_logic_vector(31 downto 0);
			io_ct2_valid : out std_logic;
			io_ct2_ready : in std_logic;
			io_ct2_payload : out std_logic_vector(31 downto 0);
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
  signal ct1, ct2, pt1, pt2, key1, key2, plaintext, key, ciphertext : T_4x32 := (others => (others => '0'));

begin

  clk <= not clk after period/2;

  aes_dut : AES_Masked
  port map(
		io_clk => clk,
		io_reset => reset_aes,
		io_enable => enable_aes,
		io_pt1_valid => pt1_valid,
		io_pt1_ready => pt1_ready,
		io_pt1_payload => pt1_payload,
		io_pt2_valid => pt2_valid,
		io_pt2_ready => pt2_ready,
		io_pt2_payload => pt2_payload,
		io_key1_valid => key1_valid,
		io_key1_ready => key1_ready,
		io_key1_payload => key1_payload,
		io_key2_valid => key2_valid,
		io_key2_ready => key2_ready,
		io_key2_payload => key2_payload,
		io_m => m,
		io_ct1_valid => ct1_valid,
		io_ct1_ready => ct1_ready,
		io_ct1_payload => ct1_payload,
		io_ct2_valid => ct2_valid,
		io_ct2_ready => ct2_ready,
		io_ct2_payload => ct2_payload,
		io_done => done_aes
		);

  testing : process is
  begin
    reset_aes <= '1';
    enable_aes <= '0';
    pt1_valid <= '0';
		pt2_valid <= '0';
		pt1_payload <= (others => '0');
		pt2_payload <= (others => '0');
		key1_payload <= (others => '0');
		key2_payload <= (others => '0');
    key1_valid <= '0';
		key2_valid <= '0';
    ct1_ready <= '0';
		ct2_ready <= '0';
    wait for 10*period;

    reset_aes <= '0';
    enable_aes <= '1';
		plaintext <= (x"6BC1BEE2", x"2E409F96", x"E93D7E11", x"7393172A");
		pt1 			<= (x"a63d21b8", x"37dbb8cd", x"aaac6f87", x"8d633d23");
		pt2 			<= (x"CDFC9F5A", x"199B275B", x"43911196", x"FEF02A09");
		key 			<= (x"2B7E1516", x"28AED2A6", x"ABF71588", x"09CF4F3C");
		key1 			<= (x"b1fb0ef5", x"5e6aa618", x"fac2af34", x"d4fdd55a");
		key2 			<= (x"9A851BE3", x"76C474BE", x"5135BABC", x"DD329A66");
		ct1 			<= (others => (others => '0'));
		ct2 			<= (others => (others => '0'));

    -- wait until (pt1_ready = '1' and pt2_ready = '1' and key1_ready = '1' and key2_ready = '1');
    -- pt1_valid <= '1';
		-- pt2_valid <= '1';
    -- key1_valid <= '1';
		-- key2_valid <= '1';
    -- write_pt : for i in 0 to 3 loop
    --   pt1_payload <= pt1(i);
		-- 	pt2_payload <= pt2(i);
    --   key1_payload <= key1(i);
		-- 	key2_payload <= key2(i);
    --   wait for period;
    -- end loop ;  -- write_pt

		wait until (pt1_ready = '1' and key1_ready = '1');
		pt1_valid <= '1';
		key1_valid <= '1';
		write_pt1 : for i in 0 to 3 loop
			pt1_payload <= pt1(i);
			key1_payload <= key1(i);
			wait for period;
		end loop;

		pt1_valid <= '0';
		key1_valid <= '0';
		
		wait until (pt2_ready = '1' and key2_ready = '1');
		pt2_valid <= '1';
		key2_valid <= '1';
		write_pt2 : for i in 0 to 3 loop
			pt2_payload <= pt2(i);
			key2_payload <= key2(i);
			wait for period;
		end loop;

		pt2_valid <= '0';
		key2_valid <= '0';

    wait until (ct1_valid = '1');

		ct1_ready <= '1';

    write_ct1 : for i in 0 to 3 loop
			wait for period;
			if (ct1_ready = '1' and ct1_valid = '1') then
 	    	ct1(i) <= ct1_payload;
			end if;
    end loop;

		ct1_ready <= '0';
		ct2_ready <= '1';

		write_ct2 : for i in 0 to 3 loop
			wait for period;
     	if (ct2_ready = '1' and ct2_valid = '1') then
 	    	ct2(i) <= ct2_payload;
			end if;
    end loop;

		wait until (done_aes = '1');
		wait for period;

		reset_aes <= '1';
    enable_aes <= '0';
    pt1_valid <= '0';
		pt2_valid <= '0';
    key1_valid <= '0';
		key2_valid <= '0';
    ct1_ready <= '1';
		ct2_ready <= '1';

		write_ct : for i in 0 to 3 loop
			ciphertext(i) <= ct1(i) xor ct2(i);
			wait for period;
		end loop;

		assert(ciphertext(0) = x"3AD77BB4");
		assert(ciphertext(1) = x"0D7A3660");
		assert(ciphertext(2) = X"A89ECAF3");
		assert(ciphertext(3) = x"2466EF97");

		wait for 10*period;

		

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