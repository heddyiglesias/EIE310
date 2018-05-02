clear;
close;

w=0:(pi/200):pi;
X=exp(j*w)+2+3*exp(-j*w)+4*exp(-j*2*w)+5*exp(-j*3*w);
subplot 221; plot(w/pi,abs(X)); grid %grafica magnitud
xlabel('w/pi [rad/m]');title('magnitud')
subplot 222; plot(w/pi,unwrap(angle(X))/pi); grid %grafica ángulo
xlabel('w/pi [rad/m]');title('angulo/pi [rad]')