A = [10 4 5; 4 6 1; 5 1 4];
b = [1; 4; 5];
x0 = [1; 1; 1];
e = 1e-5;
CGM(A,b,x0,e)

function [x1] = CGM(A, b, x0, e)  
    r0 = b - (A*x0);
    p0 = r0;
    
    while true
        alpha = (r0' * r0) / (p0' * A * p0);
        x1 = x0 + (alpha * p0);
        r1 = r0 - alpha * A * p0;
        
        if norm(r1) < e
            return 
        end
        
        beta = (r1' * r1) / (r0' * r0);
        p1 = r1 + (beta * p0);
        
        r0 = r1;
        p0 = p1;
        x0 = x1;
    end
end