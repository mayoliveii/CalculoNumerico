function [f2]=interpquadraticalagrange(fxp2,xp2,xest)
 
% %%% Grafico da funcao, nesse cado de ln
%  vx=linspace(3,12);
%  vy=linspace(1.6,4.6);%%%%  "log no matlab é o ln"
% plot(vx,vy), hold on
% xlabel ('x')
% ylabel ('Funçao ln(x)')
%Pontos
%  xp2=[7 8 9]';
%  fxp2=[3.4 2.2 2.8];%%%%aqui é o valor da função nos pontos de x dados
% plot(xp,fxp,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
% Estimativa por Intepolacao Linear de Newton 
% xest=7.8;%%% "xest é um valor qualquer que esteja dentro do intervalo, usado só para análise e é dado no exercicio"
%exat=log(xest);
a= (((xest-xp2(2))*(xest-xp2(3)))/((xp2(1)-xp2(2))*(xp2(1)-xp2(3))))*fxp2(1);
b= (((xest-xp2(1))*(xest-xp2(3)))/((xp2(2)-xp2(1))*(xp2(2)-xp2(3))))*fxp2(2);
c= (((xest-xp2(1))*(xest-xp2(2)))/((xp2(3)-xp2(1))*(xp2(3)-xp2(2))))*fxp2(1);
f2= a+b+c;
%%%% Pelo Matlab, para plotar o gráfico da reta
% coef1=polyfit(xp2,fxp2,2)';
%y1=polyval(coef1,exat)
 
%  y1=polyval(coef1,vx)
%  plot(vx,y1,'g'),hold on
 
%Erro percentual
%E1=abs((f2-exat)/exat)*100