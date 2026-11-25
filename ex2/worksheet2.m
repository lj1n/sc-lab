
% main file 

%a)
lmbd = -1;
t=linspace(0,5,100);

x= exp(lmbd *t);
figure;
plot(t,x);
xlabel("t");
ylabel("x");
title("analytical sol. to Dahlquist's test eq.");




%b) see files

%c) 


f=@(t,y) lmbd*y;
y_0=1;
t_end = 5;
dts=[1, 0.5,0.25,0.125];
errors = struct();

figure;
plot(t,x, DisplayName="analytical sol")
hold on;


% expl_euler:
for i=1:4
    dt=dts(i);
    y=expl_euler(y_0,dt, t_end,f);
    disp(y)
    t_num=0:dt:t_end;
    plot(t_num, y, '*-', DisplayName=sprintf("euler, dt = %.3f", dt));

    y_exact = exp(lmbd*t_num);
    errors.euler(i) = Util.rmse(y_exact, y, dt ,  t_end);
     
end
xlabel('t');
ylabel('y(t)');
title('explicit euler method');
legend;
hold off;


figure;
plot(t,x, DisplayName="analytical sol")
hold on;
% heun:
for i=1:4
    dt=dts(i);
    y=heun(y_0,dt, t_end,f);
    disp(y)
    t_num=0:dt:t_end;
    plot(t_num, y, '*-', DisplayName=sprintf("heun, dt = %.3f", dt));

    y_exact = exp(lmbd*t_num);
    errors.heun(i) = Util.rmse(y_exact, y, dt ,  t_end);

end
xlabel('t');
ylabel('y(t)');
title('heun method');
legend;
hold off;




figure;
plot(t,x, DisplayName="analytical sol")
hold on;
% rk4:
for i=1:4
    dt=dts(i);
    y=rk4(y_0,dt, t_end,f);
    disp(y)
    t_num=0:dt:t_end;
    plot(t_num, y, '*-', DisplayName=sprintf("rk4, dt = %.3f", dt));

    y_exact = exp(lmbd*t_num);
    errors.rk4(i) = Util.rmse(y_exact, y, dt ,  t_end);

end
xlabel('t');
ylabel('y(t)');
title('rk4  method');
legend;
hold off;

%approx err
red_euler=errors.euler(1:3)./errors.euler(2:4);
red_heun=errors.heun(1:3)./errors.heun(2:4);
red_rk4= errors.rk4(1:3)./errors.rk4(2:4);

tableEuler=table(dts',errors.euler', [NaN red_euler]', 'VariableNames', {'dt', 'Err', 'ErrRed'});
tableHeun=table(dts',errors.heun', [NaN red_heun]', 'VariableNames', {'dt', 'Err', 'ErrRed'});
tableRK4=table(dts', errors.rk4',[NaN red_rk4]','VariableNames',{'dt','Err', 'ErrRed'});

disp('expl euler');
disp(tableEuler);
disp('heun');
disp(tableHeun);
disp('rk');
disp(tableRK4);