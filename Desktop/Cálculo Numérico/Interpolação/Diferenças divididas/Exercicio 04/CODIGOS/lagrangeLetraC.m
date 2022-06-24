function resp = lagrangeLetraC(x,y,xx)
% Interpolação de Lagrange
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
% Grafico dos pontos
plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','c', ...
    'MarkerSize',8),hold on,grid on % Pontos
xlabel('x')
ylabel('y')

