clear
clc

x1 = linspace(0,1,100);
x2 = 1-x1;
y1 = zeros(1, length(x1));
y2 = zeros(1, length(x1));
T = zeros(1, length(x1));

for xi = 1:length(x1)
    T(xi) = newtonRhapson(0.001, 0.1, x1(xi));
end

function fp = Pp(T, i)
    fp = 760 - (Antoine(T,1)*i + Antoine(T,2)*(1-i));
end

function Pstar = Antoine(T,i)
    if i == 1
        Pstar = 10^(6.90565-(1211.033/(T+220.790)));
    else
        Pstar = 10^(6.95334-(1343.943/(T+219.377)));
    end
end

function dfp = dPp(T,i)
    dfp = (Pp(T+eps(1), i) - Pp(T, i))/eps(1);
end

function answer = newtonRhapson(ftol, T, i)
    t0 = T;
    iterasi = 0;
    while true
        t1 = t0 - (Pp(t0, i)/dPp(t0, i));
        f = Pp(t1, i);
        if abs(f) < ftol || iterasi >= 2
            break
        else
            t0 = t1;
        end
        iterasi = iterasi + 1;
    end
    answer = t1;
end  