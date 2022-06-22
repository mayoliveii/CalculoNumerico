%método do N-R
%

function [raiz] = raphson(x0,prec,iterm)
f = input('digite a funcao nao linear');
df = input ('digite a derivada da funcao');
erro=1000;
k=0;
while erro>=prec && k<=iterm
    fxi= f(x0);
    dfxi= df(x0);
    xn= x0 - (fxi/dfxi);
    erro = abs((xn-x0)/xn);
    disp([xn,fxi,dfxi,erro]);
    x0=xn;
    k=k+1;
end
if k>iterm
    raiz ='solucao divergente';
else
    raiz=xn;   
end
