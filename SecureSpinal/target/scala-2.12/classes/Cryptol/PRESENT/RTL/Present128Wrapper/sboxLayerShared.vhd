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


entity sboxLayerShared is
  port(
    io_stateIn1 : in std_logic_vector(63 downto 0);
    io_stateIn2 : in std_logic_vector(63 downto 0);
    io_stateIn3 : in std_logic_vector(63 downto 0);
    io_stateOut1 : out std_logic_vector(63 downto 0);
    io_stateOut2 : out std_logic_vector(63 downto 0);
    io_stateOut3 : out std_logic_vector(63 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end sboxLayerShared;

architecture arch of sboxLayerShared is
  signal maskedSBox_18_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_in1 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_in2 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_in3 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_18_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_19_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_20_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_21_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_22_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_23_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_24_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_25_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_26_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_27_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_28_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_29_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_30_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_31_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_32_io_out3 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_out1 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_out2 : std_logic_vector(3 downto 0);
  signal maskedSBox_33_io_out3 : std_logic_vector(3 downto 0);

begin
  maskedSBox_18 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_18_io_in1,
      io_in2 => maskedSBox_18_io_in2,
      io_in3 => maskedSBox_18_io_in3,
      io_out1 => maskedSBox_18_io_out1,
      io_out2 => maskedSBox_18_io_out2,
      io_out3 => maskedSBox_18_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_19 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_19_io_in1,
      io_in2 => maskedSBox_19_io_in2,
      io_in3 => maskedSBox_19_io_in3,
      io_out1 => maskedSBox_19_io_out1,
      io_out2 => maskedSBox_19_io_out2,
      io_out3 => maskedSBox_19_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_20 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_20_io_in1,
      io_in2 => maskedSBox_20_io_in2,
      io_in3 => maskedSBox_20_io_in3,
      io_out1 => maskedSBox_20_io_out1,
      io_out2 => maskedSBox_20_io_out2,
      io_out3 => maskedSBox_20_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_21 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_21_io_in1,
      io_in2 => maskedSBox_21_io_in2,
      io_in3 => maskedSBox_21_io_in3,
      io_out1 => maskedSBox_21_io_out1,
      io_out2 => maskedSBox_21_io_out2,
      io_out3 => maskedSBox_21_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_22 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_22_io_in1,
      io_in2 => maskedSBox_22_io_in2,
      io_in3 => maskedSBox_22_io_in3,
      io_out1 => maskedSBox_22_io_out1,
      io_out2 => maskedSBox_22_io_out2,
      io_out3 => maskedSBox_22_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_23 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_23_io_in1,
      io_in2 => maskedSBox_23_io_in2,
      io_in3 => maskedSBox_23_io_in3,
      io_out1 => maskedSBox_23_io_out1,
      io_out2 => maskedSBox_23_io_out2,
      io_out3 => maskedSBox_23_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_24 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_24_io_in1,
      io_in2 => maskedSBox_24_io_in2,
      io_in3 => maskedSBox_24_io_in3,
      io_out1 => maskedSBox_24_io_out1,
      io_out2 => maskedSBox_24_io_out2,
      io_out3 => maskedSBox_24_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_25 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_25_io_in1,
      io_in2 => maskedSBox_25_io_in2,
      io_in3 => maskedSBox_25_io_in3,
      io_out1 => maskedSBox_25_io_out1,
      io_out2 => maskedSBox_25_io_out2,
      io_out3 => maskedSBox_25_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_26 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_26_io_in1,
      io_in2 => maskedSBox_26_io_in2,
      io_in3 => maskedSBox_26_io_in3,
      io_out1 => maskedSBox_26_io_out1,
      io_out2 => maskedSBox_26_io_out2,
      io_out3 => maskedSBox_26_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_27 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_27_io_in1,
      io_in2 => maskedSBox_27_io_in2,
      io_in3 => maskedSBox_27_io_in3,
      io_out1 => maskedSBox_27_io_out1,
      io_out2 => maskedSBox_27_io_out2,
      io_out3 => maskedSBox_27_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_28 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_28_io_in1,
      io_in2 => maskedSBox_28_io_in2,
      io_in3 => maskedSBox_28_io_in3,
      io_out1 => maskedSBox_28_io_out1,
      io_out2 => maskedSBox_28_io_out2,
      io_out3 => maskedSBox_28_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_29 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_29_io_in1,
      io_in2 => maskedSBox_29_io_in2,
      io_in3 => maskedSBox_29_io_in3,
      io_out1 => maskedSBox_29_io_out1,
      io_out2 => maskedSBox_29_io_out2,
      io_out3 => maskedSBox_29_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_30 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_30_io_in1,
      io_in2 => maskedSBox_30_io_in2,
      io_in3 => maskedSBox_30_io_in3,
      io_out1 => maskedSBox_30_io_out1,
      io_out2 => maskedSBox_30_io_out2,
      io_out3 => maskedSBox_30_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_31 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_31_io_in1,
      io_in2 => maskedSBox_31_io_in2,
      io_in3 => maskedSBox_31_io_in3,
      io_out1 => maskedSBox_31_io_out1,
      io_out2 => maskedSBox_31_io_out2,
      io_out3 => maskedSBox_31_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_32 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_32_io_in1,
      io_in2 => maskedSBox_32_io_in2,
      io_in3 => maskedSBox_32_io_in3,
      io_out1 => maskedSBox_32_io_out1,
      io_out2 => maskedSBox_32_io_out2,
      io_out3 => maskedSBox_32_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_33 : entity work.MaskedSBox
    port map ( 
      io_in1 => maskedSBox_33_io_in1,
      io_in2 => maskedSBox_33_io_in2,
      io_in3 => maskedSBox_33_io_in3,
      io_out1 => maskedSBox_33_io_out1,
      io_out2 => maskedSBox_33_io_out2,
      io_out3 => maskedSBox_33_io_out3,
      clk => clk,
      reset => reset 
    );
  maskedSBox_18_io_in1 <= pkg_extract(io_stateIn1,3,0);
  maskedSBox_18_io_in2 <= pkg_extract(io_stateIn2,3,0);
  maskedSBox_18_io_in3 <= pkg_extract(io_stateIn3,3,0);
  process(maskedSBox_18_io_out1,maskedSBox_19_io_out1,maskedSBox_20_io_out1,maskedSBox_21_io_out1,maskedSBox_22_io_out1,maskedSBox_23_io_out1,maskedSBox_24_io_out1,maskedSBox_25_io_out1,maskedSBox_26_io_out1,maskedSBox_27_io_out1,maskedSBox_28_io_out1,maskedSBox_29_io_out1,maskedSBox_30_io_out1,maskedSBox_31_io_out1,maskedSBox_32_io_out1,maskedSBox_33_io_out1)
  begin
    io_stateOut1(3 downto 0) <= maskedSBox_18_io_out1;
    io_stateOut1(7 downto 4) <= maskedSBox_19_io_out1;
    io_stateOut1(11 downto 8) <= maskedSBox_20_io_out1;
    io_stateOut1(15 downto 12) <= maskedSBox_21_io_out1;
    io_stateOut1(19 downto 16) <= maskedSBox_22_io_out1;
    io_stateOut1(23 downto 20) <= maskedSBox_23_io_out1;
    io_stateOut1(27 downto 24) <= maskedSBox_24_io_out1;
    io_stateOut1(31 downto 28) <= maskedSBox_25_io_out1;
    io_stateOut1(35 downto 32) <= maskedSBox_26_io_out1;
    io_stateOut1(39 downto 36) <= maskedSBox_27_io_out1;
    io_stateOut1(43 downto 40) <= maskedSBox_28_io_out1;
    io_stateOut1(47 downto 44) <= maskedSBox_29_io_out1;
    io_stateOut1(51 downto 48) <= maskedSBox_30_io_out1;
    io_stateOut1(55 downto 52) <= maskedSBox_31_io_out1;
    io_stateOut1(59 downto 56) <= maskedSBox_32_io_out1;
    io_stateOut1(63 downto 60) <= maskedSBox_33_io_out1;
  end process;

  process(maskedSBox_18_io_out2,maskedSBox_19_io_out2,maskedSBox_20_io_out2,maskedSBox_21_io_out2,maskedSBox_22_io_out2,maskedSBox_23_io_out2,maskedSBox_24_io_out2,maskedSBox_25_io_out2,maskedSBox_26_io_out2,maskedSBox_27_io_out2,maskedSBox_28_io_out2,maskedSBox_29_io_out2,maskedSBox_30_io_out2,maskedSBox_31_io_out2,maskedSBox_32_io_out2,maskedSBox_33_io_out2)
  begin
    io_stateOut2(3 downto 0) <= maskedSBox_18_io_out2;
    io_stateOut2(7 downto 4) <= maskedSBox_19_io_out2;
    io_stateOut2(11 downto 8) <= maskedSBox_20_io_out2;
    io_stateOut2(15 downto 12) <= maskedSBox_21_io_out2;
    io_stateOut2(19 downto 16) <= maskedSBox_22_io_out2;
    io_stateOut2(23 downto 20) <= maskedSBox_23_io_out2;
    io_stateOut2(27 downto 24) <= maskedSBox_24_io_out2;
    io_stateOut2(31 downto 28) <= maskedSBox_25_io_out2;
    io_stateOut2(35 downto 32) <= maskedSBox_26_io_out2;
    io_stateOut2(39 downto 36) <= maskedSBox_27_io_out2;
    io_stateOut2(43 downto 40) <= maskedSBox_28_io_out2;
    io_stateOut2(47 downto 44) <= maskedSBox_29_io_out2;
    io_stateOut2(51 downto 48) <= maskedSBox_30_io_out2;
    io_stateOut2(55 downto 52) <= maskedSBox_31_io_out2;
    io_stateOut2(59 downto 56) <= maskedSBox_32_io_out2;
    io_stateOut2(63 downto 60) <= maskedSBox_33_io_out2;
  end process;

  process(maskedSBox_18_io_out3,maskedSBox_19_io_out3,maskedSBox_20_io_out3,maskedSBox_21_io_out3,maskedSBox_22_io_out3,maskedSBox_23_io_out3,maskedSBox_24_io_out3,maskedSBox_25_io_out3,maskedSBox_26_io_out3,maskedSBox_27_io_out3,maskedSBox_28_io_out3,maskedSBox_29_io_out3,maskedSBox_30_io_out3,maskedSBox_31_io_out3,maskedSBox_32_io_out3,maskedSBox_33_io_out3)
  begin
    io_stateOut3(3 downto 0) <= maskedSBox_18_io_out3;
    io_stateOut3(7 downto 4) <= maskedSBox_19_io_out3;
    io_stateOut3(11 downto 8) <= maskedSBox_20_io_out3;
    io_stateOut3(15 downto 12) <= maskedSBox_21_io_out3;
    io_stateOut3(19 downto 16) <= maskedSBox_22_io_out3;
    io_stateOut3(23 downto 20) <= maskedSBox_23_io_out3;
    io_stateOut3(27 downto 24) <= maskedSBox_24_io_out3;
    io_stateOut3(31 downto 28) <= maskedSBox_25_io_out3;
    io_stateOut3(35 downto 32) <= maskedSBox_26_io_out3;
    io_stateOut3(39 downto 36) <= maskedSBox_27_io_out3;
    io_stateOut3(43 downto 40) <= maskedSBox_28_io_out3;
    io_stateOut3(47 downto 44) <= maskedSBox_29_io_out3;
    io_stateOut3(51 downto 48) <= maskedSBox_30_io_out3;
    io_stateOut3(55 downto 52) <= maskedSBox_31_io_out3;
    io_stateOut3(59 downto 56) <= maskedSBox_32_io_out3;
    io_stateOut3(63 downto 60) <= maskedSBox_33_io_out3;
  end process;

  maskedSBox_19_io_in1 <= pkg_extract(io_stateIn1,7,4);
  maskedSBox_19_io_in2 <= pkg_extract(io_stateIn2,7,4);
  maskedSBox_19_io_in3 <= pkg_extract(io_stateIn3,7,4);
  maskedSBox_20_io_in1 <= pkg_extract(io_stateIn1,11,8);
  maskedSBox_20_io_in2 <= pkg_extract(io_stateIn2,11,8);
  maskedSBox_20_io_in3 <= pkg_extract(io_stateIn3,11,8);
  maskedSBox_21_io_in1 <= pkg_extract(io_stateIn1,15,12);
  maskedSBox_21_io_in2 <= pkg_extract(io_stateIn2,15,12);
  maskedSBox_21_io_in3 <= pkg_extract(io_stateIn3,15,12);
  maskedSBox_22_io_in1 <= pkg_extract(io_stateIn1,19,16);
  maskedSBox_22_io_in2 <= pkg_extract(io_stateIn2,19,16);
  maskedSBox_22_io_in3 <= pkg_extract(io_stateIn3,19,16);
  maskedSBox_23_io_in1 <= pkg_extract(io_stateIn1,23,20);
  maskedSBox_23_io_in2 <= pkg_extract(io_stateIn2,23,20);
  maskedSBox_23_io_in3 <= pkg_extract(io_stateIn3,23,20);
  maskedSBox_24_io_in1 <= pkg_extract(io_stateIn1,27,24);
  maskedSBox_24_io_in2 <= pkg_extract(io_stateIn2,27,24);
  maskedSBox_24_io_in3 <= pkg_extract(io_stateIn3,27,24);
  maskedSBox_25_io_in1 <= pkg_extract(io_stateIn1,31,28);
  maskedSBox_25_io_in2 <= pkg_extract(io_stateIn2,31,28);
  maskedSBox_25_io_in3 <= pkg_extract(io_stateIn3,31,28);
  maskedSBox_26_io_in1 <= pkg_extract(io_stateIn1,35,32);
  maskedSBox_26_io_in2 <= pkg_extract(io_stateIn2,35,32);
  maskedSBox_26_io_in3 <= pkg_extract(io_stateIn3,35,32);
  maskedSBox_27_io_in1 <= pkg_extract(io_stateIn1,39,36);
  maskedSBox_27_io_in2 <= pkg_extract(io_stateIn2,39,36);
  maskedSBox_27_io_in3 <= pkg_extract(io_stateIn3,39,36);
  maskedSBox_28_io_in1 <= pkg_extract(io_stateIn1,43,40);
  maskedSBox_28_io_in2 <= pkg_extract(io_stateIn2,43,40);
  maskedSBox_28_io_in3 <= pkg_extract(io_stateIn3,43,40);
  maskedSBox_29_io_in1 <= pkg_extract(io_stateIn1,47,44);
  maskedSBox_29_io_in2 <= pkg_extract(io_stateIn2,47,44);
  maskedSBox_29_io_in3 <= pkg_extract(io_stateIn3,47,44);
  maskedSBox_30_io_in1 <= pkg_extract(io_stateIn1,51,48);
  maskedSBox_30_io_in2 <= pkg_extract(io_stateIn2,51,48);
  maskedSBox_30_io_in3 <= pkg_extract(io_stateIn3,51,48);
  maskedSBox_31_io_in1 <= pkg_extract(io_stateIn1,55,52);
  maskedSBox_31_io_in2 <= pkg_extract(io_stateIn2,55,52);
  maskedSBox_31_io_in3 <= pkg_extract(io_stateIn3,55,52);
  maskedSBox_32_io_in1 <= pkg_extract(io_stateIn1,59,56);
  maskedSBox_32_io_in2 <= pkg_extract(io_stateIn2,59,56);
  maskedSBox_32_io_in3 <= pkg_extract(io_stateIn3,59,56);
  maskedSBox_33_io_in1 <= pkg_extract(io_stateIn1,63,60);
  maskedSBox_33_io_in2 <= pkg_extract(io_stateIn2,63,60);
  maskedSBox_33_io_in3 <= pkg_extract(io_stateIn3,63,60);
end arch;

