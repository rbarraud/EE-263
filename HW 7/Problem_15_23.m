% EE 263 Homework 7 Problem 15.23
close all; clear all;
% part (b) %
A = [2 3; 3 1];
S = inv(A)^2;

eq = [];
for theta = 0:pi/100:2*pi,
    x = [cos(theta); sin(theta)];
    y = A*x;
    z = y'*S*y;
    eq = [eq abs(z-1) < .001];
end

equality = mean(eq)

% part (a) / (c) %
%A1 = inv(S)^.5; % inv(S)^.5 gives [2 1; 1 2], not [1 2; 2 1].
A1 = [3.288 1.4796; 1.4796 2.7948];

eq1 = [];
for theta = 0:pi/100:2*pi,
    x = [cos(theta); sin(theta)];
    y = A1*x;
    z = y'*S*y;
    eq1 = [eq1 abs(z-1) < .001];
end
equality1 = mean(eq1)

% Sanity check for part c %
x = [cos(0:pi/100:2*pi); sin(0:pi/100:2*pi)];
y = A*x; z = A1*x;
plot(y(1,:),y(2,:)); hold on; plot(z(1,:), z(2,:), 'r');