function z = myDeCompression(y, N)

z = zeros(1, N);

for k = 1:N
    temp = 0;
    for l = 1:N
        if (l==1)
            w = 1/sqrt(N);
        else
            w = sqrt(2/N);
        end
        temp = temp + (w*y(l)*cos(pi*(1/(2*N))*((2*k)-1)*(l-1)));
    end
    z(k) = temp;
end