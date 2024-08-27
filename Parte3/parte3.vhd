library ieee;
use ieee.std_logic_1164.all;

-- Definição do módulo do flip-flop mestre-escravo
entity parte3 is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end parte3;

architecture Behavioral of parte3 is

    -- Declaração do componente do D latch (Parte2)
    component Parte2
        Port ( Clk : in STD_LOGIC;
               D : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    -- Sinais internos para conectar o latch mestre e escravo
    signal Q_master : STD_LOGIC;
    signal CLK_inv : STD_LOGIC;

begin

    -- Inverter o sinal de clock para o latch escravo
    CLK_inv <= not CLK;

    -- Instanciação do latch mestre
    MasterLatch : Parte2
        Port map ( Clk => CLK_inv,
                   D => D,
                   Q => Q_master);

    -- Instanciação do latch escravo
    SlaveLatch : Parte2
        Port map ( Clk => CLK,
                   D => Q_master,
                   Q => Q);

end Behavioral;
