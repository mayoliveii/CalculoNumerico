function[a0,a1,a2,a3]=regrlinp3(x,y)
    %------------------------------------------------------------------
    % regrlinp3: ajuste de um conjunto de dados (x,y) por regressão 
    % linear polinomial por mínimos quadrados
      
    % ENTRADA:
    % x: vetor com variável independente dos pontos
    % y: variável dependente

    % SAÍDA:
    % a0: intersecção com eixo y
    % a1: inclinação
    % a2: coeficiente
    % a3: coeficiente
    
    % MÍNIMOS QUADRADOS LINEAR
    n=length(x);
    if n ~= length(y); error ('x e y devem ter o mesmo tamanho'), end

    % Geração dos dados para a matriz de MMQ por regressão linear
    % polinomial
    sx=sum(x);
    sx2=sum(x.^2);
    sy=sum(y);
    sx3=sum(x.^3);
    sxy=sum(x.*y);
    sx4=sum(x.^4);
    sx5=sum(x.^5);
    sx6=sum(x.^6);
    sx2y=sum((x.^2).*y);
    sx3y=sum((x.^3).*y);
    
    % Calculo dos coeficientes da melhor reta que ajusta os pontos dados
    % De forma Matricial:
    A=[n sx sx2 sx3
       sx sx2 sx3 sx4
       sx2 sx3 sx4 sx5
       sx3 sx4 sx5 sx6];
    b=[sy sxy sx2y sx3y]';
    
    % Resolve o sistema utilizando a \ do Matlab
    a=A\b;
    % Coeficientes
    a0=a(1); a1=a(2); a2=a(3); a3=a(4);
    
    % Gerando dados para plotar a curva ajustada - reta
    %xa=linspace(min(x)-1,max(x)+1)';
    %ya=(a0 + a1*xa + a2*xa.^2 + a3*xa.^3);
    %plot(x,y,'o','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',8),hold on
    %plot(xa,ya,'g-','LineWidth',2), hold on
    %xlabel('v,m/s')
    %ylabel('F,N')
    %title('Gráfico de Força x Velocidade do vento para um corpo em um túnel de vento')
   
end