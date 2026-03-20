function [S, theta] = AxisAng6(expc6)
% Extracts the normalized screw axis S and the distacne traveled along the
% screw theta from the 6-vector of exponential coordinates S*theta.

theta = norm(expc6);
S = expc6 / theta;

end