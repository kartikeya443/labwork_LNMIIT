%assign 1
f=3e3;
t=linspace(0,5/f,1000);
A=0.5;
y=A.*cos(2*pi*f*t);
subplot(4,1,1);
plot(t,y);
xlabel("t");
ylabel("y");

Fs=1e5;
f=3e3;
n=0:1:ceil(5*Fs/f);
A=0.5;
Xs = A.*cos(2*pi*f*n*(1/Fs));
subplot(4,1,2);
stem(n,Xs);
xlabel("n");
ylabel("Xs");

Fs1=1e4;
n1=0:1:ceil(5*Fs1/f);
Xs1 = A.*cos(2*pi*f*n1*(1/Fs1));
subplot(4,1,3);
stem(n1,Xs1);
xlabel("n1");
ylabel("Xs1");

Fs2=6e3;
n2=0:1:ceil(5*Fs2/f);
Xs2 = A.*cos(2*pi*f*n2*(1/Fs2));
subplot(4,1,4);
stem(n2,Xs2);
xlabel("n2");
ylabel("Xs2");



