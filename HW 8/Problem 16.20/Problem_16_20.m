% EE 263 Homework 8 Problem 16.20
close all; clear all;
grademodeldata;

[U,S,V] = svd(G);
Dinv = U(:,1);
a = V(:,1)*S(1,1);

Ghat = Dinv*a';
d = 1./Dinv;
md = mean(d);
d = d/md;
Dinv = 1./d; % This is equivalent to Dinv = Dinv * md.
a = a/md;    % Therefore we divide a by md to get the same result.

Ghat_2 = Dinv*a';
equal = (abs(Ghat_2 - Ghat) <= .001); 
% This shows Ghat_2 = Ghat even with the change (+/- quantization
% error).

J =(1/(m*n))^.5 * norm(G-Ghat,'fro');

RMS = (1/(m*n))^.5 * norm(G,'fro');
frac = J/RMS;