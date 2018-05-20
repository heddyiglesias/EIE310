clear all;
close all;
clc;
%Ejemplo 3: el archivo  h.txt  contiene la respuesta impulso de un FPB digital diseñado 
%para cortar en 20 kHz y atenuar 65000 [-] en 22.05 kHz. 
%Se supone que Fs = 4 x 44.1 = 176.4 kHz. La longitud de  h(n)  es 258.
%El siguiente programa grafica  h(n) y la Mag[H(f)].
load h.txt 
 
subplot 221;  
 plot(h, '.'); grid 
 xlabel('n'); 
 title('h(n)'); 
 
 
f = 0 : 100 : 200000; 
 M = abs(freqz(h,1,f,176400)); 
 
subplot 223; 
 semilogy(f/1000, M); grid;  
 axis([0 200 0.000001 10]); 
 xlabel('f[kHz]'); 
 title('Mag[H(f)]')

