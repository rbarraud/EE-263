% EE 263 Final Problem 1
close all; clear all;

opt_ctrl_data;

Theta = [];
mag = [];
U = [];
for theta = 0:.001*pi:pi,
    D1 = [];
    for i = 0:T1-1,
        D1 = [(A^i)*B D1];
    end
    H = C*D1;

    target = [cos(theta); sin(theta)];
    u = H\target;
    x = D1*u;
    pT1 = C*x;
    xf = (A^(T2-T1))*(-x);


    % D2 advances the input in time from T1 to T2.
    D2 = [];
    for i = 0:T2-1-T1,
        D2 = [(A^i)*B D2];
    end
    H2 = C*D2;

    u2 = D2\xf;
    u_total = [u; u2];
    
    Theta = [Theta theta];
    mag = [mag norm(u_total)];
    
    U = [U u_total];
    
end

plot(Theta,mag);


% Trajectory plot %
theta = Theta(find(mag == min(mag)));
target = [cos(theta) sin(theta)];
u = U(:,find(mag == min(mag)));
u = u/norm(u);

E = [];
for t = 1:T2
    D = [];
    for i = 1:t,
        D = [(A^(i-1))*B D];
    end
    D = [D zeros(n,(T2-t))];
    E = [E; D];
end
xl = E*u;

x = [];
for i = 1:T2,
    x = [x xl((i-1)*n+1:i*n)];
end
p = C*x;

plot(p(1,:),p(2,:));

norm(p(:,T1))

