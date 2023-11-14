clear
clc

xspan = [0 3];
y0 = [10 0 0];
[x, y] = ode45(@furuka, xspan, y0);
plot(x, y);

function dydt = furuka(~, y)
    dydt = zeros(3, 1);
    dydt(1) = -3*y(1);
    dydt(2) = 3*y(1) - 2*y(2);
    dydt(3) = 2*y(2);
end
