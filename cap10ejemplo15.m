%Ejemplo 15: el archivo  carot.wav  
%contiene ecos de ultrasonido aplicado a una arteria car�tida para detectar posibles obstrucciones (estenosis).             carot.wav 
%La frecuencia del ultrasonido es 5 MHz, el �ngulo del transductor es 45 � y la tasa de muestreo es 22050 m/s. 
%El siguiente programa reproduce ac�sticamente la se�al, grafica la onda y su espectrograma
x = wavread('carot');    % lee la se�al doppler de la car�tida 
Fs = 22050;              % frec. de muestreo 
soundsc(x, Fs)           % reproduce sonido 
 % Grafica la se�al 
 t = (1:length(x)) * 1/Fs; 
 subplot 211; plot(t, x);  xlabel('seg.'); ylabel('Se�al'); grid;  
 % Calcula y grafica el espectrograma 
 LS = 1024;                             % longitud del segmento usado
 [B, f, t] = specgram(x, 4*LS, Fs, hamming(LS), round(0.75*LS)); 
 subplot 212; imagesc(t, f, abs(B))     % crea imagen 
 axis xy, colormap(1-gray)              % origen abajo, niveles de gris 
 brighten(-0.8);                        % oscurece la imagen 
 xlabel('t [seg]'); ylabel('f [Hz]'); grid; zoom