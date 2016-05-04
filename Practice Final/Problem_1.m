% EE 263 Practice Final Problem 1
close all; clear all;

stereo_calibration_data;
% part (b) %
A = [];
for i = 1:K,
    p1 = P(1,i); p2 = P(2,i);
    q1 = Q(1,i); q2 = Q(2,i);
    
    A_i = [p1*q1 p1*q2 p1 p2*q1 p2*q2 p2 q1 q2 1];
    A = [A; A_i];
end

[U,S,V] = svd(A);
f = V(:,end);
f = f/norm(f);

F = [f(1) f(2) f(3) ; f(4) f(5) f(6); f(7) f(8) f(9)];

J = 0;
for i = 1:K,
    p = [P(1,i); P(2,i); 1];
    q = [Q(1,i); Q(2,i); 1];
    res = (p'*F*q)^2;
    
    J = J + res;
end

J = J/K; % part (b) is correct %

% part (c) %
k = [];
for i = 1:N,
    p = [Pcor(:,i) ; 1];
    
    square = 10000;
    current = 0;
    for j = 1:N,
        if(sum(find(k==j)) == 0),
            
            q = [Qcor(:,j); 1];
            res_j = (p'*F*q)^2;
            if(res_j < square),
                square = res_j;
                current = j; 
            end
        end
    end
    
    k = [k current];
end
% part (c) is correct %
