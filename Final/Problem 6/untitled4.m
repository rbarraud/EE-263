% EE 263 Final Prolem 6
close all; clear all;

% fingerprint_data;

A = [8 9; 4 2];

Theta = [];
mag = [];
for theta = 0:.01*pi:2*pi,
    Q = [cos(theta) sin(theta); -sin(theta) cos(theta)];
    Theta = [Theta theta];
    mag = [mag trace(A*Q)];
end
for theta = 0:.01*pi:2*pi,
    Q = [cos(theta) sin(theta); sin(theta) -cos(theta)];
    Theta = [Theta theta];
    mag = [mag trace(A*Q)];
end
plot(Theta,mag);

max(mag)
theta = Theta(find(mag == max(mag)))

Q = [cos(theta) sin(theta); -sin(theta) cos(theta)];


[U,S,V] = svd(A);

