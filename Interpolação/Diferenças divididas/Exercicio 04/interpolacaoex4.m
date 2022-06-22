clear; clc; clearvars;
%% Entrada de dados
% x=input('Entre com os valores(independentes) do vetor X');
x= [0 1 2.5 3 4.5 5 6];
% y=input('Entre com os valores(dependentes) do vetor Y');
y =[2 5.4375 7.3516 7.5625 8.4453 9.1875 12];
%% Processamento do problema
n=length(y); 
if length(y)~=n, error('x e y devem ter obrigatoriamente o mesmo tamanho!'); 
end
% xf=input('Digite o valor de x onde se quer encontrar o valor de f(x): ');
xf = 3.5;
L=zeros(n);% Fazendo pra diferenças divididas 
% L cria uma matriz quadrada do tamanho do vetor
for k=1:n %vetor varrendo o tamanho da matriz de vetores x independentes
   L(k,1)=y(k); %preenchendo o  vetor L, espelho de y transposto (ORDEM ZERO!)
end
for k=2:n %segurando a segunda coluna da matriz L e fazendo a quantidade de linhas tamanho de n
  for m=1:n-k                     
       L(m,k)=(L(m,k-1)-L(m+1,k-1))/(x(m)-x(m+(k-1)));
  end
end
tabela= [x' L]

xt = 1;
resp = L(1,1);
for p = 1:n-1
xt = xt*(xf-x(p));
resp = resp+L(1,p+1)*xt;
end
% s=1;
% t=0;
% resp=y(1);
% for p=2:n
%    s=s*(xf-x(p-1));
%    t=s*L(1,p);
%    resp=resp+t;
% end
disp(['O valor de x: ',num2str(xf),' requerido para f(x) é: ',num2str(resp)])
