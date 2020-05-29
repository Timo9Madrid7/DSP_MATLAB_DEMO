% The Digital requirements  
Wp=0.2613*pi; Ws=0.4018*pi; Ap=0.75; As=20;

% Sampling frequency(Hz)
Fs=1000; T=1/Fs;

% Bilinear analogue requirements
wp=2*tan(Wp/2)/T;
ws=2*tan(Ws/2)/T;

% Determine the order of AF filter 
% and the 3-dB cutoff frequency 
[N,wc]=buttord(wp,ws,Ap,As,'s');

% Determine the AF-BW filter
[numa,dena]=butter(N,wc,'s');

% Convert AF to DF by bilinear transformation
[numd,dend]=bilinear(numa,dena,Fs);

% Plot the frequency response
% w=linspace(0,pi,5000);
% h=freqz(numd,dend,w);
% plot(w/pi,20*log10(abs(h)));
% axis([0 1 -100 1]);grid;
% xlabel('frequency'); ylabel('Gain,dB');
% title("Butterworth Low-pass DF");