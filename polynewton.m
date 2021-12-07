function p = polynewton(x,y)
M = tabladif(x,y);
n = length(x);
b = M(1,2:end);
p = b(1);
for k=2:n
    p = [0 p]+b(k)*poly(x(1:k-1));
end
end

function M = tabladif(x,y)
n = length(x);
M = zeros(n);
M(1:n,1) = y;
for k = 1:n-1
    Delta_x = x(k+1:n)-x(1:n-k);
    Delta_y = diff(y)./Delta_x;
    M(1:n-k,k+1) = Delta_y;
    y = Delta_y;
end
M = [x M];
end