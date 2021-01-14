%Bandwidth is 1% of peak value.
%Peak value at t = 0 == 0.5
Ts = 1/64; %Rounded 1/2B
T0 = 4;    %Picked so that g(T0) << 1
N0 = T0/Ts; %formula

t=0:Ts:Ts*(N0-1);
g = exp(-2*t); % Given
g(1)= Ts*0.5;

%Fourier Transfrom 
G = fft(g);

[Gp, Gm] = cart2pol(real(G), imag(G));
k=0:N0-1;
w=2*pi*k/T0;

%Plot
subplot(211), stem(w(1:32), Gm(1:32));
subplot(212), stem(w(1:32), Gp(1:32));