clear
clc

data = [3 5.1
    5 6.8
    10 12.7
    30 24.5
    90 36.7];

x = [30 30];
xstar = fminsearch(@minimize, x);

disp(xstar);

fv = @(s) (xstar(2)*s)/(xstar(1) + s);

s = 1:0.001:100;
v = zeros(size(s));

for i = 1:length(s)
    v(i) = fv(s(i));
end

plot(s,v);
hold on;
scatter(data(:,1), data(:,2));

function phi = minimize(x)

data = [3 5.1
    5 6.8
    10 12.7
    30 24.5
    90 36.7];

s = data(:,1);
vdata = data(:,2);
km = x(1);
vm = x(2);

vhitung = zeros(size(vdata));

for i = 1:length(vhitung)
vhitung(i) = (vm*s(i))/(km + s(i));
end

phi = sum((vhitung - vdata).^2);

end