Y = [122 130 135 160 175 190 200];
X = [0 10 20 30 40 50 60];

xx = 0 : 1 : 60;
plot(X,Y,'or',xx,spline(X,Y,xx),'--g')
grid