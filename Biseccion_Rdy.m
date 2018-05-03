%LISTO

func = @(x) x.^3 - 4*sin(x) + 1;
a = 1;
b = 2;
e = 1e-5;

[raiz, vecRaiz, vecError, it, a_or, b_or] = biseccionn(func, a, b, e)

varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
disp(Table)
disp(char(latexT))

function [raiz, vecRaiz, vecError, it, a_or, b_or] = biseccionn(f, a, b, e)
    a_or = a;
    b_or = b;
    raiz = [;;];
    i = -1;
    
    tic;
    if eval(subs(f,a))*eval(subs(f,b)) > 0
        raiz = 'error'
    else
        raiz(3,1) = abs(a-b)/abs(b);
        raiz(1,1) = 1;
        while abs(a-b) > e
            if eval(subs(f,a))*eval(subs(f,(a+b)/2)) < 0
                b = (a+b)/2;
            else
                a = (a+b)/2;
            end
            i = i+1;
        raiz(3,i+1) = abs(a-b)/abs(b);
        raiz(1,i+1) = i+1;
        raiz(2, i+1) = (a+b)/2;
        end
    end
    tiempo_cpu = toc
    it = size(raiz(1,:));
    
    it = it(2);
    vecRaiz = raiz(2,:);
    vecError = raiz(3,:);
    raiz = vecRaiz(it);
    
    
    fplot(f, [a_or b_or]), grid on
    xlabel('x')
    ylabel('y')

    title = strcat('Biseccion[', num2str(a_or), ', ', num2str(b_or), ']');
    print(title, '-deps')
end
