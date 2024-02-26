clc
clear all
close all

[x, Fs] = audioread('handel.wav');
x = x';
y = x(1, 1:10000);
n = 10000;

thresh1 = [0.5, 0.75, 0.9];
thresh2 = [-0.5, -0.75, -0.9];

reconstructed_audio = zeros(1, length(y));

for k = 1:length(thresh1)
    for i = 1 : 256 : length(y)-256
        x = y(1, i:(i+255));
        dct_coeff = dct(x);
        M = length(dct_coeff);
        z = zeros (1, M);
        for j = 1:M
            if (thresh1(k) <= dct_coeff(j)) || (dct_coeff(j) <= thresh2(k))
                z(j) = dct_coeff(j);
            else
                z(j) = 0;
            end
        end
        reconstructed_audio(1, i:(i+255)) = idct(z);
    end
    error(k) = mse(y, reconstructed_audio);
end

soundsc(reconstructed_audio, Fs);
figure;
stem(thresh1, error);
xlabel("Threshold");
ylabel("Error");
title("Error v/s Threshold - 21UEC072");