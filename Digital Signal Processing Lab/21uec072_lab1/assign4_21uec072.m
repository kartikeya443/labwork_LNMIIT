%assign 4 - different interpolation techniques

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

y1 = interp1(b1,Xs1,b2);
subplot(4,1,1);
stem(y1);

y2 = interp1(b1,Xs1,b2,"pchip");
subplot(4,1,2);
stem(y2);

y3 = interp1(b1,Xs1,b2,"spline");
subplot(4,1,3);
stem(y3);

y4 = interp1(b1,Xs1,b2,"nearest");
subplot(4,1,4);
stem(y4);