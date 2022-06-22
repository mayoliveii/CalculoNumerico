function xb = Busca_incremental(xmin,xmax,ns)
% Função 1: log10(x) − sen(x)
% Função 2:
% método da busca incremental
%busca incremental para localização de raízes da função
% log10(x)-sin(x)
% xb = busca_incremental: encontra os subintervalos de x que contêm
% mudanças de sinal de uma função em um intervalo
% entrada:
% xmin,xmax = extremidades do intervalo
% ns = número de subintervalos 
% saída:
% xb(n,1) é o limite inferior da n-ésima mudança de sinal
% xb(n,2) é o limite superior da n-ésima mudança de sinal
f= @(xx)log10(xx) - sin(xx) ; % Gráfico da função
fplot(f,[1 5])
xlabel('Eixo x')
ylabel('Eixo y')
legend(['f(X)=LOG10(X)-SEN(X)'])
grid on
if nargin < 2, error('são necessários pelo menos 2 argumentos')
end
if nargin < 3, ns = 50;end
x = linspace(xmin,xmax,ns);
f = log10(x)-sin(x);
nb = 0; xb = [];
for n=1:length(x)-1
   if sign(f(n)) ~= sign(f(n+1))
       nb= nb + 1;
       xb(n,1)= x(n);
       xb(n,2)= x(n+1);
   end
end
if isempty(xb)
    disp('nenhum subintervalo encontrado, por favor verifique o intervalo ou aumente ns')
else
    disp('número de subintervalos com mudança de sinal')
    disp(nb)
end