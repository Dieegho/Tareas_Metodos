% Metodo Newton
syms x;
f = x.^3 - 4*sin(x) + 1;
e = 1e-5;
x0 = 1;

[raiz, vecRaiz, vecError, it] = newton(f, x0, e)

varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
disp(Table)
disp(char(latexT))


function [raiz, vecRaiz, vecError, it] = newton(f, x_inicial, e)
    tic;
    raiz = [;;];
    i = 0;
    a_or = 0;
    b_or = 3;
    
    derivada = diff(f);
    x_final = x_inicial - eval(subs(f,x_inicial))/eval(subs(diff(sym(f)), x_inicial));
    raiz(2,1) = x_final;
    raiz(3,1) = abs(x_final - x_inicial)/abs(x_final);
    
    while abs(x_final - x_inicial) > e
        
        temp = x_final;
        x_inicial = x_final;
        x_final = temp - eval(subs(f,temp))/eval(subs((derivada), temp));
        i = i+1;
        raiz(2,i+1) = x_final;
        raiz(3,i+1) = abs(x_final - x_inicial)/abs(x_final);
    end

    tiempo_cpu = toc
    it = i - 1;
    vecRaiz = raiz(2,:);
    vecError = raiz(3,:);

    fplot(f, [a_or b_or]), grid on
    xlabel('x')
    ylabel('y')

    title = strcat('Newton_[', num2str(a_or), ', ', num2str(b_or), ']');
    print(title, '-deps')
end %end function
