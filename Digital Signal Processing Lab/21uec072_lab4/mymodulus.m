function y = mymodulus(h,l)

for n = 1:l
    for i = 1:l
        index = mod(n-i,l) + 1;
        y(n,i) = h(index);
    end
end
end