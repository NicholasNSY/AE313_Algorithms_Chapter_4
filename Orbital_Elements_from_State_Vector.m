%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ALGORITHM_4.2 (Orbital_Elements_from_State_Vector.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
% Credits: Prof. Howard D. Curtis (ERAU)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Obtain orbital elements from the state vector. Applying this algorithm to
% orbits around other planets or the sun amounts to defining the frame of
% reference and substituting the appropriate gravitational parameter mu.
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Guide:
% 1. Calculate the distance: r = sqrt(sum(rvec.*rvec)) = sqrt(X^2+Y^2+Z^2)
% 2. Calculate the speed: v = sqrt(sum(vvec.*vvec)) = sqrt(v(x)^2+y(x)^2+z(x)^2)
% 3. Calculate the radial velocity: vr  = (sum(rvec.*vvec))/r = ??
% 
%    #Note: vr>0, satellite is flying away from perigee.
%           vr<0, satellite is flying toward perigee.
%
% 4. Calculate the specific angular momentum: hvec = cross(rvec,vvec) = ??
% 5. Calculate the magnitude of the specific angular momentum: h = sqrt(sum(hvec.*hvec))
% 
%    #Note: !~Specific angular momentum (h) is the first(1) orbital element.~!
%
% 6. Calculate the inclination: i = acos((hz)/h)
%
%    #Note: !~Inclination (i) is the second(2) orbital element.~!
%            0 < i < 2*pi
%           (pi/2) < i < 2*pi ... Retrograde
%
% 7. Calculate node line vector: Nvec = cross(K_hat,hvec) = ??
% 8. Calculate the magnitude of N: N = sqrt(sum(Nvec.*Nvec))
% 9. Calculate the right ascension of the ascending node: Lomega = acos(Nx/N) 
%
%    #Note: !~RA of the AN (Lomega) is the third(3) orbital element.~!
%           Lomega = acos(Nx/N) for (Ny >= 0)
%           Lomega = 2*pi - acos(Nx/N) for (Ny < 0)
%
% 10. Calculate the eccentricity vector: evec = (1/mu).*((((v^2)-(mu/r)).*rvec) - (r.*vr.*vvec))
%
%     #Note: mu = Gravitational Parameter
%
% 11. Calculate the eccentricity: e = sqrt(sum(evec.*evec))
%
%     #Note: !~Eccentricity (e) is the fourth(4) orbital element.~!
%
%     #Alternative: e = sqrt(1 + (h^2/mu^2)*(v^2-(2mu/r)))   
%
% 12. Calculate the argument of perigee: Somega = acos(sum((Nvec/N).*(evec/e)))
%
%     #Note: !~Argument of Perigee (Somega) is the fifth(5) orbital element.~!
%            Somega = acos(sum((Nvec/N).*(evec/e))) for (ez >= 0)
%            Somega = 2*pi - acos(sum((Nvec/N).*(evec/e))) for (ez < 0)
%
% 13. Calculate the true anomaly: theta = acos(sum((evec/e).*(rvec/r)))
%     
%     #Note: !~True Anomaly (theta) is the sixth(6) orbital element.~!
%            theta = acos(sum((evec/e).*(rvec/r))) for (vr >= 0)
%            theta = 2*pi - acos(sum((evec/e).*(rvec/r))) for (vr < 0)
%
%     #Alternative: theta = acos((1/e)*((h^2/(mu*r))-1)) for (vr >= 0)
%                   theta = 2*pi - acos((1/e)*((h^2/(mu*r))-1)) for (vr < 0)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% ALGORITHM_4.2
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clc
clear
close
tic

fprintf("ALGORITHM 4.2 (Orbital Elements from State Vector)\n\n");

% rvecx = -6045;
% rvecy = -3490;
% rvecz = 2500;

rvecx = input('r vector X value: ');          % X,Y,Z values for r vector
rvecy = input('r vector Y value: ');
rvecz = input('r vector Z value: ');
fprintf('\n');

rvec = [rvecx,rvecy,rvecz];                   % r vector matrix

% vvecx = -3.457;
% vvecy = 6.618;
% vvecz = 2.533;

vvecx = input('v vector X value: ');          % X,Y,Z values for v vector
vvecy = input('v vector Y value: ');
vvecz = input('v vector Z value: ');
fprintf('\n');

vvec = [vvecx,vvecy,vvecz];                   % v vector matrix
r = sqrt(sum(rvec.*rvec));                    % Magnitude of r vector
v = sqrt(sum(vvec.*vvec));                    % Magnitude of v vector
vr  = (sum(rvec.*vvec))/r;                    % Radial velocity

if (vr > 0)
    fprintf('#Object transit away from perigee.\n\n');
else
    fprintf('#Object transit toward perigee.\n\n');
end

hvec = cross(rvec,vvec);                      % h vector matrix
h = sqrt(sum(hvec.*hvec));                    % Magnitude of h vector

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Orbital Element h = %.4f\n', h);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

hz = hvec(1,3);                               % hz, h vector index
i = acos((hz)/h);                             % Inclination (rad)
i2 = (180/pi)*(i);                            % Inclination Data Conversion

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Orbital Element i = %.4f degrees\n', i2);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

if (0 < i < 2*pi)
    fprintf('#No quadrant ambiguity.\n\n');
else 
    fprintf('#Orbit is Retrograde.\n\n');
end

K_hat = [0,0,1];                              % K Vector Determination
Nvec = cross(K_hat,hvec);                     % Node line vector N
N = sqrt(sum(Nvec.*Nvec));                    % Magnitude of N vector

Nx = Nvec(1,1);                               % Nx, N vector index
Lomega = acos(Nx/N);                          % RA of AN, Lomega (rad)  
Lomega2 = (180/pi)*(Lomega);                  % Lomega Data Conversion

fprintf('#Unconfirmed Lomega  = %.4f degrees\n\n', Lomega2);

Ny = Nvec(1,2);                               % Ny, N vector index

if (Ny >= 0)
    Lomega3 = Lomega2;
else
    Lomega3 = 360 - Lomega2;
end

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Orbital Element Lomega = %.4f degrees\n', Lomega3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

mu = 398600;                                  % GP for Earth

% mu = input('mu value: ');                   % GP value

evec = (1/mu).*((((v^2)-(mu/r)).*rvec) - (r.*vr.*vvec)); % e vector matrix
e = sqrt(sum(evec.*evec));                    % Magnitude of e vector

if (e == 0)
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    fprintf('Orbital Element e = %.4f (Circular Orbit)\n', e);
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');
elseif (0 < e) && (e < 1)
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    fprintf('Orbital Element e = %.4f (Eliptical Orbit)\n', e);
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');
elseif (e == 1)
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    fprintf('Orbital Element e = %.4f (Parabloic Orbit/Escape Trajectory)\n', e);
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');
else
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    fprintf('Orbital Element e = %.4f (Hyperbolic Orbit)\n', e);
    fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');
end

Somega = acos(sum((Nvec/N).*(evec/e)));       % A of P, Somega (rad)
Somega2 = (180/pi)*(Somega);                  % Somega Data Conversion

fprintf('#Unconfirmed Somega  = %.4f degrees\n\n', Somega2);

ez = evec(1,3);                               % ez, e vector index

if (ez >= 0)
    Somega3 = Somega2;
else
    Somega3 = 360 - Somega2;
end

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Orbital Element Somega = %.4f degrees\n', Somega3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

theta = acos(sum((evec/e).*(rvec/r)));        % True Anomaly, theta
theta2 = (180/pi)*(theta);                    % theta Data Conversion

fprintf('#Unconfirmed theta  = %.4f degrees\n\n', theta2);

if (vr >= 0)
    theta3 = theta2;
else
    theta3 = 180 - theta2;
end

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
fprintf('Orbital Element theta = %.4f degrees\n', theta3);
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n');

beep
toc                                           % End                                
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% NicholasNSY (2018)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fprintf('\n')
fprintf('Kappa KappaGold KappaPride?\n')      % Kappa KappaGold KappaPride? 