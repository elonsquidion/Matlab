% Muhammad Thahta Duta Disastra
% 13022016
clear
clc

f = adult(1);
f2 = feval(@adult, 2);
f3 = h(3, @adult);
disp(f);
disp(f2);
disp(f3);

function f = adult(a)
    if a == 1
        f = 99;
    else
        f = 100;
    end
end

function g = h(v, nf)

c = feval(nf, v);
g = 1000 + c;

end




