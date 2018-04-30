%el siguiente programa evalúa numéricamente la DTFT de la secuencia del ejemplo 6,  
%x(n) = d  (n+1) + 2d  (n) + 3d  (n-1) + 4d  (n-2) + 5d  (n-3). 
close all;
clear all;

n = -1 : 3; 
x = 1 : 5;  
w = 0 : (pi/200) : pi; 
X = dtft(x, n, w);  
subplot 331; plot(w/pi, abs(X)); grid xlabel('w / Pi [rad/m]'); title('Magnitud')  
subplot 332; plot(w/pi, unwrap(angle(X))/pi); grid xlabel('w / Pi [rad/m]'); title('Angulo / Pi [rad]')