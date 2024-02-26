close all
clear all
clc

F = 3e3;
A = 0.1:0.1:1;
Fs2 = 8e3;
n2 = 0:1:ceil(5*Fs2/F);                                                                        
x = 0.5.*cos(2*pi*(n2*F)/Fs2);

y1 = myquantizer(x,64);
noise = mse((y1-x).^2);
sqnr = ((A.^2)/2)/noise;
stem(A,sqnr);