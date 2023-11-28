clear
clc

tspan = 0:0.2:3;
y0 = [4 8 0 0];
[t, C] = ode23(@furuka, tspan, y0);
plot(t, C);
legend('show');

tfinal = fzero(@conversion, 2);
fprintf("Konversi 90%% terjadi saat %f jam\n", tfinal);

tesmaks = fminbnd(@esmaks, 0, 3);
fprintf("tfinal saat ES maks adalah: %f jam\n", tesmaks);

k = fminsearch(@minimize, [2 1 1.5]);
fprintf("k1 = %f, k-1 = %f, k2 = %f\n", k(1), k(2), k(3))

function phi = minimize(k)
tspan = 0:0.2:3;
Cdata = [8 0
    3.87 0.98
    2.69 2.1
    1.76 3.11
    1.08 3.97
    0.64 4.67
    0.37 5.20
    0.22 5.58
    0.14 5.85
    0.09 6.03
    0.05 6.15
    0.04 6.24
    0.02 6.29
    0.01 6.33
    0.01 6.35
    0.01 6.37];

y0 = [4 8 0 0];
[~, C] = ode23(@furuka2, tspan, y0, [], k);
Chitung = [C(:,2) C(:,4)];
phi = sum(sum((Cdata-Chitung).^2));
end

function tfinal = esmaks(tf)
tspan = [0 tf];
y0 = [4 8 0 0];
[~, C] = ode23(@furuka, tspan, y0);
tfinal = -C(end, 3);
end

function tfinal = conversion(tf)
tspan = 0:0.2:tf;
y0 = [4 8 0 0];
[~, C] = ode23(@furuka, tspan, y0);
S0 = y0(2);
St = C(end, 2);
tfinal = 0.1*S0 - St;
end

function dy = furuka(~, y)
dy = zeros(4, 1);
k1 = 2;
kmin1 = 1;
k2 = 1.5;
dy(1) = -k1*y(1)*y(2) + kmin1 * y(3) + k2*y(3);
dy(2) = -k1*y(1)*y(2) + kmin1 * y(3);
dy(3) = k1*y(1)*y(2) - kmin1 * y(3) - k2*y(3);
dy(4) = k2*y(3);
end

function dy = furuka2(~, y, k)
dy = zeros(4, 1);
k1 = k(1);
kmin1 = k(2);
k2 = k(3);
dy(1) = -k1*y(1)*y(2) + kmin1 * y(3) + k2*y(3);
dy(2) = -k1*y(1)*y(2) + kmin1 * y(3);
dy(3) = k1*y(1)*y(2) - kmin1 * y(3) - k2*y(3);
dy(4) = k2*y(3);
end