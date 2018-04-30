function[x, n] = fimpulso(n0, n1, n2)  % Genera x(n) = impulso(n - n0) para n1 <= n <= n2  
n = [n1 : n2];  
x = [(n - n0) == 0];