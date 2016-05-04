function [g] = optimize(f,A, mu)
%OPTIMIZE Minimizes d + mu*c for the given mu.
%   f is the function to be fitted.
%   A is the matrix such that c = ||n^2/sqrt(n-2) A*g||^2 
%   mu is the trade off preference parameter

n = length(f);

Atilde = [eye(n)/sqrt(n); A*(1/mu)*(n^2)/sqrt(n-2)];
ytilde = [f/sqrt(n); zeros(1,n-2)'];

g = inv(Atilde'*Atilde)*Atilde'*ytilde;

end
