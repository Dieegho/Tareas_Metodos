clc

% Ax = B
A = [3 -1 2; 1 1 0; -2 3 -4];
B = [3 3 3];
X0 = [0, 0, 0];
X = X0;
e = 1e-7;
max = 500;
iterador = 0;
n = 3;
norma = 1;

while norma > e
    iterador = iterador + 1;
    fprintf ('%d  ', iterador);
    for i = 1:n
        suma = 0;
        for j = 1:n
            if i ~= j
                suma = suma + A(i,j)*X(j);
            end
        end
        X(i)=(B(i)-suma)/A(i,i);
        fprintf('%10.7f  ',X(i));
    end
    norma = norm(X0-X)/norm(X0);
    fprintf('%10.7f\n', norma);
    X0 = X;
    if iterador >= max
        break
    end
end