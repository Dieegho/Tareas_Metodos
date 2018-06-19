function xk = GS(A, b, x0, e) 
    mat_tri_low = tril(A);
    aux1 = eye(size(A,1)) - inv(mat_tri_low)*A;
    aux2 = inv(mat_tri_low) * b;
    xk = aux1 * x0 + aux2;
    
    ratio_espec = max(abs(eig(aux1)));
    
    if ratio_espec < 1
        while true
            if norm(xk-x0)/norm(xk) < e
                break
            end
            x0 = xk;
            xk = aux1 * x0 + aux2;
        end
    end
end