function[a0,a1]=regrlinsimples(x,y)
%------------------------------------------------------------
% regrlinsimples : ajuste de um conjunto de dados (x,y) por regressao 
% linear simples por mínimos quadrados
      
% ENTRADA
% x : vetor com variavel independente dos pontos
% y : variavel dependente

% SAÍDA
% A: matriz A dos coeficiente de MMQL
% b: vetor b dos coeficiente de MMQL

% MINIMOS QUADRADOS LINEAR
n=length(x);
if n ~= length(y); error ('x e y devem ter o mesmo tamanho'), end
sx=sum(x); 
sy=sum(y);
sxy=sum(x.*y); 
sx2=sum(x.^2);

% Montagem da Matriz A e vetor b
% para calculo dos coeficientes da melhor reta que ajusta os pontos dados
% por MMQL
% Forma Maticial
A=[n sx
   sx sx2 ];
b=[sy sxy]';

 a=A\b;
a0=a(1); a1=a(2);
end
%   
% % Curva 
% xa=linspace(min(x)-1,max(x)+1)';
% ya=(a0 + a1*xa);
% plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
% plot(xa,ya,'-','LineWidth',2), hold on
% xlabel('v,m/s')
% ylabel('F,N')
% title('Gráfico de Força x Velocidade do vento para um corpo em um túnel de vento')
% 
         