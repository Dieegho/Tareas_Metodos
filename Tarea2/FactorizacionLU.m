   A = [1 2 3; -2 -3 6; 4 1 3];
   
   b = [2 ; -14; 3];

   LU(A, b)

function [ L, U ] =LU(A, b)

    f= size(A, 1);
    c = size(A, 2);
    L = eye(f, c);
    
    if c>f
      c,f = f,c
    end 
    
    for j=1 : c 
        for i=j+1 : f 
            L(i,j)= A(i,j)/A(j,j);
            m = L(i,j); 
            for k = j : f  
                A(i,k) = A(i,k) - (m* A(j,k));
            end 
        end 
    end
    U=A;
    U
    L
    
    y = inv(L)*b;
    x = inv(U)*y
end
