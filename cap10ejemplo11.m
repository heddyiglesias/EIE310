%Ejemplo 11: el archivo  psr-0950-08.wav  contiene  30 seg. de se�al generada por la estrella pulsar  
%PSR B0950+08, captada en 410 MHz por el radiotelescopio NRAO de 100 m situado en West Virginia,
%trasladada a la banda audible y digitalizada @ 8000 m/s. 
%El pulsar es una estrella de neutrones de unos pocos kil�metros de di�metro, 
%remanente de la explosi�n de una supernova hace ~ 1.8 millones de a�os, 
%que gira r�pidamente completando una revoluci�n cada 253 mseg. Se encuentra a unos 850 a�os-luz de la Tierra.    
%psr-0950-08.wav 
%El siguiente programa analiza el archivo.
% Lee se�al del pulsar 
x = wavread('psr-0950-08');  
Fs = 8000; 
 % Grafica la se�al 
 T = 1 / Fs;  
 t = T * [1 : length(x)]; 
 subplot 221; plot(t, x); xlim([0 30]); grid xlabel('t [seg]'); title('Se�al pulsar') 
 % Estima la PSD de la se�al 
 x = x - mean(x); % elimina componente continua 
 M = 4096;        % tama�o del segmento 
 T = M/2;         % traslapo 
 [P, f] = pwelch(x, hamming(M), T, M, Fs); 
 % Grafica la PSD de la se�al 
 subplot 222; plot(f, P); grid xlabel('f [Hz]'); title('PSD se�al') 
 % Calcula la envolvente de x --> e 
 m = abs(x);               % rectifica en onda completa 
 load h20.txt              % lee h(n) de filtro antialias con Fc = 20 Hz                           
 % y atenuaci�n de 40 dB @ 40 Hz  
 e = conv(m, h20);         % aplica filtro antialias 
 e = e(1:100:length(e));   % decimaci�n; tasa de muestreo baja a 80 m/s 
 e = e - mean(e);          % elimina componente continua 
 Fs = 80;                  % redefine la frecuencia de muestreo 
 % Grafica la envolvente 
 T = 1 / Fs;  
 t = T * [1 : length(e)]; 
 subplot 223; plot(t, e); xlim([0 30]); grid xlabel('t [seg]'); title('Envolvente') 
 % Estima la PSD de la envolvente 
 M = 2048;   % tama�o del segmento 
 T = M/2;    % traslapo 
 [P, f] = pwelch(e, hamming(M), T, M, Fs); 
 % Grafica la PSD de la envolvente 
 subplot 224; plot(f, P); grid xlabel('f [Hz]'); title('PSD envolvente')