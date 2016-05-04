% EE 263 Midterm Problem 2
close all;
clear all;

l1_irwls_data;

A = [ones(1,m)' t];
X0 = A\y;

scatter(t,y); hold on; plot(t,A*X0, 'r');

iter = 100;
Xold = [];
Xnew = X0;
for i = 1:iter,
    Xold = Xnew;
    W = [];
    for j = 1:m,
        w = 1/abs((A(j,:)*Xold - y(j)));
        if w==inf, w = 10^15;, end;
        %This is here to ensure full rank even when A(j,:)*Xold = y(j).
        W = [W w];
    end
    W = diag(W);
    Xnew = (W*A)\(W*y);
    if norm(Xnew-Xold,1) <= 10^-6, break, end
end

plot(t,A*Xnew,'k');
title('Iteratively reweighted least squares');
xlabel('t'); ylabel('y');