% EE 263 Homework 8 Problem 16.1
close all; clear all;
% part (b) %
bs_det_data;
A = Y*Y';
[U,S,V] = svd(A);
S = diag(S);
w = S(1)*U(:,1)/T;
hist(w'*Y,50); title('Histogram for w^TY');

st = sign(w'*Y);

error_rate = min(sum(st == s)/T, sum(st == -s)/T)
if error_rate == sum(st == -s)/T,
    st = -st;
end