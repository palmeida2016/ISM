%% Header
% Name: Pedro Almeida
% Date: October 1st, 2021
% Course: EGM 4523C – Intermediate Strength of Materials
% Serial Number: 2

%% Preparation
clc; clear; close all;
s = 2;
range_x = [0 10];
run_problems = [1];


%% Problem 1
if any(run_problems(:) == 1)
    figure(1)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/500; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
%     I = 6.95e-6;
    I = 1/E;

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(.55*s*pw(x,0,0) -s*pw(x,0,1) + 2*s*pw(x,1,1) - 2*s*pw(x,2,1) + 2*s*pw(x,3,1) - 2*s*pw(x,4,1) + 2*s*pw(x,5,1) - 2*s*pw(x,6,1) + 2*s*pw(x,7,1) - 2*s*pw(x,8,1) + s*pw(x,9,1) + 0.45*s*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(0.55*s*pw(x,0,1) -(s/2)*pw(x,0,2) + 2*(s/2)*pw(x,1,2) - 2*(s/2)*pw(x,2,2) + 2*(s/2)*pw(x,3,2) - 2*(s/2)*pw(x,4,2) + 2*(s/2)*pw(x,5,2) - 2*(s/2)*pw(x,6,2) + 2*(s/2)*pw(x,7,2) - 2*(s/2)*pw(x,8,2) + (s/2)*pw(x,9,2) + 0.45*s*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = 1000*(0.55*(s/6)*pw(x,0,3) -(s/24)*pw(x,0,4) + 2*(s/24)*pw(x,1,4) - 2*(s/24)*pw(x,2,4) + 2*(s/24)*pw(x,3,4) - 2*(s/24)*pw(x,4,4) + 2*(s/24)*pw(x,5,4) - 2*(s/24)*pw(x,6,4) + 2*(s/24)*pw(x,7,4) - 2*(s/24)*pw(x,8,4) + (s/24)*pw(x,9,4) - (209/240)*s*pw(x,0,1) + 0.45*(s/6)*pw(x,10,3))/(E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')


    [I1, I2] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',I1);
    fprintf('Min I = %f\n',I2);
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
    I=1/E;
%     I = 1585.121602e-6; %

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
    moment = 1000*(50*pw(x,0,0) + s*pw(x,1,0) + 2*s*pw(x,2,0) + 3*s*pw(x,3,0) + 4*s*pw(x,4,0) - 4*s*pw(x,5,0) - 3*s*pw(x,6,0) - 2*s*pw(x,7,0) - s*pw(x,8,0) - 50*pw(x,10,0));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*(25*pw(x,0,2) + (s/2)*pw(x,1,2) + 2*(s/2)*pw(x,2,2) + 3*(s/2)*pw(x,3,2) + 4*(s/2)*pw(x,4,2) - 4*(s/2)*pw(x,5,2) - 3*(s/2)*pw(x,6,2) - 2*(s/2)*pw(x,7,2) - (s/2)*pw(x,8,2) + (-500 - 30*s)*pw(x,0,1) + (2500 + 135*s) - 25*pw(x,10,2)))/(E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [I1, I2] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',I1);
    fprintf('Min I = %f\n',I2);
    
    %Min Radius = 0.2120 meters
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
    I = 1/E;
    I = 2908.086809e-6; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(((7*s)/60 + 41)*pw(x,0,0) - s*pw(x,1,0) + s*pw(x,2,0) - s*pw(x,3,0) + s*pw(x,4,0) - 70*pw(x,6,1) + 70*pw(x,8,1) - (s/2)*pw(x,9,2)  + ((23*s)/60 + 99)*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(((7*s)/60 + 41)*pw(x,0,1) - s*pw(x,1,1) + s*pw(x,2,1) - s*pw(x,3,1) + s*pw(x,4,1) + (s+10)*pw(x,5,0) - 35*pw(x,6,2) + 35*pw(x,8,2) - (s/6)*pw(x,9,3) + ((23*s)/60 + 99)*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*((((7*s)/60 + 41)/6)*pw(x,0,3) - (s/6)*pw(x,1,3) + (s/6)*pw(x,2,3) - (s/6)*pw(x,3,3) + (s/6)*pw(x,4,3) + ((s+10)/2)*pw(x,5,2) - (35/12)*pw(x,6,4) + (35/12)*pw(x,8,4) - (s/120)*pw(x,9,5) + ((9143*s)/3600 - (3755/6))*pw(x,0,1) + (((23*s)/60 + 99)/6)*pw(x,10,3)))/(E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [A, I] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',A);
    fprintf('Min I = %f\n',I);
end


%% Problem 4
if any(run_problems(:) == 4)
    figure(4)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 2; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 1/E;
    I = 3623.188406e-6; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(25*s*pw(x,0,0) - s*pw(x,1,0) - 2*s*pw(x,2,0) - 3*s*pw(x,3,0) - 4*s*pw(x,4,0) - 5*s*pw(x,5,0) - 4*s*pw(x,6,0) - 3*s*pw(x,7,0) - 2*s*pw(x,8,0) - s*pw(x,9,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(25*s*pw(x,0,1) - 125*s*pw(x,0,0) - s*pw(x,1,1) - 2*s*pw(x,2,1) - 3*s*pw(x,3,1) - 4*s*pw(x,4,1) - 5*s*pw(x,5,1) - 4*s*pw(x,6,1) - 3*s*pw(x,7,1) - 2*s*pw(x,8,1) - s*pw(x,9,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*((25/6)*s*pw(x,0,3) - (125/2)*s*pw(x,0,2) - (s/6)*pw(x,1,3) - 2*(s/6)*pw(x,2,3) - 3*(s/6)*pw(x,3,3) - 4*(s/6)*pw(x,4,3) - 5*(s/6)*pw(x,5,3) - 4*(s/6)*pw(x,6,3) - 3*(s/6)*pw(x,7,3) - 2*(s/6)*pw(x,8,3) - (s/6)*pw(x,9,3)))/(E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [A, I] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',A);
    fprintf('Min I = %f\n',I);
end


%% Problem 5
if any(run_problems(:) == 5)
    figure(5)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 2; %Safety Factor
    sY = 276e6; %Yield Stress
    I = 1/E; %
    I = 11739.112283e-6;

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*((3*s + 200)*pw(x,0,0) - s*pw(x,1,0) - 2*s*pw(x,2,0) - 100*pw(x,3,1) + 100*pw(x,7,1) - 2*s*pw(x,8,0)- s*pw(x,9,0) + (3*s+200)*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*((3*s + 200)*pw(x,0,1) - s*pw(x,1,1) - 2*s*pw(x,2,1) - 50*pw(x,3,2) + 50*pw(x,7,2) - 2*s*pw(x,8,1)- s*pw(x,9,1) + (3*s+200)*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*(((3*s + 200)/6)*pw(x,0,3) - (s/6)*pw(x,1,3) - 2*(s/6)*pw(x,2,3) - (25/6)*pw(x,3,4) + (25/6)*pw(x,7,4) - 2*(s/6)*pw(x,8,3)- (s/6)*pw(x,9,3) + (-(41*s)/2 - 7100/3)*pw(x,0,1) + ((3*s+200)/6)*pw(x,10,3)))/(E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [A, I] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',A);
    fprintf('Min I = %f\n',I);
end


%% Problem 6_1
if any(run_problems(:) == 61)
    figure(6)

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
    subplot(2,1,1)
    shear = 1000*(((7*s)/5)*pw(x,0,0) - 100*pw(x,1,0) - s*pw(x,2,0) - 100*pw(x,3,0) - s*pw(x,4,0) + 100*pw(x,6,0) + 200*pw(x,7,0) + 300*pw(x,8,0) + (((3*s)/5) - 400)*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(2,1,2)
    moment = 1000*(((7*s)/5)*pw(x,0,1) - 100*pw(x,1,1) - s*pw(x,2,1) - 100*pw(x,3,1) - s*pw(x,4,1) + 100*pw(x,6,1) + 200*pw(x,7,1) + 300*pw(x,8,1) + (((3*s)/5) - 400)*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')
end

%% Problem 6_2
if any(run_problems(:) == 62)
    figure(7)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
%     I = 1/E;
    I = 19480.349915e-6;

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(((7*s)/5)*pw(x,0,0) - 100*pw(x,1,0) - s*pw(x,2,0) - 100*pw(x,3,0) - s*pw(x,4,0) - ((3*s)/5 + 200)*pw(x,5,0) + 2*100*pw(x,6,0) + 2*200*pw(x,7,0) + 2*300*pw(x,8,0) + 2*(((3*s)/5) - 400)*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(((7*s)/5)*pw(x,0,1) - 100*pw(x,1,1) - s*pw(x,2,1) - 100*pw(x,3,1) - s*pw(x,4,1) - ((3*s)/5 + 200)*pw(x,5,1) + (3*s - 600)*pw(x,5,0) + 2*100*pw(x,6,1) + 2*200*pw(x,7,1) + 2*300*pw(x,8,1) + 2*(((3*s)/5) - 400)*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')
    
    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*(((7*s)/30)*pw(x,0,3) - (100/6)*pw(x,1,3) - (s/6)*pw(x,2,3) - (100/6)*pw(x,3,3) - (s/6)*pw(x,4,3) - (((3*s)/5 + 200)/6)*pw(x,5,3) + ((3*s - 600)/2)*pw(x,5,2) + 2*(100/6)*pw(x,6,3) + 2*(200/6)*pw(x,7,3) + 2*(300/6)*pw(x,8,3) + (-(137*s)/10 + 2480)*pw(x,0,1) + 2*((((3*s)/5) - 400)/6)*pw(x,10,3)))/(10*E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [A, I] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',A);
    fprintf('Min I = %f\n',I);
end


%% Problem 7_1
if any(run_problems(:) == 71)
    figure(8)

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
    subplot(2,1,1)
    shear = 1000*(4.5*s*pw(x,0,0) - s*pw(x,1,0) - s*pw(x,2,0) - s*pw(x,3,0) - s*pw(x,4,0) - s*pw(x,5,0) - s*pw(x,6,0) - s*pw(x,7,0) - s*pw(x,8,0) - s*pw(x,9,0) + 4.5*s*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(2,1,2)
    moment = 1000*(4.5*s*pw(x,0,1) - s*pw(x,1,1) - s*pw(x,2,1) - s*pw(x,3,1) - s*pw(x,4,1) - s*pw(x,5,1) - s*pw(x,6,1) - s*pw(x,7,1) - s*pw(x,8,1) - s*pw(x,9,1) + 4.5*s*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')
end

%% Problem 7_2
if any(run_problems(:) == 72)
    figure(9)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/400; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
%     I = 1/(3*E);
    I = 683.640162e-6/3;

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(3*4.5*s*pw(x,0,0) - 3*s*pw(x,1,0) - 3*s*pw(x,2,0) - s*pw(x,3,0) - 5*s*pw(x,3,0) - s*pw(x,4,0) - s*pw(x,5,0) - s*pw(x,6,0) - s*pw(x,7,0) - 5*s*pw(x,7,0) - 3*s*pw(x,8,0) - 3*s*pw(x,9,0) + 3*4.5*s*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(3*4.5*s*pw(x,0,1) - 3*s*pw(x,1,1) - 3*s*pw(x,2,1) - s*pw(x,3,1) - 5*s*pw(x,3,1) - 21*s*pw(x,3,0) - s*pw(x,4,1) - s*pw(x,5,1) - s*pw(x,6,1) - s*pw(x,7,1) - 5*s*pw(x,7,1) + 21*s*pw(x,7,0) - 3*s*pw(x,8,1) - 3*s*pw(x,9,1) + 3*4.5*s*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')
    
    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*(3*4.5*(1/6)*s*pw(x,0,3) - 3*(1/6)*s*pw(x,1,3) - 3*(1/6)*s*pw(x,2,3) - s*(1/6)*pw(x,3,3) - 5*(1/6)*s*pw(x,3,3) - 21*(1/2)*s*pw(x,3,2) - s*(1/6)*pw(x,4,3) - s*(1/6)*pw(x,5,3) - s*(1/6)*pw(x,6,3) - s*(1/6)*pw(x,7,3) - 5*(1/6)*s*pw(x,7,3) + 21*(1/2)*s*pw(x,7,2) - 3*(1/6)*s*pw(x,8,3) - 3*(1/6)*s*pw(x,9,3) + (-76.75 * s)*pw(x,0,1) + 3*4.5*(1/6)*s*pw(x,10,3)))/(3*E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [A, I] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',A);
    fprintf('Min I = %f\n',I);
end