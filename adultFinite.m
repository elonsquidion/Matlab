clear
clc

% du/dt + v*du/dx - d^2u/dx^2 = 0
% u(0,t) = 1
% u(1,t) = 1
% u(x=0:1,0) = 0

tspan = 0.1:0.1:0.9;
uawal = zeros(1, length(tspan)-2);

[t, u] = ode23(@pdp, tspan, uawal);

u = [ones(9, 1) u ones(9, 1)];
surf(u);
xlabel('x');
ylabel('t');
zlabel('u');

function dudt = pdp(~, u) % central method
    v = 1;
    h = 0.1;
    dudt = zeros(length(u), 1);
    dudt(1) = -v*(u(2) - 1)/(2*h) + (u(2)-2*u(1)+1)/(h^2);
    for i = 2:length(dudt)-1
        dudt(i) = -v*(u(i+1) - u(i-1))/(2*h) + (u(i+1)-2*u(i)+u(i-1))/(h^2);
    end
    dudt(end) = -v*(1 - u(end-1))/(2*h) + (1-2*u(end)+u(end-1))/(h^2);
end