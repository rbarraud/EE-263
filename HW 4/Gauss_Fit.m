% Gaussian_Fit.m HW4 7.1
close all;
clear all;

gauss_fit_data;
subplot(211)
plot(t,y);
% initial guess
p = [12 ; 50 ; 50];
% This initial guess comes from seeing that the center is roughly in the
% middle of the graph (100/2), the amplitude at that point is fluctuating
% between about 9 and 15, so I chose 12, and the spread was about 1/2 the
% size I wanted when I tried plotting with spread 20, so I doubled the
% spread to 40, and it looked like a decent estimate.

E = [];
iter = 100;
convT = .025;
for i = 1:iter,
    a = p(1);
    mu = p(2);
    sigma = p(3);
   
    %hold on;
    yhat = (a*exp(-(t'-mu).^2./sigma^2));
    %plot(t,yhat, '-');

    %Find A = D(r_i):
    A = [exp((t'-mu).^2./sigma^2);
        (2*a*(t'-mu)./sigma^2).*exp((t'-mu).^2./sigma^2);
        (2*a*(t'-mu).^2./sigma^3).*exp((t'-mu).^2./sigma^2)]';

    r = yhat' - y;
    E = [E ((1/N)*norm(r))^(1/2)];

    b = A*p - r;

    pnew = inv(A'*A)*A'*b;
    %If left out, the program will run iter times
    % convT is the convergence threshhold.
    if norm(p - pnew) < convT break, end;
    p = pnew;
end
hold on;
plot(t,yhat,'red');

subplot(212);
plot([1:1:i],E);