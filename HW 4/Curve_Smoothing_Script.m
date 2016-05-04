% HW 4 Problem 7.3: Curve Smoothing
close all;
clear all;
curve_smoothing;

A = [];
h = [1 -2 1];
for i = 1:n-2,
    a = [zeros(1,i-1) h zeros(1,n-i-2)];
    A = [A; a];
end

C = [];
D = [];
for i = 1:30,
    mu = i^2;
    g = optimize(f,A,mu);
    c = (1/n)*norm(f-g)^2;
    d = (n^4/(n-2)) * norm(A*g)^2;
    C = [C c];
    D = [D d];
end

plot(C,D);
title('Trade-off curve between C and D');
xlabel('C');
ylabel('D');
pause;

% Plotting result against f for mu = 0, mu = inf
% mu = 0
t = [1/n:1/n:1];
g = f;
plot(t,g,'-');

% mu = inf
A = [t' ones(1,n)'];

y = inv(A'*A)*A'*f;
a = y(1);
b = y(2);

g = a*t+b;
hold on;
plot(t,g,'red');

title('Fitted curves for mu = 0 and mu = inf');
xlabel('t');
ylabel('g');


