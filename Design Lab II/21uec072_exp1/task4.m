clc
clear all
close all

N_sd = 0.01;
x = 1 + 1i;
noise = complex(randn(1,1),randn(1,1));
y = x + N_sd*noise;

if (real(y) >= 0 && imag(y) >= 0)
    det = 1 + 1i;
elseif (real(y) < 0 && imag(y) >= 0)
    det = -1 + 1i;
elseif (real(y) < 0 && imag(y) < 0)
    det = -1 - 1i;
else
    det = 1 - 1i;
end

