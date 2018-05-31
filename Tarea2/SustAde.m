a = [2 0 0 0;2 3 0 0; 4 1 4 0; 3 2 2 5]
b = [2; 4 ; 3 ; 5];

sustAdelante(a, b)

function [sol] = sustAdelante(A, B) 
    n = length(B);
    sol = zeros(n, 1);
    for i=1:n
       sol(i) = B(i);

       for j=1:(i - 1)
          sol(i) = sol(i) - A(i, j)*sol(j);    
       end

       sol(i) = sol(i)/A(i, i);
    end
end