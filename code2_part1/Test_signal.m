f1=500;% frequency inside the roll-off
f2=1200;% frequency outside the roll-off
fs=3000;% sampling frequency
T=1;% sampling interval
n = T*fs;% number of sampling points
t = linspace(0,T,n);

% Input signal
y1 = cos(2*pi*f1*t);
y2 = cos(2*pi*f2*t);
y = y1 + y2;

% Input signal in frequency domain
fft_y=fftshift(fft(y));
f=linspace(-fs/2,fs/2,n);

% Filter the input signal
y_filter=filter(numd,dend,y); 
y_filter_freq=fftshift(fft(y_filter));

% Input signal figures
figure(1);
subplot(4,1,1);
plot(t,y1);
title('y_1 in the time domain');
xlabel('Time');
ylabel('Amplitude');
subplot(4,1,2);
plot(t,y2);
title('y_2 in the time domain');
xlabel('Time');
ylabel('Amplitude');
subplot(4,1,3);
plot(t,y);
title('Mixture in the time domain');
xlabel('Time');
ylabel('Amplitude');
subplot(4,1,4);
plot(f,abs(fft_y));
title('Mixture in the frequency domain');
xlabel('Frequency');
ylabel('Amplitude');
axis([0 2000 0 100]);

% Output signal figures
figure(2);
subplot(2,1,1);
plot(t,y_filter);  
title('Filtered signal in the time domain');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2);
plot(f,abs(y_filter_freq));
xlabel('Frequency');
ylabel('Amplitude');
title('Filter signal in the frequency domain');
axis([0 2000 0 100]);

% figure(3);
% plot(f,abs(y_filter_freq));
% hold on;
% xlabel('Frequency');
% ylabel('Amplitude');
% title('Comparison in the frequency domain');
% axis([400 600 0 200]);