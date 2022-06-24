clear all; clc; clearvars;
D= 0.001 %m
E=0.8 
Rele=0.4 %Ohmega/m
k=0.7 %W/m*k
L=0.05 %m 
%Tinfinito = Tsur 
Tsur= 300 %K
h= 50 %W/m^2*K 
tspan = [0,10];
dTdt=@(T,t)i^2*Rele-h*pi*D*(T-Tsur)+E*O*pi*D*(T^4-Tsur^4);
[t,T]=ode45(dTdt,tspan,h);



