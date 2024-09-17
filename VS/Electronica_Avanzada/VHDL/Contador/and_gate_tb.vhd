library ieee;
use ieee.std_logic_1164.all;

entity and_gate_tb is
end entity and_gate_tb;

architecture behavioral of and_gate_tb is
    signal a, b : std_logic := '0';
    signal y    : std_logic;
begin
    uut: entity work.and_gate
        port map (
            a => a,
            b => b,
            y => y
        );

    process
    begin
        -- Test case 1: a = '0', b = '0'
        a <= '0'; b <= '0';
        wait for 10 ns;
        assert (y = '0') report "Test case 1 failed" severity error;

        -- Test case 2: a = '0', b = '1'
        a <= '0'; b <= '1';
        wait for 10 ns;
        assert (y = '0') report "Test case 2 failed" severity error;

        -- Test case 3: a = '1', b = '0'
        a <= '1'; b <= '0';
        wait for 10 ns;
        assert (y = '0') report "Test case 3 failed" severity error;

        -- Test case 4: a = '1', b = '1'
        a <= '1'; b <= '1';
        wait for 10 ns;
        assert (y = '1') report "Test case 4 failed" severity error;

        wait;
    end process;
end architecture behavioral;
