%PEDRO GUILHERME LAURENTINO GONÇALVES - EXAME
clear all;clc;clear;
%Faça um programa no Scilab que gere um vetor (dimensão 1) com os 20 primeiros números que são
%múltiplos simultaneamente de 7 e de 11.
A = 1:1464;;
a= 1:length(A);
m = 11;
n= 7;
    b= find(mod(a,m) == 0) ;
    c= find(mod(a,n) == 0);
D= intersect(b,c);
B=[b]';
C=[c]';
d=[D]'