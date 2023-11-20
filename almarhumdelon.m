clear
clc

tspan = [0 10];
y0 = [10 0 0 0];
[t, C]= ode23(@furuka, tspan, y0);

plot(t, C(:,1), 'r');
plot(t, C(:,2), 'b');
plot(t, C(:,3), 'p');
plot(t, C(:,4), 'g');


function dy = furuka(~,y)
dy = ones(4,1);
r1 = 0.5*y(1)^2;
r2 = 0.3*y(1);
r3 = 0.1*y(2)^2;
r4 = 0.4*y(3);

dy(1) = -r1 -r2;
dy(2) = r1 - r3;
dy(3) = r2 + r3 - r4;
dy(4) = r4;
end