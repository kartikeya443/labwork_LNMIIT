clc
clear all
close all

[x, Fs] = audioread('handel.wav');
x = x';
y = x(1, 1:25600);

thresh1 = 0.5;
thresh2 = -0.5;
reconstructed_audio = zeros(1, length(y));

for k = 1 : 256 : [length(y) - 256]
    x = y(1, k:(k+255));
    dct_coeff = dct(x);
    M = length(dct_coeff);
    z = zeros(1, M);
    for j = 1:M
        if (thresh1 <= dct_coeff(j)) || (dct_coeff(j) <= thresh2)
            z(j) = dct_coeff(j);
        else
            z(j) = 0;
        end
        reconstructed_audio(1, k:(k+255)) = idct(z);
    end
end

soundsc(reconstructed_audio, Fs);
filename = 'outputcompression.wav';
audiowrite(filename, reconstructed_audio, Fs);
clear reconstructed_audio Fs