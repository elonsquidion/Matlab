clear
clc

data = [0 .1039; 3.15 .08; 4.1 .079; 6.2 0.776; 8.2 .0701; 10 .0639; 13.5 .0529; 18.3 .0353; 26 .027];

function dCdt = ChemWoosh(~, C, C0)
    CA0 = C0(1);
    CB = C0(2) - (CA0-)
end