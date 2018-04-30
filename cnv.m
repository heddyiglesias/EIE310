function [y] = cnv(x, h)  % Convuelve x con h y coloca resultado en y  % [y] = cnv(x, h)     
Lx = length(x);  % número de muestras de x  
Lh = length(h);  % número de muestras de h  
N = Lx + Lh - 1; % número de muestras de y  
y = zeros(1, N); % reserva memoria para el vector y,                  
% acelerando los cálculos siguientes  
for n = 1 : N                % índice de y     
  k1 = max([1 (n-Lh+1)]);   % primer valor de k    
  k2 = min([n Lx]);         % último valor de k     
  for k = k1 : k2           % calcula una muestra de y       
    y(n) = y(n) + (x(k) * h(n-k+1));     % invierte h    
  end  
end