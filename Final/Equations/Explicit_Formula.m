% EE 263

% Explicit formula for 
% x(n+1) = Ax(n) + Bu(n)
% y(n) = Cx(n) + Du(n);

% Sol'n => Y = [y(0) y(1) ... y(t-1)]'
%       => U = [u(0) u(1) ... u(t-1)]'

%  Y = O_t * x(0) + T_t * U;

A, B, C, D = []; % some matrices A B C D


O_t = []; T_t = [];

p = length(U);
k = length(D(1,:));

for i = 1:p,
    O_t_new = C*(A^(i-1));
    O_t = [O_t; O_t_new];
    
    new = [];
    for j = 1:i-1,
        new = [new C*(A^(i-j-1))*B];
    end
    new = [new D zeros(1,(p-i)*k);
end