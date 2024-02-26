%assign 3 - different sampling rates interpolation

f=3e3;
N=5;
A=1;
Ns=64;
Fs=[1e4,6e3,12e3,4e3,5e3];
Fs1=1e5;
n1=0:1:(Fs1/f)*N;
for i = 1:5
   n = 0:1:(Fs(i)/f)*N;
   x = A*cos(2*pi*(f*n)/Fs(i));
   b1 = 0:1:max(n);
   b2 = 0:max(n)/max(n1):max(n);
   yi1 = interp1(b1,x,b2,'linear');
   subplot(5,1,i);
   stem(yi1);
   t=sprintf("Interpolation at sampling rate %d",Fs(i));
   title(t);
end