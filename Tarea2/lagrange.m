Y = [122 130 135 160 175 190 200];
X = [0 10 20 30 40 50 60];
f = lagrange(X,Y);

xx = 0 : 1 : 60;
plot(xx,polyval(f,xx),X,Y,'or')
grid

function f = lagrange(X,Y,XX)
    if size(X,1) > 1
        X = X'
    end
    if size(Y,1) > 1
        Y = Y'
    end
    N = length(X);
    pvals = zeros(N,N);
    for i = 1:N
      pp = poly(X((1:N) ~= i));
      pvals(i,:) = pp ./ polyval(pp, X(i));
    end
    f = Y*pvals;

    if nargin==3
      YY = polyval(f,XX);
      f = YY;
    end

    if nargout > 1
      R = roots(((N-1):-1:1) .* f(1:(N-1)));
      if nargout > 2
        S = polyval(f,R);
      end
    end
end
