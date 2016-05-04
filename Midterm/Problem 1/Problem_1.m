% EE 263 Midterm Problem 1
close all;
clear all;

min_energy_job_sched_data;

C = [];
for i = 1:T,
    C = [C (s<=i & f>=i)];
end

Theta_b = [];
for i = 1:n,
    theta_b_i = w(i)/(f(i)-s(i)+1)*C(i,:);
    Theta_b = [Theta_b; theta_b_i];
end
best = norm(Theta_b,'fro');


x = C'*inv(C*C')*w;
norm(x)


Theta = x*pinv(w);