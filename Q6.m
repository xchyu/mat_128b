count = 0;
x = 100;
xp = (x*exp(x)+1)/(exp(x)-1) -1;
while ( abs(x-xp) > 10^-6)
x = xp;
xp = (x*exp(x)+1)/(exp(x)-1) -1;
count = count + 1;
err = x - xp;
fprintf('%d %d \n', count, err);
end
count