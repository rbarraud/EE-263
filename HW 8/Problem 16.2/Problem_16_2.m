% EE 263 Homework 8 Problem 16.2
close all; clear all;

lrmc;
% Initialization %
mu = mean(Aknown);
Ahat = mu*ones(m,n);
for i = 1:p,
    Ahat(K(i,1),K(i,2)) = Aknown(i);
end

% Iteration %
iter = 2000;
res = [];
for j = 1:iter,
    [U,S,V] = svd(Ahat);
    Snew = [S(1:r,1:n); zeros(m-r,n)];
    Atilde = U*Snew*V';
    
    Ahat = Atilde;
    for i = 1:p,
        Ahat(K(i,1),K(i,2)) = Aknown(i);
    end
    res = [res norm(Ahat-A,'fro')];
end

plot([1:1:iter],res); title('Frobenius norm convergence');