% Homework 5 Problem 8.1
close all;
clear all;

MU = logspace(-2,4);
A = [10 9 8 7 6 5 4 3 2 1; 1 1 1 1 1 1 1 1 1 1];
b = [-10;-1];

J1 = [];
J2 = [];

for i = 1:length(MU),
    mu = MU(i);
    
    Atilde = [A; sqrt(mu)*eye(10)];
    btilde = [b; ones(1,10)'];
    
    xls = Atilde\btilde;
    
    J1 = [J1 norm(A*xls - b)^2];
    J2 = [J2 norm(xls)^2];
end

plot(J1,J2);
title('Trade-off curve for P8.1');
xlabel('J1');
ylabel('J2');