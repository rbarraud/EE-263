% Vector_Time_Series_Modeling.m HW4 6.13
close all;
clear all;

vts_data;

A = [];
Y1 = [];
for i = 1:length(Y(:,1)),
    Yx = Y(i,:);
    Y1 = [Y1 Yx(1:end-1)'];
    Y2 = Yx(2:end)';
    
    a = inv(Y1'*Y1)*Y1'*Y2;
    a = [a' zeros(1,n-length(a))];
    A = [A; a];
end

% We now have our predictive matrix A.
% To find yhat, we continuously apply A to the first column of y.

yhat = [Y(:,1) A*Y(:,1:end-1)];

Err = yhat-Y;
mse = (1/(length(Y(1,:))-1))*(norm(Err,'fro')^2);
msv = (1/length(Y(1,:)))*(norm(Y,'fro')^2);

% Finally we predict y(T+1)

YT1 = A*Y(:,end);


