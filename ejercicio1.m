A=1; B=9; C=7; D=2; E=7; F=2; G=9; H=4;
t=0:0.3:30; v= exp(-((B+A)/(2*C*(D+E)))*t).*sin(t);
subplot 121; plot(t,v); title('PLOT');
xlabel('tiempo [seg]'); ylabel('volts'); grid;
subplot 122; stem(t,v); title('STEM');
xlabel('tiempo [seg]'); ylabel('volts'); grid;