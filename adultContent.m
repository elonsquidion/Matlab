x1 = linspace(-1, 1, 1000);
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

function dp = dPp(T, i)
    eps = 1e-6;
    dp = (f(T + eps, i) - f(T, i)) / eps;
end

function t1 = newtonRhapson(ftol, T, i)
    t0 = T;
    while true
        t1 = t0 - (f(t0, i) / dPp(t0, i));
        ft = f(t1, i);
        if abs(ft) < ftol
            break;
        else
            t0 = t1;
        end
    end
end

function z = f(x, y)
    z = 2.8*x^2*(x^2*(2.5*x^2+y^2-2)+1.2*y^2*(y*(3*y-0.75)-6.0311)+3.09) + 0.98*y^2*((y^2-3.01)*y^2+3) - 1.005;
end