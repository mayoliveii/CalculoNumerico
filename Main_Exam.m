%--------------------------------------------------------------------------
% EXAME - Disciplina Calculo Numerico- 2021.2
% Professora  : Lindaura Maria Steffens                 
% NOME: JOSE KABESA KALALA
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% QUESTAO 1. Raizes de Funcoes
% i) Neste caso, a primeira coisa ser� fazer o gr�fico para ver o
% comportamento da fun��o, enseguida pode-se usar um m�todo intervalar que
% pode ser a busca incremental ou a bissec��o,lembrando que os m�todos
% intervalares precisam da fun��o e dos limites do intervalo para poder
% funcionar. Pode-se usar tamb�m os m�todos iterativos, onde vamos precisar 
% de um valor de x ou de dois limites onde poder� ser determinado o valor
% exato da ra�z.

% Entradas
n=8; 
eppara=0.5*10^(2-n);
xl=-5;
xu=5;
x_old = -5;
xr = 5;
xr_old = 1;
maxit=50;
func = @(x) x*cos(x^2); 
dfunc = @(x) cos(x^2)-2*x^2*sin(x^2); % Derivada da fun��o 

% Bissec��o
 [raiz_b,fx_b,EstRaiz_b,Epest_b,iter_b]=bissec(func,xu,xl,eppara)

% Falsa Posi��o
[raiz_fp,fx_fp,EstRaiz_fp,Epest_fp,iter_fp]=falsaposic(func,xu,xl,eppara)

% Newton-Raphson
[raiz,fx,EstRaiz,Epest,iter]=newtonraphson(func,dfunc,xr,eppara,maxit)

% Secante
[raiz_s,VIter_s,fx_s,Epest_s,iter_s]=secante(func,xr,xr_old,eppara);


legend('bissec','falsaposic','newton','secante')

Raiz=[raiz_b;raiz_fp;raiz_nr;raiz_s];
Iteracao=[iter_b;iter_fp;iter_nr;iter_s];
RowNames=[{'Bissec��o'};{'Falsa Posi��o'};{'Newton-Rapshon'};{'Secante'}];
T=table(Raiz,Iteracao,'RowNames',RowNames)

% Busca Incremental
func = @(x) x*cos(x^2); 
xmin=-5;
xmax=5;
ns=50;
[nb,xb]=busc_increm(func,xmin,xmax,ns)

for i=1:1:nb
    xl=xb(i,1);
    xu=xb(i,2);
    % Bissec��o
    [raiz_b,fx_b,EstRaiz_b,Epest_b,iter_b]=bissec(func,xl,xu,eppara);
    % Newton-Raphson
    [raiz_nr,fx_nr,EstRaiz_nr,Epest_nr,iter_nr]=newtonraphson(func,df,xl,xu,eppara);
    
    Raiz=[raiz_b;raiz_nr];
    Iteracao=[iter_b;iter_nr];
    RowNames=[{'Bissec'},{'Newton'}];
    disp(['Raiz ',num2str(i)])
    T=table(Raiz,Iteracao,'RowNames',RowNames)
end

legend('Bissec','Newton')

% Todos os m�todos encontraram a mesma raiz, sendo o m�todo de Newton-Raphson 
% o mais r�pido e eficiente, pois precisou de menos itera��es que os demais 
% Com isso, pode-se concluir que os m�todos iterativos
% foram mais r�pidos e eficientes que os intervalares.

%--------------------------------------------------------------------------



% Para todas as ra�zes da fun��o no intervalo, o m�todo de Newton-Raphson precisou de uma
% quantidade menor de itera��es para fornecer a estimativa.
%-------------------------------------------------------------------------
%--------------------------------------------------------------------------
% QUESTAO 2. Sistemas Lineares e Ajuste de Curvas
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%x= [3  4  5  7  8  9   11  12]
%y= [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]
clear; clc; close all;

n=8;
eppara=0.5*10^(2-n);
x= [3  4  5  7  8  9   11  12];
y= [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

xx=linspace(3,12,50); % Vetor x de 3 a 12 com 50 pontos
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',8) % gr�fico dos pontos
xlabel('x')
ylabel('y')
title('N pontos')
hold on
grid on

[a0,a1]=regrlinsimples(x,y)
fx=a0+a1.*xx;
plot(xx,fx,'r','LineWidth',2)
k=1;
[t1,r2_1]=erroranalise(x,y,k)

[a0,a1,a2,a3]=regrlinp3(x,y)
fx=a0+a1.*xx+a2.*xx.^2+a3.*xx.^3;
plot(xx,fx,'g','LineWidth',2)
legend('N pontos','Regress�o Linear Simples','Regress�o Polinomial C�bica','Location','southwest');
xlabel('x');ylabel('f(x)');title('MMQ');
k=3;
[t3,r2_3]=erroranalise(x,y,k)

RowNames=[{'Regress�o Linear Simples'};{'Regress�o Polinomial C�bica'}];
R2=[r2_1;r2_3];
T=table(R2,'RowName',RowNames)

% Pelo gr�fico � poss�vel perceber que a regress�o polinomial c�bica se
% ajustou muito melhor aos pontos dados do que a regress�o linear simples.

% outros m�todos----------------------------------------------
% Elimina��o de Gauss
disp('Elimina��o de Gauss')
x=eliminagauss(x,y)

% Decomposi��o LU
disp('Decomposi��o LU')
[L,U,P]=lu(x);
d=L\(P*y);
x_lu=U\d

%  AJUSTE DE CURVAS POR INTERPOLA��

n=8;
eppara=0.5*10^(2-n);
x= [3  4  5  7  8  9   11  12];
y= [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];
% Grafico dos pontos
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','c', ...
    'MarkerSize',8),hold on,grid on % Pontos
xlabel('x')
ylabel('y')

xx = 8.2; % Valor a ser estimado
% Grau 1 (2 pontos)
x=[8 9]';
y=[2.2 2.8]';
yn1=internewton(x,y,xx)
% Grau 2 (3 pontos)
x=[8 9 11]';
y=[2.2 2.8 3.8]';
yn2=internewton(x,y,xx)
% Grau 3 (4 pontos)
x=[7 8 9 11]';
y=[3.4 2.2 2.8 3.8]';
yn3=internewton(x,y,xx)
RowNames=[{'Grau 1'};{'Grau 2'};{'Grau 3'}];
Newton=[yn1;yn2;yn3];
T=table(Newton,'RowName',RowNames)
plot(8.2,2.3253,'o','MarkerEdgeColor','k','MarkerFaceColor', ...
    'b','MarkerSize',8)
% 2.3253 � a estimativa calculada pelo 2� m�todos,
% representada pela bolinha azul escuro no gr�fico.
%Pode-se perceber que n�o houve altera��o no valor da estimativa
% utilizando os polinomios interpoladores de newton do grau 1 ate o grau 3.
% Isso porque a fun��o  aparentemente n�o se trata de uma quadratica.

% quest�o 3
% a) Pode usar a regra do trap�zio m�ltipla, que seria 7 regras do trap�zio, tbm
%    pode-se usar 3 regras de 1/3 de Simpson com uma regra do trap�zio, pode-se
%    usar 2 regras 3/8 de Simpson com uma regra do trap�zio, e a melhor 
%    alternativa poss�vel e com maior acur�cia acontece quando se usa 1 regra 3/8 de Simpson
%    com 2 regras 1/3 de Simpson 
% integra��o num�rica

% Limites de integracao e funcao
x0 = 1; xn = 4;
f = @(x) x-exp(-x);
% Solu��o exata
syms x
fx = x-exp(-x);
Iex = int(fx,x0,xn)
n = 7;
x = linspace(x0,xn,n+1);
% Trapezio Multiplo
I1=trap(f,x0,xn,n)
E1=abs(((Iex-I1)/Iex)*100) % Erro
% 2 1/3 de Simpson + 3 Trapezio
I2=simp13(f,x(1),x(3),2)+trap(f,x(3),x(6),3)
E2=abs(((Iex-I2)/Iex)*100) % Erro
% 4 1/3 de Simpson + 1 Trapezio
I3=simp13(f,x(1),x(5),4)+trap(f,x(5),x(6),1)
E3=abs(((Iex-I3)/Iex)*100) % Erro
%Quadratura de Gauss
clear all; close all; clc;

f = @(x) x*exp(x);
x0 = 1;
xn = 4;
syms x
fx = x-exp(-x);
Iex = int(fx,x0,xn);
% Mudan�a de variavel
% x = ((xn+x0)+(xn-x0)*xd)/2; dx=(xn-x0)/2;
fm = @(xd) ((((xn+x0)+(xn-x0)*xd)/2)*exp(((xn+x0)+(xn-x0)*xd)/2))*(xn-x0)/2;
% 2 Pontos
c0=1;c1=1;
x0=-1/sqrt(3); x1=1/sqrt(3);
I2=c0*fm(x0)+c1*fm(x1);
E2=abs(((Iex-I2)/Iex))*100  % Erro
% 3 Pontos
c0=5/9; c1=8/9; c2=5/9;
x0=-sqrt(3/5); x1=0; x2=sqrt(3/5);
I3=c0*fm(x0)+c1*fm(x1)+c2*fm(x2);
E3=abs(((Iex-I3)/Iex))*100 % Erro
% Tabela
Pontos = {'Dois';'Tr�s'};
Estimativa = [I2;I3];
T = table(Pontos,Estimativa)
% Como esperado, a Quadratura de Gauss de 3 pontos apresentou uma acuracia melhor
% que a de 2 pontos, pois chegou praticamento no resultado
% exato
% 3c) Pelo motivo da regra de 1/3 de Simpson e do m�todo de Gauss Legendre de 
%     2 pontos ser exata somente para polin�mios de grau 3, na integral de grau 4 
%     ambas teriam erros de acur�cia
%     J� o Gauss Legendre de 3 pontos � exato at� o polin�mio de grau 5, nessa 
%     integral de grau 4 ela dar� um valor exato
%     Ou seja, � a melhor op��o e a acur�cia perfeita