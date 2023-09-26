ut = 0.17;
g = 9.8;
rhop = 1200;
rho = 1000;
Dp = 5E-3;
miu = 0.001;
Cd = 0;
ftol = 1e-10;

while true
    Nre = (rho*ut*Dp)/miu;

    if (Nre < 0.2)
        Cd = 24/Nre;
    elseif (Nre < 500)
        Cd = (24/Nre)*(1+0.5*Nre^0.687);
    elseif (Nre < 200000)
        Cd = 0.44;
    else
        Cd = 0.1;
    end

    ut_new = sqrt((4*9.8*(1200-1000)*5E-3)/(3*Cd*1000));
    delta = ut_new - ut;

    ut = ut_new;

    fprintf("Nre = %f, Cd = %f, ut = %f\n", Nre, Cd,ut);

    if delta <= ftol
        break
    end

end