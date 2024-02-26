function Im1 = myCompression(Im)

Im1 = zeros(64,64);
Im1(1:64,1:64) = Im(128:(128+63),128:(128+63));
[m,n] = size(Im1);
beta(1) = sqrt(1/n);
beta(2:n) = sqrt(2/n);

for k = 1:m
    for l = 1:n
        temp = 0;
        for i = 1:m
            for j = 1:n
                temp = temp + (Im1(i,j)*cos(pi*((2*i)-1)*(k-1)/(2*n))*cos(pi*((2*j)-1)*(l-1)/(2*n))*beta(k)*beta(l));
            end
        end
        y(k,l) = temp;
    end
end


