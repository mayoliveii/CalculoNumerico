clear;clc;
Pmin=14.7;
Pmax=3200;
T=400;
dg=0.8;
API=37.8;
Pbolha=2000;
  P = linspace(Pmin, Pmax, 20);
  Rs = zeros(20,1);
  Bo = zeros(20,1);
  Bg = zeros(20,1);
  Z = zeros(20,1);
  Co = zeros(20,1);
  mio = zeros(20,1);
  mig = zeros(20,1);
  
  for i = 1:20
    if P(i) > Pbolha
      a = 2.8869 - 14.1811 - 3.3093 * log10((Pbolha*0.000145038))^0.5;
      Rs(i) = (dg * (API^(0.989)/(( T - 273.15) * 9/5 + 32)^(0.172) * 10^a)^1.2255);
    else
      a = 2.8869 - 14.1811 - 3.3093 * log10((P(i)*0.000145038)^0.5);
      Rs(i) = (dg * (API^(0.989)/(( T - 273.15) * 9/5 + 32)^(0.172) * 10^a)^1.2255);
    end
   [RS]=[Rs]'
  end
  
  
  
  d_o = 141.5/(API + 131.5);
  
  Bob = Rs .* (dg/d_o)^(0.526) + 0.986 * (( T - 273.15) * 9/5 + 32); %parâmetro da correlação de Glaso para Bo
  
  if dg < 0.75
    Ppc = 677 + 15*dg - 37.5 * dg^2;
    Tpc = 168 + 325*dg - 12.5 * dg^2;
  else
    Ppc = 677 + 15*dg - 37.5 * dg^2;
    Tpc = 168 + 325*dg - 12.5 * dg^2;
  end
  
  for i = 1:20
    Z(i) = 1 - 3.53 * (P(i)/Ppc)/10^(0.9813*T/Tpc) + 0.274 * (P(i)/Ppc)^2/10^(0.8157*T/Tpc);
  end
  
  Psc = 14.7;
  Tsc = 60;
  
  for i = 1:20
    Bg(i) = Psc * Z(i) * (( T - 273.15) * 9/5 + 32) / (Tsc * P(i)*0.000145038); 
  end
  
  a = 2.8869 - 14.1811 - 3.3093 * log10((Pbolha*0.000145038)^0.5);
  Rsb = dg * (API^(0.989)/(( T - 273.15) * 9/5 + 32)^(0.172) * 10^a)^1.2255;
  
  for i = 1:20
    if P(i) > Pbolha
      Co(i) = 1.705e-7 * Rsb^(0.69357)*dg^(0.1885)*API^(0.3272)*(( T - 273.15) * 9/5 + 32)^(0.6729)*(P(i)*0.000145038)^(-0.5906);
    else
      Co(i) = (1/Bo(i))*(Bo(i+1)-Bo(i))/((P(i+1)-P(i))*0.000145038) + (Bg(i)/Bo(i))*(Rs(i+1)-Rs(i))/((P(i+1)-P(i))*0.000145038);
    end
  end
  
   for i = 1:20
    if P(i) > Pbolha
      Bo(i) = Bob(i) * exp(-Co(i)*P(i)-Pbolha);
    else
      a = -6.58511+2.91329 * log10(Bob(i))-0.27683*(log10(Bob(i)))^2;
      Bo(i) = 1 + 10^a;
    end
  end
  
  for i = 1:20
    if P(i) < Pbolha
      X = exp(22.33 - 0.194*API + 0.00033 * API^2 - (3.2-0.0185*API)*log( T +310));
      miod = exp(X) - 1;
      a = exp(4.768-0.8359*log(Rs(i)+300));
      b = 0.555 + 133.55/(Rs(i) + 300);
      mio(i) = a * miod^(b);
    else
      X = exp(22.33 - 0.194*API + 0.00033 * API^2 - (3.2-0.0185*API)*log(T +310));
      miod = exp(X) - 1;
      a = exp(4.768-0.8359*log(Rsb+300));
      b = 0.555 + 133.55/(Rsb + 300);
      miob = a * miod^(b);
      alpha = 6.5698e-7*log(miob^2)-1.48211e-5*log(miob)+2.27877e-4;
      beta = 2.24623e-2*log(miob) + 0.873204;
      mio(i) = miob * exp(alpha*(P(i)-Pbolha)^beta);
    end
  end
  
  rhog = dg * 0.99;
  
  for i = 1:20
    Mg = rhog * 8.31446 * T * Z(i) / P(i)
    X = 3.47 + 1588/T + 0.0009 * Mg
    Y = 1.66378 - 0.04679 * X
    K = (0.807 * (T/Tpc)^0.618 - 0.357 * exp(-0.449*(T/Tpc))+0.34*exp(-4.058*(T/Tpc))+0.018)/(0.9490*(Tpc/(Mg^3*Ppc^4))^(1/6))
    A = X * rhog^Y
    mig(i) = 1e-4*K*exp(A)
  end
%   
%   Rs = Rs * 0.178107;
%   
%   figure(1)
%   plot(P,Rs);
%   xlabel('Pressão')
%   ylabel('Rs')
%   
%   figure(2)
%   plot(P,Bo);
%   xlabel('Pressão')
%   ylabel('Bo')
%   
%   figure(3)
%   plot(P,Bg);
%   xlabel('Pressão')
%   ylabel('Bg')
%   
%   figure(4)
%   plot(P,mio);
%   xlabel('Pressão')
%   ylabel('mio')
%   
%   figure(5)
%   plot(P,mig);
%   xlabel('Pressão')
%   ylabel('mig')
%   
%   figure(6)
%   plot(P,Co);
%   xlabel('Pressão')
%   ylabel('Co')
%   
%   figure(7)
%   plot(P,Z);
%   xlabel('Pressão')
%   ylabel('Z')
%   
% tabela = table(P,RS,BO,BG,mio,mig,Co,Z) 
% % end