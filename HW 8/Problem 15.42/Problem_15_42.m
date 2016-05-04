% EE 263 Homework 8 Problem 15.42
close all; clear all;

twoD_proj_data;
A = A-mean(A,2)*ones(1,N);
[U,S,V] = svd(A);
Q = U(:,1:2);
proj = Q'*A; % Note this is equivalent to Ux\A.
axis equal;
plot(proj(1,:),proj(2,:),'*'); 

J = 0;
for i = 1:N,
    for j = 1:N,
        J = J + norm([proj(1,i) proj(2,i)] - [proj(1,j) proj(2,j)])^2;
    end
end

% Orthonormality check % The matrix is orthonormal (as expected) %
Q(:,1)'*Q(:,2)
norm(Q(:,1))
norm(Q(:,2))

Q \ eye(n) % should equal U_reduced'