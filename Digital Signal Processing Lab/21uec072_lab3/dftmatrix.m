function y = dftmatrix(N)

f = 0.1;
X = zeros(N,N);
n = 0:1:99;
x = cos(2*pi*f*n);
u = 0;

for k = 0:N-1
    u = u+1;
    for j = 0:N-1
        X(u,k+1) = X(u,k+1)+ x(j+1)*exp(-1i*2*pi*j*k*1/N);
    end
end 

y = X;


