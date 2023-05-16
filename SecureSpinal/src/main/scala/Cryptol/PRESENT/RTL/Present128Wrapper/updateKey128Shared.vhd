-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : present128_wrapper
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity updateKey128Shared is
  port(
    io_keyIn1 : in std_logic_vector(127 downto 0);
    io_keyIn2 : in std_logic_vector(127 downto 0);
    io_keyIn3 : in std_logic_vector(127 downto 0);
    io_round : in std_logic_vector(4 downto 0);
    io_keyOut1 : out std_logic_vector(127 downto 0);
    io_keyOut2 : out std_logic_vector(127 downto 0);
    io_keyOut3 : out std_logic_vector(127 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end updateKey128Shared;

architecture arch of updateKey128Shared is
  signal sbox1_io_in1 : std_logic_vector(3 downto 0);
  signal sbox1_io_in2 : std_logic_vector(3 downto 0);
  signal sbox1_io_in3 : std_logic_vector(3 downto 0);
  signal sbox2_io_in1 : std_logic_vector(3 downto 0);
  signal sbox2_io_in2 : std_logic_vector(3 downto 0);
  signal sbox2_io_in3 : std_logic_vector(3 downto 0);
  signal sbox1_io_out1 : std_logic_vector(3 downto 0);
  signal sbox1_io_out2 : std_logic_vector(3 downto 0);
  signal sbox1_io_out3 : std_logic_vector(3 downto 0);
  signal sbox2_io_out1 : std_logic_vector(3 downto 0);
  signal sbox2_io_out2 : std_logic_vector(3 downto 0);
  signal sbox2_io_out3 : std_logic_vector(3 downto 0);

  signal k11 : std_logic_vector(127 downto 0);
  signal k12 : std_logic_vector(127 downto 0);
  signal k13 : std_logic_vector(127 downto 0);
  signal k21 : std_logic_vector(127 downto 0);
  signal k22 : std_logic_vector(127 downto 0);
  signal k23 : std_logic_vector(127 downto 0);
  signal k31 : std_logic_vector(127 downto 0);
  signal k32 : std_logic_vector(127 downto 0);
  signal k33 : std_logic_vector(127 downto 0);
  signal k11Reg : std_logic_vector(127 downto 0);
  signal k12Reg : std_logic_vector(127 downto 0);
  signal k13Reg : std_logic_vector(127 downto 0);
begin
  sbox1 : entity work.MaskedSBox
    port map ( 
      io_in1 => sbox1_io_in1,
      io_in2 => sbox1_io_in2,
      io_in3 => sbox1_io_in3,
      io_out1 => sbox1_io_out1,
      io_out2 => sbox1_io_out2,
      io_out3 => sbox1_io_out3,
      clk => clk,
      reset => reset 
    );
  sbox2 : entity work.MaskedSBox
    port map ( 
      io_in1 => sbox2_io_in1,
      io_in2 => sbox2_io_in2,
      io_in3 => sbox2_io_in3,
      io_out1 => sbox2_io_out1,
      io_out2 => sbox2_io_out2,
      io_out3 => sbox2_io_out3,
      clk => clk,
      reset => reset 
    );
  sbox1_io_in1 <= pkg_extract(k11,127,124);
  sbox1_io_in2 <= pkg_extract(k12,127,124);
  sbox1_io_in3 <= pkg_extract(k13,127,124);
  sbox2_io_in1 <= pkg_extract(k11,123,120);
  sbox2_io_in2 <= pkg_extract(k12,123,120);
  sbox2_io_in3 <= pkg_extract(k13,123,120);
  k11 <= pkg_cat(pkg_extract(io_keyIn1,66,0),pkg_extract(io_keyIn1,127,67));
  k12 <= pkg_cat(pkg_extract(io_keyIn2,66,0),pkg_extract(io_keyIn2,127,67));
  k13 <= pkg_cat(pkg_extract(io_keyIn3,66,0),pkg_extract(io_keyIn3,127,67));
  k21 <= pkg_cat(pkg_cat(sbox1_io_out1,sbox2_io_out1),pkg_extract(k11Reg,119,0));
  k22 <= pkg_cat(pkg_cat(sbox1_io_out2,sbox2_io_out2),pkg_extract(k12Reg,119,0));
  k23 <= pkg_cat(pkg_cat(sbox1_io_out3,sbox2_io_out3),pkg_extract(k13Reg,119,0));
  k31 <= pkg_cat(pkg_cat(pkg_extract(k21,127,67),(pkg_extract(k21,66,62) xor io_round)),pkg_extract(k21,61,0));
  k32 <= pkg_cat(pkg_cat(pkg_extract(k22,127,67),pkg_extract(k22,66,62)),pkg_extract(k22,61,0));
  k33 <= pkg_cat(pkg_cat(pkg_extract(k23,127,67),pkg_extract(k23,66,62)),pkg_extract(k23,61,0));
  io_keyOut1 <= k31;
  io_keyOut2 <= k32;
  io_keyOut3 <= k33;
  process(clk)
  begin
    if rising_edge(clk) then
      k11Reg <= k11;
      k12Reg <= k12;
      k13Reg <= k13;
    end if;
  end process;

end arch;

