clear
clc

kstar = fminsearch(@minimize, [0 0 0]);
fprintf("k = %f\n", kstar(1));
fprintf("n = %f\n", kstar(2));
fprintf("m = %f\n", kstar(3));

data = [0 .1039; 3.15 .08; 4.1 .079; 6.2 0.776; 8.2 .0701; 10 .0639; 13.5 .0529; 18.3 .0353; 26 .027; 30.8 0.0207];
tspan = data(:, 1);
CAdata = data(:, 2);

C0 = [CAdata(1), 5];

[t, C] = ode45(@(t, C) furuka(t, C, C0, kstar), tspan, CAdata(1));

disp(C);
plot(t, C);

function phi = minimize(k)
data = [0 .1039; 3.15 .08; 4.1 .079; 6.2 0.776; 8.2 .0701; 10 .0639; 13.5 .0529; 18.3 .0353; 26 .027; 30.8 0.027];
tspan = data(:, 1);
CAdata = data(:, 2);

C0 = [CAdata(1), 5];
[~, C] = ode45(@(t, C) furuka(t, C, C0, k), tspan, C0(1));

phi = 0;

for i = 1:length(CAdata)
    phi = phi + (C(i) - CAdata(i))^2;
end

end

function dC = furuka(~, C, C0, k)
CA = C(1);
CB = C0(2) - (C0(1)-CA);
dC = -k(1)*CA.^k(2)*CB.^k(3);
end