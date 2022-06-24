function resp = Lagrange(x,y,xx)
% Interpolação de Lagrange
% yint = Lagrange(x,y,xx): Uses an (n − 1) −order
% Lagrange interpolating polynomial based on n data points
% to determine a value of the dependent variable (yint) at
% a given value of the independent variable, xx.
% input:
% x = vetor de variaveis independentes
% y = vetor de variaveis dependentes
% xx = valor de x onde se quer encontrar o valor de y

n=length(y); 
if length(y)~=n, error('x e y devem ter obrigatoriamente o mesmo tamanho!'); 
end

resp = 0;
for i = 1:n
    fdeX = y(i);
        for j = 1:n
            if i ~= j
            fdeX = fdeX*(xx - x(j))/(x(i) - x(j));
            end
        end
    resp = resp + fdeX;
end

