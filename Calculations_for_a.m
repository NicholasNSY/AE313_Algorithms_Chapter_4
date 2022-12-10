%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Plugins (Calculations_for_a.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Additional calculations to find semi-major axis.
%
% The code calculates the semi-major axis, a, of an object in orbit given 
% its mechanical specific energy, epsilon, gravitational parameter, mu, and 
% position vector, r. The semi-major axis is defined as the distance between 
% the center of an object in orbit and one of its two focal points. In general, 
% the semi-major axis is half of the major axis, which is the longest diameter 
% of an ellipse.
%
% The mechanical specific energy is calculated using the equation 
% epsilon = (v^2)/2 - mu/r, where v is the velocity of the object and r is its 
% position vector. The semi-major axis is then calculated using the equation 
% a = -mu/(2*epsilon). The result is printed to the command window, and a beep 
% sound is played to indicate that the calculation is complete.
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Guide:
% 1. Mechanical Specific Energy: epsilon = ((v^2)/2)-(mu/r)
% 2. Semi-Major Axis: a = (-mu/(2*epsilon))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Calculations for a
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Clear the command window and workspace, and start the timer
clc
clear
close
tic

% Print a message to the command window
fprintf("Plugins (Additional calculations to find semi-major axis)\n\n");

% Define the variables used in the calculation
v = 7.1964;
mu = 398600;
r = 7704.5;

% Calculate the mechanical specific energy
epsilon = ((v^2)/2)-(mu/r);

% Calculate the semi-major axis
a = (-mu/(2*epsilon));

% Print the result to the command window
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Semi-Major Axis a = %.4f\n', a);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

% Make a beep sound and stop the timer
beep
toc                             
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% NicholasNSY (2018)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
