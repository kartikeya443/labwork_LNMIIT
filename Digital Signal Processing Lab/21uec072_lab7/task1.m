clc
clear all
close all

x = audioread('handel.wav');
x = x';
y = x(1, 1:21000);
dct_coeff = dct(y);
z = idct(dct_coeff);

soundsc(z);