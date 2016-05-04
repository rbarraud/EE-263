% EE 263 Final Problem 5
close all; clear all;

stackelberg_data;

I = eye(10);
G = 2*B-I;

q1 = .5*inv(G)*(a-c);       %q1 = q1+ .01*(1:10 == 5)';
q2 = .5*inv(B)*(a-q1-c);    %q2 = q2 + .01*(1:10 == 10)';

p = a - B*(q1 + q2);
pi1 = (p'-c')*q1
pi2 = (p'-c')*q2

(a-c)'*(inv(G)-2*inv(B))*(a-c)  
% pi2 is larger when this value is negative

% Test:

B = [.5223913368639402921013 0; 0 8];  % eigenvalues in interval [1/2 , 2/3];

I = eye(2);
G = 2*B-I;

atest = a(1:2);
ctest = c(1:2);

q1 = .5*inv(B)*(atest -ctest );     %q1 = [0;0];
q2 = .5*inv(B)*(atest -q1-ctest );  %q2 = [0;0];

q2 = q2 + .03*(1:2 == 2)';

p = atest - B*(q1 + q2);
pi1 = (p'-ctest')*q1
pi2 = (p'-ctest')*q2

(atest-ctest)'*(inv(G)-2*inv(B))*(atest-ctest)
