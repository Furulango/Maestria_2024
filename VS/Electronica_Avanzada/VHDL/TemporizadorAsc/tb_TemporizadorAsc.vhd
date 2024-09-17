-- Banco de Pruebas para TemporizadorAsc
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity tb_TemporizadorAsc is
end tb_TemporizadorAsc;

architecture behavior of tb_TemporizadorAsc is
    -- Parámetros de la simulación
    constant CLK_PERIOD : time := 20 ns;
    constant K_VALUE : integer := 4;
    
    -- Señales para la prueba
    signal RST : std_logic := '0';
    signal CLK : std_logic := '0';
    signal K : std_logic_vector(K_VALUE-1 downto 0) := (others => '0');
    signal STR : std_logic := '0';
    signal Tout : std_logic;

    -- Instanciar la unidad bajo prueba
    component TemporizadorAsc
        generic (n : integer := K_VALUE);
        port (
            RST : in std_logic;
            CLK : in std_logic;
            K : in std_logic_vector(n-1 downto 0);
            STR : in std_logic;
            Tout : out std_logic
        );
    end component;

begin
    -- Instancia de la unidad bajo prueba
    uut: TemporizadorAsc
        port map (
            RST => RST,
            CLK => CLK,
            K => K,
            STR => STR,
            Tout => Tout
        );

    -- Generador de reloj
    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Proceso de inicio
    start_process : process
    begin
        STR <= '0';
        wait for 6 * CLK_PERIOD;
        STR <= '1';
        wait;
    end process;

    -- Proceso de reinicio
    rst_process : process
    begin
        RST <= '1';
        wait for 5 * CLK_PERIOD;
        RST <= '0';
        wait;
    end process;

end behavior;
