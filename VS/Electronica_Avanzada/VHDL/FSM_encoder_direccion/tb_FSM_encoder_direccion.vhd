library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_FSM_encoder_direccion is
end tb_FSM_encoder_direccion;

architecture behavior of tb_FSM_encoder_direccion is
    component FSM_encoder_direccion
        Port (
            RST : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            S   : out STD_LOGIC
        );
    end component;

    signal RST       : STD_LOGIC := '0';
    signal CLK       : STD_LOGIC := '0';
    signal A         : STD_LOGIC := '0';
    signal B         : STD_LOGIC := '0';
    signal S         : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: FSM_encoder_direccion
        Port map (
            RST => RST,
            CLK => CLK,
            A   => A,
            B   => B,
            S   => S
        );

    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    signal_tb : process
    begin
        RST <= '1';
        wait for 20 ns;
        RST <= '0';

        A <= '0'; B <= '0';
        wait for CLK_PERIOD * 10;

        A <= '0'; B <= '1';
        wait for CLK_PERIOD * 10;

        A <= '1'; B <= '0';
        wait for CLK_PERIOD * 10;

        A <= '1'; B <= '1';
        wait for CLK_PERIOD * 10;

        A <= '0'; B <= '1';
        wait for CLK_PERIOD * 10;

        A <= '1'; B <= '0';
        wait for CLK_PERIOD * 10;

        A <= '1'; B <= '1';
        wait for CLK_PERIOD * 10;

        A <= '0'; B <= '0';
        wait for CLK_PERIOD * 10;

        wait;
    end process;

end behavior;
