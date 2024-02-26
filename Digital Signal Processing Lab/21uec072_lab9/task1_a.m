clc
clear all
close all

wc = pi/2;
M = 31;

% Low Pass Filter:

% Rectangle

for n = 0:M
    r = @(w) exp(-1i*w*(n-(M-1)/2));
    q = integral(r, -wc, wc);
    y(n+1) = (1/(2*pi))*q;
    w = 1;
    h1 = y.*w;
end

figure;
freqz(h1);
title("Rectangle - Magnitude");

% Hamming -

for n = 0:M 
    r = @(w) exp(-1i*w*(n-(M-1)/2));
    q = integral(r,-wc,wc);
    y(n+1) = (1/(2*pi))*q;
    w(n+1) = 0.42 - 0.5 * cos(2*pi*n/(M - 1)) + 0.08 * cos(4*pi*n/(M - 1));
    h2(n+1)=y(n+1).*w(n+1);
end    

figure;
freqz(h2);
title("Hamming - Magnitude");

% Blackman

for n=0:M 
    r= @(w) exp(-1i*w*(n-(M -1)/2));
    q=integral(r,-wc, wc);
    y(n+1)=(1/(2*pi))*q;
    w(n+1) = 0.54 - 0.46 * cos(2*pi*n/(M - 1));
    h3(n+1)=y(n+1).*w(n+1);
end    

figure;
freqz(h3);
title("Blackman - Magnitude");
