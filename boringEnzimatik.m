clear
clc

tspan = 0:0.2:3;
y0 = [4 8 0 0];
[t, C] = ode23(@furuka, tspan, y0);
plot(t, C);
legend('show');

tfinal = fzero(@conversion, 2);
fprintf("Konversi 90%% terjadi saat %f jam\n", tfinal);

function tfinal = conversion(tf)
tspan = [0 tf];
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