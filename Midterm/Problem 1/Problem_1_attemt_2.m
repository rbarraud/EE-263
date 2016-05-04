% EE 263 Problem 1 Attempt 2
close all;
clear all;

min_energy_job_sched_data;

M = [];
for i = 1:T,
    M = [M (s<=i & f>=i)];
end

C = [];
W = [];
for i = 1:n,
    c = [zeros(1,(i-1)*T) M(i,:) zeros(1,(n-i)*T)];
    C = [C; c];
    W = [W w(i)*eye(T)];
end

C = [];
W = [];
for i = 1:n,
    c = [zeros(1,(i-1)*T) M(i,:) zeros(1,(n-i)*T)];
    C = [C; c];
    W = [W w(i)*eye(T)];
end

rho = 100;
A = [W; sqrt(rho)*C];
b = [zeros(T,n*T); C] * sqrt(rho)*.5*ones(n*T,1);
d = ones(n,1);

G = inv(A'*A);

x = G*(A'*b - C'*inv(C*G*C')*(C*G*A'*b -d));

Theta = [];
for i = 1:n,
    Theta = [Theta x(T*(i-1)+1:i*T)];
end
plot_job_sched(Theta);

E = norm(Theta*w)^2