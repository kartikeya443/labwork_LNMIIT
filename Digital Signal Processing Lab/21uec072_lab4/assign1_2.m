clc
clear all
close all

h = [2,1,2,1];
x = [1,2,3,4];
m = length(x);
n = length(h);
l = max(m,n);
x = [x, zeros(1,l-m)];
h = [h, zeros(1,l-n)];

% cicular convolution by self
k = mycirconv(h,l);
hmatrix_self = k*transpose(x);

% by inbuilt function
hmatrix_inbuilt = cconv(x,h,l);
