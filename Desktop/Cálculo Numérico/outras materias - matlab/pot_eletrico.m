clear all; clc; format short;
a=1;
b=1;
x=linspace(-a,a,100)
y=linspace(0,b,100)
nInf= 10;

soma(1:length(x),1:length(y))- 0;
for i=1:length(x)
    for j=1:length(y)
        n=1;
        while( n < nInf )
            llk=(2*n-1)*pi/a;
            temp= ( cosh( llk*x(j) )/ cosh( llk*b );
            soma(i,j)= soma(i,j)+1 /(2*n-1)*temp;
            n = n + 1;
        end
    end
end
