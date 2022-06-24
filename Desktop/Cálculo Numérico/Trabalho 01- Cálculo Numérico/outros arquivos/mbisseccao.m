function [ raiz, control, control2 ] = mbisseccao
%MBISSECCAO Summary of this function goes here
%   Detailed explanation goes here
% @ ACLNM // May 2014

funcao = 'x - 2^0.5';
%funcao = '1 - exp(x)';
%funcao = 'sin(x) - exp(x)';
a0=-5;
b0=10;
ncycles = 51;
a = a0;
b = b0;
click = 0;
valid = 1;
control = zeros(ncycles,3);
control(:,1) = (1:ncycles)';
control2 = zeros(ncycles,1);
while (valid == 1) && (click < ncycles)
    click = click + 1;
    [valid, sfab] = bolzanocheck(funcao, a, b);
    control(click,[2 3]) = [a b];
    control2(click,1) = (b-a);
    
    if valid == 1 % é porque existe um zero no intervalo
        [ valid, a, b ] = findside(funcao, a, b, sfab);
        
    elseif valid == -1
        disp('ERRO, no intervalo existem zero ou 2*n raízes, sendo n € N.')
    elseif valid == 0
        disp('chegámos ao fim')
    end
end

if valid ~= 1 || click == ncycles
    raiz = [a b click];
end
% disp(control)
% disp(control2)
% disp(raiz)
end

function [valid, sfab] = bolzanocheck(funcao, a, b)
sfab = [0 0];
x = a;
sfab(1) = sign(eval(funcao));
x = b;
sfab(2) = sign(eval(funcao));
valid = -prod(sfab); % valid is true if bolzano checks.
end

function [ valid, a, b ] = findside(funcao, a, b, sfab)
valid = 1;
x = (a + b) / 2;
sfc = sign(eval(funcao));
sfab = (sfab .* sfc);
if (sfab == [0 0]) % o c é o zero
    a = x;
    b = x;
    valid = 0;
elseif sfab(1) == -1
    b = x;
elseif sfab(2) == -1
    a = x;
end
end
