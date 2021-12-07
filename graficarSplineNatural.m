function graficarSplineNatural(S,X)
for i = 1:length(S)
    xx = linspace(X(i),X(i+1),100);
    yy = S(i,1)*(xx-X(i)).^3+S(i,2)*(xx-X(i)).^2+S(i,3)*(xx-X(i))+S(i,4);
    plot(xx,yy)
end
end

