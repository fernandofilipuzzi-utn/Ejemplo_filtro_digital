clear all; clc; close all;

n=3  % orden del filtro

syms k integer;
theta(k)=(2*k-1)/(2*n) *pi;
m=floor(n/2);

syms s;
H(s)=1/prod( s^2 + 2*sin(theta(1:m))*s + 1  ) * 1/(mod(n,2)*s+1);
H(s)=collect(H(s))

[num, den]= numden(H(s));
B=sym2poly(num); A=sym2poly(den);

fig=figure; 
zplane( [zeros(1, n- length(B)+1) B ], [zeros(1, n- length(A)+1) A] );
grid on; title('Filtro Butterworth'); 
saveas(fig,'./butterworth_pz_ej1','jpg');