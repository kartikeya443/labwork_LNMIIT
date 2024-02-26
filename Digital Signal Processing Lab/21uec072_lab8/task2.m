clc
close all
clear all

x = [1,2,3,4];
N = length(x);
w = exp(-1i*2*pi/N);

z = zeros(1,N);
k11 = x(1) + x(3);
k12 = x(1) - x(3);
k21 = x(2) + x(4);
k22 = x(2) - x(4);

z(1) = k11 + k21;
z(2) = k12 + k22*w;
z(3) = k11 - k21;
z(4) = k12 - k22*w;

%inbuilt function
y = fft(x);

disp(z);
disp(y);
