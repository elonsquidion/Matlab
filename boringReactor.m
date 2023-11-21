clear
clc

zspan = [0 7];
y0 = [100, 380];
[z, y] = ode78(@furuka, zspan, y0);
plot(z,y(:,1), 'DisplayName', 'CA (mol/m^3)');
hold on;
plot(z,y(:,2), 'DisplayName', 'T (K)');
legend('show', 'Location', 'best');
xlabel('z (m)');

function dC = furuka(~, y)
dC = zeros(2, 1);
dC(1) = -5.186/2*exp(-1020/y(2))*y(1);
dC(2) = 3.125*(5.186*exp(-1020/y(2))*y(1))+0.5*(380-y(2));
end

