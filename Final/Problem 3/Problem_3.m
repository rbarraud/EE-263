% EE 263 Final Problem 3
close all; clear all;

quality_control_data;

%{
% Equivalent code
% This results in the same Q
K = [];
for i = 1:n2,
    ki = A\B(:,i);
    K = [K ki];
end

X = C*K;

Q = [A B ; C X];

rank(Q)
%}
K = A\B;
X = C*K;

Q = [A B; C X];
rank(Q)         % Minimum rank of Q here is 5
                % This makes sense since rank(A) = 5

unsatisfactory_widgets = [];
for j = 1:n,
    sat = 0;
    for i = 1:m,
        if(Q(i,j) < t(i)), sat = 1; end % 1 if unsatisfactory
    end
    unsatisfactory_widgets = [unsatisfactory_widgets; sat];
end

unsatisfactory_widgets = find(unsatisfactory_widgets);