library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definición de la entidad
entity ContDes is
    generic(n : integer := 4);
    port(
        RST : in std_logic;
        CLK : in std_logic;
        OPC : in std_logic_vector(1 downto 0);
        K   : in std_logic_vector(n-1 downto 0);
        Z   : out std_logic;
        Q   : out std_logic_vector(n-1 downto 0)
    );
end ContDes;

-- Definición de la arquitectura
architecture contar of ContDes is
    signal Qp, Qn, Zr : std_logic_vector(n-1 downto 0);

begin
    Q <= Qp;
    Zr <= (others => '0'); -- others -> todos los bits
    Z <= '1' when Qp = Zr else '0';
    
    -- OPC | Qn
    -- ------------
    -- 00 | Qp    Hold
    -- 01 | Qp-1  Decrement
    -- 1x | K     Load
    
    mux : process(OPC, Qn, K)
    begin
        if OPC(1) = '1' then
            Qn <= K;
        elsif OPC(0) = '1' then
            Qn <= std_logic_vector(unsigned(Qp) - 1);
        else
            Qn <= Qp;
        end if;
    end process mux;
    
    Qp <= (others => '0') when RST = '1' else Qn when rising_edge(CLK);
end contar;
