%% Prueba de M?todos

% M?todo de Bisecci?n
funcion = @(x) x^3 - 4*sin(x) + 1;
a = 1;
b = 2;
e = 1e-500000000;
%fplot(funcion)
%grid on
raiz = biseccion(funcion, a, b, e);

% M?todo de Falsa Posici?n



%% M?todo de Bisecci?n
function raiz = biseccion(f, a, b, e)
    t = tic;
    fprintf('Metodo de Bisecci?n\n');
    fprintf('Iteracion\t\ta\t\t\tb\t\t  Raiz\n');
    i = 0;
    if f(a)*f(b) > 0
        disp('No hay raiz entre estos valores detectados por este metodo \n')
        raiz = 'error'
    else
        while abs(a-b) > e
            if f(a)*f((a+b)/2) < 0
                b = (a+b)/2;
            else
                a = (a+b)/2;
            end
            i = i+1;
        fprintf('\t%i\t\t%f\t%f\t%f \n', [i a b (a+b)/2]);
        end
        raiz = (a+b)/2;
    end
    toc(t)
end