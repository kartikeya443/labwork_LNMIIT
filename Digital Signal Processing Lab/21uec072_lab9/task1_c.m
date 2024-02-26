clc
close all
clear all

M = 31;
wc = pi/2;

% Band Pass Filter

% Rectangle

for n = 0:M 
    r = @(w) exp(-1i*w*(n-(M-1)/2));
    q = integral(r,-pi/2,-pi/4);
    y(n+1) = (1/(2*pi))*q;
    w = 1;
    h1(n+1) = y(n+1).*w;
end    

figure;
freqz(h1);
title("Rectangle - Magnitude");

% Hamming

for n = 0:M 
    r = @(w) exp(-1i*w*(n-(M-1)/2));
    q = integral(r,-pi/2,-pi/4);
    y(n+1) = (1/(2*pi))*q;
    w(n+1) = 0.42 - 0.5*(cos(2*pi*n/(M-1))) + 0.08*cos(4*pi*n/(M-1));
    h2(n+1) = y(n+1).*w(n+1);
end    

figure;
freqz(h2);
title("Hamming - Magnitude");

% Blackman

for n = 0:M 
    r = @(w) exp(-1i*w*(n-(M-1)/2));
    q = integral(r,-pi/2,-pi/4);
    y(n+1) = (1/(2*pi))*q;
    w(n+1) = 0.54 - 0.46*(cos(2*pi*n/(M-1)));
    h3(n+1) = y(n+1).*w(n+1);
end    

figure;
freqz(h3);
title("Blackman - Magnitude");
