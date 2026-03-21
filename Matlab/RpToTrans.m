function T = RpToTrans(R, p)
% Builds the homogeneous transformation matrix T corresponding to a
% rotation matrix R and a position vector p.

isRotationMatrix(R);

if ~isnumeric(p) || ~isreal(p)
    error('RpToTrans:InvalidType', 'Input p must be a real numeric vector.');
end

if numel(p) ~= 3
    error('RpToTrans:InvalidDimension', 'Input p must contain exactly 3 elements.');
end

if any(~isfinite(p))
    error('RpToTrans:NonFiniteInput', 'Input vector contains NaN or Inf values.');
end

T = eye(4);
T(1:3, 1:3) = R;
T(1:3, 4) = p(:);

end