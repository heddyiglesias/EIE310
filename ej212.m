%Ejemplo 12: sean dos secuencias sinusoidales de 0.05 [c/m] y de 1.05 [c/m].   
%En la primera existen 18º entre muestras, mientras que en la segunda existen 378º.  
%Pero las magnitudes de las muestras generadas son idénticas:
clear all;
close all;

n = [0 : 60]; 
x =sin(2*pi * 0.05*n);  subplot 211;  stem(n, x);title('0.05 [ciclos/muestras]'); grid
y=sin(2*pi * 1.05*n);  subplot 212; stem(n, y); title('1.05 [ciclos/muestras]'); grid