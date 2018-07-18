clear all;
close all;
clc;
%Ejemplo 3: las respuestas impulso del promedio móvil y del promedio ponderado del ejemplo 1 
%cumplen con el requerimiento para tener fase lineal.  
 %• Promedio móvil:    h(n) = [0.2  0.2  0.2  0.2  0.2] 
 %• Promedio ponderado:  h(n) = [0.07  0.24  0.38  0.24  0.07] 
 
%El siguiente programa grafica la magnitud y el ángulo de la respuesta de frecuencia del promedio ponderado, 
%genera una onda cuadrada y la filtra.  
b = [0.07  0.24  0.38  0.24  0.07];      % definición de h(n) 
b = b / (sum(b));                        % para que H(0) sea = 1 
[H, w] = freqz(b, 1);  
Mag = abs(H);  
Ang = unwrap(angle(H));  
subplot 221; plot(w, Mag); title('Mag[H(w)]');  xlabel('w'); grid 
subplot 223; plot(w, Ang); title('Ang[H(w)] [rad]');  xlabel('w'); grid 
 
n = [0 : 0.1 : 3.9] * pi; 
x = square(n); % genera onda cuadrada 
y = conv(x, b);                          % filtra la onda cuadrada 
subplot 222; stem(x); title('x (entrada)'); axis([0 45 -1.5 1.5]); xlabel('n'); grid 
subplot 224; stem(y); title('y (salida)'); axis([0 45 -1.5 1.5]); xlabel('n'); grid
%Se observa que la salida mantiene la forma de la entrada, excepto por la pérdida de frecuencias altas.