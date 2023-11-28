clear
clc

tspan = [0 4];
y0 = [25 353];

[T, y] = ode45(@furuka, tspan, y0);

subplot(211);
plot(T, y(:,1), 'r');

subplot(223);
plot(T, y(:,2), 'k');

tf = fzero(@conversion, 2);
fprintf("Waktu saat konversi 90%% %f jam\n", tf);

ua = fzero(@maximize, 350);
fprintf("Nilai UA agar Tmaks 85oC = %f J/C.jam\n", ua);

subplot(224)
[T, y] = ode45(@furuka2, tspan, y0, [], ua);
plot(T, y(:,2))

function f = conversion(tf)
tspan = [0 tf];
y0 = [25 353];

[~, y] = ode45(@furuka, tspan, y0);
C = y(end, 1);
f = 0.1*y(1)-C;
end

function f = maximize(x)
tspan = [0:0.0001:4];
y0 = [25 353];

[~, y] = ode45(@furuka2, tspan, y0, [], x);

T = y(:, 2);
Tmaks = T(1);
for i = 1:length(T)
    if T(i) > Tmaks
        Tmaks = T(i);
    end
end
f = Tmaks - 358;

end

function dy = furuka(~, y)
dy = zeros(2, 1);
ra = -5.5e3*exp(-3000/y(2))*y(1);
cp = 1087 - 0.5*y(2);
dhr = -2020;
ua = 300;
Tc = 303;
rho = 3.5;

dy(1) = ra;
dy(2) = (-dhr*abs(ra)-ua*(y(2)-Tc))/(rho*cp);
end

function dy = furuka2(~, y, ua)
dy = zeros(2, 1);
ra = -5.5e3*exp(-3000/y(2))*y(1);
cp = 1087 - 0.5*y(2);
dhr = -2020;
Tc = 303;
rho = 3.5;

dy(1) = ra;
dy(2) = (-dhr*abs(ra)-ua*(y(2)-Tc))/(rho*cp);
end