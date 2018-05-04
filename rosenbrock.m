%% Prueba de Métodos
format long;
syms x y;
funcion = (1-x)^2+100*(y-x^2)^2;
a = -3;
b = -4;
e = 1e-6;


% Método de Newton
rosenbrock_funcion(funcion, a, b, e)

function rosenbrock_funcion(funcion, x0, y0, e)
    t = tic;
    
    syms x y;
    i = 0;
    f = gradient(funcion);
    fprima = inv(hessian(funcion));
    
    x_inicial = [x0; y0];
    x_final = x_inicial - eval(subs(fprima, [x, y], [x_inicial(1), x_inicial(2)]))*eval(subs(f, [x, y], [x_inicial(1), x_inicial(2)]));
    
    fprintf('Iteracion\t\t\t  Xn\t\t\t\t\t\t Xn+1\n');
    fprintf('\t%i\t\t%f\t%f\t\t%f\t%f \n', [i x_inicial(1) x_inicial(2) x_final(1) x_final(2)]);
    
    while norm(x_final-x_inicial)/norm(x_final) > e
        temp = x_final;
        x_inicial = x_final;
        
        x_final = x_inicial - eval(subs(fprima, [x, y], [temp(1), temp(2)]))*eval(subs(f, [x, y], [temp(1), temp(2)]));
        
        i = i + 1;
        fprintf('\t%i\t\t%f\t%f\t\t%f\t%f \n', [i x_inicial(1) x_inicial(2) x_final(1) x_final(2)]);
    end
    
    toc(t)
end