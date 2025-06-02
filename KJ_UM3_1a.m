% Nama: John Doe
% NIM: 13023000

CA0 = 2; % mol/liter
CB0 = 0; % mol/liter
CC0 = 0; % mol/liter

C0 = [CA0 CB0 CC0]; % mol/liter
tspan = 0:0.1:1; % menit

[t, C] = ode23(@furuka, tspan, C0);

plot(t, C);
legend('show', 'CA', 'CB', 'CC')
xlabel('Waktu (menit)')
ylabel('Konsentrasi Komponen (mol/liter)')


function dC = furuka(~, C)
CA = C(1);
CB = C(2);
CC = C(3);
dC = zeros(3,1);

dC(1) = -5*CA;
dC(2) = 5*CA - 0.5*CB + 0.75*CC^2;
dC(3) = 0.5*CB - 0.75*CC^2;
end