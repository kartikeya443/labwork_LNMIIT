close all
clear all
clc

F = 3e3;
A = 0.5;
Fs2 = 8e3;
n2 = 0:1:ceil(5*Fs2/F);
x = A.*cos(2*pi*(n2*F)/Fs2);
subplot(1,5,1);
stem(n2,x);

level = 8;
delta = (max(x)-min(x))/(level-1);

term1 = x - min(x);
subplot(1,5,2);
stem(n2,term1);

term2 = term1/delta;
subplot(1,5,3);
stem(n2,term2);

term3 = round(term2);
subplot(1,5,4);
stem(n2,term3);

y = min(x) + delta*term3;
subplot(1,5,5);
stem(n2,y);