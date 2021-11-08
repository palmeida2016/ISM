%% Header
% Name: Pedro Almeida
% Date: November 8th, 2021
% Course: EGM 4523C – Intermediate Strength of Materials
% Serial Number: 2

%% Preparation
clc; clear; close all;
S = 2;
s=sqrt(S+1);

%% Solve
syms y

% Define main matrix
A = [0 1 0 1 0 0 0 0

    0 -S*y*y 0 0 0 0 0 0

    0 0 0 0 sin(y) cos(y) y 1

    0 0 0 0 -S*y*y*sin(y) -S*y*y*cos(y) 0 0

    sin(y/2) cos(y/2) (y/2) 1 0 0 0 0 

    0 0 0 0 sin(y/2) cos(y/2) (y/2) 1

    y*cos(y/2) -y*sin(y/2) y 0 -y*cos(y/2) y*sin(y/2) y 0

    -S*y*y*sin(y/2) -S*y*y*cos(y/2) 0 0 S*y*y*sin(y/2) S*y*y*cos(y/2) 0 0];


B = det(A);

fplot(B, [0,6]);
title('Determinant vs. x');
ylabel('Determinant');
xlabel('x')

x = fzero(matlabFunction(B),1);
disp(x);

hold on;
plot(x, 0, 'ok');
hold off;
