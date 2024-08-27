LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY parte2 IS
PORT ( Clk, R, S : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END parte2;
ARCHITECTURE Structural OF parte2 IS
SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;
ATTRIBUTE KEEP : BOOLEAN;
ATTRIBUTE KEEP OF R_g, S_g, Qa, Qb : SIGNAL IS TRUE;
BEGIN
R_g <= NOT (R AND Clk);
S_g <= NOT (S AND Clk);
Qa <= NOT (R_g AND Qb);
Qb <= NOT (S_g AND Qa);
Q <= Qa;
END Structural;