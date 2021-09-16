%% Header
% Name: Pedro Almeida
% Date: October 1st, 2021
% Course: EGM 4523C – Intermediate Strength of Materials
% Serial Number: 2

%% Preparation
clc; clear; close all;
s = 2;

%% Problem 1
%Constants
L = 2; %Beam Length
E = 69.9e9; %Young's Modulus
v_allowed = L/500; %Allowed Displacement
k = 1.5; %Safety Factor
sY = 276e6; %Yield Stress
I = 0; % 

%Problem Solution
syms x

%Displacement Plot
subplot(3,1,1)
shear = -s*pw(x,0,1) + 2*s*pw(x,1,1) - 2*s*pw(x,2,1) + 2*s*pw(x,3,1) - 2*s*pw(x,4,1) + 2*s*pw(x,5,1) - 2*s*pw(x,6,1) + 2*s*pw(x,7,1) - 2*s*pw(x,8,1) + s*pw(x,9,1);
fplot(shear, [0 10]);
ylim([-3 1])
title('Shear Force vs. x');
xlabel('x [m]')
ylabel('Force [N]')

%Moment Plot
subplot(3,1,2)
moment = -(s/2)*pw(x,0,2) + 2*(s/2)*pw(x,1,2) - 2*(s/2)*pw(x,2,2) + 2*(s/2)*pw(x,3,2) - 2*(s/2)*pw(x,4,2) + 2*(s/2)*pw(x,5,2) - 2*(s/2)*pw(x,6,2) + 2*(s/2)*pw(x,7,2) - 2*(s/2)*pw(x,8,2) + (s/2)*pw(x,9,2);
fplot(moment, [0 10]);
title('Moment vs. x');
xlabel('x [m]')
ylabel('Moment [Nm]')

%Displacement Plot
subplot(3,1,3)
displacement = -(s/24)*pw(x,0,4) + 2*(s/24)*pw(x,1,4) - 2*(s/24)*pw(x,2,4) + 2*(s/24)*pw(x,3,4) - 2*(s/24)*pw(x,4,4) + 2*(s/24)*pw(x,5,4) - 2*(s/24)*pw(x,6,4) + 2*(s/24)*pw(x,7,4) - 2*(s/24)*pw(x,8,4) + (s/24)*pw(x,9,4);
fplot(displacement, [0 10]);
title('Displacement vs. x');
xlabel('x [m]')
ylabel('Displacement [m]')


%% Problem 2
