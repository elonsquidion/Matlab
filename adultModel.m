clear
clc

data = [0 2; 1 4.5; 2 5.7; 3 7.5; 4 9.9; 5 12; 6 14];
xdata = data(:,1);
ydata = data(:,2);
fk = @(k) sum((ydata-k(1)*xdata-k(2)).^2);

k = fminsearch(fk, [2 2]);
ymodel = k(1)*xdata+k(2);

scatter(xdata, ydata);
hold on
plot(xdata, ymodel);