% (exampleDSB.m)
% This program uses triplesinc.m

ts = 1.e-4;
t  = -0.04:ts:0.04;
Ta = 0.01;

m_sig = triplesinc(t, Ta);

Lfft = length(t);
Lfft = 2^ceil(log2(Lfft));

M_fre = fftshift(fft(m_sig, Lfft));
freqm = (-Lfft/2:Lfft/2-1)/(Lfft*ts);

s_dsb = m_sig.*cos(2*pi*500*t);
Lfft = 2^ceil(log2(Lfft)+1);

S_dsb = fftshift(fft(s_dsb, Lfft));
freqs = (-Lfft/2:Lfft/2-1)/(Lfft*ts);

figure(1)
subplot(221)
td1 = plot(t, m_sig);

subplot(223);
td2 = plot(t, s_dsb);

subplot(222);
fd1 = plot(freqm, abs(M_fre));

subplot(224);
fd2 = plot(freqs, abs(S_dsb));
