%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ALGORITHM_4.1 (ra_and_dec_from_r.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
% Credits: Prof. Howard D. Curtis (ERAU)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Given the position vector r=XI+YJ+ZK, calculate the RA (?) and Dec
% (?).
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Guide:
% 1. Calculate the magnitude of r: r = sqrt(X^2+Y^2+Z^2)
% 2. Calculate the direction cosines of r: l = (X/r), m = (Y/r), n = (Z/r)
% 3. Calculate the Dec: Dec = arcsin(n)
% 4. Calculate the RA: RA = arcos(l/cos(Dec)) for (m>0)
%                      RA = 2*pi - (arcos(l/cos(Dec))) for (m<=0)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% ALGORITHM_4.1
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clc
clear
close
tic

fprintf("ALGORITHM 4.1 (RA and Dec from r)\n\n");

X = -5368;
Y = -1784;
Z = 3691;

% X = input('X Value: ');                % X,Y,Z values for r vector
% Y = input('Y Value: ');
% Z = input('Z Value: ');
% fprintf('\n');

r = sqrt(X^2+Y^2+Z^2);                   % Magnitude of r vector

l = (X/r);                               % Direction of cosines of r vector
m = (Y/r);
n = (Z/r);

Dec = asin(n);                           % Declination (rad)

if (m > 0)                               % Right Acension (rad)
    RA = acos(l/cos(Dec));
else
    RA = 2*pi - acos(l/cos(Dec));
end

Dec2 = (180/pi)*(Dec);                   % Data Conversion
RA2 = (180/pi)*(RA);

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Results: Declination = %.4f degrees\n', Dec2); 
fprintf('         Right Ascension = %.4f degrees\n', RA2);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

beep
toc                                      % End                                
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% NicholasNSY (2018)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fprintf('\n'
fprintf('Kappa KappaGold KappaPride?\n') % Kappa KappaGold KappaPride?   