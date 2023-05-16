-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : present_wrapper
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity updateKeyShared is
  port(
    io_keyIn1 : in std_logic_vector(79 downto 0);
    io_keyIn2 : in std_logic_vector(79 downto 0);
    io_keyIn3 : in std_logic_vector(79 downto 0);
    io_round : in std_logic_vector(4 downto 0);
    io_keyOut1 : out std_logic_vector(79 downto 0);
    io_keyOut2 : out std_logic_vector(79 downto 0);
    io_keyOut3 : out std_logic_vector(79 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end updateKeyShared;

architecture arch of updateKeyShared is
  signal sbox_io_in1 : std_logic_vector(3 downto 0);
  signal sbox_io_in2 : std_logic_vector(3 downto 0);
  signal sbox_io_in3 : std_logic_vector(3 downto 0);
  signal sbox_io_out1 : std_logic_vector(3 downto 0);
  signal sbox_io_out2 : std_logic_vector(3 downto 0);
  signal sbox_io_out3 : std_logic_vector(3 downto 0);

  signal k11 : std_logic_vector(79 downto 0);
  signal k12 : std_logic_vector(79 downto 0);
  signal k13 : std_logic_vector(79 downto 0);
  signal k21 : std_logic_vector(79 downto 0);
  signal k22 : std_logic_vector(79 downto 0);
  signal k23 : std_logic_vector(79 downto 0);
  signal k31 : std_logic_vector(79 downto 0);
  signal k32 : std_logic_vector(79 downto 0);
  signal k33 : std_logic_vector(79 downto 0);
  signal k11Reg : std_logic_vector(79 downto 0);
  signal k12Reg : std_logic_vector(79 downto 0);
  signal k13Reg : std_logic_vector(79 downto 0);
begin
  sbox : entity work.MaskedSBox
    port map ( 
      io_in1 => sbox_io_in1,
      io_in2 => sbox_io_in2,
      io_in3 => sbox_io_in3,
      io_out1 => sbox_io_out1,
      io_out2 => sbox_io_out2,
      io_out3 => sbox_io_out3,
      clk => clk,
      reset => reset 
    );
  sbox_io_in1 <= pkg_extract(k11,79,76);
  sbox_io_in2 <= pkg_extract(k12,79,76);
  sbox_io_in3 <= pkg_extract(k13,79,76);
  k11 <= pkg_cat(pkg_extract(io_keyIn1,18,0),pkg_extract(io_keyIn1,79,19));
  k12 <= pkg_cat(pkg_extract(io_keyIn2,18,0),pkg_extract(io_keyIn2,79,19));
  k13 <= pkg_cat(pkg_extract(io_keyIn3,18,0),pkg_extract(io_keyIn3,79,19));
  k21 <= pkg_cat(sbox_io_out1,pkg_extract(k11Reg,75,0));
  k22 <= pkg_cat(sbox_io_out2,pkg_extract(k12Reg,75,0));
  k23 <= pkg_cat(sbox_io_out3,pkg_extract(k13Reg,75,0));
  k31 <= pkg_cat(pkg_cat(pkg_extract(k21,79,20),(pkg_extract(k21,19,15) xor io_round)),pkg_extract(k21,14,0));
  k32 <= pkg_cat(pkg_cat(pkg_extract(k22,79,20),(pkg_extract(k22,19,15) xor io_round)),pkg_extract(k22,14,0));
  k33 <= pkg_cat(pkg_cat(pkg_extract(k23,79,20),(pkg_extract(k23,19,15) xor io_round)),pkg_extract(k23,14,0));
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

