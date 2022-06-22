% IFG
% Engenharia Elétrica
% Cálculo Numérico
% Cleiber Nichida
% 4. Período

% Metodo da bissecção
clear;
clc;
disp ('Insira a função');
f=input('','s');

disp ('Insira o intervalo inferior');
a=input('');
disp ('Insira o intervalo superior');
b=input('');

disp('Entre com o erro máximo');
err=input('');

disp ('Entre com o número máximo de iterações');
max=input('');

it=0;

while (it<=max)
    x=(a+b)/2
    if (subs(f,x)==0 || b-a<err)
        fprintf ('A raiz é %d \n',x);
        fprintf ('O número de iterações foi: %d \n',it);
        break
    end
    it=it+1;
    
    if sign(subs(f,x))==sign(subs(f,a))
        a=x;
    else 
        b=x;
    fprintf(' %3i   %10.8f   %10.8f   %10.8f   %10.8f   %10.8f\n', it, a, b, x, err);
    end
   
end