clc;
close all;
clear all;

N = 10^3;
x1 = randi([0, 1], 1, N);
x = 2*x1-1;

h1 = 1/sqrt(2)*complex(randn(1,1), randn(1,1));
h2 = 1/sqrt(2)*complex(randn(1,1), randn(1,1));

noise1 = sqrt(1/2)*complex(randn(1,N),randn(1,N));
noise2 = sqrt(1/2)*complex(randn(1,N),randn(1,N));

y1 = h1.*x + 0.*noise1;
y2 = h2.*x + 0.*noise2;

combine_vector = h1.*y1 + h2.*y2;
nh = conj(h1).*h1 + conj(h2).*h2;
detected = (combine_vector./nh)>0;

error = sum(abs(x1-detected).^2)/N