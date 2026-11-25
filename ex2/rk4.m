function y = rk4(y_0, dt, t_end, f)
    n=round(t_end/dt); 
    y= zeros(1,n+1);
    y(1)=y_0;
    for i = 1:n
        t = dt*(i-1);

        k1 = f(t,y(i));
        k2 = f(t+dt/2,y(i)+dt/2*k1);
        k3 = f(t+dt/2,y(i)+dt/2*k2);
        k4 = f(t+dt,y(i)+dt*k3);

        y(i+1) = y(i) + dt/6*(k1+2*k2+2*k3+k4);
    end
end



