clear all; clc; close all;
 
% Especificaciones del filtro normalizadas
Wc=1.2;
Ws=1.3;
Ap=3; % atenuacion en dB
As=20;  % atenaucion de dB

%% Calculo del orden y la constante de riple
[n,e] = mi_cheb1ord(Wc, Ws, Ap, As)

% Definicion de la expresion los polos
syms k integer;
theta(k)=(2*k-1) / (2*n) *pi;
beta(k)=asinh((1)^k/e)/(n);

sk(k)=tanh(beta(k)).*(-1).*sin(theta(k)) + j*cos(theta(k));

% Definicion de la funcion de transferencia a partir de los polos
syms s;
H(s)=collect( prod( 1./(s-sk(1:n)) ));

% respuesta en frecuencia.
fig1=figure; 
[num, den]= numden(1/H(0)*H(s));
B=sym2poly(num); A=sym2poly(den); 
freqs(B,A);
title('Respuesta en frecuencia del filtro de Chebyshev');
saveas(fig1,'./chebyshev_ej2_freqs','jpg');

% polos y ceros
fig2=figure; 
zplane( [zeros(1, n- length(B)+1) B ], [zeros(1, n- length(A)+1) A] );
grid on; title('Filtro de Chebyshev'); 
saveas(fig2,'./chebyshev_ej2_pz','jpg');
