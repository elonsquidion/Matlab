clear
clc

tspan = [0 90];
C0 = [27.61 0 0];

[t, C] = ode23tb(@furuka, tspan, C0);

% plot(t, C);

x = fminsearch(@tebak, [0.02 0.01 0.06 40]); % beda tebakan beda jawaban, serah lu dah ah
disp("      k1        k2        k3      Z0")
disp(x);

function phi = tebak(x)
data = [0 27.61
    10 16.52
    20 10.92
    30 7.53
    40 5.37
    50 3.81
    60 2.88
    70 2.07
    80 1.68
    90 1.33];

tspan = data(:,1);
Cdata = data(:,2);
C0 = [Cdata(1) 0 0];
[~, C] = ode23(@dtebak, tspan, C0, [], x);
phi = sum((C(:,1) - Cdata).^2);
end

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

function dC = dtebak(~, C, k)
    k1 = k(1);
    k2 = k(2);
    k3 = k(3);
    Z0 = k(4);
    dC = zeros(3, 1);
    dC(1) = -k1*C(1)*(Z0-C(2)) + k2*C(2);
    dC(2) = -(k2 + k3)*C(2) + k1 * C(1)* (Z0-C(2));
    dC(3) = k3*C(2);
end
