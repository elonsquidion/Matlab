h = 0.2;

x = linspace(1, 100, 10000);
y0 = 1;


for i = 1:100
    k1 = dydx(x(i), y(i));
    k2 = dydx(x(i)+0.5*h, y(i)+0.5*h*k1);
    k3 = dydx(x(i)+0.5*h, y(i)+0.5*h*k2);
    k4 = dydx(x(i)+h, y(i)+h*k3);
    y(i+1) = y(i) + h * (k1 + 2*k2+ 2*k3 + k4)/6;
end

% [x, y] = ode45(@dydx, x, y0); % shortcut

plot(x,y)

function df = dydx(x, y)
    df = y - 2*sin(x);
end
