clear
clc

tspan = [0, 10];
y0 = 1;

[x, y] = ode78(@f, tspan, y0);

plot(x, y);

function dydx = f(x, y)
dydx = sin(x*y) + x*y^2 - 10;
end