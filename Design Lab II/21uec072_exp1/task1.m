clc
clear all
close all

snr_db = 20;
snr_lin = 10.^(snr_db/10);
N_sd = 1/sqrt(snr_lin);

N = 1e3;
x1 = randi(2,1,N) - 1;
x = 2*(x1) - 1;
noise = complex(randn(1,N),randn(1,N));

y = x + N_sd*noise;
det = y>0;

error = sum(abs(x1 - det).^2)/N