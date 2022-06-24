%% Busca Incremental
min=2;
max=4;
[intervalos]=busca_incremental(min,max,n_div)
%% Bissecção
%Função 01
func=@(x)log10(x)-sin(x);
xmin=2;
xmax=4;
[raiz,fx,EstRaiz,Epest,iter,tabela]=bissec(func,xmin,xmax,maxit)
%Função 02
func=@(x)log10(x) -(x)^(1/2);
xmin=2;
xmax=4;
[raiz,fx,EstRaiz,Epest,iter,tabela]=bissec(func,xmin,xmax,maxit)
%% Falsa Posição
