clear all; clc; close all;

n=3  % orden del filtro

syms k integer;
theta(k)=(2*k-1)/(2*n)*pi;

sk(k)=-sin(theta(k)) + j*cos(theta(k));

syms s;
H(s)=collect( prod( 1./(s-sk(1:n)) ));

[num, den]= numden(1/H(0)*H(s));
B=sym2poly(num); A=sym2poly(den);

fig=figure; 
zplane( [zeros(1, n- length(B)+1) B ], [zeros(1, n- length(A)+1) A] );
grid on; title('Filtro Butterworth'); 
saveas(fig,'./butterworth_pz_ej2','jpg');