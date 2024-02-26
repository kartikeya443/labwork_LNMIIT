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

y = mymodulus(h,l);
[x_f,D8] = mydft(x,l);
h_f = D8*y*inv(D8);

% compute Yf and Y
Yf = h_f*x_f';
Y = inv(D8)*Yf;

% compare with circular convulation
Y_function = cconv(h,x,l);
