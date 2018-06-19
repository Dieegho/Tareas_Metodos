n=10;
A = matriz(n)

[f,c] = size(A);
b = ones(f,1)

for i= 1:size(b)
    b(i) = i;
end

x0 = ones(f,1);
e=10^-4;
w=0.7;

x = relajacion(x0,A,b,e,w)

function  x  = relajacion( x0, A, b,e,w)
    siz=size(A);
    q=(1/w)*diag(diag(A))+tril(A);
    m=eye(siz(1))-inv(q)*A;
    c=inv(q)*b;
    xk=m*x0+c;
    respec=max(abs(eig(m)))
    
     if abs(1-w)<1
        con=0;
        
     while norm(xk-x0)/norm(xk)>=e
       con=con+1;
        x0=xk;
        xk=m*x0+c;
        
     end
     end
   x = xk;
   con
end


function [A]= matriz(n)
A= zeros(n,n);
for i = 1:n
    for j = 1:n
        if i<=j
            A(i,j) = i*(n-j+1);
            
        else
            A(i,j) = A(j,i);
            
        end
    end
end
A;
end
