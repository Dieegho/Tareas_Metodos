%% Prueba de Métodos
format long;
syms x y;
funcion = [x^3-3*x*y^2-1/2; 3*x^2*y-y^3-(3^(1/2))/2];
func = [x^2+x-y^2-1; y-sin(x^2)];
a = 0;
b = 1;
e = 1e-6;


% Método de Newton
newton_multiple(func, a, b, e)
%newton_opti(funcion, a, b, e)

function newton_multiple(funcion, x0, y0, e)
    t = tic;
    
    syms x y;
    i = 0;
    fprima = inv(jacobian(funcion));
    
    x_inicial = [x0; y0];
    x_final = x_inicial - eval(subs(fprima, [x, y], [x_inicial(1), x_inicial(2)]))*eval(subs(funcion, [x, y], [x_inicial(1), x_inicial(2)]));
    
    fprintf('Iteracion\t\t\t  Xn\t\t\t\t\t\t Xn+1\n');
    fprintf('\t%i\t\t%f\t%f\t\t%f\t%f \n', [i x_inicial(1) x_inicial(2) x_final(1) x_final(2)]);
    
    while norm(x_final-x_inicial)/norm(x_final) > e
        temp = x_final;
        x_inicial = x_final;
        
        x_final = x_inicial - eval(subs(fprima, [x, y], [temp(1), temp(2)]))*eval(subs(funcion, [x, y], [temp(1), temp(2)]));
        
        i = i + 1;
        fprintf('\t%i\t\t%f\t%f\t\t%f\t%f \n', [i x_inicial(1) x_inicial(2) x_final(1) x_final(2)]);
    end
    
    toc(t)
end
