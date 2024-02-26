clc
clear all
close all

[y,Fs] = audioread('handel.wav');

% Adding Hiss to Audio:

hiss = zeros(8,1);
hiss(3,1) = 40;
hiss(7,1) = 40; 
z = zeros(length(y),1);

for i = 1:8:length(y) - 8
    x = fft(y(i:i+7)) + hiss;
    z(i:i+7) = ifft(x);
end

audiowrite("audio_with_hiss.wav",z,Fs);

% Removing Hiss from Audio: Using Notch Filter

h = [1, -2 * cos(pi/2), 1];
y1 = conv(z,h);

audiowrite('audio_without_hiss_notch.wav',y1,Fs);