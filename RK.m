% Muhammad Thahta Duta Disastra
% 13022016

clear
clc

% Data umpan
F1 = 10;
z1 = 0.5;
z2 = 1- z1;

% Data tangki
T = 16 + 273;
Prank = 4;
x0 = 0.2; % Tebakan awal

% Koefisien
A1 = 3.98292;
B1 = 819.296;
C1 = 24.417;

A2 = 4.3281;
B2 = 1132.108;
C2 = 0.918;

P1 = Pfunc(T, A1, B1, C1);
P2 = Pfunc(T, A2, B2, C2);

while 1
    X = funx(x0, P1, P2, Prank);
    if abs(X) < 0.0001^2
        xril = x0;
        break
    else
        xph = x0 + 0.00001;
        fph = funx (xph, P1, P2, Prank);
        df = (fph-X)/0.00001;
        x1 = x0 - X/df;
        x0 = x1;
    end
end

% Mencari fraksi liquid propana
xpro = xril;
xbut = 1 - xpro;

ypro = P1/Prank * xpro;
ybut = 1- ypro;

% Mencari volume liquid

L = (z1 * F1 - ypro*F1)/(xpro-ypro);
V = F1 - L;

fprintf("Jadi, volume uap campuran adalah %f,\nvolume liquid campuran adalah %f,\nfraksi mol liquid propana dan isobutana" + ...
    "masing-masing adalah %f dan %f\n" + ...
    "fraksi mol gas propana dan isobutana adalah %f dann %f", V,L, xpro, xbut, ypro, ybut)


function Pi = Pfunc(Targ, Aarg, Barg, Carg)
    Pi = 10^(Aarg - Barg/(Targ - Carg));
end

function X = funx (x0, P1, P2, P)
   X = x0 - (P - P2)/(P1-P2);
end


    