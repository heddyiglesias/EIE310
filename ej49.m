%el siguiente programa evalúa numéricamente la DTFT de un impulso δ(n) en tiempo discreto, 
%calculada analíticamente en el ejemplo 5.  
clear all;
close all;
[x, n] = impulso(0, -10, 10); 
w = [0 : 0.01 : 1] * pi; 
[X] = dtft(x, n, w); 
subplot 221; plot(w/pi, abs(X)); xlabel('w / Pi [rad/m]'); title('DTFT de impulso'); grid  

%Se obtiene el mismo resultado.