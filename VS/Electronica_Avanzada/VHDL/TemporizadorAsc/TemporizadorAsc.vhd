-- Maestria en Ciencias Mecatronica
-- Electronica Avanzada
-- Temporizador ascendente

-- Definición de las librerías
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Definición de la entidad
entity TemporizadorAsc is
    generic(n : integer := 4);
    port(
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        K : in STD_LOGIC_VECTOR(n-1 downto 0);
        STR : in STD_LOGIC;
        Tout : out STD_LOGIC
    );
end TemporizadorAsc;

architecture contar of TemporizadorAsc is
    signal Qn, Qp : std_logic_vector(n-1 downto 0);
begin

    -- STR Qp=K | Qn
    -------------------
    --  0   x   |   0       Clear
    --  1   0   |   Qp+1    Count 
    --  1   1   |   0       Clear
    Mux: process(STR, Qp, K)
    begin
        if STR = '0' then
            Qn <= (others => '0');
            Tout <= '0';
        elsif Qp = K then
            Qn <= (others => '0');
            Tout <= '1';
        else
            Qn <= std_logic_vector(unsigned(Qp) + 1);
            Tout <= '1';
        end if;
    end process Mux;

    Qp <= (others => '0') when RST = '1' else Qn when rising_edge(CLK);
end contar;
