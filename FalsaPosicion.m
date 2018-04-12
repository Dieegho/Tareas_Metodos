% Metodo Falsa Posicion.
%fplot(@(x) x.^3 - 4*sin(x) + 1), grid on

func = @(x) x.^3 - 4*sin(x) + 1;
a = 1;
b = 2;
e = 1e-5;

[raiz, vecRaiz, vecError, vecA, vecB, it, a_or, b_or] = false_position(func, a, b, e);

disp('nnn---------------nnn')
varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
%disp(Table)
%disp(char(latexT))

function [raiz, vecRaiz, vecError,  vecA, vecB, it, a_or, b_or] = false_position(f, a, b, e) 
error = 1;
k = 1;
a_or = a;
b_or = b;

if f(a)*f(b) < 0
    %fprintf('Iteracion\ta\t   b\tRaiz\t\tError\n');
    
    while e < error
        f_a = f(a);
        f_b = f(b);

        a1_1 = a * f_b;
        a1_2 = b * f_a;
        a2_1 = f_b - f_a;

        raiz = (a1_1 - a1_2) / (a2_1);
        vecRaiz(k+1) = raiz;
        f_c = f(raiz);
        
        error = abs((vecRaiz(k+1) - vecRaiz(k))/vecRaiz(k+1));
        vecError(k+1) = error;
        vecA(k+1) = a;
        vecB(k+1) = b;
        
        %fprintf('    %i\t    %f   %f  \t%f\t%f\n', [k a b vecRaiz(k) vecError(k)]);
        
        if f_a * f_c < 0
            b = raiz;
        elseif f_c*f_b < 0
            a = raiz;
        end %end if

        k = k + 1;
    end %end while
end %end if

it = k - 1;
vecRaiz = vecRaiz(2:end);
vecError = vecError(2:end);

fplot(@(x) x.^3 - 4*sin(x) + 1, [a_or b_or]), grid on
xlabel('x')
ylabel('y')

title = strcat('FalsaPosicion_[', num2str(a_or), ', ', num2str(b_or), ']');
print(title, '-deps')
end %end function