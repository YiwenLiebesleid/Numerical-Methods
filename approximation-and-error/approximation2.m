syms x;
f(x) = log(x);
x0 = 1;
val = 1.2;
tolerance = 1e-5;

VALs = [1.2:0.2:2, 2.02];

rel_errors = [];

for val=VALs		% for every x values
    
    counter = 0;
    
	% initialization
    curr_diff = f(x);
    curr_mul = 1;
    curr_fact = 0;
    pn = log(x0);
    
	% compute derivative and factorial for the new term
    curr_diff = diff(curr_diff);
    dd = matlabFunction(curr_diff);
    dd = dd(x0);
    curr_mul = curr_mul*(x-x0);
    mm = matlabFunction(curr_mul);
    mm = mm(val);
    curr_fact = curr_fact + 1;
    pn = pn + dd * mm / (factorial(curr_fact));
    
    error = abs(pn - log(val));
    error_track = [error];		% keep track of the error for later plot
    while counter < 100		% until meet times
        counter = counter + 1;
        curr_diff = diff(curr_diff);
        dd = matlabFunction(curr_diff);
        dd = dd(x0);
        curr_mul = curr_mul*(x-x0);
        mm = matlabFunction(curr_mul);
        mm = mm(val);
        curr_fact = curr_fact + 1;
        pn = pn + dd * mm / (factorial(curr_fact));
        
        error = abs(pn - log(val));
        rel_error = error / abs(log(val));
        error_track = cat(2, error_track, [rel_error]);
    end
    
    rel_errors = cat(1, rel_errors, error_track);
end


Xaxis = logspace(0,101, 101);

subplot(3,2,1)
loglog(Xaxis,rel_errors(1,:))		% loglog plot
% plot([1:1:101], rel_errors(1,:), '-b.')
xlabel('N'), ylabel('error'), title('error value of Ns, 1.2'),

subplot(3,2,2)
% loglog(Xaxis,rel_errors(2))
plot([1:1:101], rel_errors(2,:), '-b.')
xlabel('N'), ylabel('error'), title('error value of Ns, 1.4'),

subplot(3,2,3)
% loglog(Xaxis,rel_errors(2))
plot([1:1:101], rel_errors(3,:), '-b.')
xlabel('N'), ylabel('error'), title('error value of Ns, 1.6'),

subplot(3,2,4)
% loglog(Xaxis,rel_errors(3))
plot([1:1:101], rel_errors(4,:), '-b.')
xlabel('N'), ylabel('error'), title('error value of Ns, 1.8'),

subplot(3,2,5)
% loglog(Xaxis,rel_errors(3))
plot([1:1:101], rel_errors(5,:), '-b.')
xlabel('N'), ylabel('error'), title('error value of Ns, 2.0'),

subplot(3,2,6)
loglog(Xaxis,rel_errors(6,:))		% loglog plot
% plot([1:1:101], rel_errors(6,:), '-b.')
xlabel('N'), ylabel('error'), title('error value of Ns, 2.02'),
