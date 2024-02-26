clc
clear all
close all

snr_db = 20;
snr_lin = 10.^(snr_db/10);
N_sd = 1/sqrt(snr_lin);

N = 1e6;
x1 = randi(2,1,N) - 1;
x = 2*(x1) - 1;

h = (1/sqrt(2)).*complex(randn(1,N),randn(1,N));
noise = complex(randn(1,N),randn(1,N));

y = h.*x + N_sd.*noise;
det = (y./h) > 0;

error = sum(abs(x1 - det).^2)/N