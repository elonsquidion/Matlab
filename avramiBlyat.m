clear
clc

data = [360 0.1055
    370 0.2010
    380 0.3425
    390 0.5146
    400 0.6757
    410 0.8026
    420 0.8924
    430 0.9544
    440 0.9888];

T = data(:, 1);
alfa = data(:, 2);
T0 = 338.75;
b = 10;
A0 = 5000;
E0 = 30000;
x0 = [A0 E0];

avrami = @(T, x) furuka(x(1), T, T0, b, x(2));

x = fminsearch(@(x) minimize(x, T, alfa, avrami), x0);

fprintf("A = %f\n", x(1));
fprintf("E = %f\n", x(2));

Thitung = linspace(350, 450, 1000);
alfaHitung = zeros(size(Thitung));
for i = 1:length(Thitung)
    alfaHitung(i) = avrami(Thitung(i), x);
end


plot(Thitung, alfaHitung);
hold on;
scatter(T, alfa);

xlabel('T (K)');
ylabel('alfa');

function phi = minimize(x, T, alfa, avrami)
alfaHitung = zeros(size(alfa));
for i = 1:length(T)
    alfaHitung(i) = avrami(T(i), x);
end
phi = sum((alfa-alfaHitung).^2);
end

function alf = furuka(A, T, T0, b, E)
R = 8.314;
alf = 1-exp(-(A*(T-T0)/b*exp(-E/(R*T))));
end
