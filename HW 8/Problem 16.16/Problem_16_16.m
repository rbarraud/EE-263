% EE 263 Homework 8 Problem 16.16
close all; clear all;
term_by_doc;

% part (a) %
Atilde = [];
for i = 1:length(A(1,:)),
    a = A(:,i);
    a = a/norm(a);
    Atilde = [Atilde a];
end
[U,S,V] = svd(Atilde);
plot(diag(S),'*k'); title('Singular values of Atilde');

% part (b) %
students_index = find(strcmp('students',term)); % index = 53
q = double([1:1:m] == students_index)';
q = q/norm(q); % For cases where q has more than one term

c = Atilde'*q;
[c,j] = sort(-c);
c = -c;
for i = 1:5,
    disp([document{j(i)} ' : ' num2str(c(i))]);
end
disp('  '); % Clears an extra line.

% part (c) %;
s = diag(S);
S32 = [diag([s(1:32); zeros(m-32,1)]) zeros(m,m)];
S16 = [diag([s(1:16); zeros(m-16,1)]) zeros(m,m)];
S8  = [diag([s(1:8) ; zeros(m-8 ,1)]) zeros(m,m)];
S4  = [diag([s(1:4) ; zeros(m-4 ,1)]) zeros(m,m)];

Ahat32 = U*S32*V'; Ahat16 = U*S16*V'; Ahat8 = U*S8*V'; Ahat4 = U*S4*V';

% Queries %
c32 = Ahat32'*q; c16 = Ahat16'*q; c8 = Ahat8'*q; c4 = Ahat4'*q;

[x32,j32] = sort(-c32); x32 = -x32;
disp(['x32: ' document{j32(1)} '  :  ' num2str(x32(1))]);

[x16,j16] = sort(-c16); x16 = -x16;
disp(['x16: ' document{j16(1)} '  :  ' num2str(x16(1))]);

[x8 , j8] = sort(- c8); x8 = -x8;
disp(['x8: ' document{j8(1)} '  :  ' num2str(x8(1))]);

[x4 , j4] = sort(- c4); x4 = -x4;
disp(['x4: ' document{j4(1)} '  :  ' num2str(x8(1))]);