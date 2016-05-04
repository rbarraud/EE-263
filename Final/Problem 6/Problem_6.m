% EE 263 Final Problem 6
close all; clear all;
fingerprint_data;

[Uy,Sy,Vy] = svd(Y*X','econ');
Qy = Vy*Uy';
Y = Qy*Y;

[Uz, Sz, Vz] = svd(Z*X','econ');
Qz = Vz*Uz';
Z = Qz*Z;

norm(X-Y,'fro')^2           %343.4862
norm(X-Z,'fro')^2           %605.7872

% Adding t vector to each fingerprint.

% Since Y = Qy*Y and Z = Qz*Z has already been implemented, we
% can use X - Z instead of X - Qz*Z for Z.
ytilde = reshape(X - Y,2*N,1);
ztilde = reshape(X - Z,2*N,1);

A = [];
for i = 1:N,
    A = [A; eye(n)];
end

ty = A\ytilde;
tz = A\ztilde;

Y = Y + ty*ones(1,N);
Z = Z + ty*ones(1,N);
subplot(121);
plot(X(1,:) , X(2,:) , 'kx' , ...
     Y(1,:) , Y(2,:) , 'ro'); ...
axis image;
subplot(122);
plot(X(1,:) , X(2,:) , 'kx' , ...     
     Z(1,:) , Z(2,:) , 'gs');
axis image;

Ey = norm(X-Y,'fro')^2;     % Ey = 62.2050
Ez = norm(X-Z,'fro')^2;     % Ez = 472.8925

