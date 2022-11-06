clear all; clc; close all;

n=4         % orden del filtro

syms k integer;
theta(k)=(2*k-1) / (2*n) *pi;

sk(k)=(-1)*sin(theta(k)) + j*( 2*k/4-1/2-1/4 ) ;

syms s;
H(s)=collect( prod( 1./(s-sk(1:n)) ));

[num, den]= numden(H(s));
B=sym2poly(num); A=sym2poly(den);

% respuesta en frecuencia.
fig1=figure; 
freqs(B,A);
title('Respuesta en frecuencia del filtro de Bessel');
saveas(fig1,'./bessel_ej1_freqs','jpg');

% polos y ceros
fig2=figure; 
zplane( [zeros(1, n- length(B)+1) B ], [zeros(1, n- length(A)+1) A] );
grid on; title('Filtro de Bessel'); 
saveas(fig2,'./bessel_ej1_pz','jpg');
