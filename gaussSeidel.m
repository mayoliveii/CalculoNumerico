function [x,iter]=gaussSeidel(A,b,x0,eppara,maxit)
%--------------------------------------------------------------------
% gaussSeidel : metodo de Gauss-Seidel para resolucao de sistemas lineares
% Variáveis:
% [x]=gaussSeidel(A,b,eppara,maxit))
% ENTRADA
% A : matriz dos coeficientes
% b : vetor lado direito
% eppara : erro relativo desejado (default = 0,0001%)
% maxit : número máx de iterações permitido (default = 50) 

% SAÍDA
% x : vetor solucao
% iter : número de iterações
%--------------------------------------------------------------------
tic
if nargin < 2, error ('são necessários pelo menos 2 argumentos'), end
 
% Método Gauss-Seidel
% valores por default
if nargin < 3|isempty(x0), x0=zeros(length(b),1); end % aproximação inicial do vetor x 
if nargin < 4|isempty(eppara), eppara=0.0001; end % criterio de para
if nargin < 5|isempty(maxit), maxit=150; end % maximo de iterações
 
[m,n]=size(A);
if m~=n, error ('a matriz A deve ser quadrada'), end

% Construcao da matriz C e vetor d
C=A; % matriz auxiliar 
x=x0;
% Inicializa colocando zeros na diagonal da matriz A, dividindo pelos 
% elementos aii tanto a matriz como o vetor b, gerando a matriz C e o vetor d 
for i= 1:n
    C(i,i)=0;
    C(i,1:n)=C(i,1:n)/A(i,i);
    d(i)=b(i)/A(i,i);
end

% Loop de iteracoes
iter=0; 
Epest=100;
while max(Epest) >= eppara | iter >= maxit,
    x_old= x;
    for i= 1:n
        x(i)=d(i)-C(i,1:n)*x;
        if x(i)~= 0
         Epest(i)=abs( (x(i) -x_old(i)) / x(i))*100; 
        end
    end
    iter=iter + 1;
end
%----------------
 toc
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
% Rotina G-S
 
 
 
