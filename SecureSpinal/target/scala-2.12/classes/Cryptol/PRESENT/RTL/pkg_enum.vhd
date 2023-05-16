-- Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
-- Component : present_wrapper
-- Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type States is (sIdle,sLoadData,sExecute,sDone);
  type fsm_enumDef is (BOOT,sIdle,sExecute,sDone);

  function pkg_mux (sel : std_logic; one : States; zero : States) return States;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector;
  function pkg_toStates_native (value : std_logic_vector(1 downto 0)) return States;
  function pkg_mux (sel : std_logic; one : fsm_enumDef; zero : fsm_enumDef) return fsm_enumDef;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector;
  function pkg_tofsm_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_enumDef;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : States; zero : States) return States is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toStates_native (value : std_logic_vector(1 downto 0)) return States is
  begin
    case value is
      when "00" => return sIdle;
      when "01" => return sLoadData;
      when "10" => return sExecute;
      when "11" => return sDone;
      when others => return sIdle;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : States) return std_logic_vector is
  begin
    case value is
      when sIdle => return "00";
      when sLoadData => return "01";
      when sExecute => return "10";
      when sDone => return "11";
      when others => return "00";
    end case;
  end;
  function pkg_mux (sel : std_logic; one : fsm_enumDef; zero : fsm_enumDef) return fsm_enumDef is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tofsm_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_enumDef is
  begin
    case value is
      when "00" => return BOOT;
      when "01" => return sIdle;
      when "10" => return sExecute;
      when "11" => return sDone;
      when others => return BOOT;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector is
  begin
    case value is
      when BOOT => return "00";
      when sIdle => return "01";
      when sExecute => return "10";
      when sDone => return "11";
      when others => return "00";
    end case;
  end;
end pkg_enum;


