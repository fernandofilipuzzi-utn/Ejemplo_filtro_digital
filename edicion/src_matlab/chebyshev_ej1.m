clear all; clc; close all;

n=3         % orden del filtro
e=0.2;      % constante del riple

syms k integer;
theta(k)=(2*k-1) / (2*n) *pi;
beta(k)=asinh((1)^k/e)/(n);

sk(k)=tanh(beta(k)).*(-1).*sin(theta(k)) + j*cos(theta(k));

syms s;
H(s)=collect( prod( 1./(s-sk(1:n)) ));

[num, den]= numden(1/H(0)*H(s));
B=sym2poly(num); A=sym2poly(den);
 
fig=figure; 
zplane( [zeros(1, n- length(B)+1) B ], [zeros(1, n- length(A)+1) A] );
grid on; title('Filtro de Chebyshev'); 
saveas(fig,'./chebyshev_ej1_pz','jpg');