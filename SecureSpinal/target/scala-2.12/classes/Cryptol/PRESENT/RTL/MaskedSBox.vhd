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


entity MaskedSBox is
  port(
    io_in1 : in std_logic_vector(3 downto 0);
    io_in2 : in std_logic_vector(3 downto 0);
    io_in3 : in std_logic_vector(3 downto 0);
    io_out1 : out std_logic_vector(3 downto 0);
    io_out2 : out std_logic_vector(3 downto 0);
    io_out3 : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end MaskedSBox;

architecture arch of MaskedSBox is
  signal G_io_out1 : std_logic_vector(3 downto 0);
  signal G_io_out2 : std_logic_vector(3 downto 0);
  signal G_io_out3 : std_logic_vector(3 downto 0);
  signal F_io_out1 : std_logic_vector(3 downto 0);
  signal F_io_out2 : std_logic_vector(3 downto 0);
  signal F_io_out3 : std_logic_vector(3 downto 0);

  signal GOut1 : std_logic_vector(3 downto 0);
  signal GOut2 : std_logic_vector(3 downto 0);
  signal GOut3 : std_logic_vector(3 downto 0);
  signal dummy : std_logic;
begin
  G : entity work.MaskedG
    port map ( 
      io_in1 => io_in1,
      io_in2 => io_in2,
      io_in3 => io_in3,
      io_out1 => G_io_out1,
      io_out2 => G_io_out2,
      io_out3 => G_io_out3 
    );
  F : entity work.MaskedF
    port map ( 
      io_in1 => GOut1,
      io_in2 => GOut2,
      io_in3 => GOut3,
      io_out1 => F_io_out1,
      io_out2 => F_io_out2,
      io_out3 => F_io_out3,
      clk => clk,
      reset => reset 
    );
  io_out1 <= F_io_out1;
  io_out2 <= F_io_out2;
  io_out3 <= F_io_out3;
  process(clk, reset)
  begin
    if reset = '1' then
      GOut1 <= pkg_stdLogicVector("0000");
      GOut2 <= pkg_stdLogicVector("0000");
      GOut3 <= pkg_stdLogicVector("0000");
    elsif rising_edge(clk) then
      GOut1 <= G_io_out1;
      GOut2 <= G_io_out2;
      GOut3 <= G_io_out3;
    end if;
  end process;

end arch;

