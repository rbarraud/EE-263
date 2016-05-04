% EE 263 Practice Final Problem 5
close all; clear all;

laplacian_smoothing_data;

E = [];
M = length(Edges(:,1));
for i = 1:M,
    row = (1:n == Edges(i,1)) - (1:n == Edges(i,2));
    row = double(row);
    E = [E;row];
end

lambda = .2;

A = [eye(n); lambda^2 * E];

y_hat = A\[y; zeros(M,1)];

plot(1:n,y_hat,'r'); hold on; plot(1:n,y);