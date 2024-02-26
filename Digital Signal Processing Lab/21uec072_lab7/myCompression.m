function y = myCompression(x, N)

y = zeros(1,N);

for k = 1:N
    if (k==1)
        w = 1/sqrt(N);
    else
        w = sqrt(2/N);
    end
    temp = 0;
    for l = 1:N
        temp = temp + (x(l)*cos(pi*(1/(2*N))*((2*l)-1)*(k-1)));
    end
    y(k) = w*temp;
end