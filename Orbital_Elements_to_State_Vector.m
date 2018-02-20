%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ALGORITHM_4.5 (Orbital_Elements_to_State_Vector.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
% Credits: Prof. Howard D. Curtis (ERAU)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Given the orbital elements h, e, i, Lomega, Somega, and theta, compute
% the state vectors r and v in the geocentric equatorial frame of reference. 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Guide:
% 1. Calculate position vector rxbar in perifocal coordinates using 
%    rxbar = ((h^2/mu)*(1/(1+e*cos(theta)))).*[cos(theta);sin(theta);0]
% 2. Calculate velocity vector vxbar in perifocal coordinates using
%    vxbar = (mu/h).*[-sin(theta);e+cos(theta);0]
% 3. Calculate the matrix Qxbarx of the transformation from perifocal to
%    geocentric equatorial coordinates using 
%    Qxbarx = [-sin(Lomega)*cos(i)*sin(Somega)+cos(Lomega)*cos(Somega),
%              -sin(Lomega)*cos(i)*cos(Somega)-cos(Lomega)*sin(Somega),
%              sin(Lomega)*sin(i);
%              cos(Lomega)*cos(i)*sin(Somega)+sin(Lomega)*cos(Somega),
%              cos(Lomega)*cos(i)*cos(Somega)-sin(Lomega)*sin(Somega),
%              -cos(Lomega)*sin(i);
%              sin(i)*sin(Somega),sin(i)*cos(Somega),cos(i)]
%4. Transform rxbar and vxbar into the geocentric frame by using
%   rx = (Qxbarx).*(rxbar)
%   vx = (Qxbarx).*(vxbar)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% ALGORITHM_4.5
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clc
clear
close
tic

fprintf("ALGORITHM 4.5 (Orbital Elements to State Vector)\n\n");

% h = 80000;
% e = 1.4;
% i = 30;
% Lomega = 40;
% Somega = 60;
% theta = 30;

h = input('h value: ');                       % Required Values (deg)
e = input('e value: ');
i = input('i value: ');
Lomega = input('Lomega value: ');
Somega = input('Somega value: ');
theta = input('theta value: ');
fprintf('\n');

i2 = (pi/180)*i;                                % Data Conversion (rad)
Lomega2 = (pi/180)*Lomega;
Somega2 = (pi/180)*Somega;
theta2 = (pi/180)*theta;

mu = 398600;                                    % GP for Earth

% Position Vector rxbar
rxbar = ((h^2/mu)*(1/(1+e*cos(theta2)))).*[cos(theta2),sin(theta2),0];

% Velocity Vector vxbar
vxbar = (mu/h).*[-sin(theta2),e+cos(theta2),0];

% Matrix Transformation Qxbarx
Qxbarx = [-sin(Lomega2)*cos(i2)*sin(Somega2)+cos(Lomega2)*cos(Somega2),-sin(Lomega2)*cos(i2)*cos(Somega2)-cos(Lomega2)*sin(Somega2),sin(Lomega2)*sin(i2);cos(Lomega2)*cos(i2)*sin(Somega2)+sin(Lomega2)*cos(Somega2),cos(Lomega2)*cos(i2)*cos(Somega2)-sin(Lomega2)*sin(Somega2),-cos(Lomega2)*sin(i2);sin(i2)*sin(Somega2),sin(i2)*cos(Somega2),cos(i2)];

rx = (Qxbarx).*(rxbar);          
vx = (Qxbarx).*(vxbar);          

rx2 = rx';                       % Vector Transpose
vx2 = vx';
rx3 = sum(rx2);                  % Geocentric Equatorial Position Vector rx 
vx3 = sum(vx2);                  % Geocentric Equatorial Velocity Vector vx

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Position Vector rx = \n');
fprintf('                    %.4f\n', rx3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Velocity Vector vx = \n');
fprintf('                    %.4f\n', vx3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

beep
toc                                           % End                                
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% NicholasNSY (2018)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fprintf('\n')
fprintf('Kappa KappaGold KappaPride?\n')      % Kappa KappaGold KappaPride?