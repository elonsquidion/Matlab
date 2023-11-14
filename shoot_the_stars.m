clear
clc

ystar = fzero(@selisih, 0.2); % no brain
xspan = [0 1];
y0 = [0 ystar];
[x, y] = ode45(@furuka, xspan, y0);
plot(x, y);

function phi = selisih(yt)
    xspan = [0 1];
    y0 = [0 yt];
    [~, y] = ode45(@furuka, xspan, y0);
    phi = y(end, 1);
end

function dydx = furuka(x, y)
    dydx = zeros(2, 1);
    dydx(1) = y(2);
    dydx(2) = y(1) - x;
end
