function [x,iter]=GS(A,b,x,tol)
N=tril(A);
P=N-A; corr=1; errest=1; iter=0;
while abs(errest)>tol
    iter=iter+1;
    x0=x;
    corr0=corr;
    x=N\(P*x0+b);
    corr=norm(x-x0,inf);
    normest=corr/corr0;
    if normest>=1 & iter>=2
       error('norma de la matriz de iteración > 1')
    end
    errest=normest/(1-normest)*corr; 
end
iter
