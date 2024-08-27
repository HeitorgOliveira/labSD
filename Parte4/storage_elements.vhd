library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity storage_elements is
    port (
        D     : in  std_logic;
        Clock : in  std_logic;
        Qa    : out std_logic;
        Qb    : out std_logic;
        Qc    : out std_logic
    );
end entity storage_elements;

architecture behavioral of storage_elements is
    -- Gated D latch
    signal latch_Q : std_logic;

    -- Positive-edge triggered D flip-flop
    signal flip_flop_b_Q : std_logic;

    -- Negative-edge triggered D flip-flop
    signal flip_flop_c_Q : std_logic;

begin
    -- Gated D Latch
    process(D, Clock)
    begin
        if Clock = '1' then
            latch_Q <= D;
        end if;
    end process;

    -- Positive-edge triggered D Flip-Flop
    process(D, Clock)
    begin
        if rising_edge(Clock) then
            flip_flop_b_Q <= D;
        end if;
    end process;

    -- Negative-edge triggered D Flip-Flop
    process(D, Clock)
    begin
        if falling_edge(Clock) then
            flip_flop_c_Q <= D;
        end if;
    end process;

    -- Outputs do circuito
    Qa <= latch_Q;
    Qb <= flip_flop_b_Q;
    Qc <= flip_flop_c_Q;

end architecture behavioral;
