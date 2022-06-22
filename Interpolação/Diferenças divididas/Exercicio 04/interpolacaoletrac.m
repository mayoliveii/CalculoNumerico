clear; clc;
xd=[0 1 2.5 3 4.5 5 6]';
yd=[2 5.4375 7.3516 7.5625 8.4453 9.1875 12]';
A=[xd.^3 xd.^2 xd ones(length(xd),1)];
b=yd;
C=A\b;
a= interp1(xd,yd);
