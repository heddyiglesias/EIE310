%Ejemplo 6: calcular la DTFT de:  x(n) = d  (n+1) + 2d  (n) + 3d  (n-1) + 4d  (n-2) + 5d  (n-3)  
%Aplicando la propiedad de desplazamiento en el tiempo:  
clean all;
close all;

n = -1 : 3; 
x = 1 : 5;  
w = 0 : (pi/200) : pi; 
X = dtft(x, n, w);  
stem(w,X);



%subplot (221); plot(w/pi, abs(X)); grid xlabel('w / Pi [rad/m]'); title('Magnitud')  
%subplot (222); plot(w/pi, unwrap(angle(X))/pi); grid xlabel('w / Pi [rad/m]'); title('Angulo / Pi [rad]')