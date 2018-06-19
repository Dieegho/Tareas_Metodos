[A,b]=matriz(10);
Eliminacion_gaussiana(A,b);

function [A,b] = matriz(n)
A=zeros(n)
b=zeros(n,1)
for i = 1:n
    t=-1+((i-1)*(2/(n-1)))
    for j = 1:n
        A(i,j)=t^(j-1)
    end
    b(i,1)=1/(1+25*t^2)
end 
end

function [ x ] = Eliminacion_gaussiana( A, b )
[n, q]=size(A);

for i=1:n-1;
    for k=i+1:n ;
        m=A(k,i)/A(i,i);
        for j= i+1:n;
            A(k,j)= A(k,j)-m*A(i,j);
        end
        A(k,i)=0;
        b(k)=b(k)-m*b(i);
    end
end
x=zeros(n,1);
disp(A);
disp(b);
for i=n:-1:1;
    aux=0;
    for j=i+1:n
        aux=aux+A(i,j)*x(j);
    end
    x(i)=(b(i)-aux)/A(i,i);
end
end