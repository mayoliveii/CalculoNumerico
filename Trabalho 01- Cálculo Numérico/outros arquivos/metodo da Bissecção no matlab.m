% IFG
% Engenharia El�trica
% C�lculo Num�rico
% Cleiber Nichida
% 4. Per�odo

% Metodo da bissec��o
clear;
clc;
disp ('Insira a fun��o');
f=input('','s');

disp ('Insira o intervalo inferior');
a=input('');
disp ('Insira o intervalo superior');
b=input('');

disp('Entre com o erro m�ximo');
err=input('');

disp ('Entre com o n�mero m�ximo de itera��es');
max=input('');

it=0;

while (it<=max)
    x=(a+b)/2
    if (subs(f,x)==0 || b-a<err)
        fprintf ('A raiz � %d \n',x);
        fprintf ('O n�mero de itera��es foi: %d \n',it);
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