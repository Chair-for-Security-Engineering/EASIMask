-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : AES
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity KeySchedule is
  port(
    io_clk : in std_logic;
    io_reset : in std_logic;
    io_sampleInput : in std_logic;
    io_keyIn1 : in std_logic_vector(127 downto 0);
    io_keyIn2 : in std_logic_vector(127 downto 0);
    io_roundConstant : in std_logic_vector(7 downto 0);
    io_m : in std_logic_vector(151 downto 0);
    io_keyOut1 : out std_logic_vector(127 downto 0);
    io_keyOut2 : out std_logic_vector(127 downto 0)
  );
end KeySchedule;

architecture arch of KeySchedule is
  signal sBox_4_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_4_io_mask : std_logic_vector(37 downto 0);
  signal sBox_5_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_5_io_mask : std_logic_vector(37 downto 0);
  signal sBox_6_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_6_io_mask : std_logic_vector(37 downto 0);
  signal sBox_7_io_sbox_in : std_logic_vector(15 downto 0);
  signal sBox_7_io_mask : std_logic_vector(37 downto 0);
  signal sBox_4_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_5_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_6_io_sbox_out : std_logic_vector(15 downto 0);
  signal sBox_7_io_sbox_out : std_logic_vector(15 downto 0);

  signal r_reg1 : std_logic_vector(127 downto 0);
  signal r_reg2 : std_logic_vector(127 downto 0);
  signal r_w00 : std_logic_vector(31 downto 0);
  signal r_w01 : std_logic_vector(31 downto 0);
  signal r_w10 : std_logic_vector(31 downto 0);
  signal r_w11 : std_logic_vector(31 downto 0);
  signal r_w20 : std_logic_vector(31 downto 0);
  signal r_w21 : std_logic_vector(31 downto 0);
  signal r_w30 : std_logic_vector(31 downto 0);
  signal r_w31 : std_logic_vector(31 downto 0);
  signal r_rc : std_logic_vector(31 downto 0);
  signal r_sBoxOut0 : std_logic_vector(31 downto 0);
  signal r_sBoxOut1 : std_logic_vector(31 downto 0);
begin
  sBox_4 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_4_io_sbox_in,
      io_mask => sBox_4_io_mask,
      io_sbox_out => sBox_4_io_sbox_out 
    );
  sBox_5 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_5_io_sbox_in,
      io_mask => sBox_5_io_mask,
      io_sbox_out => sBox_5_io_sbox_out 
    );
  sBox_6 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_6_io_sbox_in,
      io_mask => sBox_6_io_mask,
      io_sbox_out => sBox_6_io_sbox_out 
    );
  sBox_7 : entity work.SBox
    port map ( 
      io_clk => io_clk,
      io_reset => io_reset,
      io_sbox_in => sBox_7_io_sbox_in,
      io_mask => sBox_7_io_mask,
      io_sbox_out => sBox_7_io_sbox_out 
    );
  sBox_4_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,31,24),pkg_extract(io_keyIn2,31,24));
  sBox_4_io_mask <= pkg_extract(io_m,151,114);
  process(sBox_4_io_sbox_out,sBox_5_io_sbox_out,sBox_6_io_sbox_out,sBox_7_io_sbox_out)
  begin
    r_sBoxOut0(31 downto 24) <= pkg_extract(sBox_4_io_sbox_out,15,8);
    r_sBoxOut0(23 downto 16) <= pkg_extract(sBox_5_io_sbox_out,15,8);
    r_sBoxOut0(15 downto 8) <= pkg_extract(sBox_6_io_sbox_out,15,8);
    r_sBoxOut0(7 downto 0) <= pkg_extract(sBox_7_io_sbox_out,15,8);
  end process;

  process(sBox_4_io_sbox_out,sBox_5_io_sbox_out,sBox_6_io_sbox_out,sBox_7_io_sbox_out)
  begin
    r_sBoxOut1(31 downto 24) <= pkg_extract(sBox_4_io_sbox_out,7,0);
    r_sBoxOut1(23 downto 16) <= pkg_extract(sBox_5_io_sbox_out,7,0);
    r_sBoxOut1(15 downto 8) <= pkg_extract(sBox_6_io_sbox_out,7,0);
    r_sBoxOut1(7 downto 0) <= pkg_extract(sBox_7_io_sbox_out,7,0);
  end process;

  sBox_5_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,23,16),pkg_extract(io_keyIn2,23,16));
  sBox_5_io_mask <= pkg_extract(io_m,113,76);
  sBox_6_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,15,8),pkg_extract(io_keyIn2,15,8));
  sBox_6_io_mask <= pkg_extract(io_m,75,38);
  sBox_7_io_sbox_in <= pkg_cat(pkg_extract(io_keyIn1,7,0),pkg_extract(io_keyIn2,7,0));
  sBox_7_io_mask <= pkg_extract(io_m,37,0);
  r_rc <= pkg_shiftLeft(io_roundConstant,24);
  r_w00 <= ((pkg_extract(r_reg1,127,96) xor pkg_cat(pkg_extract(r_sBoxOut0,23,0),pkg_extract(r_sBoxOut0,31,24))) xor r_rc);
  r_w01 <= (pkg_extract(r_reg2,127,96) xor pkg_cat(pkg_extract(r_sBoxOut1,23,0),pkg_extract(r_sBoxOut1,31,24)));
  r_w10 <= (pkg_extract(r_reg1,95,64) xor r_w00);
  r_w11 <= (pkg_extract(r_reg2,95,64) xor r_w01);
  r_w20 <= (pkg_extract(r_reg1,63,32) xor r_w10);
  r_w21 <= (pkg_extract(r_reg2,63,32) xor r_w11);
  r_w30 <= (pkg_extract(r_reg1,31,0) xor r_w20);
  r_w31 <= (pkg_extract(r_reg2,31,0) xor r_w21);
  io_keyOut1 <= pkg_cat(pkg_cat(pkg_cat(r_w00,r_w10),r_w20),r_w30);
  io_keyOut2 <= pkg_cat(pkg_cat(pkg_cat(r_w01,r_w11),r_w21),r_w31);
  process(io_clk, io_reset)
  begin
    if io_reset = '1' then
      r_reg1 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      r_reg2 <= pkg_stdLogicVector("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    elsif rising_edge(io_clk) then
      if io_sampleInput = '1' then
        r_reg1 <= io_keyIn1;
        r_reg2 <= io_keyIn2;
      end if;
    end if;
  end process;

end arch;

