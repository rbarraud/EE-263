% Homework 5 Problem 8.14
close all;
clear all;

h = .1;
a = .1;
K = 100;

w1 = [2; 2];
w2 = [-2; 3];
w3 = [4; -3];
w4 = [-4; -2];

k1 = 10;
k2 = 30;
k3 = 40;
k4 = 80;

A = [1 0 h 0; 0 1 0 h; 0 0 1-a 0; 0 0 0 1-a];
B = [0 0; 0 0; h 0; 0 h];

% A1
A1 = [];
for ki = 1:k1-1,
    A1 = [A1 A^(k1-1-ki)*B];
end
z1 = [zeros(1,200-2*(k1-1))];
z1 = [z1;z1;z1;z1];
A1 = [eye(2);0 0; 0 0]'*[A1 z1];

%A2
A2 = [];
for ki = 1:k2-1,
    A2 = [A2 A^(k2-1-ki)*B];
end
z2 = [zeros(1,200-2*(k2-1))];
z2 = [z2;z2;z2;z2];
A2 = [eye(2);0 0; 0 0]'*[A2 z2];


%A3
A3 = [];
for ki = 1:k3-1,
    A3 = [A3 A^(k3-1-ki)*B];
end
z3 = [zeros(1,200-2*(k3-1))];
z3 = [z3;z3;z3;z3];
A3 = [eye(2);0 0; 0 0]'*[A3 z3];

%A4
A4 = [];
for ki = 1:k4-1,
    A4 = [A4 A^(k4-1-ki)*B];
end
z4 = [zeros(1,200-2*(k4-1))];
z4 = [z4;z4;z4;z4];
A4 = [eye(2);0 0; 0 0]'*[A4 z4];


Aall = [A1;A2;A3;A4];
W = [w1;w2;w3;w4];

f = Aall'*inv(Aall*Aall')*W;
J = norm(f)^2

f1 = [];
f2 = [];
for i = 1:length(f),
    if (mod(i,2)) == 0,
        f2 = [f2; f(i)];
    else
        f1 = [f1; f(i)];
    end
end
f = [f1 f2];

subplot(211); plot(f(:,1)); title('Force over time'); ylabel('Force');
subplot(212); plot(f(:,2)); ylabel('Force');

pause;


% Plotting p
x = [0;0;0;0];
for i = 1:K,
    xnext = A*x(:,i) + B*[f(i,1); f(i,2)];
    x = [x xnext];
end

close all;
p = [eye(2);0 0; 0 0]'*x;
plot(p(1,:),p(2,:));
title('trajectory'); xlabel('p1'); ylabel('p2');




