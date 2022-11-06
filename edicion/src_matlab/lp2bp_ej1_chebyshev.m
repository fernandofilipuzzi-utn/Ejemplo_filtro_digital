clear all; clc; close all;

syms w;

%% funcion de transformacion  
f = @(w) (- w^2 + w0^2)/(B*w0);

%% requerimientos pasa medio (anchos de banda)
w0=2*pi*(1326);     %rad/s frecuencia en rad/s
Bp=2*pi*(625);      %rad/s frecuencia en rad/s
Bc=2*pi*(865);      %rad/s frecuencia en rad/s
Bs=2*pi*(2652);     %rad/s frecuencia en rad/s
Ap=0.1;               %dB en w=1 
As=15;              %dB en los extremos de Bs
%% rexpresando los requerimientos pasa medio a  A_max, w1, w2, Amin, w3, w4

% Encontrando las frecuencias paso - en el chebyshev es la frecuencia de
% borde - w=1
[s1]=vpasolve(w^2+Bp*w-w0^2==0,w); 
f1=s1(2)/2/pi;
f2=(Bp+f1*2*pi)/2/pi;

% Encontrando las frecuencias de corte
[s3]=vpasolve(w^2+Bc*w-w0^2==0,w);
f3=s3(2)/2/pi;
f4=(Bc+f3*2*pi)/2/pi;

% Encontrando la frecuencias en la banda suprimida
[s5]=vpasolve(w^2+Bs*w-w0^2==0,w);
f5=s5(2)/2/pi;
f6=(Bs+f5*2*pi)/2/pi;

% Normalizando - chebyshev normaliza con la de paso - es la frecuencia 1
% en el butterworth es la frecuencia de corte la frecuencia 1
Wc=(f4-f3)/(f2-f1);
Ws=(f6-f5)/(f2-f1);

%% Calculo del orden y la constante de riple
[n,e] = mi_cheb1ord(Wc, Ws, Ap, As)

%% diseno del filtro pasa bajo

% Definicion de la expresion los polos
syms k integer;
theta(k)=(2*k-1) / (2*n) *pi;
beta(k)=asinh((1)^k/e)/(n);

sk(k)=tanh(beta(k)).*(-1).*sin(theta(k)) + j*cos(theta(k));

% Definicion de la funcion de transferencia a partir de los polos
syms s;
H(s)=collect( prod( 1./(s-sk(1:n)) ));
 
[num, den]= numden(1/H(0)*H(s));
BS=sym2poly(num); AS=sym2poly(den);

% transformacion de paso bajo a paso alto
[Bs, As] = mi_lp2bp(BS, AS, w0, Bp)

% respuesta en frecuencia.
fig1=figure;
freqs(BS,AS);
grid on; title('Filtro pasa bajo Chebyshev ');
saveas(fig1,'./chebyshev_ej2_freqs','jpg');

%% respuesta en frecuencia
n=double(n);
fig2=figure; 
freqs(Bs,As);
grid on; title('Filtro pasa medio Chebyshev '); 
saveas(fig2,'./lp2bp_ej1_chebyshev_freqs','jpg');

% polos y ceros bp
fig3=figure; 
zplane( [zeros(1, n- length(Bs)+1) Bs ], [zeros(1, n- length(As)+1) As] );
grid on; title('Filtro pasa medio Chebyshev'); 
saveas(fig3,'./lp2bp_ej1_chebyshev_pz_bp','jpg');

% polos y ceros lp normalizado
fig4=figure; 
zplane( [zeros(1, n- length(BS)+1) BS ], [zeros(1, n- length(AS)+1) AS] );
grid on; title('Filtro pasa bajo Chebyshev'); 
saveas(fig4,'./lp2bp_ej1_chebyshev_pz_lp','jpg');
