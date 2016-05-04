% EE 263 Final Problem 4
close all; clear all;
% NOTES

Theta = 0:pi/100:2*pi;
A = [2 4; 0 1];

z = [];
x = [];
mag = [];
phase = [];
for i = 1:length(Theta),
    zi = [cos(Theta(i)); sin(Theta(i))]; z = [z zi];
    xi = A*zi; x = [x xi];
    magi = norm(xi); mag = [mag magi];
    phasei = atan(xi(2)/xi(1)); phase = [phase phasei];
end

subplot(211);
plot(Theta,mag);
subplot(212);
plot(Theta,phase);

[U,S,V] = svd(A);
