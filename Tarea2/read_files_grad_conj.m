function [A, b, x0] = read_file(name, lambda)
    file = load(name);
    Af = file.X;
    bf = file.Y;
    
    Aaux = Af'*Af;
    n = size(Aaux, 1);
    
    A = Aaux + lambda*eye(n);
    b = Af'*bf;
    
    size_x = size(b);
    x0 = ones(size_x);
end