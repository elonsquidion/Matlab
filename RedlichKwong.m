T = 350;
P = 9.4573e5;
Tc = 425.21;
psi = 0.42748;
Pc = 3.796e6;
ohm = 0.08664;

Tr = Tempr(T, Tc);
ar = alfar(Tr);
b = be(ohm, 8.31, Tc, Pc);
a = alfa(8.31, Tc, Pc, psi);
P = pressure(R, T, V, b);
disp(P);

function P = pressure(R, T, V, b)
    P = (R*T)/(V-b)-alfa/(V(V+b));
end

function a = alfa(R, Tc, Pc, psi)
    a = psi*(ar*R^2*Tc^2)/Pc;
end

function b = be(ohm, R, Tc, Pc)
    b = ohm*(R*Tc)/Pc;
end

function ar = alfar(Tr)
    ar = Tr^(-1/2);
end

function Tr = Tempr(T, Tc)
    Tr = T/Tc;
end