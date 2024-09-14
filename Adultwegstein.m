clear
clc

x0 = -1000;

xtol = eps(10);

for i = 1:5

    x1 = fungsi(x0);
    
    while true
        x2 = wegstein(x0, x1);
        if abs(x2 - x1) >= xtol && abs(x2 - wegstein(x1, x2)) >= xtol
            break;
        else
            x0 = x1;
            x1 = x2;
        end
    end
    
    x0 = x2;

end

disp(x0);


function y = fungsi(x)
y = 2*cos(x)/4.5; % 4.5*x-2*cos(x) = y = 0
% harusnya x = 0,407968
end

function x2 = wegstein(x0, x1)

f0 = fungsi(x0);
f1 = fungsi(x1);

%pecah biar gampang dibaca
pembilang = x0*f1 - x1*f0;
penyebut = x0 - x1 + f1 - f0;

x2 = pembilang/penyebut;
end