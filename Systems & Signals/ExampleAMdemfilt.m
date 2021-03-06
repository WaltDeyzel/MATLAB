% ExampleAMdemfilt.m
% This program uses triangle.m to illustrate AM modulation and demodulation

ts = 1.e-4;
t = -0.04:ts:0.04;
Ta = 0.01;
fc = 500;

amplitude_ofset2 = 1;
m_sig = (triangl((t+0.01)/0.01) - triangl((t-0.01)/0.01))+amplitude_ofset2;
Lm_sig = length(m_sig);

Lfft=length(t);
Lfft=2^ceil(log2(Lfft));
M_fre = fftshift(fft(m_sig, Lfft));
freqm = (-Lfft/2:Lfft/2-1)/(Lfft*ts);

B_m = 150;
h = fir1(40, (B_m*ts));

% AM signal generated by adding a carrier to DSB-SC

s_am = (m_sig).*cos(2*pi*fc*t);
Lfft=length(t); 
Lfft=2^ceil(log2(Lfft));
S_am = fftshift(fft(s_am, Lfft));
freqs = (-Lfft/2:Lfft/2-1)/(Lfft*ts);

% Demodulating with rectifier
s_dem = s_am.*(s_am>0);
S_dem = fftshift(fft(s_dem, Lfft));

% Ideal LPF with BW 150 Hz
s_rec = filter(h, 1, s_dem);
S_rec = fftshift(fft(s_rec, Lfft));


Trange = [-0.025 0.025 -2 2];
figure(1)
axis(Trange)

subplot(221); 
td1 = plot(t, m_sig);
title('Message');

subplot(222); 
td2 = plot(t, s_am);
title('Modulated');

subplot(223); 
td3 = plot(t, s_dem);
title('Rectifier');

subplot(224); 
td4 = plot(t, s_rec);
title('Reconstructed');

Trange = [-700 700 0 200];
figure(2)


subplot(221);
td1 = plot(freqm, abs(M_fre));
title('Message');
axis(Trange)

subplot(222); 
td2 = plot(freqs, abs(S_am));
title('Modulated');

subplot(223); 
td3 = plot(freqs, abs(S_dem));
title('Rectifier');
axis(Trange)

subplot(224); 
td4 = plot(freqs, abs(S_rec));
title('Reconstructed');
axis(Trange)