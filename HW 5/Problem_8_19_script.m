% Homework 5 Problem 8.19
close all;
clear all;

ls_classify_data;

A = [X' ones(1,N)'];
wv = A\y;
w = wv(1:n);
v = wv(end);

yhat = sign(w'*Xtest + v*ones(1,N));
yhat = yhat';

correct = sum(yhat == ytest);
fpos    = sum((yhat == 1) & (ytest == -1));
fneg    = sum((yhat == -1) & (ytest == 1));