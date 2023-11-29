% Nama : Delon Khaerun Alief
% NIM : 13022057

P2tebak = [200 900];
P2 = fminbnd(@minimize, P2tebak(1), P2tebak(2));
Wminimal = minimize(P2);

fprintf("Nilai P2 optimal adalah %f kPa\n", P2);
fprintf("Nilai W minimum yang dimaksud adalah %f kW\n",Wminimal);

P2plot = 200:0.01:900;
W2plot = zeros(size(P2plot));

for i = 1:length(W2plot)
    W2plot(i) = minimize(P2plot(i));
end

plot(P2plot,W2plot);
title('Pengaruh P2 Terhadap W');
xlabel('P2 (kPa)');
ylabel('W (kW)');

function W = minimize(P2)
k = 1.5;
P1 = 200; % kPa
P3 = 900; % kPa
V1 = 0.3; % m^3/detik

W = k/(k-1)*P1*V1*((P2/P1)^((k-1)/k)+(P3/P2)^((k-1)/k)-2);
end