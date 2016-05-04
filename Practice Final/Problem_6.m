% EE 263 Practice Final Problem 6
close all; clear all;
k = 0; Tdes = 500*ones(100,1);
res = [];
%{
for i = 1:10,
    p = zeros(1,10);
    p(i) = 10;
    T = surface_heating_sim(p); k = k+1;
    error = T-(Tdes*ones(100,1));
    residual = norm(error)^2;
    res = [res residual];
end
%}

for alpha = 1:10,
    p = alpha*ones(1,10);
    T = surface_heating_sim(p); k = k+1;
    error = T-Tdes;
    residual = norm(error)^2;
    res = [res residual];
end

minimum = find(res == min(res));
res = [];

for alpha = minimum-1:.1:minimum+1,
    p = alpha*ones(1,10);
    T = surface_heating_sim(p); k = k+1;
    error = T-Tdes;
    residual = norm(error)^2;
    res = [res residual];
end

index = find(res == min(res));
alpha_opt = minimum-1+.1*(index-1);

p0 = alpha_opt*ones(1,10);
gamma = .5;

T0 = surface_heating_sim(p0); k = k+1;
E0 = norm(T0-Tdes)^2;

iter = 4;
for k = 1:iter,
    A = [];
    for i = 1:10,
        p = p0; p(i) = p(i) + gamma;
        A = [A (surface_heating_sim(p)-T0)./gamma]; k = k+1;
    end
    delp = A\(500-T0);
    p0 = p0 + delp';
    T0 = surface_heating_sim(p0); k = k+1;
end

T = surface_heating_sim(p0); k = k+1;
error = norm(T-Tdes)/10;














