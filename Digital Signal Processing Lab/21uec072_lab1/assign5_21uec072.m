%assign 5 - simulink

Fs=1e5;
f=3e3;
n=0:1:ceil(5*Fs/f);
A=0.5;
Xs = A.*cos(2*pi*f*n*(1/Fs));
stem(n,Xs);