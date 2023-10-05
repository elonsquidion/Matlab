x1 = linspace(0, 1, 100);
x2 = 1 - x1;
y1 = zeros(1, length(x1));
y2 = zeros(1, length(x1));
T = zeros(1, length(x1));
Ki = zeros(1, length(x1));

for xi = 1:length(x1)
    T(xi) = newtonRhapson(0.00001, 6, x1(xi));
    Psat = Antoine(T(xi), 1);
    Ki(xi) = Psat / 760;
    y1(xi) = Ki(xi) * x1(xi);
end

plot(x1, T);
hold on;
plot(y1, T);
hold off;
xlabel("Mole Fraction Benzene for P = 1 atm");
ylabel('T');


function Pstar = Antoine(T, i)
    if i == 1
        Pstar = 10^(6.90565 - (1211.033 / (T + 220.790)));
    else
        Pstar = 10^(6.95334 - (1343.943 / (T + 219.377)));
    end
end

function P = Pp(T, i)
    P = 760 - (Antoine(T, 1) * i + Antoine(T, 2) * (1 - i));
end

function dp = dPp(T, i)
    eps = 1e-6;
    dp = (Pp(T + eps, i) - Pp(T, i)) / eps;
end

function t1 = newtonRhapson(ftol, T, i)
    t0 = T;
    while true
        t1 = t0 - (Pp(t0, i) / dPp(t0, i));
        f = Pp(t1, i);
        if abs(f) < ftol
            break;
        else
            t0 = t1;
        end
    end
end

