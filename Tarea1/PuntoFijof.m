%Metodo Punto fijo
syms x;
g= x*cos(x)- exp(x)+1;
x0= -0.5;
tol = 1e-5;

[raiz, vecX, vecError, itf] = punto_fijo(g, x0, tol);

varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(itf, [vecX; vecError], varNames);
disp(Table)
%disp(char(latexT))

function [raiz, vecX, vecError, itf] = punto_fijo(g, x0, tol)
a = -1;
b = 1;
error = 1;
it = 1;

tic; 

while tol < error
    aux = x0;
    x0 = eval(subs(g, aux));

    vecX(it + 1) = aux;

    error = abs(vecX(it+1) - vecX(it));
    vecError(it+1) = error;

    it = it + 1;
end

tiempo_cpu = toc;
raiz = aux;
itf = it - 1;
vecX = vecX(2:end);
vecError = vecError(2:end);

fplot(g, [a b]), grid on
xlabel('x')
ylabel('y')
