format compact
syms x;
f(x) = log(x);
x0 = 1;
% val = 1.2;
VALs = [0.8:0.05:1.75];
% tolerance = 1e-5;
TOLs = [1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];

CNTs = [];

for ind=1:1:30		% for every x value and tolerance cases
    if(ind <= 20)	% set value for val and tolerance
        val = VALs(ind);
        tolerance = 1e-5;
    else		% set value for val and tolerance
        val = 1.2;
        tolerance = TOLs(ind-20);
    end
    
    counter = 0;		% counter is the N value
    
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
    
    while error >= tolerance		% until meets tolerance, keep doing things above
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
    end
    
    disp (ind)
    disp ("N =")
    disp (counter)
    CNTs = cat(2,CNTs,[counter]);
end

% plot figures
subplot(1,2,1)
plot(VALs, CNTs(1:20), '-b.')
xlabel('xval'), ylabel('N'), title('N value of xvals'),

subplot(1,2,2)
plot(TOLs, CNTs(21:30), '-r.')
set(gca,'xscale','log')
xlabel('tols in log scale'), ylabel('N'), title('N value of tolerances')
