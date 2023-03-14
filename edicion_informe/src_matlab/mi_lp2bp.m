
function [B,A]=mi_lp2bp(Bs,As, w0, B)
	syms s;
	H(s)=poly2sym(Bs,s)/poly2sym(As,s);

	% funcion de transformacion f(z)=wc/s
	H(s)=collect( H( (s^2+w0^2)/(B*s) ) );
    
	[num,den]=numden(H(s));
	B=sym2poly(num);
	A=sym2poly(den);

end
