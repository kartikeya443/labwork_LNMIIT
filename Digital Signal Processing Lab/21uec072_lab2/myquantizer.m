function y = myquantizer(x,level)

delta = (max(x)-min(x))/(level-1);
term1 = x - min(x);
term2 = term1/delta;
term3 = round(term2);
xq = min(x) + delta*term3;
y = xq;

end