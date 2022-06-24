% Introdução ao problema 4...
clc;clearvars
x= [0 1 2.5 3 4.5 5 6]; % variável independente
f=[2 5.4375 7.3516 7.5625 8.4453 9.1875 12]; % variável dependente 
xx =linspace(0,6); % dados finamente espaçados
p1=polyfit(x,f,1); % ajusta o conjunto de dados a um polinomio de grau 1
p2=polyfit(x,f,2); % ajusta o conjunto de dados a um polinomio de grau 2
p3=polyfit(x,f,3); % ajusta o conjunto de dados a um polinomio de grau 3
p4=polyfit(x,f,4); % ajusta o conjunto de dados a um polinomio de grau 4
p5=polyfit(x,f,5); % ajusta o conjunto de dados a um polinomio de grau 5
p6=polyfit(x,f,6); % ajusta o conjunto de dados a um polinomio de grau 6

y1=polyval(p1,3.5); % valor de f(3.5) para o polinomio de grau 1
y2=polyval(p2,3.5); % valor de f(3.5) para o polinomio de grau 2
y3=polyval(p3,3.5); % valor de f(3.5) para o polinomio de grau 3
y4=polyval(p4,3.5); % valor de f(3.5) para o polinomio de grau 4
y5=polyval(p5,3.5); % valor de f(3.5) para o polinomio de grau 5
y6=polyval(p6,3.5); % valor de f(3.5) para o polinomio de grau 6

yy1=polyval(p1,xx); % curva de grau 1
yy2=polyval(p2,xx); % curva de grau 2
yy3=polyval(p3,xx); % curva de grau 3
yy4=polyval(p4,xx); % curva de grau 4
yy5=polyval(p5,xx); % curva de grau 5
yy6=polyval(p6,xx); % curva de grau 6


plot(x,f,'o',xx,yy1,'r',xx,yy2,'g',xx,yy3,'b',xx,yy4,'c',xx,yy5,'k',xx,yy6,'y')
xlabel('variável independente')
ylabel('variável dependente')
grid on
vet=[y1 y2 y3 y4 y5 y6]';
