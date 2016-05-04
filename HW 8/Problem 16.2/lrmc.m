% Low rank matrix completion.
clear all;
m = 120; % num of users
n = 120; % num of movies
r = 4; % rank of A

% generate random A with rank r
rand('state',0);
A = rand(m,r)*rand(r,n);

% random K
[i,j] = find(rand(m,n) < 20/n); % roughly 20 ratings per user
K = [i,j];
p = size(K,1);

% find Aknown
Aknown = zeros(p,1);
for i = 1:p
    Aknown(i) = A(K(i,1),K(i,2));
end
