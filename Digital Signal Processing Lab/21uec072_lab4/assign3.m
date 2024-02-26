clc
clear all
close all

x = [1,2,3,4,5,6,7,8];
h = [2,1,2,1,2,1,2,1];
m = length(x);
n = length(h);
l = max(m,n);
x = [x, zeros(1,l-m)];
h = [h, zeros(1,l-n)];

p = mydft(x,m);
q = mydft(h,n);
c = p.*q;
o = length(c);

% DFT multiplication
dftmult = myidft(c,o);
% circular convolution
circularconv = cconv(x,h,l);
