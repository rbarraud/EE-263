% EE 263 Midterm Problem 5
close all;
clear all;
classify_polytopes_data;

Degen = [];
Orig = [];
for i = 1:N,
    p = P(:,:,i);
    %scatter(p(1,:),p(2,:));
    k = [p(1,:) - p(1,1)*ones(1,n+1); p(2,:) - p(2,1)*ones(1,n+1)];
    %scatter(k(1,:), k(2,:));
    Degen = [Degen; rank(k) < 2];
    v = null(p);
    o = mean((abs(v) == v)) == 1;
    Orig = [Orig; o];
end

D_indices = find(Degen);
O_indices = find(Orig);
