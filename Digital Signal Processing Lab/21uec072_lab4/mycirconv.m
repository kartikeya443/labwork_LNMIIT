function y = mycirconv(h,l)

num = 0;
for i = 1:l
    if i == 1
        y(:,i) = h(:);
        num = y(l,i);
    else
        y(1, i) = num;
        y(2:l,i) = y(1: l-1, i-1);
        num = y(l, i);
    end
end