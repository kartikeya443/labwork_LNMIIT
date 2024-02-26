clc
close all
clear all

snr_db = 0:3:30;
snr_lin = 10.^(snr_db./10);
N = 10^6;
n = 1./sqrt(snr_lin);
h1 = 1/sqrt(2)*complex(randn(1,N), randn(1,N)); 
h2 = 1/sqrt(2)*complex(randn(1,N), randn(1,N));
noise1 = complex(randn(1,N),randn(1,N));
noise2 = complex(randn(1,N),randn(1,N));
x1 = randi([0, 1], 1, N);
x = 2*x1 - 1;

% theoritical = factorial
L = 2;
ber_theory = factorial(2*L-1)/(factorial(L).*factorial(2*L-1-L));
%ber_theory=nchoosek(2*L-1,L);
ber_theory = ber_theory.*(1./(2*snr_lin)).^L;

for i = 1:length(snr_db)
    n_sd=n(i);
    sim("sim_exp3.slx")
    err(i) = ans.error; 
end

figure;
semilogy(snr_db,err,'-o');
hold on
semilogy(snr_db,ber_theory,'-+')
grid on;

