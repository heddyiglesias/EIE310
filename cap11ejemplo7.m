clear all;
close all;
clc;
%Ejemplo 7: se dise�a un filtro pasabajos ideal con los siguientes datos: 
 %� Frecuencia de corte   wc = ? /2  [rad/m] 
 %� Longitud de  h(n):   N = 33 
 
%El siguiente programa dise�a el filtro y compara la respuesta de frecuencia deseada con la obtenida. 
 
N = 33; % longitud de h(n) 
 % Respuesta de frecuencia deseada 
H = [ones(1,9) zeros(1,8)]; 
 % Genera frecuencias negativas 
 H(N : -1 : (N+3)/2) = H(2 : 1 : (N+1)/2);  
 
% Calcula h(n) 
ho = ifft(H);  
ho = real(ho);   % elimina partes imaginarias residuales 
 
% La IDFT entrega h(n) con �ndices 0 1 2 3 ... -3 -2 -1 
% pero se necesita en el orden ... -3 -2 -1 0 1 2 3 ... 
h = [ho((N+3)/2 : N) ho(1 : (N+1)/2)]; % intercambia mitades de ho 
 
% Calcula la respuesta de frecuencia obtenida 
w = [0 : 0.0001*pi : pi];  % vector de frecuencias 
Fs = 2 * pi;               % frecuencia de muestreo 
Hw = freqz(h, 1, w, Fs);   % respuesta de frecuencia 
HdB = 20 * log10(abs(Hw)); % magnitud en [dB] 
 
% Grafica la respuesta de frecuencia deseada 
k = [0 : (N-1)/2]; 
subplot 211; stem(k, H(1:(N-1)/2+1)); grid;  axis([0 (N-1)/2+0.5 0 1]); xlabel('k'); title('Magnitud deseada [-]') 
 
% Grafica la respuesta de frecuencia obtenida 
subplot 212; plot(w/pi, HdB); grid;  axis([0 1 -50 5]); xlabel('w/pi'); title('Magnitud obtenida [dB]') 
zoom 
 
%En la siguiente figura se muestra la respuesta de frecuencia deseada y la respuesta de frecuencia obtenida