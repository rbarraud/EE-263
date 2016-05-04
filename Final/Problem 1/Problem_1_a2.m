% EE 263 Final Problem 1 Attempt #2
close all; clear all;

opt_ctrl_data;
T1 = 5000;
T2 = 10000;
% Step 1: Generate D and E.
D = [];
for i = 1:T1,
    D = [A^(i-1)*B D];
end
E = C*[D zeros(size(B,1), size(B,2)*(T2-T1))];

% Step 2: Generate F.
F = [];
for i = 1:T2,
    F = [A^(i-1)*B F];
end

% Step 3: Generate P, the projection matrix onto Null(F)
[U,S,V] = svd(F);

Snew = eye(T2);
n = size(S);
Snew(1:n,1:n) = zeros(n,n);

P = V*Snew*V';      % Projection onto the null space of F

% Step 4: Generate u
G = E*P;
[U,S,V] = svd(G);
v = V(:,1);
u = P*v;
u = u/norm(u);
norm(E*u)           % Optimal norm reported here is 0.8699.

% Step 5: Generate trajectory plot
p = [0;0];
x = zeros(4,1);
for i = 1:T2,
    x = A*x + B*u(i);
    p = [p C*x];
end

plot(p(1,:),p(2,:)); title('trajectory of p(t) for 0 < t <{T_2}');
hold on; plot(p(1,1),p(2,1),'Ok'); plot(p(1,T1+1),p(2,T1+1),'Or');
p(:,T1+1)   % p(:,1) = p(0) so p(:,T1+1) = p(T1)
            % p(T1) = [-0.7980 ; -0.3464].