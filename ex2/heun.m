
function y = heun(y_0, dt, t_end, f)
    n=round(t_end/dt);
    y= zeros(1,n+1);
    y(1)=y_0;
    for i=1:n 
        y_prime_i= f(dt*(i-1), y(i));
        y_prime_next=f(dt*i, y(i)+dt*y_prime_i);
        y(i+1)= y(i) + 0.5* dt*(y_prime_i+y_prime_next);
    end
end
