function [yint] = lagrange(xp3,fxp3,xx)
x = xp3;
y = fxp3;
% Lagrange: Polin�mio interpolador de Lagrange 
% yint = lagrange(x,y,xx): Utiliza um polin�mio interpolador de lagrange de
% grau (n-1) com base em n pontos dados para determinar um valor da
% variavel dependente (yint) em um dado valor da vari�vel independente, xx.
%------------------------------Entrada------------------------------------
% x = vari�vel independente
% y = vari�vel dependente
% xx = valor da vari�vel independente em que a interpola��o � calculada
%-----------------------------Sa�da--------------------------------------
% yint = valor interpolado da vari�vel dependente 
% Integrantes do Grupo: Douglas, Jos� Kabesa E Victor
% Disciplina: C�lculo Num�rico
n = length(x);
if length(y)~=n, erro('x e y devem ter o mesmo tamanho'); end
s = 0;
for i = 1:n
    produto = y(i);
    for j = 1:n
        if i ~= j
            produto = produto*(xx-x(j))/(x(i)-x(j));
        end
    end
    s = s+produto;
end
yint = s;
