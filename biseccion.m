function raiz = biseccion(f, a, b, e)
    t = tic;
    raiz = [;;];
    i = -1;
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
    toc(t)
end