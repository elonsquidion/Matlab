% Nama: John Doe
% NIM: 13023000

CA0 = 2; % mol/liter
CB0 = 0; % mol/liter
CC0 = 0; % mol/liter

C0 = [CA0 CB0 CC0]; % mol/liter
ttebak = [0 1]; % menit

tfinal = fminbnd(@minimize, ttebak(1), ttebak(2),[],C0);

fprintf("Waktu yang dibutuhkan adalah %f\n", tfinal)
% bisa jadi ada 2 jawaban: 0,529348 dan 0,618099. Keduanya valid
% tergantung kekuatan MATLAB masing-masing wkkwwkwk.
% intinya liat aja sih, algoritmanya bener apa kagak. bisa jadi ada jawaban
% lain

function phi = minimize(tfinal, C0)
tspan = 0:0.1:tfinal; % menit
% tspan = [0 tfinal] juga valid. Gak diminta step untuk poin b.
[~, C] = ode23(@furuka, tspan, C0);
CBt = C(end, 2);
phi = -CBt;
end

function dC = furuka(~, C)
CA = C(1);
CB = C(2);
CC = C(3);
dC = zeros(3,1);

dC(1) = -5*CA;
dC(2) = 5*CA - 0.5*CB + 0.75*CC^2;
dC(3) = 0.5*CB - 0.75*CC^2;
end