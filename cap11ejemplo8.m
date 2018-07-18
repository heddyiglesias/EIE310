clear all;
close all;
clc;
%Ejemplo 8       mr.wav 
 
%El archivo  mr.wav  contiene 400000 muestras (36.3 seg.) de m�sica grabada @ 11025 m/s, 8 bit, mono.  
%Se aprecia un ruido de fondo peri�dico. El siguiente programa despliega un espectrograma del sonido. 
mr = audioread('mr.wav'); 
Fs = 11025; 
M = 2048; % tama�o del segmento usado en el espectrograma 
[B, f, t] = specgram(mr, 4*M, Fs, hamming(M), round(0.75*M)); 
 imagesc(t, f, sqrt(abs(B))) % sqrt comprime, remarcando niveles bajos 
 axis xy, colormap(1-gray) 
 % origen abajo, niveles de gris 
 brighten(-0.6)             
 % oscurece gr�fico 
 xlabel('t [seg]'); ylabel('f [Hz]'); grid;