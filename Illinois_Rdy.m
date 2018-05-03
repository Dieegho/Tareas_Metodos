func = @(x) x^10-1;
a = 0;
b = 1.3;
e = 10^-5;
Nmax = 30;
[raiz, vecRaiz, vecError, it] = illinois(func, a, b, Nmax, e);

varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
disp(Table)
disp(char(latexT))

function [raiz, vecRaiz, vecError, it, a_or, b_or] = illinois(f,a,b,Nmax,tol)
a_or = a;
b_or = b;
i = 1;

tic;
f_a = f(a);
f_b = f(b);

c = (a*f_b - b*f_a)/(f_b - f_a);
f_c = f(c);

flag = 0;

while (abs(f_c) > tol) && (i <= Nmax)
    if f_c * f_a > 0
        a = c;
        f_a = f_c;
        if flag == -1
            c = ((a*f_b/2)-(b*f_a)) / ((f_b/2)-f_a);
        else
            c = ((a*f_b)-(b*f_a))/(f_b-f_a);
        end
        flag = -1;
    else
        b = c;
        f_b = f_c;
        if flag == 1
            c = ((a*f_b)-(b*f_a/2))/(f_b-(f_a/2));
        else
            c = ((a*f_b)-(b*f_a))/(f_b-f_a);
        end
        flag = 1;
    end
    f_c = f(c);
    
    raiz = c;
    vecRaiz(i+1) = raiz;
    vecError(i+1) = abs(f_c);
    i = i + 1;
end

tiempo_cpu = toc
it = i - 1;
vecRaiz = vecRaiz(2:end);
vecError = vecError(2:end);

fplot(f, [a_or b_or]), grid on
xlabel('x')
ylabel('y')

title = strcat('Illinois[', num2str(a_or), ', ', '1,3', ']');
print(title, '-deps')
end


