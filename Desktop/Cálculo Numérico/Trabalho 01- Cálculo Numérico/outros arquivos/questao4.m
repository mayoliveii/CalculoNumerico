%questão 1
%Peça um número “T” ao usuário e crie um vetor com “T” elementos (números), onde cada elemento
%é um número inteiro aleatórios entre 0 e 10
T= input('Quantos elementos terá o vetor?');
%for i=0:1:T
%    n(i)=rand;
%end
%disp(n)
for i= 0:1:T
          A(i)= rand(1,T);
end
disp(A)