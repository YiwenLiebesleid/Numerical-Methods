function [p,iter,err,errtrack] = secant(f,p0,p1,tol,maxiter,errtrack)

% Input:  f   = function
%         p0  = point 0 to start with
%         p1  = point 1 to start with
%         tol = tolerance for stopping criterion
%         maxiter = maximum number of iterations
%
% Output: p   = approximated root of f on [a,b]
%         iter = total number of iterations performed
%         err = resulting error

pn = p1 - f(p1)*(p1 - p0) / (f(p1) - f(p0));
pn_1 = p1;
pn_2 = p0;

iter = 1;
while abs(pn - pn_1) >= tol && iter < maxiter
    errtrack = cat(2, errtrack, [abs(pn - pn_1)]);
    iter = iter + 1;
    pn_2 = pn_1;
    pn_1 = pn;
    pn = pn_1 - f(pn_1)*(pn_1 - pn_2) / (f(pn_1) - f(pn_2));
end

p = pn;
err = abs(pn - pn_1);
errtrack = cat(2, errtrack, [err]);
