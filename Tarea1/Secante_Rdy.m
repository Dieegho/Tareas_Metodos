% Metodo Secante.

func = @(x) x.^3 - 4*sin(x) + 1;
a = 1;
b = 2;
e = 1e-5;

[raiz, vecRaiz, vecError, it, a_or, b_or] = secante(func, a, b, e);

varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
disp(Table)
%disp(char(latexT))

function [raiz, vecRaiz, vecError, it, a_or, b_or] = secante(f, a, b, e)
error = 1;
k = 1;
a_or = a;
b_or = b;

tic; 

if f(a)*f(b) < 0
    while e < error
        f_a = f(a);
        f_b = f(b);
        
        a1_1 = a * f_b;
        a1_2 = b * f_a;
        a2_1 = f_b - f_a;
        
        raiz = (a1_1 - a1_2) / (a2_1);
        vecRaiz(k+1) = raiz;
        
        f_c = f(raiz);
        a = b;
        b = raiz;

        error = abs((vecRaiz(k+1) - vecRaiz(k))/vecRaiz(k+1));
        vecError(k+1) = error;
        
        k = k + 1;
    end
end

tiempo_cpu = toc
it = k - 1;
vecRaiz = vecRaiz(2:end);
vecError = vecError(2:end);

fplot(f, [a_or b_or]), grid on
xlabel('x')
ylabel('y')

title = strcat('Secante[', num2str(a_or), ', ', num2str(b_or), ']');
print(title, '-deps')
end %end function




