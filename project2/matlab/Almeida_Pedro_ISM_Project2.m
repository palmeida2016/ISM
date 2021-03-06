%% Header
% Name: Pedro Almeida
% Date: November 8th, 2021
% Course: EGM 4523C – Intermediate Strength of Materials
% Serial Number: 2

%% Preparation
clc; clear; close all;
s = 2;
range_x = [0 10];
run_problems = [72];


%% Problem 1
if any(run_problems(:) == 1
    figure(1)

    %Constants
    L = 10; %Beam Length
    E = 69.9e9; %Young's Modulus
    v_allowed = L/500; %Allowed Displacement
    k = 1.5; %Safety Factor
    sY = 276e6; %Yield Stress
%     I = 3.99e-6;
    I = 1/E;

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(359/360 * pw(x,0,0) - s*pw(x,0,1) + 2*s*pw(x,1,1) - 2*s*pw(x,2,1) + 2*s*pw(x,3,1) - 2*s*pw(x,4,1) + 2*s*pw(x,5,1) - 2*s*pw(x,6,1) + 2*s*pw(x,7,1) - 2*s*pw(x,8,1) + s*pw(x,9,1) + (37/36)*pw(x,9,0) - (1/40)*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(359/360 * pw(x,0,1) - (s/2)*pw(x,0,2) + 2*(s/2)*pw(x,1,2) - 2*(s/2)*pw(x,2,2) + 2*(s/2)*pw(x,3,2) - 2*(s/2)*pw(x,4,2) + 2*(s/2)*pw(x,5,2) - 2*(s/2)*pw(x,6,2) + 2*(s/2)*pw(x,7,2) - 2*(s/2)*pw(x,8,2) + (s/2)*pw(x,9,2) + (37/36)*pw(x,9,1) - (1/40)*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = 1000*(359/360*(1/6)*pw(x,0,3) -(s/24)*pw(x,0,4) + 2*(s/24)*pw(x,1,4) - 2*(s/24)*pw(x,2,4) + 2*(s/24)*pw(x,3,4) - 2*(s/24)*pw(x,4,4) + 2*(s/24)*pw(x,5,4) - 2*(s/24)*pw(x,6,4) + 2*(s/24)*pw(x,7,4) - 2*(s/24)*pw(x,8,4) + (s/24)*pw(x,9,4) + (37/36)*(1/6)*pw(x,9,3) - (11/240)*pw(x,0,1) - (1/40)*(1/6)*pw(x,10,3))/(E*I);
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
%     I=1/E;
    I = 543.478261e-6; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(-831/100*pw(x,0,0) + 831/100*pw(x,10,0));
    fplot(shear, range_x);
    ylim([1000*(-831/100) 0])
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(-831/100 * pw(x,0,1) + 50*pw(x,0,0) + s*pw(x,1,0) + 2*s*pw(x,2,0) + 3*s*pw(x,3,0) + 4*s*pw(x,4,0) - 4*s*pw(x,5,0) - 3*s*pw(x,6,0) - 2*s*pw(x,7,0) - s*pw(x,8,0) + 331/10*pw(x,10,0) + 831/100*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*(-831/100 * (1/6) * pw(x,0,3) + 25*pw(x,0,2) + (s/2)*pw(x,1,2) + 2*(s/2)*pw(x,2,2) + 3*(s/2)*pw(x,3,2) + 4*(s/2)*pw(x,4,2) - 4*(s/2)*pw(x,5,2) - 3*(s/2)*pw(x,6,2) - 2*(s/2)*pw(x,7,2) - (s/2)*pw(x,8,2) - 289/2*pw(x,0,1) + 331/10*(1/2)*pw(x,10,2) + 831/100*(1/6)*pw(x,10,3)))/(E*I);
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
%     I = 1/E;
    I = 676.240895e-6; %

    %Problem Solution
    syms x
    
    R_b = 279523/9600;
    R_c = -5/3 * R_b + 2993/18;
    R_a = 2/3 * R_b - 455/18;
    C_1 = -28/3 * R_b + 186241/600;
    
    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(R_a * pw(x,0,0) - s*pw(x,1,0) + s*pw(x,2,0) - s*pw(x,3,0) + s*pw(x,4,0) + R_c * pw(x,6,0) - 70*pw(x,6,1) + 70*pw(x,8,1) - (s/2)*pw(x,9,2) + R_b*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(R_a*pw(x,0,1) - s*pw(x,1,1) + s*pw(x,2,1) - s*pw(x,3,1) + s*pw(x,4,1) + (s+10)*pw(x,5,0) + R_c * pw(x,6,1) - 35*pw(x,6,2) + 35*pw(x,8,2) - (s/6)*pw(x,9,3) + R_b*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = 1000*(((R_a)/6)*pw(x,0,3) - (s/6)*pw(x,1,3) + (s/6)*pw(x,2,3) - (s/6)*pw(x,3,3) + (s/6)*pw(x,4,3) + ((s+10)/2)*pw(x,5,2) + R_c*(1/6)*pw(x,6,3) - (35/12)*pw(x,6,4) + (35/12)*pw(x,8,4) - (s/120)*pw(x,9,5) + C_1*pw(x,0,1) + ((R_b)/6)*pw(x,10,3))/(E*I);
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
%     I = 1/E;
    I = 1141.304348e-6; %

    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(263/8*pw(x,0,0) - s*pw(x,1,0) - 2*s*pw(x,2,0) - 3*s*pw(x,3,0) - 4*s*pw(x,4,0) - 5*s*pw(x,5,0) - 4*s*pw(x,6,0) - 3*s*pw(x,7,0) - 2*s*pw(x,8,0) - s*pw(x,9,0) + 137/8 * pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(263/8*pw(x,0,1) - 315/4*pw(x,0,0) - s*pw(x,1,1) - 2*s*pw(x,2,1) - 3*s*pw(x,3,1) - 4*s*pw(x,4,1) - 5*s*pw(x,5,1) - 4*s*pw(x,6,1) - 3*s*pw(x,7,1) - 2*s*pw(x,8,1) - s*pw(x,9,1) + 137/8 * pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = 1000*((263/8)/6 *pw(x,0,3) - (315/4)/2 *pw(x,0,2) - (s/6)*pw(x,1,3) - 2*(s/6)*pw(x,2,3) - 3*(s/6)*pw(x,3,3) - 4*(s/6)*pw(x,4,3) - 5*(s/6)*pw(x,5,3) - 4*(s/6)*pw(x,6,3) - 3*(s/6)*pw(x,7,3) - 2*(s/6)*pw(x,8,3) - (s/6)*pw(x,9,3) + 137/8*(1/6)*pw(x,10,3))/(E*I);
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
%     I = 1/E; %
    I = 1906.055784e-6;

    %Problem Solution
    syms x

    R_b = 4377/250;
    R_a = R_b;
    R_c = -2*R_b + 412;
    C1 = -207/4;
    
    
    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(R_a*pw(x,0,0) - s*pw(x,1,0) - 2*s*pw(x,2,0) - 100*pw(x,3,1) + R_c*pw(x,5,0) + 100*pw(x,7,1) - 2*s*pw(x,8,0)- s*pw(x,9,0) + R_b*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(R_a*pw(x,0,1) - s*pw(x,1,1) - 2*s*pw(x,2,1) - 50*pw(x,3,2) + R_c*pw(x,5,1) + 50*pw(x,7,2) - 2*s*pw(x,8,1)- s*pw(x,9,1) + R_b*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')

    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*((R_a/6)*pw(x,0,3) - (s/6)*pw(x,1,3) - 2*(s/6)*pw(x,2,3) - (25/6)*pw(x,3,4) + R_c/6*pw(x,5,3) + (25/6)*pw(x,7,4) - 2*(s/6)*pw(x,8,3)- (s/6)*pw(x,9,3) + C1*pw(x,0,1) + (R_b/6)*pw(x,10,3)))/(E*I);
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
    shear = 1000*(-1978/375*pw(x,0,0) - 100*pw(x,1,0) - s*pw(x,2,0) - 100*pw(x,3,0) - s*pw(x,4,0) + 6056/375*pw(x,5,0) + 100*pw(x,6,0) + 200*pw(x,7,0) + 300*pw(x,8,0) - 152578/375*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(2,1,2)
    moment = 1000*(-1978/375*pw(x,0,1) - 100*pw(x,1,1) - s*pw(x,2,1) - 100*pw(x,3,1) - s*pw(x,4,1) + 6056/375*pw(x,5,1) + 100*pw(x,6,1) + 200*pw(x,7,1) + 300*pw(x,8,1) - 152578/375*pw(x,10,1));
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
    I = 1/(2*E);
%     I = 9524.364945e-6;

    R_b = -82178/375;
    R_a = R_b + 2008/5;
    R_c = -2*R_b - 3988/5;
    C_1 = -50/3*R_b - 62911/15;


    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(R_a*pw(x,0,0) - 100*pw(x,1,0) - s*pw(x,2,0) - 100*pw(x,3,0) - s*pw(x,4,0) + R_c*pw(x,5,0) - (R_b+600)*pw(x,5,0) + 2*100*pw(x,6,0) + 2*200*pw(x,7,0) + 2*300*pw(x,8,0) + 2*R_b/6*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(R_a*pw(x,0,1) - 100*pw(x,1,1) - s*pw(x,2,1) - 100*pw(x,3,1) - s*pw(x,4,1) + R_c*pw(x,5,1) - (R_b+600)*pw(x,5,1) + (5*R_b + 1400)*pw(x,5,0) + 2*100*pw(x,6,1) + 2*200*pw(x,7,1) + 2*300*pw(x,8,1) + 2*R_b/6*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')
    
    %Displacement Plot
    subplot(3,1,3)
    displacement = 1000*(R_a/6*pw(x,0,3) - (100/6)*pw(x,1,3) - (s/6)*pw(x,2,3) - (100/6)*pw(x,3,3) - (s/6)*pw(x,4,3) + R_c/6*pw(x,5,3) - (R_b+600)/6*pw(x,5,3) + (5*R_b + 1400)/2*pw(x,5,2) + 2*(100/6)*pw(x,6,3) + 2*(200/6)*pw(x,7,3) + 2*(300/6)*pw(x,8,3) + C_1*x + 2*R_b/6*pw(x,10,3))/(2*E*I);
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

    R_b = 14/5;
    R_a = R_b;
    R_c = -2*R_b + 18;
    C_1 = -25*R_b/2 + 30;
    
    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(2,1,1)
    shear = 1000*(R_a*pw(x,0,0) - s*pw(x,1,0) - s*pw(x,2,0) - s*pw(x,3,0) - s*pw(x,4,0) - s*pw(x,5,0) + R_c*pw(x,5,0) - s*pw(x,6,0) - s*pw(x,7,0) - s*pw(x,8,0) - s*pw(x,9,0) + R_b*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(2,1,2)
    moment = 1000*(R_a*pw(x,0,1) - s*pw(x,1,1) - s*pw(x,2,1) - s*pw(x,3,1) - s*pw(x,4,1) - s*pw(x,5,1) + R_c*pw(x,5,1) - s*pw(x,6,1) - s*pw(x,7,1) - s*pw(x,8,1) - s*pw(x,9,1) + R_b*pw(x,10,1));
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
    I = 1/(3*E);
%     I = 261.663640e-6/3;

    R_b = 1286/275;
    R_a = R_b;
    R_c = -2*R_b + 18;
    C_1 = -59*R_b/2 + 112;
    
    %Problem Solution
    syms x

    %Shear Force Plot
    subplot(3,1,1)
    shear = 1000*(3*R_a*pw(x,0,0) - 3*s*pw(x,1,0) - 3*s*pw(x,2,0) - 3*s*pw(x,3,0) + (12-2*R_a)*pw(x,3,0) - s*pw(x,4,0) + R_c*pw(x,5,0) - s*pw(x,5,0) - s*pw(x,6,0) - 3*s*pw(x,7,0) + (12-2*R_b)*pw(x,7,0) - 3*s*pw(x,8,0) - 3*s*pw(x,9,0) + 3*R_b*pw(x,10,0));
    fplot(shear, range_x);
    title('Shear Force vs. x');
    xlabel('x [m]')
    ylabel('Force [N]')

    %Moment Plot
    subplot(3,1,2)
    moment = 1000*(3*R_a*pw(x,0,1) - 3*s*pw(x,1,1) - 3*s*pw(x,2,1) - 3*s*pw(x,3,1) + (12-2*R_a)*pw(x,3,1) - (2*R_a + 24)*pw(x,3,0) - s*pw(x,4,1) + R_c*pw(x,5,1) - s*pw(x,5,1) - s*pw(x,6,1) - 3*s*pw(x,7,1) + (12-2*R_a)*pw(x,7,1) + (2*R_a + 24)*pw(x,7,0) - 3*s*pw(x,8,1) - 3*s*pw(x,9,1) + 3*R_b*pw(x,10,1));
    fplot(moment, range_x);
    title('Moment vs. x');
    xlabel('x [m]')
    ylabel('Moment [Nm]')
    
    %Displacement Plot
    subplot(3,1,3)
    displacement = (1000*(3*R_a*(1/6)*pw(x,0,3) - 3*(1/6)*s*pw(x,1,3) - 3*(1/6)*s*pw(x,2,3) - 3*s*(1/6)*pw(x,3,3) + (12-2*R_a)*(1/6)*pw(x,3,3) - (2*R_a + 24)*(1/2)*pw(x,3,2) - s*(1/6)*pw(x,4,3) + R_c/6*pw(x,5,3) - s*(1/6)*pw(x,5,3) - s*(1/6)*pw(x,6,3) - 3*s*(1/6)*pw(x,7,3) + (12-2*R_b)*(1/6)*pw(x,7,3) + (2*R_a + 24)*(1/2)*pw(x,7,2) - 3*(1/6)*s*pw(x,8,3) - 3*(1/6)*s*pw(x,9,3) + C_1*pw(x,0,1) + 3*R_b*(1/6)*pw(x,10,3)))/(3*E*I);
    fplot(displacement, range_x);
    title('Displacement vs. x');
    xlabel('x [m]')
    ylabel('Displacement [m]')

    [A, I] = getMoment(displacement, range_x, moment, v_allowed, E, sY, k);
    fprintf('Min Area = %f\n',A);
    fprintf('Min I = %f\n',I);
end