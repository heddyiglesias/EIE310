%Ejemplo 5: calcular la DTFT de un impulso  δ(n)  en tiempo discreto.
clean all;
close all;
%[x,n] = fimpulso(0,-6,+6);     %stem(n, x)  % d(n) 

%[X] = dtft(x, n, 0)


%Por lo tanto, el espectro de frecuencia del impulso vale 1 + j0  para todas las frecuencias; 
%es independiente de w.   en este caso w=0


[x, n] = fimpulso(0, -10, 10); 
w = [0 : 0.01 : 1] * pi; 
[X] = dtft(x, n, w); 
subplot 221; plot(w/pi, abs(X)); xlabel('w / Pi [rad/m]'); title('DTFT de impulso'); grid     
           