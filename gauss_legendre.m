function [I]=gauss_legendre(f,a,b)
% Gauss-Legendre: M�todo da integra��o num�rica
% I = W0f(x0)+W1f(x1)+...+Wn-1f(xn-1): F�rmula de Gauss-Legendre com mais pontos
% [I]=gauss_legendre(f,a,b): Utiliza o M�todo de Quadratura de
% Gauss-Legendre para determinar a integral da fun��o f
% W0 = W1 = 1, Para a Regra de Quadratura de Gauss de 2 pontos 
% W0 = 0.5555556, Para a Regra de Quadratura de Gauss de 3 pontos
% W1 = 0.8888889, Para a Regra de Quadratura de Gauss de 3 pontos
% W2 = 0.5555556, Para a Regra de Quadratura de Gauss de 3 pontos
%------------------------------Entrada------------------------------------
% f = A fun��o a ser integrada
% a = limite m�nimo
% b = limite m�ximo
%-------------------------------Sa�da------------------------------------
% I = O valor da integral a ser resolvida ou encontrada
% Integrantes do Grupo: Douglas, Jos� Kabesa E Victor
% Disciplina: C�lculo Num�rico
ponto = 0;
while ponto == 0
ponto = input('Escolha os pontos da equa��o do Gauss-Legendre a ser usado.(2 � min. e 3 � max):');
      if ponto<2||ponto>3
          ponto = 0;
          fprintf('Entrada errada! Favor escolha um valor entre 2 e 3 .\n\n');
      end
end
a0=(b+a)/2;
a1=(b-a)/2;
if ponto == 2
    x0=a0+(a1*(-1/(sqrt(3)))); % Parametriza��o
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
fprintf('\nA integral resolvida usando %.0f-ponto da f�rmula do Gauss-Legendre � %.3f\n',ponto,I);
