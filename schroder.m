function raiz = schroder(f, x_inicial, e)
    t = tic;
    raiz = [;;];
    i = 0;
    derivada = diff(f);
    derivada_dos = diff(derivada);
    x_final = x_inicial - (eval(subs(f, x_inicial))*eval(subs(derivada,x_inicial)))/(eval(subs(derivada,x_inicial))^2-(eval(subs(f,x_inicial))*eval(subs(derivada_dos,x_inicial))));
    raiz(2, 1) = x_final;
    raiz(3,1) = abs(x_final - x_inicial)/abs(x_final);
    while abs(x_final - x_inicial)/abs(x_final) > e
        temp = x_final;
        x_inicial = x_final;
        x_final = temp - (eval(subs(f, temp))*eval(subs(derivada,temp)))/(eval(subs(derivada,temp))^2-(eval(subs(f,temp))*eval(subs(derivada_dos,temp))));
        i = i+1;
        raiz(2,i+1) = x_final;
        raiz(3,i+1) = abs(x_final - x_inicial)/abs(x_final);
    end
    raiz(1, 1:i+1) = [1:i+1];
    toc(t)
end
