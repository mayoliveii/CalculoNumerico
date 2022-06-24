clear all; clc;

%% Trabalho 01-Erros e processos iterativos
%Mayara Camilo de Oliveira;
%Pedro Guilherme L. Gonçalves;
%Max Assunção Pacheco.

%% Iniciando os vetores 
Estim=[]; %estimativas
Epverd=[]; %erro percentual verdadeiro
Epestim=[]; %erro percentual estimado

%% Estimar 1/(1+x^2)
x= 0.7;
exato= 1/(1+x^2); %valor exato
N= 4; %numero de algarismos significativos
eppara= 0.5*10^(2-N);

%% Primeira estimativa
n=0;
estim=0;
epestim=100; %erro da primeira estimativa

while epestim > eppara
    est_old= estim;
    estim= estim+((-x^2)^n);
    n=n+1;
    epverd= abs(exato-estim);
    epestim= abs((estim-est_old)/estim)*100;
    Estim= [Estim estim];
    Epverd= [Epverd epverd];
    Epestim= [Epestim epestim];
     
end
t=[1:1:length(Estim) ; Estim ; Epverd ; Epestim]';

tabela= table((1:1:length(Estim))', Estim' , Epverd', Epestim', 'VariableNames',{'Iteração','Estimativa','Erro percentual verdadeiro','Erro percentual estimado'})
plot(t(:,1),t(:,3),'b','linewidth',2),hold on
plot(t(:,1),t(:,4),'-.r','linewidth',2),hold on
axis([0 10 0 10]);
xlabel('termos/iteracoes')
ylabel('erros')
legend(['Epverd'],['Epestim'])
