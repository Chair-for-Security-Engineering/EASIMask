library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.interfaces.all;
use work.dut;

architecture present_sequential of dut is -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)" -- @suppress "Unused generic: width_plain is not used in work.dut(present)"
  
  signal shares_buf : shares_plain_t;
  signal key_buf : shares_key_t;
  signal conf_buf : std_logic_vector(31 downto 0);
  signal result_buf : shares_cipher_t;
  
  signal dut_data_in  : std_logic_vector(191 downto 0);
  signal dut_key      : std_logic_vector(239 downto 0);
  signal dut_data_out : std_logic_vector(191 downto 0);

  signal rand_enable : std_logic;
  signal rand_keccak : std_logic_vector(576-1 downto 0);
  
  signal dut_done, dut_rst : std_logic := '0';
  signal rand_cnt: natural range 0 to 18:=0;-- unsigned(3 downto 0);


  type dut_state_t is (idle, working, sDone);
  signal dut_state : dut_state_t := idle;
  
  signal start_dut: STD_LOGIC;

  component present_wrapper is
    port (
      io_resetFull  : in  std_logic;
      io_enable     : in  std_logic;
      io_dataIn     : in  std_logic_vector(191 downto 0);
      io_key        : in  std_logic_vector(239 downto 0);
      io_dataOut    : out std_logic_vector(191 downto 0);
      io_done       : out std_logic;
      clk           : in  std_logic;
      reset         : in  std_logic
    );
  end component;

 begin

  present : present_wrapper
  port map(
    clk           => clk,
    reset         => dut_rst,
    io_resetFull  => rst_full,
    io_enable     => start_dut,
    io_done       => dut_done,
    io_key        => dut_key,
    io_dataIn     => dut_data_in,
    io_dataOut    => dut_data_out
  );


  dut_data_in( 63 downto   0) <= shares_buf(0);
  dut_data_in(127 downto  64) <= shares_buf(1);
  dut_data_in(191 downto 128) <= shares_buf(2);

  dut_key( 79 downto   0) <= key_buf(0);
  dut_key(159 downto  80) <= key_buf(1);
  dut_key(239 downto 160) <= key_buf(2);

  result <= result_buf;
  

  -- -- KECCAK CORE - PRNG --------------------------------------------------------
	-- PRNG : ENTITY work.KECCAK
  -- PORT MAP ( 
  --     CLK          => clk,
  --     RESET        => rst_full,
  --     ENABLE       => rand_enable,
  --     -- MESSAGE ---------------------
  --     M            => (OTHERS => '0'),
  --     -- PRNG ------------------------
  --     PRNG_OUT     => rand_keccak
  -- );

  -- gen_rand:
  -- for I in 0 to NUM_SBOX-1 generate
  --   rand_out(12*I+RAND-1 downto RAND*I) <= rand_keccak(RAND-1 downto 0);
  -- end generate gen_rand;
  -- ------------------------------------------------------------------------------

  dut : process(clk)
  begin
    if rising_edge(clk) then
      start_dut <= '0';
      if rst_full = '1' then
        -- reset everything else
        conf_buf <= (others => '0');
      end if;
      if rst = '1' or rst_full = '1' then
        -- reset outputs
        done <= '0';
	      dut_rst <= '1';
		  
        -- reset buffers
        key_buf <= (others => (others => '0'));
        shares_buf <= (others => (others => '0'));
        conf_buf <= (others => '0');
        result_buf <= (others => (others => '0'));

        -- reset state
        dut_state <= idle;
      else
        case (dut_state) is
          when idle =>
            --result <= (others => (others => '0'));
	          dut_rst <= '0';
            if start = '1' then
              done <= '0';
	            start_dut <= '1';
              shares_buf <= shares_in;
              key_buf <= key_in;
              conf_buf <= conf;
              dut_state <= working;
              -- rand_enable <= '1';
				      -- rand_cnt <= 0;
            end if;
				
			--  when randomness =>
			--    rand_cnt <= rand_cnt + 1;
			-- 	if(rand_cnt = 4) then
			-- 	   start_dut <= '1';
			-- 		dut_state <= working;
			-- 	end if;

          when working =>
	          dut_rst <= '0';
            -- rand_enable <= '0';
            -- Just wait
            if dut_done = '1' then
              result_buf(0) <= dut_data_out( 63 downto   0);
              result_buf(1) <= dut_data_out(127 downto  64);
              result_buf(2) <= dut_data_out(191 downto 128);
              start_dut <= '0';
              dut_state <= sDone;
            end if;
          
            when sDone =>
              done <= '1';
              dut_state <= sDone;

        end case;
      end if;
    end if;
  end process;



end present_sequential;