clear
clc

xspan = [0 2];
C0 = ones(1, 11);

y = 0:0.1:1;

[x, C] = ode45(@(xs, c0) furuka(xs, c0, y), xspan, C0);

surf(y, x, C);

function dC = furuka(~, C, y)
    dC = zeros(11,1);
    for i = 2:11
        dC(i) = 0.01*((C(i) - C(i-1))/0.1) + y(i);
    end
end


