function poly = lagrange(xpts,ypts,xeval)

% MA 510 / CS 522: Numerical Methods
% Instructor: Prof. Andrea Arnold
%
% Function to generate Lagrange interpolating polynomial at values xeval
% that passes through points (xpts,ypts)
%
% Input: xpts  = x points
%        ypts  = y points
%        xeval = evaluate polynomial at these x values
%
% Output: poly = Lagrange interpolating polynomial


N = length(xpts);
L = ones(N,length(xeval));

% Generate Lagrange functions L_k(x) for each point xeval
for k = 1:N
    for i = 1:N
        if (i ~= k)
            L(k,:) = L(k,:).*(xeval-xpts(i))/(xpts(k)-xpts(i));
        end
    end
end

% Generate Lagrange interpolating polynomial
poly = 0;

for k = 1:N
    poly = poly + ypts(k)*L(k,:);
end

