function c = bisect(a, b, delta)
format long
%% Input: 	a 	the left endpoint of the interval
%% 		b 	the right endpoint of the interval
%% 		delta	the tolerance/accuracy we desire
%%
%% Output:	c 	the approxmiation to the root of f
%% 
%% Syntax:	bisect(a, b, delta)
%%
%% Notes:  
%% 		1. Don't use eps as a variable.  eps is an internal
%% 			MATLAB routine in some versions of MATLAB.
%%		2. The code defining f comes after the code defining
%%			bisect, since bisect depends on f.
%%		3. By default, MATLAB only displays 5 digits.  You can
%%			change this by issuing the command "format long".
%%			See "help format" for more details.
%%

fa = f(a); 			%% compute initial values of f(a) and f(b)
fb = f(b); 

if  sign(fa) == sign(fb)	%% sanity check: f(a) and f(b) must have different
				%% signs
				%% 
				%% the error function prints an error message and
				%% exits
	error('f must have different signs at the endpoints a and b.  Aborting.')
end
fprintf('   initial interval:  a=%d, b=%d, fa=%d, fb=%d\n',a,b,fa,fb)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                       %%
%% main routine                                                          %%
%%                                                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while ( abs(b - a) > 2*delta )	%% While the size of the interval is
				%% larger than the tolerance

	c = (b + a)/2;		%% Set c to be the midpoint of the interval

	fc = f(c);		%% Calculate the value of f at c

	if sign(fc) ~= sign(fb)	%% If f(c) and f(b) are of different sign, then
				%% f must have a zero between c and b (by the 
				%% Intermediate Value Theorem).
		a = c; 	fa = fc;
	else 			%% This is the case where f(a) and f(c) are of 
				%% different sign.
			        %%	
		b = c;	fb = fc;
	end
				%% Repeat the algorithm on the new interval
        seg = b - a;
        root = (b+a)/2;
        fprintf('   a=%d, b=%d, f(a)=%d, f(b)=%d, interval length = %d \n',a,b,fa,fb,seg);
end

fprintf('   approximate zero c = %.8f, f(c) = %d', root, f(root));
%%
%% put subroutines here
%%
%%
function fx = f(x)
	fx = (5-x)*exp(x) - 5;  %% Enter your function here.
	return;