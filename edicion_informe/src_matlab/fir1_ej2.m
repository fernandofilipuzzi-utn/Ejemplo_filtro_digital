clear all; clc; close all;

N=61;   % longitud
Wn=0.3; % frecuencia de corte normalizada wcT
esLP=1; % es filtro pasa bajos
 
TIPO_FILTRO="pasa alto";
TIPO_VENTANA="hamming";

[Bz,Az]=mi_fir1(N, Wn*2, TIPO_FILTRO, TIPO_VENTANA);

fig=figure;
freqz(Bz,Az); title('Filtro FIR');
saveas(fig,'./fir1_ej2','jpg');

