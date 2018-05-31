a = [3 2 2 5; 0 4 1 4; 0 0 2 3; 0 0 0 2]
b = [2; 4 ; 3 ; 5];

sustAtras(a, b) 

function [sol] = sustAtras(A, B) 
    n = length(B);
    sol = zeros(n, 1);
    for i=n:-1:1
       sol(i) = B(i);

       for j=(i + 1):n
          sol(i) = sol(i) - A(i, j)*sol(j);    
       end

       sol(i) = sol(i)/A(i, i);
    end
end