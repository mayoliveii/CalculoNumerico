function [f1]=interplinearlagrange(fxp,xp,xest)
 
%%% Grafico da funcao, nesse cado de ln
%  vx=linspace(3,12,100);
%  vy=linspace(0.3,8.5,100);%%%%  "log no matlab � o ln"
%  scatter(vx,vy)
% plot(vx,vy), hold on
% xlabel ('x')
% ylabel ('Fun�ao ln(x)')
% Pontos dados
 %xp=[7 8]';
 %fxp=[3.4 2.2];%%%%aqui � o valor da fun��o nos pontos de x dados
% plot(xp,fxp,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
% Estimativa por Intepolacao Linear de Newton 
%xest=7.8;%%% "xest � um valor qualquer que esteja dentro do intervalo, usado s� para an�lise e � dado no exercicio"
%exat=log(xest);
f1=((xest-xp(2))/(xp(1)-xp(2)))*fxp(1) + ((xest-xp(1))/(xp(2)-xp(1)))*fxp(2);
%%%% Pelo Matlab, para plotar o gr�fico da reta
% coef1=polyfit(xp,fxp,1)';
% y1=polyval(coef1,exat)
% 
% %
% y1=polyval(coef1,vx)
% plot(vx,y1,'g'),hold on
 
%Erro percentual
% E1=abs((f1-exat)/exat)*100