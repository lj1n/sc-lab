
classdef Util

    methods(Static)

        function e = rmse(y_ex, y_approx, dt, t_end)
            e = sqrt(dt/t_end * sum((y_ex-y_approx).^2));
        end

    end

end
