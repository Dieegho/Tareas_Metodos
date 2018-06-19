function mse = medium_cuadratic_error(A, b, sol)
    f = A * sol;
    rest = 0;
    for i = 1:size(f,1)
        aux = (f(i) - b(i))^2;
        rest = rest +  aux;
    end
    mse = rest / size(f,1);
end