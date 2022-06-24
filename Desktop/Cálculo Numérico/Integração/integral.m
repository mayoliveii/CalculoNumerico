function I = simp13(func,x0,xn,n,varargin)
%n: grau
x= [ 0 0.2 0.4 0.6 0.8]';
y= 0.2 +25*x -200*x^2 +675*x^3 -900*x^4 +400*x^5;
%func: function handle @
%varargin: parametros
%definir nargin if 
%simpson simples: n=2
x=x0;;
h= (xn-x0)/n;
s=func(x0,varargin{:}); %f(x0)
for i=1:(n-1)
    x=x+h;
    if mod(i,2) ==1
    s=s+4*func(x,varargin{:});
    else 
        s=s+2*func(x,varargin{:});
    end
end
s= s+func(xn,varagin{:}); %f(xn)
%Calculando a integral
I=(xn-x0)*s(2*n)

        


