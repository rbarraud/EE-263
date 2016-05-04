% EE 263 Homework 8 Problem 15.26
close all; clear all;
ellip_bdry_data;

Xnew = [];
for i = 1:N,
    x = X(:,i);
    xnew = [x(1)^2 2*x(1)*x(2) 2*x(1)*x(3) 2*x(1)*x(4) x(2)^2 2*x(2)*x(3) ...
            2*x(2)*x(4) x(3)^2 2*x(3)*x(4) x(4)^2];
    Xnew = [Xnew; xnew];
end

b = ones(N,1);
Avect = Xnew\b;

A = [Avect(1) Avect(2) Avect(3) Avect(4); ...
     Avect(2) Avect(5) Avect(6) Avect(7); ...
     Avect(3) Avect(6) Avect(8) Avect(9); ...
     Avect(4) Avect(7) Avect(9) Avect(10)];
 
res = [];
for i = 1:N,
    x = X(:,i);
    z = x'*A*x;
    res = [res z];
end
hist(res,20); title('Histgram of x^TAx');

rms(1-res)