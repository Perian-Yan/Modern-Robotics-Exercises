function [S, theta] = AxisAng6(expc6)
% Extracts the normalized screw axis S and the distacne traveled along the
% screw theta from the 6-vector of exponential coordinates S*theta.

if nargin ~= 1
    error('AxisAng6:InvalidInputNumber', 'Function requires exactly one input argument.');
end

if any(~isfinite(expc6))
    error('AxisAng6:NonFiniteInput', 'Input exponential coordinates include NaN or Inf.');
end

if numel(expc6) ~= 6
    error('AxisAng6:InvalidSize', 'Input must be a 6 dimensional vector.');
end

if ~isnumeric(expc6) || ~isreal(expc6)
    error('AxisAng6:InvalidType', 'Input must be a real numeric vector.');
end


tol = getTol();
if norm(expc6) < tol
    warning('AxisAngle6:SmallAngle', ...
        'The expc6 represents no motion, screw axis is undefined (set to zero).');
    theta = 0;
    S = zeros(6,1);
elseif norm(expc6(1:3)) >= tol
    theta = norm(expc6(1:3));
    S = expc6(:) / theta;
else
    theta = norm(expc6(4:6));
    S = expc6(:) / theta;
    disp('Screw axis represents pure translation.')
end

end