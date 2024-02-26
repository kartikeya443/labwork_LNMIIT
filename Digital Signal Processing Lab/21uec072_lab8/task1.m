clc
close all
clear all

x = [1,2];
N = length(x);
w = exp(-1i*2*pi/N);

z = zeros(1,N);
z(1) = x(1) + x(2);
z(2) = x(1) - x(2);

%inbuilt function
y = fft(x);

disp(z);
disp(y);