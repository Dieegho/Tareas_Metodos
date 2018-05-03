%Metodo de aceleracion convexa de Whittaker
syms x;
%func = x*exp(x.^2) - sin(x) + 4*cos(x) + 6;
%func = x.^3 - 3*x^2*(2^(-x)) + 3*x*(4^(-x)) - 8^(-x);
func = x.^3 - exp(-x) + x*sin(3*x);
a = 0;
b = 2;
e = 1e-7;

[raiz, vecRaiz, vecError, it, a_or, b_or] = whittaker(func, a, b, e)
varNames = {'Iteraciones', 'Raiz', 'Error'};
[Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
disp(Table)
disp(char(latexT))


function [raiz, vecRaiz, vecError, it, a_or, b_or] = whittaker(f, a, b, e)
  error = 1;
  k = 1;
  
  raiz = a;
  a_or = a;
  b_or = b;

  while e < error
      d_fx = diff(f);
      dd_fx = diff(d_fx);
      
      aux = raiz;
      f_aux = eval(subs(f, aux));
      df_aux = eval(subs(d_fx, aux));
      ddf_aux = eval(subs(dd_fx, aux));
      
      l_faux = f_aux * ddf_aux / (df_aux)^2;  
      raiz = aux - ((f_aux * (2 - l_faux)) / (2*df_aux));
      vecRaiz(k+1) = raiz;
      
      error = abs((vecRaiz(k+1) - vecRaiz(k))/vecRaiz(k+1));
      vecError(k+1) = error;
      

      k = k + 1;
  end
  
  it = k - 1;
  vecRaiz = vecRaiz(2:end);
  vecError = vecError(2:end);

  fplot(f, [a b]), grid on
  xlabel('x')
  ylabel('y')
  
  title = strcat('Whittaker[', num2str(a_or), ', ', num2str(b_or), ']');
  print(title, '-deps')
end
