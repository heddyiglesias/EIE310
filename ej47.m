clear all;
close all;

%ejemplo 7 calcular la DTFT de   x(n) = 0.5n · u(n)
n=[0:1:20];
x=0.5.^n;
%stem(n,x);
w = [-5 : 0.01 : 5] * pi;
[X] = dtft(x, n, w);


%El siguiente programa grafica la magnitud de  X(w) entre  -5p  y +5p  [rad/m].
plot(w/pi, abs(X)); grid   xlabel('w / Pi [rad/m]');   title('Magnitud de X(w)');