---------------------------------------------------------------------------
--
-- Copyright (C) 2016 Stiftung Secure Information and 
--                    Communication Technologies SIC and
--                    Graz University of Technology
-- Contact: http://opensource.iaik.tugraz.at
--
-- This file is part of AES DOM.
--
-- $BEGIN_LICENSE:DEFAULT$
-- Commercial License Usage
-- Licensees holding valid commercial licenses may use this file in
-- accordance with the commercial license agreement provided with the
-- Software or, alternatively, in accordance with the terms contained in
-- a written agreement between you and SIC. For further information
-- contact us at http://opensource.iaik.tugraz.at.
--
-- GNU General Public License Usage
-- Alternatively, this file may be used under the terms of the GNU
-- General Public License version 3.0 as published by the Free Software
-- Foundation and appearing in the file LICENSE.GPL included in the
-- packaging of this file.  Please review the following information to
-- ensure the GNU General Public License version 3.0 requirements will be
-- met: http://www.gnu.org/copyleft/gpl.html.
-- 
-- This software is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this software. If not, see http://www.gnu.org/licenses/.
--
-- $END_LICENSE:DEFAULT$
--
----------------------------------------------------------------------------
--       ### aes_sbox.vhdl ###
--
-- Description:
-- Different variants of masked and unmasked AES Sboxes
--   
--
-- Initial Version: Date: 22. September 2015 by Hannes Gross IAIK
--
------------------------------------------------------------------------------
library ieee;  use ieee.std_logic_1164.all; 
               use work.masked_aes_pkg.all;
               
entity aes_sbox is
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
end aes_sbox;

-------------------------------------------------------------------

architecture behavorial of aes_sbox is
  -- Shared  signals
  signal mappedxD                  : t_shared_gf8(SHARES-1 downto 0);
  signal Y1xD                      : t_shared_gf4(SHARES-1 downto 0);
  signal Y0xD                      : t_shared_gf4(SHARES-1 downto 0);
  signal Y0xorY1xD                 : t_shared_gf4(SHARES-1 downto 0);
  signal Y0xorY12xD                : t_shared_gf4(SHARES-1 downto 0);
  signal Y0mulY1xD                 : t_shared_gf4(SHARES-1 downto 0);
  signal InverterInxD              : t_shared_gf4(SHARES-1 downto 0);
  signal InverterOutxD             : t_shared_gf4(SHARES-1 downto 0);
  signal InverseMSBxD              : t_shared_gf4(SHARES-1 downto 0);
  signal InverseLSBxD              : t_shared_gf4(SHARES-1 downto 0);
  signal InvUnmappedxD             : t_shared_gf8(SHARES-1 downto 0);
  signal InvMappedxD               : t_shared_gf8(SHARES-1 downto 0);
  -- Pipelining registers
  signal Y0_0xDP, Y0_1xDP, Y0_2xDP : t_shared_gf4(SHARES-1 downto 0);
  signal Y0_3xDP, Y0_4xDP          : t_shared_gf4(SHARES-1 downto 0);
  signal Y1_0xDP, Y1_1xDP, Y1_2xDP : t_shared_gf4(SHARES-1 downto 0);
  signal Y1_3xDP, Y1_4xDP          : t_shared_gf4(SHARES-1 downto 0);
  signal Y0xorY12xDP               : t_shared_gf4(SHARES-1 downto 0);
  
  -- For eight stage pipeline variant only:
  signal mappedxDP                 : t_shared_gf8(SHARES-1 downto 0);
  signal InverterInxDP             : t_shared_gf4(SHARES-1 downto 0);
begin

  -- General: Define aliases
  aliases_p: process (mappedxD, mappedxDP) is
  begin  -- process aliases_p
    for i in SHARES-1 downto 0 loop
      if (PIPELINED = "yes") and (EIGHT_STAGED = "yes") then
        Y1xD(i) <= mappedxDP(i)(7 downto 4);
        Y0xD(i) <= mappedxDP(i)(3 downto 0);
      else
        Y1xD(i) <= mappedxD(i)(7 downto 4);
        Y0xD(i) <= mappedxD(i)(3 downto 0);
      end if;
    end loop;  --i
  end process aliases_p;
  
  ---------------------------------------------------------------
  -- Masked and pipelined (5 staged) AES Sbox with variable order of security
  masked_variant_pipelined : if (SHARES > 1) and (PIPELINED = "yes") and (EIGHT_STAGED = "no") generate
    
    -- Pipeline for Y0 and Y1
    pipeline_y0y1_p : process (ClkxCI, RstxBI) is
    begin  -- process pipeline_y0y1_p
      if RstxBI = '0' then              -- asynchronous reset (active low)
        -- per share
        for i in SHARES-1 downto 0 loop
          Y0_0xDP(i) <= (others => '0');
          Y0_1xDP(i) <= (others => '0');
          Y0_2xDP(i) <= (others => '0');
          Y1_0xDP(i) <= (others => '0');
          Y1_1xDP(i) <= (others => '0');
          Y1_2xDP(i) <= (others => '0');
        end loop;  --i
      elsif ClkxCI'event and ClkxCI = '1' then  -- rising clock edge
        -- per share
        for i in SHARES-1 downto 0 loop
          Y0_2xDP(i)     <= Y0_1xDP(i);
          Y0_1xDP(i)     <= Y0_0xDP(i);
          Y0_0xDP(i)     <= Y0xD(i);
          Y1_2xDP(i)     <= Y1_1xDP(i);
          Y1_1xDP(i)     <= Y1_0xDP(i);
          Y1_0xDP(i)     <= Y1xD(i);
          Y0xorY12xDP(i) <= Y0xorY12xD(i);
        end loop;  --i
      end if;
    end process pipeline_y0y1_p;    

    -- Generate instances per share...
    generate_instances_g: for i in SHARES-1 downto 0 generate
      -- Linear mapping at input
      input_mapping : entity work.lin_map
      generic map (
        MATRIX_SEL => "X^-1")
      port map (
        DataInxDI  => XxDI(i),
        DataOutxDO => mappedxD(i));

      -- Input is split up in Y1 and Y0
      Y0xorY1xD(i) <= Y1xD(i) xor Y0xD(i);

      -- Square scaler
      square_scaler_gf24 : entity work.square_scaler
      port map (
        DataInxDI  => Y0xorY1xD(i),
        DataOutxDO => Y0xorY12xD(i));

      -- Inverter input
      InverterInxD(i) <= Y0mulY1xD(i) xor Y0xorY12xDP(i);

      -- Inverse linear mapping
      InvUnmappedxD(i) <= InverseMSBxD(i) & InverseLSBxD(i);

      -- Linear mapping at output
      output_mapping : entity work.lin_map
        generic map (
          MATRIX_SEL => "MX")
        port map (
          DataInxDI  => InvUnmappedxD(i),
          DataOutxDO => InvMappedxD(i));

    end generate generate_instances_g;

    -- Output
    output_p: process (InvMappedxD) is
    begin  -- process output_p
      for i in SHARES-1 downto 0 loop
        if i > 0 then
          QxDO(i) <= InvMappedxD(i);
        else -- Add "b" only once
          QxDO(0) <= InvMappedxD(0) xor "01100011";
        end if;
      end loop;  -- i
    end process output_p;


    ---- Single instances:
    -- Multiply Y1 and Y0 (GF 2^4)
    mul_y0y1 : entity work.real_dom_shared_mul_gf4
      generic map (
        PIPELINED                => PIPELINED,
        FIRST_ORDER_OPTIMIZATION => "yes",
        SHARES                   => SHARES)
      port map (
        ClkxCI => ClkxCI,
        RstxBI => RstxBI,
        XxDI   => Y1xD,
        YxDI   => Y0xD,
        ZxDI   => Zmul1xDI,
        BxDI   => Bmul1xDI,
        QxDO   => Y0mulY1xD);

    -- Inverter in GF2^4
    inverter_gf24: entity work.inverter
      generic map (
        VARIANT           => "Masked",
        PIPELINED         => PIPELINED,
        EIGHT_STAGED_SBOX => "no",
        SHARES            => SHARES)
      port map (
        ClkxCI   => ClkxCI,
        RstxBI   => RstxBI,
        XxDI     => InverterInxD,
        Zmul1xDI => Zinv1xDI,
        Zmul2xDI => Zinv2xDI,
        Zmul3xDI => Zinv3xDI,
        Bmul1xDI => Binv1xDI,
        Bmul2xDI => Binv2xDI,
        Bmul3xDI => Binv3xDI,
        QxDO     => InverterOutxD);

    -- Multiply Inv and Y0 (GF 2^4)
    mult_msb: entity work.shared_mul_gf4
      generic map (
        PIPELINED  => "yes",
        SHARES     => SHARES)
      port map (
        ClkxCI => ClkxCI,
        RstxBI => RstxBI,
        XxDI   => InverterOutxD,
        YxDI   => Y0_2xDP,
        ZxDI   => Zmul2xDI,
        QxDO   => InverseMSBxD);
    
    -- Multiply Y1 and Inv (GF 2^4)
    mult_lsb: entity work.shared_mul_gf4
      generic map (
        PIPELINED  => "yes",
        SHARES     => SHARES)
      port map (
        ClkxCI => ClkxCI,
        RstxBI => RstxBI,
        XxDI   => InverterOutxD,
        YxDI   => Y1_2xDP,
        ZxDI   => Zmul3xDI,
        QxDO   => InverseLSBxD);
  end generate masked_variant_pipelined;
                     
end behavorial;
