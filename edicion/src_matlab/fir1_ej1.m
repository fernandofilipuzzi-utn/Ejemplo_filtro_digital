clear all; clc; close all;

N=15;   % longitud
Wc=0.3; % frecuencia de corte normalizada wcT
esLP=1; % es filtro pasa bajos
 
hd0=Wc;
if esLP==0; Wc=2-0.3; hd0=1-hd0; end;

syms n;
m=(N-1)/2 ;
h= @(n) sin(Wc*pi*( n - m ) )./(pi*( n - m));


if(mod(N,2)==1)
  hd= [h(0:(N-3)/2) hd0 h((N+1)/2:(N-1)) ];
else
  hd=[h(0:N-1) ];
end

fig=figure;
freqz(hd,1); title('Filtro FIR');
saveas(fig,'./fir1_ej1','jpg');

