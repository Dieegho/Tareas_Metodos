densidad = 10e3;
gravedad = 9.8;
elevacion = 60;

% como no tenemos la funcion cremaos una matriz para asociar cada punto a
% su imagen

W = [122 130 135 160 175 190 200];
Z = [0 10 20 30 40 50 60];
n = 6;
h = (Z(n+1)-Z(1))/n;

sumatoria = 0;
for i = 2:n
    sumatoria = sumatoria + (2*(W(i)*(60-Z(i))));
end

trapecio_compuesto = (h/2)*(W(1)+W(n+1)+sumatoria)

fuerza = densidad * gravedad * trapecio_compuesto