library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_encoder_direccion is
    Port (
        RST       : in  STD_LOGIC;
        CLK       : in  STD_LOGIC;
        A         : in  STD_LOGIC;
        B         : in  STD_LOGIC;
        S         : out STD_LOGIC
    );
end FSM_encoder_direccion;

architecture FSM of FSM_encoder_direccion is
    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
    signal state, s_siguiente : state_type;
    signal concat_signal : STD_LOGIC_VECTOR(1 downto 0);
begin

    process(state, A, B)
    begin
        concat_signal <= A & B;
        case state is
            when S0 =>
                case concat_signal is
                    when "00" => s_siguiente <= S0;
                    when "01" => s_siguiente <= S1;
                    when "10" => s_siguiente <= S4;
                    when "11" => s_siguiente <= S0;
                    when others => s_siguiente <= S0;
                end case;
                S <= '0';
                
            when S1 =>
                case concat_signal is
                    when "00" => s_siguiente <= S5;
                    when "01" => s_siguiente <= S1;
                    when "10" => s_siguiente <= S1;
                    when "11" => s_siguiente <= S2;
                    when others => s_siguiente <= S0;
                end case;
                S <= '0';

            when S2 =>
                case concat_signal is
                    when "00" => s_siguiente <= S2;
                    when "01" => s_siguiente <= S6;
                    when "10" => s_siguiente <= S3;
                    when "11" => s_siguiente <= S2;
                    when others => s_siguiente <= S0;
                end case;
                S <= '0';
                
            when S3 =>
                case concat_signal is
                    when "00" => s_siguiente <= S0;
                    when "01" => s_siguiente <= S3;
                    when "10" => s_siguiente <= S3;
                    when "11" => s_siguiente <= S7;
                    when others => s_siguiente <= S0;
                end case;
                S <= '0';

            when S4 =>
                case concat_signal is
                    when "00" => s_siguiente <= S0;
                    when "01" => s_siguiente <= S4;
                    when "10" => s_siguiente <= S4;
                    when "11" => s_siguiente <= S7;
                    when others => s_siguiente <= S0;
                end case;
                S <= '1';

            when S5 =>
                case concat_signal is
                    when "00" => s_siguiente <= S5;
                    when "01" => s_siguiente <= S1;
                    when "10" => s_siguiente <= S4;
                    when "11" => s_siguiente <= S5;
                    when others => s_siguiente <= S0;
                end case;
                S <= '1';

            when S6 =>
                case concat_signal is
                    when "00" => s_siguiente <= S5;
                    when "01" => s_siguiente <= S6;
                    when "10" => s_siguiente <= S6;
                    when "11" => s_siguiente <= S2;
                    when others => s_siguiente <= S0;
                end case;
                S <= '1';

            when S7 =>
                case concat_signal is
                    when "00" => s_siguiente <= S7;
                    when "01" => s_siguiente <= S6;
                    when "10" => s_siguiente <= S3;
                    when "11" => s_siguiente <= S7;
                    when others => s_siguiente <= S0;
                end case;
                S <= '1';
                
            when others =>
                s_siguiente <= S0;
                S <= '0';
        end case;
    end process;
    
    process(CLK, RST)
    begin
        if RST = '1' then
            state <= S0;
        elsif rising_edge(CLK) then
            state <= s_siguiente;
        end if;
    end process;
end FSM;
