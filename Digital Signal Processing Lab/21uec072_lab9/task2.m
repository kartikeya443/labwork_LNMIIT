clc
close all
clear all

[y,Fs] = audioread('handel.wav');

% Adding Hiss to Audio:

hiss = zeros(256,1);
hiss(66,1) = 40;
hiss(192,1) = 40;
z = zeros(length(y),1);

for i = 1:256:length(y) - 256
    x = fft(y(i:i+255)) + hiss;
    z(i:i+255) = ifft(x);
end

% Removing Hiss from Audio: Using Band Reject Filter

N = 63;
Zfilt = [ones(N,1); zeros(256 - 2 * N,1); ones(N,1)];

for i = 1:256:length(y) - 256
    x = fft(y(i:(i+255)));
    x1 = x.*Zfilt;
    filtered_audio(i:(i+255)) = real(ifft(x1));
end

audiowrite("audio_with_hiss.wav",z,Fs);
audiowrite("audio_without_hiss.wav",filtered_audio,Fs);
