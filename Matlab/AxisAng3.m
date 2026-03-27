function [omghat, theta] = AxisAng3(expc3)
% Extracts the rotation axis omghat (unit vector) and rotation angle theta
% from the 3-parameter exponential coordinates expc3=omghat*theta.

if nargin ~= 1
    error('AxisAng3:InvalidInputNumber', 'Function requires exactly one input argument.');
end

if any(~isfinite(expc3))
    error('AxisAng3:NonFiniteInput', 'Input exponential coordinates include NaN or Inf.');
end

if numel(expc3) ~= 3
    error('AxisAng3:InvalidSize', 'Input must be a 3 dimensional vector.');
end

if ~isnumeric(expc3) || ~isreal(expc3)
    error('AxisAng3:InvalidType', 'Input must be a real numeric vector.');
end

theta = norm(expc3);

tol = getTol();
if theta < tol
    omghat = [0;0;0];
    theta = 0;
    warning('AxisAngle3:SmallAngle', ...
        'The rotation angle %.3e is below tolerance %.1e and axis is undefined (set to zero).', theta, tol);
else
    omghat = expc3(:) / theta;
end