function [omghat, theta] = AxisAng3(expc3)
% Extracts the rotation axis omghat (unit vector) and rotation angle theta
% from the 3-parameter exponential coordinates expc3=omghat*theta.

theta = norm(expc3);
omghat = expc3 / theta;
end