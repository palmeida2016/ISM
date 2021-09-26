%% Header
% Name: Pedro Almeida
% Date: October 1st, 2021
% Course: EGM 4523C – Intermediate Strength of Materials
% Serial Number: 2

%% Preparation
clc; clear; close all;
s = 2;
range_x = [0 10];
run_problems = [1 2 3 4 5];


%% Problem 1
if any(run_problems(:) == 1)
    figure(1)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/500; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 0; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = .55*s*pw(x,0,0) -s*pw(x,0,1) + 2*s*pw(x,1,1) - 2*s*pw(x,2,1) + 2*s*pw(x,3,1) - 2*s*pw(x,4,1) + 2*s*pw(x,5,1) - 2*s*pw(x,6,1) + 2*s*pw(x,7,1) - 2*s*pw(x,8,1) + s*pw(x,9,1) + 0.45*s*pw(x,10,0);
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 0.55*s*pw(x,0,1) -(s/2)*pw(x,0,2) + 2*(s/2)*pw(x,1,2) - 2*(s/2)*pw(x,2,2) + 2*(s/2)*pw(x,3,2) - 2*(s/2)*pw(x,4,2) + 2*(s/2)*pw(x,5,2) - 2*(s/2)*pw(x,6,2) + 2*(s/2)*pw(x,7,2) - 2*(s/2)*pw(x,8,2) + (s/2)*pw(x,9,2) + 0.45*s*pw(x,10,1);
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = 0.55*(s/6)*pw(x,0,3) -(s/24)*pw(x,0,4) + 2*(s/24)*pw(x,1,4) - 2*(s/24)*pw(x,2,4) + 2*(s/24)*pw(x,3,4) - 2*(s/24)*pw(x,4,4) + 2*(s/24)*pw(x,5,4) - 2*(s/24)*pw(x,6,4) + 2*(s/24)*pw(x,7,4) - 2*(s/24)*pw(x,8,4) + (s/24)*pw(x,9,4) - (209/240)*s*pw(x,0,1) + 0.45*(s/6)*pw(x,10,3);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')
end



%% Problem 2
if any(run_problems(:) == 2)
    figure(2)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 0; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 0;
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 50*pw(x,0,0) + s*pw(x,1,0) + 2*s*pw(x,2,0) + 3*s*pw(x,3,0) + 4*s*pw(x,4,0) - 4*s*pw(x,5,0) - 3*s*pw(x,6,0) - 2*s*pw(x,7,0) - s*pw(x,8,0) - 50*pw(x,10,0);
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = 25*pw(x,0,2) + (s/2)*pw(x,1,2) + 2*(s/2)*pw(x,2,2) + 3*(s/2)*pw(x,3,2) + 4*(s/2)*pw(x,4,2) - 4*(s/2)*pw(x,5,2) - 3*(s/2)*pw(x,6,2) - 2*(s/2)*pw(x,7,2) - (s/2)*pw(x,8,2) + (-500 - 30*s)*pw(x,0,1) + (2500 + 135*s) - 25*pw(x,10,2);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')
end

%% Problem 3
if any(run_problems(:) == 3)
    figure(3)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 0; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = ((7*s)/60 + 41)*pw(x,0,0) - s*pw(x,1,0) + s*pw(x,2,0) - s*pw(x,3,0) + s*pw(x,4,0) - 70*pw(x,6,1) + 70*pw(x,8,1) - (s/2)*pw(x,9,2)  + ((23*s)/60 + 99)*pw(x,10,0);
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = ((7*s)/60 + 41)*pw(x,0,1) - s*pw(x,1,1) + s*pw(x,2,1) - s*pw(x,3,1) + s*pw(x,4,1) + (s+10)*pw(x,5,0) - 35*pw(x,6,2) + 35*pw(x,8,2) - (s/6)*pw(x,9,3) + ((23*s)/60 + 99)*pw(x,10,1);
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (((7*s)/60 + 41)/6)*pw(x,0,3) - (s/6)*pw(x,1,3) + (s/6)*pw(x,2,3) - (s/6)*pw(x,3,3) + (s/6)*pw(x,4,3) + ((s+10)/2)*pw(x,5,2) - (35/12)*pw(x,6,4) + (35/12)*pw(x,8,4) - (s/120)*pw(x,9,5) + ((9143*s)/3600 - (3755/6))*pw(x,0,1) + (((23*s)/60 + 99)/6)*pw(x,10,3);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')
end


%% Problem 4
if any(run_problems(:) == 4)
    figure(4)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 0; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 25*s*pw(x,0,0) - s*pw(x,1,0) - 2*s*pw(x,2,0) - 3*s*pw(x,3,0) - 4*s*pw(x,4,0) - 5*s*pw(x,5,0) - 4*s*pw(x,6,0) - 3*s*pw(x,7,0) - 2*s*pw(x,8,0) - s*pw(x,9,0);
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 25*s*pw(x,0,1) - 125*s*pw(x,0,0) - s*pw(x,1,1) - 2*s*pw(x,2,1) - 3*s*pw(x,3,1) - 4*s*pw(x,4,1) - 5*s*pw(x,5,1) - 4*s*pw(x,6,1) - 3*s*pw(x,7,1) - 2*s*pw(x,8,1) - s*pw(x,9,1);
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (25/6)*s*pw(x,0,3) - (125/2)*s*pw(x,0,2) - (s/6)*pw(x,1,3) - 2*(s/6)*pw(x,2,3) - 3*(s/6)*pw(x,3,3) - 4*(s/6)*pw(x,4,3) - 5*(s/6)*pw(x,5,3) - 4*(s/6)*pw(x,6,3) - 3*(s/6)*pw(x,7,3) - 2*(s/6)*pw(x,8,3) - (s/6)*pw(x,9,3);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')
end


%% Problem 5
if any(run_problems(:) == 5)
    figure(5)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 0; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = (3*s + 200)*pw(x,0,0) - s*pw(x,1,0) - 2*s*pw(x,2,0) - 100*pw(x,3,1) + 100*pw(x,7,1) - 2*s*pw(x,8,0)- s*pw(x,9,0) + (3*s+200)*pw(x,10,0);
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = (3*s + 200)*pw(x,0,1) - s*pw(x,1,1) - 2*s*pw(x,2,1) - 50*pw(x,3,2) + 50*pw(x,7,2) - 2*s*pw(x,8,1)- s*pw(x,9,1) + (3*s+200)*pw(x,10,1);
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = ((3*s + 200)/6)*pw(x,0,3) - (s/6)*pw(x,1,3) - 2*(s/6)*pw(x,2,3) - (25/6)*pw(x,3,4) + (25/6)*pw(x,7,4) - 2*(s/6)*pw(x,8,3)- (s/6)*pw(x,9,3) + (-(41*s)/2 - 7100/3)*pw(x,0,1) + ((3*s+200)/6)*pw(x,10,3);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')
end