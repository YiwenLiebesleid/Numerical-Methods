function [p,p_1,iter,relerr,errtrack] = bisection(f,a,b,tol,maxiter,errtrack)

% Reference: Prof. Arnold's bisection code.
% Input:  f   = nonlinear function
%         a   = left endpoint of x interval
%         b   = right endpoint of x interval
%         tol = tolerance for stopping criterion
%         maxiter = maximum number of iterations
%
% Output: p   = approximated root of f on [a,b]
%         p_1 = last approximation
%         iter = total number of iterations performed
%         relerr = resulting relative error
%         errtrack = track the change of errors

if ( sign(f(a))*sign(f(b))>=0 )
    disp('Bisection method not guaranteed to converge.')
else
    % Initialize bisection method
    p_curr = a + (b-a)/2; % first p value
    iter   = 0;
    relerr = inf;
    
    while ( relerr >= tol && iter<maxiter )
        % Update iteration
        iter = iter + 1;
        
        % Check signs to pick next subinterval
        if ( sign(f(a))*sign(f(p_curr))<0 )
            b = p_curr;
        else
            a = p_curr;
        end
        
        p_new  = a + (b-a)/2;
        relerr = abs(p_new-p_curr)/abs(p_new);
        errtrack = cat(2, errtrack, [abs(p_new-p_curr)]);
        p_1 = p_curr;
        p_curr = p_new;
    end
end

p = p_new;
