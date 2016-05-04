% EE 263 Homework 7 Problem 15.21
close all; clear all;
% part (a) %
N= 99;
A = [.9 .5; -.5 .7];
B = [1;  -1];

K = [];
for i = 1:N,
    new = [];
    for j = 1:50,
        if i-j >= 0,
            new = [new A^(i-j)*B];
        else
            new = [new zeros(2,1)];
        end
    end
    K = [K; new];
end

C = [1 2];
D = [];
for i = 1:N,
    new = [zeros(1,2*(i-1)) C zeros(1, 2*(N-i))];
    D = [D; new];
end

F = D*K;

[M,S,V] = svd(F); % M used so U is not confused.
U = V(:,1);
U = U/norm(U);

max_energy = norm(F*U);
%plot(U); xlabel('t'); ylabel('u(t)'); title('Worst case input for u(t)');
plot(F*U); xlabel('t'); ylabel('u(t)'); title('Worst case output for u(t)');
%{
% part (b) %
K = [];
for i = 1:50,
    K = [K A^(100-i)*B];
end
G = C*K;

[M,S,V] = svd(G);
U = V(:,1);
U = U/norm(U);

y_100 = abs(G*U);
plot(U); xlabel('t'); ylabel('u(t)'); title('u(t) maximizer for |y(100)|');

%}