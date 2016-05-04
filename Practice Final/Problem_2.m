% EE 263 Practice Final Problem 2
close all; clear all;

nuc_react_dyn_data;

% initial conditions %
T = 100*52;
t = 1/52:1/52:T/52;
Phi = zeros(1,length(t));
power = zeros(1,length(t));
R = zeros(1,length(t));
N = N0;
phi = 0;
C = A + phi*B;
k = 0;

for i = 1:T,
    R(i) = d'*N;
    if(i <= T_life*52),
        power(i) = phi*c'*N;
        if(power(i) < P_min),
            phi = P_max/(c'*N);
            k = k+1;
        end
        Phi(i) = phi;
        
        N = expm((1/52)*(A+phi*B))*N;
    else,
        N = expm(A/52)*N;
    end
end

subplot(311); plot(t(t<=T_life),power(t<=T_life));
subplot(312); plot(t(t<=T_life),Phi(t<=T_life));
subplot(313); plot(t,R);

[Rmax J] = max(R);
Rthresh = .05*Rmax;

index = find(R <= Rthresh & t > t(J));
T5 = t(index(1))




