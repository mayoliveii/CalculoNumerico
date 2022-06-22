clear all; close all;clc;
%De quanto a quanto varia
x = linspace(-12,12,11);  y = x;
[X,Y] = meshgrid(x,y);
Z = (-10 +12*Y -16*X)  / (-18);
figure;
surf(X,Y,Z);
hold on;%(DOMÍNIO: %scatter3(X(:),Y(:),0*X(:)));
%Pontos dados no exercício:
scatter3(2,-4,5,'LineWidth',2); 
scatter3(-1,4,-3,'LineWidth',2); 
scatter3(-1,10,-7,'LineWidth',2);
% surf(X,Y,Z);
hold on;
grid on;
%formando vetor
w = -3-5;  v = 4+4;  u = -1-2;
quiver3(2,-4,5,u,v,w,'LineWidth',2,'Autoscale','off');
hold on;
u = -1-2; v = 10+4; w= -7-5;
quiver3(2,-4,5,u,v,w,'LineWidth',2,'Autoscale','off');
hold on;
quiver3(0,0,0,2,-4,5,'LineWidth',2,'Autoscale','off');
xlabel('x');  ylabel('y');  zlabel('z');  
