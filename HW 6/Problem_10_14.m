% EE 263 Homework 6 Problem 10.14
close all; clear all;
sys_dynamics_matA;

[V,D] = eig(A);

x01 = V(:,1) + V(:,2);
x02 = V(:,3) + V(:,4);
x03 = [1 0 1 0]';
x04 = [0 1 0 1]';

t = 0:.1:30;

traj1 = [];
traj2 = [];
traj3 = [];
traj4 = [];
for i = 1:length(t),
    traj1 = [traj1 expm(A*t(i))*x01];
    traj2 = [traj2 expm(A*t(i))*x02];
    traj3 = [traj3 expm(A*t(i))*x03];
    traj4 = [traj4 expm(A*t(i))*x04];
end

Traj(:,:,1) = traj1; Traj(:,:,2) = traj2; Traj(:,:,3) = traj3;
Traj(:,:,4) = traj4;

for i = 1:4,
    x1 = Traj(1,:,i);
    x2 = Traj(2,:,i);
    x3 = Traj(3,:,i);
    x4 = Traj(4,:,i);
    
    subplot(221); plot(t,x1); title('x1');
    subplot(222); plot(t,x2); title('x2');
    subplot(223); plot(t,x3); title('x3');
    subplot(224); plot(t,x4); title('x4');
    pause;
end

Z = expm(A*15);             % Z for part  (c)
Y = expm(A*-20);            % Y for part  (d)
x0 = expm(A*-10)*ones(4,1); % x0 for pare (f)