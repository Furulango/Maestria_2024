library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        a : in  std_logic;
        b : in  std_logic;
        y : out std_logic
    );
end entity and_gate;

architecture behavioral of and_gate is
begin
    y <= a and b;
end architecture behavioral;
