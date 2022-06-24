%--------------------------------------------------------------------------
% MAIN QUEST�O C
% PROF Eduardo
% Alunos: Mayara, Max e Pedro
%--------------------------------------------------------------------------
%% Entradas
x =[0 1 2.5 3 4.5 5 6];
y = [2 5.4375 7.3516 7.5625 8.4453 9.1875 12];
xx = 3.5; % Valor a ser estimado
% Grau 1 (2 pontos)
x=[3 4.5]';
y=[7.5625 8.4453]';
yn1=lagrangeLetraC(x,y,xx)
% Grau 2 (3 pontos)
x=[2.5 3 4.5]';
y=[7.3516 7.5625 8.4453]';
yn2=lagrangeLetraC(x,y,xx)
% Grau 3 (4 pontos)
x=[2.5 3 4.5 5]';
y=[7.3516 7.5625 8.4453 9.1875]';
yn3=lagrangeLetraC(x,y,xx)
% Grau 4 (5 pontos)
x=[1 2.5 3 4.5 5]';
y=[5.4375 7.3516 7.5625 8.4453 9.1875]';
yn4=lagrangeLetraC(x,y,xx)
% Grau 5 (6 pontos)
x=[0 1 2.5 3 4.5 5]';
y=[2 5.4375 7.3516 7.5625 8.4453 9.1875]';
yn5=lagrangeLetraC(x,y,xx)
%Grafico
RowNames=[{'Grau 1'};{'Grau 2'};{'Grau 3'};{'Grau 4'};{'Grau 5'}];
Lagrange=[yn1;yn2;yn3;yn4;yn5];
T=table(Lagrange,'RowName',RowNames)
plot(3.5,7.7422,'o','MarkerEdgeColor','k','MarkerFaceColor', 'b','MarkerSize',8)

