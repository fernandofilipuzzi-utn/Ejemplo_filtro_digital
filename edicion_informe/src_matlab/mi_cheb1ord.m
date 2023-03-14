function [N,e]=mi_cheb1ord(Wc, Ws, Ap, As)

e=sqrt(10^(Ap/10)-1);
ns=acosh( sqrt(10^(As/10)-1)/e )/acosh(Ws);
A3db=3;
n3db=acosh( sqrt(10^(A3db/10)-1)/e )/acosh(Wc);
n=ceil(n3db);
if ns>n
    n=ceil(ns);
end

N=n;