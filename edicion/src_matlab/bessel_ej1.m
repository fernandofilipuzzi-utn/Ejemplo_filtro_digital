clear all; clc; close all;

% coeficientes del polinomio de Bessel
syms k n integer;
b(k,n) = (factorial(2*n-k)) ./ ...
                    ( 2.^(n-k).*factorial(k) .*factorial(n-k) );

% especificaciones del filtro
N=8 ;        % orden del filtro

% funcion de transferencia
syms s;
m=N:-1:0;
bm=b(m,N);
T(s)=bm*s.^(m'); % polinomio de Bessel

H(s)=collect( bm(end)/T(s) ) % funcion de transferencia

[num, den]= numden(H(s));
B=sym2poly(num); A=sym2poly(den);

% respuesta en frecuencia.
fig1=figure; 
freqs(B,A);
title('Respuesta en frecuencia del filtro de Bessel');
saveas(fig1,'./bessel_ej1_freqs','jpg');

% polos y ceros
fig2=figure; 
zplane( [zeros(1, N- length(B)) B ], [zeros(1, N- length(A)) A] );
grid on; title('Filtro de Bessel'); 
saveas(fig2,'./bessel_ej1_pz','jpg');
