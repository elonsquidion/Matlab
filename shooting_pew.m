clear
clc

rspan = [0.05 0.1];
T1 = 300;
fungsi = @(Ttebak) shoot(rspan, T1, Ttebak);
Tstar = fzero(fungsi, 100);

[r, T] = ode45(@furuka, rspan, [400 Tstar]);
plot(r, T(:,1));

function phi = shoot(rspan, T1, Ttebak)
    [~, T] = ode45(@furuka, rspan, [400 Ttebak]);
    T1tebak = T(end, 1);
    phi = T1tebak - T1;
end

function dT = furuka(r, T)
    % d2T/dr2 + 1/r dT/dr = 0
    dT = zeros(2, 1);
    dT(1) = T(2); % dT1 = T2
    dT(2) = -1/r * T(2); % dT2 + 1/r T2 = 0
end