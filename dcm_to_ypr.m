%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ALGORITHM_4.4 (dcm_to_ypr.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
% Credits: Prof. Howard D. Curtis (ERAU)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Given the direction cosine matrix Q. Find the angles alpha, beta, gamma
% of the classical Euler rotation sequence. 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Guide:
% 1. alpha = atan(Q12/Q11) where (0 <= alpha < 2*pi)
% 2. beta = acos(-Q13) where (-pi < beta < pi)
% 3. gamma = atan(Q23/Q33) where (0 <= gamma < 2*pi)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% ALGORITHM_4.4
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clc
clear
close
tic

fprintf("ALGORITHM 4.4 (Direction Cosine Matrix to Yaw, Pitch and Roll Sequence)\n\n");

% Q11 = 0.64050;
% Q12 = 0.75319;
% Q13 = -0.15038;
% Q21 = 0.76736;
% Q22 = -0.63531;
% Q23 = 0.086824;
% Q31 = -0.030154;
% Q32 = -0.17101;
% Q33 = -0.98481;

Q11 = input('Q11 value: ');                        % Values for Q matrix
Q12 = input('Q12 value: ');
Q13 = input('Q13 value: ');
Q21 = input('Q21 value: ');
Q22 = input('Q22 value: ');
Q23 = input('Q23 value: ');
Q31 = input('Q31 value: ');
Q32 = input('Q32 value: ');
Q33 = input('Q33 value: ');
fprintf('\n');

Q = [Q11,Q12,Q13;Q21,Q22,Q23;Q31,Q32,Q33];

alpha = atan(Q12/Q11);                              % alpha (rad)
alpha2 = (180/pi)*(alpha);                          % alpha Data Conversion

if (0 <= alpha) && (alpha < 2*pi)
    alpha3 = alpha2;
else
    alpha3 = 360+alpha2;
end

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('alpha = %.4f degrees\n', alpha3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

beta = acos(-Q13);                                  % beta (rad)
beta2 = (180/pi)*(beta);                            % beta Data Conversion

if (-pi < beta) && (beta < pi)
    beta3 = beta2;
else
    beta3 = 360+beta2;
end

fprintf('~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('beta = %.4f degrees\n', beta3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~\n\n');

gamma = atan(Q23/Q33);                              % gamma (rad)
gamma2 = (180/pi)*(gamma);                          % gamma Data Conversion

if (0 <= gamma) && (gamma < 2*pi)
    gamma3 = gamma2;
else
    gamma3 = 180+gamma2;
end

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('gamma = %.4f degrees\n', gamma3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

beep
toc                                                 % End                                
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% NicholasNSY (2018)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fprintf('\n')
fprintf('Kappa KappaGold KappaPride?\n')      % Kappa KappaGold KappaPride?