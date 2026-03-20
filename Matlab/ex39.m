function R03 = ex39(alpha, beta, gamma)
Rz = rotz(alpha);
Ry = roty(beta);
Rx = [(1+cosd(gamma))/2  (1-cosd(gamma))/2 sind(gamma)/sqrt(2);
      (1-cosd(gamma))/2  (1+cosd(gamma))/2 -sind(gamma)/sqrt(2);
      -sind(gamma)/sqrt(2) sind(gamma)/sqrt(2) cosd(gamma)];
R03 = Rz * Ry * Rx;

end