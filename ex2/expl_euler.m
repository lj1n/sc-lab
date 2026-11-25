 
function y = expl_euler(y_0, dt, t_end, f)
    n=round(t_end/dt); 
    y= zeros(1,n+1);
    y(1)=y_0;
  
    for i=1:n 
        y(i+1)= y(i) +dt*f(dt*(i-1), y(i));
    end
end
    