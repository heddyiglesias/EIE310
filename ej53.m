%el siguiente programa aplica 3 ciclos de una secuencia seno con w = 0.1p   (0.05 c/m) al sistema anterior.
%A continuación grafica la entrada y la salida del filtro
close all;
clear all;

nx = 0 : 60; 
x = sin(0.1*pi * nx);   % entrada 
nh = 0 : 100; 
h = 0.9 .^ nh;         % h(n) 
[y, ny] = convol(x, nx, h, nh);      % salida 
stem(nx, x, 'b'); 
hold on; 
stem(ny, y, 'r');  axis([0 70 -5 5]); grid; title('azul: x(n)       rojo: y(n)')

%Se aprecia una transiente inicial 
%(la amplitud del primer semiciclo de la sinusoide de salida es mayor que la de los semiciclos siguientes), 
%y una respuesta residual final en la salida que tiene la forma de la respuesta impulso.