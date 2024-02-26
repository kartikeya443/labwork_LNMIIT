close all
clear all
clc

F = 3e3;
A = 0.5;
Fs2 = 8e3;
n2 = 0:1:ceil(5*Fs2/F);                                                                        
x = A*cos(2*pi*(n2*F)/Fs2);

y1 = myquantizer(x,16);
y2 = myquantizer(x,32);
y3 = myquantizer(x,64);

noise1 = mse((y1-x).^2);
subplot(1,3,1);
stem(noise1);
noise2 = mse((y2-x).^2);
subplot(1,3,2);
stem(noise2);
noise3 = mse((y3-x).^2);
subplot(1,3,3);
stem(noise3);

