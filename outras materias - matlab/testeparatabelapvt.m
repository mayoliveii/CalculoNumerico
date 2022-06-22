function table = testeparatabelapvt(Pmin, Pmax, Pbo, API, dg, T)

  P = linspace(Pmin, Pmax, 20);
  Rs = zeros(20,1);
  Bo = zeros(20,1);
  Bg = zeros(20,1);
  Z = zeros(20,1);
  Co = zeros(20,1);


%% Equações gerais
  grau_API = 141.5/(API + 131.5); %grau API
  Bob = Rs .* (dg/grau_API)^(0.526) + 0.986 * (( T - 273.15) * 9/5 + 32); %parâmetro da correlação de Glaso para Bo
  
%% Temperatura e pressão pseudocríticas
  if dg < 0.75
    Ppc = 677 + 15*dg - 37.5 * dg^2;
    Tpc = 168 + 325*dg - 12.5 * dg^2;
  else
    Ppc = 677 + 15*dg - 37.5 * dg^2;
    Tpc = 168 + 325*dg - 12.5 * dg^2;
  end
  
%% Fator de compressibilidade (Z)  
    for i = 1:20
    Z(i) = 1 - 3.53 * (P(i)/Ppc)/10^(0.9813*T/Tpc) + 0.274 * (P(i)/Ppc)^2/10^(0.8157*T/Tpc);
    end
 %% Fator volume formação do gás
  Pst = 14.7; %pressão standard
  Tst = 60; %temperatura standard
  
  for i = 1:20
    Bg(i) = Pst * Z(i) * (( T - 273.15) * 9/5 + 32) / (Tst * P(i)*0.000145038); 
  end
  
  %% Compressibilidade do óleo
    a = 2.8869 - 14.1811 - 3.3093 * log10((Pbo*0.000145038)^0.5); %parâmetro de solubilidade do gás
  Rsb = dg * (API^(0.989)/(( T - 273.15) * 9/5 + 32)^(0.172) * 10^a)^1.2255; %Razão de solubilidade na pressão de bolha da mistura
  
  for i = 1:20
    if P(i) > Pbo
      Co(i) = 1.705e-7 * Rsb^(0.69357)*dg^(0.1885)*API^(0.3272)*(( T - 273.15) * 9/5 + 32)^(0.6729)*(P(i)*0.000145038)^(-0.5906);
    else
      Co(i) = (1/Bo(i))*(Bo(i+1)-Bo(i))/((P(i+1)-P(i))*0.000145038) + (Bg(i)/Bo(i))*(Rs(i+1)-Rs(i))/((P(i+1)-P(i))*0.000145038);
    end
  end

%% Fator volume formação
   for i = 1:20
    if P(i) > Pbo
      Bo(i) = Bob(i) * exp(-Co(i)*P(i)-Pbo);
    else
      a = -6.58511+2.91329 * log10(Bob(i))-0.27683*(log10(Bob(i)))^2;
      Bo(i) = 1 + 10^a;
    end
   end
  
%% Razão de solubilidade 
  for i = 1:20
    if P(i) > Pbo
      a = 2.8869 - 14.1811 - 3.3093 * log10((Pbo*0.000145038)^0.5);
      Rs(i) = (dg * (API^(0.989)/(( T - 273.15) * 9/5 + 32)^(0.172) * 10^a)^1.2255);
    else
      a = 2.8869 - 14.1811 - 3.3093 * log10((P(i)*0.000145038)^0.5);
      Rs(i) = (dg * (API^(0.989)/(( T - 273.15) * 9/5 + 32)^(0.172) * 10^a)^1.2255);
    end
  end
  
  %% Gráficos
   figure(1)
  plot(P,Rs);
  xlabel('Pressão')
  ylabel('Rs')
  
  figure(2)
  plot(P,Bo);
  xlabel('Pressão')
  ylabel('Bo')
  
  figure(3)
  plot(P,Bg);
  xlabel('Pressão')
  ylabel('Bg')
  
  figure(4)
  plot(P,Co);
  xlabel('Pressão')
  ylabel('Co')
  
  figure(5)
  plot(P,Z);
  xlabel('Pressão')
  ylabel('Z')
 
 %% Gerador de tabela 
%   tabelaPVT = table(P,Rs,Bo,Bg,Co,Z)
%   tabelaPVT =table(P',Rs',Bo',Bg',Co',Z','VariableNames',{'P','Rs','Bo','Bg','Co','Z'});
end
  