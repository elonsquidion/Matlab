clear
clc


[x, C] = ode45(@furuka, [0 2], zeros(11, 1));
C(:,1) = 1;
mesh(linspace(0,1,11), x, C);

function dC = furuka(~, C)
    y = linspace(0,1,11);
    dC = zeros(11,1);
    for i = 2:11
        dC(i) = 0.01*((C(i) - C(i-1))/0.1) + y(i);
    end
end
