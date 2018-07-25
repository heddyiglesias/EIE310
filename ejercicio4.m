clear all;
close all;

%El siguiente programa dise�a un LPF IIR el�ptico, grafica su respuesta de frecuencia,
%filtra la onda contaminada, y graba el resultado en el archivo ecg_iir.txt.
% Datos para el dise�o del filtro
fp = 45; % frecuencia l�mite de la banda de paso en [Hz]
fr = 50; % frecuencia l�mite de la banda de rechazo en [Hz]
Fs = 200; % frec. de muestreo en [Hz]
Rp = 1; % ripple en dB en la banda de paso
Rs = 40; % ripple en dB en la banda de rechazo
% Estima el orden necesario para lograr las especificaciones
Wp = 2 * fp / Fs;
Wr = 2 * fr / Fs;
[N, Wn] = ellipord(Wp, Wr, Rp, Rs);
% Dise�a el filtro
[b, a] = ellip(N, Rp, Rs, Wn, 'low');
% Despliega N y coeficientes
N
b
a
% Calcula la respuesta de frecuencia obtenida
f1 = 0; % frec. m�nima
f2 = 100; % frec. m�xima
f = [f1 : (f2-f1)/511 : f2];
H = freqz(b, a, f, Fs);
% Grafica Mag[H(f)]
%subplot 221; semilogy(f, abs(H));
%axis([f1 f2 1e-4 2]); grid
%xlabel('f[Hz]'); title('Mag(H) de LPF IIR')
% Lee la se�al, la filtra y graba la se�al filtrada
load('ecg_rdo.txt')
y = filter(b, a, ecg_rdo);
save 'ecg_iir.txt' y -ascii


%El siguiente programa dise�a un LPF FIR �ptimo, grafica su respuesta de frecuencia,
%filtra la onda contaminada, y graba el resultado en el archivo ecg_fir.txt.
% Datos para el dise�o del filtro
Fs = 200; % frecuencia de muestreo
f = [45 50]; % vector con frecuencias l�mites de bandas
% no se especifican los l�mites 0 y Fs/2
a = [1 0]; % amplitudes deseadas en las bandas
rp = 1; % ripple en la banda de paso
rs = 40; % ripple en la banda de rechazo
% Desviaciones
dev = [(10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)];
% Estima el orden necesario para lograr las especificaciones
[N, fo, ao, w] = remezord(f, a, dev, Fs);
% Despliega N
N
% Dise�a el filtro
b = remez(N, fo, ao, w);
% Calcula la respuesta de frecuencia obtenida
f1 = 0; % frec. m�nima
f2 = 100; % frec. m�xima
f = [f1 : (f2-f1)/511 : f2];
H = freqz(b, a, f, Fs);
% Grafica Mag[H(f)]
%subplot 221; semilogy(f, abs(H));
%axis([f1 f2 1e-4 2]); grid
%xlabel('f[Hz]'); title('Mag(H) de LPF FIR')
% Lee la se�al, la filtra y graba la se�al filtrada
load('ecg_rdo.txt')
y = conv(ecg_rdo, b);
save 'ecg_fir.txt' y -ascii




load('ecg_orig.txt')
load('ecg_iir.txt')
load('ecg_fir.txt')
n1 = 1400; % n inicial
n2 = 1800; % n final
n = (n1 : n2);
t = n / 200; % [seg]
t1 = n1 / 200; % t inicial
t2 = n2 / 200; % t final
subplot 311;
plot(t, ecg_orig(n));
axis([t1 t2 -0.5 1.5]);
xlabel('seg'); grid
title('ECG original');
subplot 312;
plot(t, ecg_iir(n));
axis([t1 t2 -0.5 1.5]);
xlabel('seg'); grid
title('Salida IIR');
subplot 313;
plot(t, ecg_fir(n));
axis([t1 t2 -0.5 1.5]);
xlabel('seg'); grid
title('Salida FIR');