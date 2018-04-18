function raiz = newton(f, x_inicial, e)
    t = tic;
    raiz = [;;];
    i = 0;
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
    raiz(1,1:i+1) = [1:i+1];
    toc(t)
end