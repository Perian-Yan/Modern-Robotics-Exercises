function [q, s, h] = AxisToScrew(S)
% Take normalized screw axis S and return unit axis s, its location q, and pitch h.

if ~isnumeric(S) || ~isreal(S)
    error('AxisToScrew:InvalidType', 'Input Smust be a real numeric vector.');
end

if numel(S) ~= 6
    error('AxisToScrew:InvalidDimension', 'Input S must contain exactly 3 elements.');
end

if any(~isfinite(S))
    error('AxisToScrew:NonFiniteInput', 'Input vector contains NaN or Inf values.');
end

omghat = S(1:3);
omghat = omghat(:);
v = S(4:6);
v = v(:);

tol = getTol();

if abs(norm(omghat)-1) > tol && abs(norm(v)-1) > tol
    error('AxisToScrew:NotUnitVector', 'For screw axis S, either omghat or v needs to be a unit vector.');
end

if norm(omghat) < tol
    disp('The screw axis represents pure translation.');
    s = v;
    h = inf;
    q = zeros(3,1);
   
else
    s = omghat;
    q = cross(s, v);
    h = dot(s, v);
end

end
