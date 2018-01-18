function c = newton(x0, delta)

digits(32)

c = x0;    
fc = f(x0);                   
fprintf('   initial guess:  c=%d, fc=%d\n',c,fc)
if abs(fc) <= delta             %% check to see if initial guess satisfies
  return;                       %% convergence criterion.
end;
count = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                       %%
%% main routine                                                          %%
%%                                                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while (abs(fc) > delta)
  fpc = fprime(c);        

  if fpc==0                    %% if fprime is 0, abort.
    error('fprime is 0')        %% the error function prints message and exits
  end
  temp = c;
  c = c - fc/fpc;               %% Newton step
  err = abs(temp -4.965114231744276);
  fc = f(c);
  fprintf('   c=%.14f, fc=%d, err = %d\n',c,fc,err)
  count = count + 1;
end
%%
fprintf('   approximate zero c = %.10f, f(c) = %d, number of iterations = %d', c, f(c), count);
%%
%%
fprime(5)
fpprime(5)
fpprime(5)/(2*fprime(5))
function fx = f(x)
	fx = (5-x)*exp(x) - 5;         %% Enter your function here.
	return;
function fprimex = fprime(x)
	fprimex = (5-x)*exp(x) - exp(x); %% Enter the derivative
                             %% of your function here.
	return;
function fpprimex = fpprime(x)
    fpprimex = - 2*exp(x) - exp(x)*(x - 5);
    return;