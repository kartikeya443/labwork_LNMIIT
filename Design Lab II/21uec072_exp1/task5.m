clc
clear all
close all

snr_db = 20;
snr_lin = 10.^(snr_db./10);
N1 = 1e3;
N = 2*N1;
x1 = randi(2,1,N) - 1;
k = 1;

for i = 1:N1
    if (x1(k) == 0 && x1(k+1) == 0)
        x(i) = 1 + 1j;
    elseif (x1(k) == 0 && x1(k+1) == 1)
        x(i) = -1 + 1j;
    elseif (x1(k) == 1 && x1(k+1) == 0)
        x(i) = -1 - 1j;
    else
        x(i) = 1 - 1j;
    end
    k = k + 2;
end

N_sd = 0.01;
noise = complex(randn(1,N1), randn(1,N1)).*1/sqrt(2);
y = x + N_sd*noise;

for i = 1:N1
    if (real(y(i)) >= 0 && imag(y(i)) >= 0)
        det(i) = 1 + 1i;
    elseif (real(y(i)) < 0 && imag(y(i)) >= 0)
        det(i) = -1 + 1i;
    elseif (real(y(i)) < 0 && imag(y(i)) < 0)
        det(i) = -1 - 1i;
    else
        det(i) = 1 - 1i;
    end
end

error = det/N;