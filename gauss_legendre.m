function [I]=gauss_legendre(f,a,b)
% Gauss-Legendre: Método da integração numérica
% I = W0f(x0)+W1f(x1)+...+Wn-1f(xn-1): Fórmula de Gauss-Legendre com mais pontos
% [I]=gauss_legendre(f,a,b): Utiliza o Método de Quadratura de
% Gauss-Legendre para determinar a integral da função f
% W0 = W1 = 1, Para a Regra de Quadratura de Gauss de 2 pontos 
% W0 = 0.5555556, Para a Regra de Quadratura de Gauss de 3 pontos
% W1 = 0.8888889, Para a Regra de Quadratura de Gauss de 3 pontos
% W2 = 0.5555556, Para a Regra de Quadratura de Gauss de 3 pontos
%------------------------------Entrada------------------------------------
% f = A função a ser integrada
% a = limite mínimo
% b = limite máximo
%-------------------------------Saída------------------------------------
% I = O valor da integral a ser resolvida ou encontrada
% Integrantes do Grupo: Douglas, José Kabesa E Victor
% Disciplina: Cálculo Numérico
ponto = 0;
while ponto == 0
ponto = input('Escolha os pontos da equação do Gauss-Legendre a ser usado.(2 é min. e 3 é max):');
      if ponto<2||ponto>3
          ponto = 0;
          fprintf('Entrada errada! Favor escolha um valor entre 2 e 3 .\n\n');
      end
end
a0=(b+a)/2;
a1=(b-a)/2;
if ponto == 2
    x0=a0+(a1*(-1/(sqrt(3)))); % Parametrização
    x1=a0+(a1*(1/(sqrt(3))));
    fx0=a1*f(x0);
    fx1=a1*f(x1);
    I=fx0+fx1;
end

if ponto == 3
    x0=a0+(a1*-0.774596669);
    x1=a0;
    x2=a0+(a1*0.774596669);
    fx0=a1*f(x0);
    fx1=a1*f(x1);
    fx2=a1*f(x2);
    I=(0.5555556*fx0)+(0.8888889*fx1)+(0.5555556*fx2);
end
fprintf('\nA integral resolvida usando %.0f-ponto da fórmula do Gauss-Legendre é %.3f\n',ponto,I);
