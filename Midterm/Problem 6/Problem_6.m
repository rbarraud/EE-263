% EE 263 Midterm Problem 6
close all;
clear all;
meta_analysis_data;


A_long = [];
Y = [];
for i = 1:k,
    A_long = [A_long; A{i}];
    Y = [Y; A{i}*xhat{i}];
end

x = A_long\Y;