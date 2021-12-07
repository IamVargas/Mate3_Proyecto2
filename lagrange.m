function p = lagrange(x,y)
n = length(x);
p = zeros(1,n);
for k = 1:n
    num = poly(x([1:k-1,k+1:n]));
    den = polyval(num,x(k));
    L = num/den;
    p = p+y(k)*L;
end
end