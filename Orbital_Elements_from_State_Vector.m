%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ALGORITHM_4.2 (Orbital_Elements_from_State_Vector.m)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Nicholas Ngo Syuan Yaw (ERAU)
% AE313 02DB
% Credits: Prof. Howard D. Curtis (ERAU)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Obtain orbital elements from the state vector. Applying this algorithm to
% orbits around other planets or the sun amounts to defining the frame of
% reference and substituting the appropriate gravitational parameter m.
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
% 10. Calculate the eccentricity vector: evec = (1/mu).*((((v^2)-(mu/2)).*rvec) - (r.*vr.*vvec))
%
%     #Note: mu = Gravitational Parameter
%
% 11. Calculate the eccentricity: e = sqrt(sum(evec.*evec))
%
%     #Note: !~Eccentricity (e) is the fourth(4) orbital element.~!
%
%     #Alternative: e = sqrt(1 + (h^2/mu^2)*(v^2-(2mu/r)))   
%
% 12. Calculate the argument of perigee: Somega = acos((sum(Nvec/N))*(sum(evec/e)))
%
%     #Note: !~Argument of Perigee (Somega) is the fifth(5) orbital element.~!
%            Somega = acos((sum(Nvec/N))*(sum(evec/e))) for (ez >= 0)
%            Somega = 2*pi - acos((sum(Nvec/N))*(sum(evec/e))) for (ez < 0)
%
% 13. Calculate the true anomaly: theta = acos((sum(evec/e))*(sum(rvec/r)))
%     
%     #Note: !~True Anomaly (theta) is the sixth(6) orbital element.~!
%            theta = acos((sum(evec/e))*(sum(rvec/r))) for (vr >= 0)
%            theta = 2*pi - acos((sum(evec/e))*(sum(rvec/r))) for (vr < 0)
%
%     #Alternative: theta = acos((1/e)*((h^2/(mu*r))-1)) for (vr >= 0)
%                   theta = 2*pi - acos((1/e)*((h^2/(mu*r))-1)) for (vr < 0)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%% Algorithm_4.2
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Kappa KappaGold KappaPride?









