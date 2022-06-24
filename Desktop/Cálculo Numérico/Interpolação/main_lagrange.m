%%questão 1
x=[3 4 5 7 8 9 11 12]
y=[1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]
coef1=polyfit(x,y,5);
  x1=linspace(3,12,100)
  y1=coef1(1)*(x1.^5)+coef1(2)*(x1.^4)+coef1(3)*(x1.^3)+coef1(4)*(x1.^2)+coef1(5)*(x1)+coef1(6)
 scatter(x,y,'filled'),hold on
 plot(x1,y1), hold on
%% pela interpolação linear de lagrange
 xp=[7 8];
 fxp=[3.4 2.2];
 plot(xp,fxp,'MarkerEdgeColor','b','MarkerFaceColor','g','MarkerSize',8),hold on
 coef1=polyfit(xp,fxp,1)
% plot(xp,fxp,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
xest=7.8;
 
[f1]=interplinearlagrange(fxp,xp,xest)
scatter(xest,f1,'filled'),hold on
%%2.44
%%%forma um polinomio de 1°grau
%%59/5 - (6*xx)/5
 

%%pela interpolação quadrática de lagrange
 xp2=[7 8 9];
 fxp2=[3.4 2.2 2.8];%%%%aqui é o valor da função nos pontos de x dados
% plot(xp,fxp,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
plot(xp2,fxp2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6),hold on
coef1=polyfit(xp2,fxp2,2)
xest=7.8;
[f2]=interpquadraticalagrange(fxp2,xp2,xest)
scatter(xest,f2,'filled'),hold on
%%2.2480
%%%forma um polinomio de 2°grau
%%(9*xx^2)/10 - (147*xx)/10 + 311/5
 
%%pela interpolação de grau 3 de lagrange
%syms xx
 xp3=[5 7 8 9];
 fxp3=[4.4 3.4 2.2 2.8]
 plot(xp3,fxp3,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5),hold on
 coef1=polyfit(xp3,fxp3,3)
 xx=7.8;
 [yint] = lagrange(xp3,fxp3,xx)
scatter(xx,yint,'filled'),hold on
xlabel('x');
ylabel('y');
legend('pontos','ajuste','linear','ponto na linear','quadrática','ponto no grau 2','cúbica','ponto no grau 3');
hold off
 
 %%2.35
 %%%forma um polinomio de 3°grau
%%(17*xx^3)/60 - (59*xx^2)/10 + (473*xx)/12 - 403/5
 
%%
%questão 2
x=[1   2    3    4   5     6      7]
y=[1 0.5 0.333 0.25 0.2 0.1667 0.1429]
coef1=polyfit(x,y,5);
  x1=linspace(1,7,100)
  y1=coef1(1)*(x1.^5)+coef1(2)*(x1.^4)+coef1(3)*(x1.^3)+coef1(4)*(x1.^2)+coef1(5)*(x1)+coef1(6)
 scatter(x,y,'filled'),hold on
 plot(x1,y1), hold on
%% pela interpolação linear de lagrange
 xp=[4 5];
 fxp=[0.25 0.2];
% plot(xp,fxp,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
plot(xp,fxp,'MarkerEdgeColor','b','MarkerFaceColor','g','MarkerSize',8),hold on
 coef1=polyfit(xp,fxp,1)
xest=4.3;
[f1]=interplinearlagrange(fxp,xp,xest)
scatter(xest,f1,'filled'),hold on
%%0.2350
%%%forma um polinomio de 1°grau
%%9/20 - xx/20
 
%%pela interpolação quadrática de lagrange
 xp2=[3 4 5];
 fxp2=[0.333 0.25 0.2];%%%%aqui é o valor da função nos pontos de x dados
% plot(xp,fxp,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
plot(xp2,fxp2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6),hold on
coef1=polyfit(xp2,fxp2,2)
xest=4.3;
[f2]=interpquadraticalagrange(fxp2,xp2,xest)
scatter(xest,f2,'filled'),hold on
%%0.2575
%%%forma um polinomio de 2°grau
%%(33*xx^2)/2000 - (397*xx)/2000 + 39/50
 
%%pela interpolação de grau 3 de lagrange
%syms xx
 xp3=[3 4 5 6];
 fxp3=[0.333 0.25 0.2 0.1667];
  plot(xp3,fxp3,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',5),hold on
 coef1=polyfit(xp3,fxp3,3)
 xx=4.3;
[yint] = lagrange(xp3,fxp3,xx)
 scatter(xx,yint,'filled'),hold on
xlabel('x');
ylabel('y');
legend('pontos','ajuste','linear','ponto na linear','quadrática','ponto no grau 2','cúbica','ponto no grau 3');
hold off
 %%0.2323
 %%%forma um polinomio de 3°grau
%%% -(163*xx^3)/60000 + (491*xx^2)/10000 - (19571*xx)/60000 + 943/1000