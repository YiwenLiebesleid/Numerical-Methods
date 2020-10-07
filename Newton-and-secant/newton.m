function [p,iter,err,errtrack] = newton(f,p0,tol,maxiter,errtrack)

% Input:  f   = function
%         p0  = point to start with
%         tol = tolerance for stopping criterion
%         maxiter = maximum number of iterations
%
% Output: p   = approximated root of f on [a,b]
%         iter = total number of iterations performed
%         err = resulting error
%         errtrack = track the change of errors

syms x;
f_diff = diff(f,x);
f_diff = matlabFunction(f_diff);

pn = p0 - f(p0) / f_diff(p0);
pn_1 = p0;

iter = 1;
while abs(pn - pn_1) >= tol && iter < maxiter
    errtrack = cat(2, errtrack, [abs(pn - pn_1)]);
    iter = iter + 1;
    pn_1 = pn;
    pn = pn_1 - f(pn_1) / f_diff(pn_1);
end

p = pn;
err = abs(pn - pn_1);
errtrack = cat(2, errtrack, [err]);
