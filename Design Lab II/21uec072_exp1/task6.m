clc
clear all
close all

snr_db = 0:1:10;
snr_lin = 10.^(snr_db./10);
N_sd = 1./sqrt(snr_lin);

N = 1e6;
x1 = randi(2,1,N) - 1;
x = 2*(x1) - 1;
L = length(snr_db);

error = zeros(1,L);
error_theory = qfunc(sqrt(snr_lin));
noise = complex(randn(1,N),randn(1,N));

for i=1:L
    N_sd(i) = sqrt(1/snr_lin(i));
    y = x + N_sd(i)*noise;
    det = y>0;
    error(i) = sum(abs(x1-det).^2)/N;
end

semilogy(snr_db, error_theory, '-+');
hold on
semilogy(snr_db, error, '-o')
grid on
