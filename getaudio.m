%Programa que grafica el espectrogrma de un audio grabado

%obtenemos una muestra de audio
recObj = audiorecorder(48000,24,1);
disp('Grabando...')
recordblocking(recObj, 3);
disp('Listo');
play(recObj);
 
grab = getaudiodata(recObj);

%Graficamos el espectro de la señal
t=linspace(0,length(grab)/8000,length(grab));
figure
plot(t,grab);
title('Audio en el dominio del tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
 
 
x=abs(fft(grab));
figure
plot(x);
title('Espectro del audio');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');

figure
spectrogram(x);
title('Espectrograma');


figure
spectrogram(x(1:end/2),256,251,256,48000);
title('Espectrograma ventana:256');

figure
spectrogram(x(1:end/2),512,251,512,48000);
title('Espectrograma ventana:512');

figure
spectrogram(x(1:end/2),1024,251,1024,48000);
title('Espectrograma ventana 1024');
