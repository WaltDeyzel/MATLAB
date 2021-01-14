% (filename: siggraf.m)

%To graph a signal first get X and Y axis.

t =(-2:0.01:3); %-2 to 3 in steps of 0.01

y = exp(-t).*sin(10*pi*t).*step(t+1);

figure(1);
fig1=plot(t,y);

set(fig1, 'Linewidth', 2);

xlabel('\it t');
ylabel('\bf y');

title('\rm time domain');

function y=step(t)
    y = (t >=0 );
end