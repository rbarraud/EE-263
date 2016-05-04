close all;
clear all;
% HW 4 Problem 6.7: Deconvolution
deconv_data;

% Finding the matrix H such that Y = H*U
h1 = [zeros(1,length(y)-length(h)) h'];
% H is the Toeplitz Matrix of the convolution by h.
H = [];
for k = 1:length(y),
    H = [H; h1(length(y)-k+1:end) zeros(1,length(y)-k)];
end

G = inv(H'*H)*H';
z = G*y;
%hist(z);

sqres = norm(abs(z) - ones(1,length(z))')

% Now that we have a working estimate for x, we can use this to solve for a
% length 20 system function with delay D = 12.

% delayCheck run on D = 12 gives a delay of 8. Finguring the system delay 
% was inversely proportional to D, I changed D to L-D. This yielded
% the correct result. 
L = 20;
D = 13;
D = L-D;


Ysys = [];
for i = L:length(y),
    Ysys = [Ysys; y(i:-1:i-L+1)'];
end

Xsys = z(1+D:length(y)-L+1 + D);
g20 = inv(Ysys'*Ysys) *Ysys' * Xsys;
%g20 = flipud(g20);
xx = conv(g20,y);
%hist(xx);

xx = xx(13:end-13);
sqres = norm(abs(xx) - ones(1,length(xx))')
% The square residual from +1 of the positive entries and -1 of the
% negative entries is 1.3451. This is less than the square residual for
% the linear estimate inv(H'*H)*H' for H being the Toeplitz Matrix of h.

delayCheck = conv(g20,h);
% The current form of g20 gives a proper 12 unit delay 
% (delayCheck(13) ~= 1).

% Generating Plots
subplot(211)
stem(h);
title('stemplot of impulse response h[n]');
subplot(212)
stem(g20);
title('stemplot of impulse response g[n]');

pause;
subplot(211)
hist(y);
title('Amplitude distribution for y');
subplot(212)
hist(xx);
title('Amplitude distribution for z');