x1 = 0:0.001:1;
y1 = zeros(size(x1));
P = zeros(size(x1));
T = 310;

for i = 1:length(x1)
    Psat = antoine(310);
    P(i) = x1(i) * Psat(1) + (1 - x1(i)) * Psat(2);
    y1(i) = (x1(i) * Psat(1))/P(i);
end

plot(x1, P, 'DisplayName', 'P-x1');
hold on;
plot(y1, P, 'DisplayName', 'P-y1');
legend('show');
legend('Position', 'best');

function P = antoine(T)
P = zeros(2, 1);
P(1) = exp(16.6 - (3640)/(T - 33.4));
P(2) = exp(14.3 - (2670)/(T - 53.4));
end