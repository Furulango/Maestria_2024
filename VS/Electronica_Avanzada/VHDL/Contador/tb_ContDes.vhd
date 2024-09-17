library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definición de la entidad
entity tb_ContDes is
end tb_ContDes;

-- Definición de la arquitectura
architecture behavior of tb_ContDes is
    -- Declaración de señales
    signal RST : std_logic := '0';
    signal CLK : std_logic := '0';
    signal OPC : std_logic_vector(1 downto 0) := "00";
    signal K   : std_logic_vector(3 downto 0) := "0000";
    signal Z   : std_logic;
    signal Q   : std_logic_vector(3 downto 0);

    -- Periodo del reloj
    constant CLK_PERIOD : time := 20 ns;

begin
    uut: entity work.ContDes
        generic map (n => 4)
        port map (
            RST => RST,
            CLK => CLK,
            OPC => OPC,
            K   => K,
            Z   => Z,
            Q   => Q
        );

    -- Generación del reloj
    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Proceso de estímulo
    stimulus_process : process
    begin
        -- Inicialización
        RST <= '1';
        OPC <= "00";
        K <= "0101";
        wait for 40 ns;
        
        -- Desactivación del reset
        RST <= '0';
        wait for 20 ns;
        
        -- OPC = "00", mantener el valor actual
        OPC <= "00";
        wait for 140 ns;
        
        -- OPC = "10", cargar el valor de K
        OPC <= "10";
        K <= "1001";  -- Ejemplo de valor para K
        wait for 40 ns;
        
        -- OPC = "00", mantener el valor actual
        OPC <= "00";
        wait for 40 ns;
        
        -- OPC = "01", decrementar
        OPC <= "01";
        wait for 40 ns;
        
        -- OPC = "00", mantener el valor actual
        OPC <= "00";
        wait for 40 ns;
        
        -- OPC = "01", decrementar
        OPC <= "01";
        wait for 40 ns;
        
        -- OPC = "00", mantener el valor actual
        OPC <= "00";
        wait for 40 ns;
        
        -- OPC = "01", decrementar
        OPC <= "01";
        wait for 40 ns;
        
        -- OPC = "00", mantener el valor actual
        OPC <= "00";
        wait for 40 ns;
        
        -- OPC = "01", decrementar
        OPC <= "01";
        wait for 40 ns;
        
        -- OPC = "00", mantener el valor actual
        OPC <= "00";
        wait for 40 ns;
        
        -- Detener la simulación
        wait;
    end process;

end behavior;
