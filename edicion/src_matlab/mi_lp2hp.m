function [B,A]=mi_lp2hp(Bs,As, wc)
	syms s;
	H(s)=poly2sym(Bs,s)/poly2sym(As,s);

	% funcion de transformacion f(z)=wc/s
	
	H(s)=collect(H(wc/s));
    
	[num,den]=numden(H(s));
	B=sym2poly(num);
	A=sym2poly(den);
end
