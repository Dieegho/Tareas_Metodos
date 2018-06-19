densidad = 10e3;
gravedad = 9.8;
elevacion = 60;

W = [122 130 135 160 175 190 200];
Z = [0 10 20 30 40 50 60];
n = 6;
h = (Z(n+1)-Z(1))/n;

sumatoria = 0;
for i = 1:n
    if rem(i,2) ~= 0
        sumatoria = sumatoria + 4*(W(i)*(60-Z(i)));
    end
end

for i = 1:n-1
    if rem(i,2) == 0
        sumatoria = sumatoria + 2*(W(i)*(60-Z(i)));
    end
end

simpson = (h/3)*(W(1)+W(n+1)+sumatoria);

fuerza = densidad * gravedad * simpson