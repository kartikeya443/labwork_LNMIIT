clc
clear all
close all

[x, Fs] = audioread('handel.wav');
x = x';
y = x(1, 1:10000);
n = 10000;

dct_coeff_inbuilt = dct(y);
my_dct_coeff = myCompression(y, n);
M = length(dct_coeff_inbuilt);
N = length (my_dct_coeff);
z1 = zeros (1, M);
z2 = zeros (1, N);

thresh1 = 0.5;
thresh2 = -0.5;

for i = 1:M
    if (thresh1 <= dct_coeff_inbuilt(i)) || (dct_coeff_inbuilt(i) <= thresh2)
        z1(i) = dct_coeff_inbuilt(i);
        z2(i) = my_dct_coeff(i);
    else
        z1(i) = 0;
        z2(i) = 0;
    end
end

reconstructed_audio1 = idct2(z1);
soundsc(reconstructed_audio1, Fs);

reconstructed_audio2 = myDeCompression(z2, N);
soundsc(reconstructed_audio2, Fs);

error1 = mse(y, reconstructed_audio1)
error2 = mse(y, reconstructed_audio2)