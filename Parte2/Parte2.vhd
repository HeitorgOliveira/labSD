LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Parte2 IS
PORT ( Clk, D: IN STD_LOGIC;
Q : OUT STD_LOGIC);
END Parte2;
ARCHITECTURE Structural OF Parte2 IS
SIGNAL R, S, R_g, S_g, Qa, Qb : STD_LOGIC ;
ATTRIBUTE KEEP : BOOLEAN;
ATTRIBUTE KEEP OF R, S, R_g, S_g, Qa, Qb : SIGNAL IS TRUE;
BEGIN
R <= NOT(D);
S <= D;
R_g <= NOT ( R AND Clk);
S_g <= NOT (S AND Clk);
Qa <= NOT (S_g AND Qb);
Qb <= NOT (R_g AND Qa);
Q <= Qa;
END Structural;