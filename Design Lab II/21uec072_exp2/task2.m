clc
clear all
close all

N = 1e6;
x1 = randi(2,1,N) - 1;
x = 2*x1 - 1;
snr_db = 0:3:30;
snr_lin = 10.^(snr_db/10);

errorth = 1/2*(1 - sqrt(snr_lin./(2 + snr_lin)));
n_sd = 1./sqrt(snr_lin);
noise = complex(randn(1,N),randn(1,N));
h = sqrt(1/2)*complex(randn(1,N),randn(1,N));

for i = 1:length(snr_db)
    y = h.*x + n_sd(i).*noise;
    det = y./h>0;
    error(i) = sum(abs(x1-det).^2)/N;
end

semilogy(snr_db,error,'-*');
hold on;

semilogy(snr_db,errorth,'-o');
hold off;
grid on;