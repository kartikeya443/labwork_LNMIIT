function [y,d] = mydft(x,N)

d = zeros(N,N);
for n = 1:N
    y(n) = 0;
    for k = 1:N
        d(n,k) = exp(-1j*2*pi*(n-1)*(k-1)/N);
        y(n) = y(n) + x(k).*d(n,k);
    end
end
end