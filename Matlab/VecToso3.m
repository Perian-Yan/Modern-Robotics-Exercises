function so3mat = VecToso3(omg)
% Computes 3x3 skew-symmetric matrix corresponding to omg.


if nargin ~= 1
    error('VecToso3:InvalidInputNumber', 'Function requires exactly one input argument.');
end

if ~isnumeric(omg) || ~isreal(omg)
    error('VecToso3:InvalidType', 'Input omg must be a real numeric vector.');
end

if numel(omg) ~= 3
    error('VecToso3:InvalidDimension', 'Input omg must contain exactly 3 elements.');
end

if any(~isfinite(omg))
    error('VecToso3:NonFiniteInput', 'Input vector contains NaN or Inf values.');
end


so3mat = [0       -omg(3)  omg(2);
          omg(3)  0        -omg(1);
         -omg(2)  omg(1)   0];
end