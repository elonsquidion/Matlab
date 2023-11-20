clear
clc

tspan = [0 90];
C0 = [27.61 0 0];

[t, C] = ode23tb(@furuka, tspan, C0);

plot(t, C);

function dC = furuka(~, C)
    k1 = 0.02;
    k2 = 0.01;
    k3 = 0.06;
    Z0 = 40;
    dC = zeros(3, 1);
    dC(1) = -k1*C(1)*(Z0-C(2)) + k2*C(2);
    dC(2) = -(k2 + k3)*C(2) + k1 * C(1)* (Z0-C(2));
    dC(3) = k3*C(2);
end
