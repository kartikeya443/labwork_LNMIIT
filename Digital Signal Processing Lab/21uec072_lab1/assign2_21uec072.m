%assign 2 - interpolation

Fs=1e5;
f=3e3;
n=0:1:ceil(5*Fs/f);
A=0.5;
Xs = A.*cos(2*pi*f*n*(1/Fs));
Fs1=1e4;
n1=0:1:ceil(5*Fs1/f);
Xs1 = A.*cos(2*pi*f*n1*(1/Fs1));

b1 = 1:length(n1);   % 1:length(x2) --> Fs = 1e4
b2 = 1:length(n1)/length(n):length(n1);  % 1:length(x1) --> Fs = 1e5
y = interp1(b1,Xs1,b2);
subplot(2,1,1);
stem(y);
title("Interpolation");

fft1 = fft(Xs);
subplot(2,1,2);
stem(abs(fft1));
title("FFT");

