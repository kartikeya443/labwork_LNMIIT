clc;
clear all;
close all;

N = [2,4,8,16,128];
speed_fac = zeros(length(N));

for i = 1:length(N)
    speed_fac(i) = 2*N(i)/log2(N(i));
end

figure()
stem(N,speed_fac);
title("21uec072");