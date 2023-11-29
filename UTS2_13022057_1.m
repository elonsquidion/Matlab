% Nama : Delon Khaerun Alief
% NIM : 13022057

tspan = [0 10];
C0 = [2 0 0 0];

[t, C] = ode23(@furuka, tspan, C0);

plot(t, C);
legend('A', 'B', 'C', 'D');
title('Distribusi Konsentrasi Komponen Reaktor')
xlabel('t (menit)');
ylabel('Konsentrasi (mol/L)');

function dCdt = furuka(~, C)
r1 = 0.4*C(1)^2; % mol/L.menit
r2 = 0.45*C(1); % mol/L.menit
r3 = 0.25*C(3); % mol/L.menit
r4 = 0.65*C(2)^(1.5); % mol/L.menit
r5 = 0.1*C(2); % mol/L.menit

dCdt = zeros(4, 1);
dCdt(1) = - r1 - r2;
dCdt(2) = r1 + r3 - r4 - r5;
dCdt(3) = r2 - r3 + r4;
dCdt(4) = r5;
end