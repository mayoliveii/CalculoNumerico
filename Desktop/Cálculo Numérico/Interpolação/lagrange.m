function [yint] = lagrange(xp3,fxp3,xx)
x = xp3;
y = fxp3;
% Lagrange: Polinômio interpolador de Lagrange 
% yint = lagrange(x,y,xx): Utiliza um polinômio interpolador de lagrange de
% grau (n-1) com base em n pontos dados para determinar um valor da
% variavel dependente (yint) em um dado valor da variável independente, xx.
%------------------------------Entrada------------------------------------
% x = variável independente
% y = variável dependente
% xx = valor da variável independente em que a interpolação é calculada
%-----------------------------Saída--------------------------------------
% yint = valor interpolado da variável dependente 
% Integrantes do Grupo: Douglas, José Kabesa E Victor
% Disciplina: Cálculo Numérico
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
