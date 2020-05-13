ws1 = 0.2*pi; wp1 = 0.3*pi; wp2 = 0.6*pi; ws2 = 0.7*pi;
f = [ws1 wp1 wp2 ws2]/pi;
a = [0 1 0];
rp = 0.1; rs = 0.01;
dev = [rs rp rs];
[M,fo,ao,w] = firpmord(f,a,dev);
h = firpm(M+5,fo,ao,w);
w = linspace(0,pi,1000);
mag = freqz(h,[1],w);
figure(1);
plot(w/pi,20*log10(abs(mag)),'r');
hold on;
axis([0 1 -100 20])

% quantization
N = 4; % 4 bits quantization
q = 2^(-N);
num_4b = round(h/q)*q;
H_4b = freqz(num_4b, [1], w);
plot(w/pi,20*log10(abs(H_4b)),'g');

N = 8; % 8 bits quantization
q = 2^(-N);
num_8b = round(h/q)*q;
H_8b = freqz(num_8b, [1], w);
plot(w/pi,20*log10(abs(H_8b)),'b');

