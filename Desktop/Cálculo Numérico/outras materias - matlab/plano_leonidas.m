clear all; close all;clc;
x = -10:-20:-6;
y = -10:-10:-6;
z = -10:-3:-6;
[X,Y,Z] = meshgrid(x,y,z);
F = -7*X.^2 + -4*Y.^2 + 5*Z.^2;
xlabel('x') ;
ylabel('y') ;
zlabel('z') ;
