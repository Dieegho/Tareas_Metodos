% Ax = B
A = [10 4 5; 4 6 1; 5 1 4];
B = [1 4 5];
X0 = [0, 0, 0];
X = X0;
e = 1e-7;
max = 500;

jacobi(A, B, X0, e, max)

function X0 = jacobi(A, B, X0, e, max)
    X = X0;
    n = size(B, 2);
    norma = 1;
    iterador = 0;
    while norma > e
        iterador = iterador + 1;
        fprintf ('%d  ', iterador);
        for i = 1:n
            sumatoria = 0;
            for j = 1:n
                if i ~= j
                    sumatoria = sumatoria + A(i,j)*X(j);
                end
            end
            X(i)=(B(i)-sumatoria)/A(i,i);
            fprintf('%10.7f  ',X(i));
        end
        norma = abs(norm(X0-X)/norm(X0));
        fprintf('%10.7f\n', norma);
        X0 = X;
        if iterador >= max
            break
        end
    end
end
