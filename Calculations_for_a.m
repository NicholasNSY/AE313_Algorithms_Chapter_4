%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Plugins (Calculations_for_a.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Additional calculations to find semi-major axis.
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Guide:
% 1. Mechanical Specific Energy: epsilon = ((v^2)/2)-(mu/r)
% 2. Semi-Major Axis: a = (-mu/(2*epsilon))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Calculations for a
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clc
clear
close
tic

fprintf("Plugins (Additional calculations to find semi-major axis)\n\n");

% v = 7.1964;
% mu = 398600;
% r = 7704.5;

epsilon = ((v^2)/2)-(mu/r);          % Mechanical Specific Energy (epsilon)
a = (-mu/(2*epsilon));               % Semi-Major Axis

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Semi-Major Axis a = %.4f\n', a);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

beep
toc                                  % End                                
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% NicholasNSY (2018)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fprintf('\n')
fprintf('Kappa KappaGold KappaPride?\n')      % Kappa KappaGold KappaPride?