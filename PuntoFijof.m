%Metodo Punto fijo
g= @(x) (6-x)/3;
x0= 1;
a = 1;
b = 2;
tol = 1e-4;

[raiz, vecX, vecError, itf] = punto_fijo(g, a, b, x0, tol);

varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(itf, [vecX; vecError], varNames);
disp(Table)
%disp(char(latexT))

function [raiz, vecX, vecError, itf] = punto_fijo(g, a, b, x0, tol)
error = 1;
it = 1;
syms x;
dg = diff(g, x);

while tol < error && abs(eval(dg)) < 1
    aux = x0;
    x0 = g(aux);

    vecX(it + 1) = aux;

    error = abs((vecX(it+1) - vecX(it)) / vecX(it+1));
    vecError(it+1) = error;

    it = it + 1;
end

raiz = aux;
itf = it - 1;
vecX = vecX(2:end);
vecError = vecError(2:end);

fplot(g, [a b]), grid on
xlabel('x')
ylabel('y')

title = strcat('Punto Fijo[', num2str(a), ', ', num2str(b), ']');
print(title, '-deps')
end %end function