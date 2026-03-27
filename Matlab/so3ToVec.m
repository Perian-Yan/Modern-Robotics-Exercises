function omg = so3ToVec(so3mat)
% Computes 3-vector corresponding to the 3x3 skew-symmetric matrix.

if nargin ~= 1
    error('so3ToVec:InvalidInputNumber', 'Function requires exactly one input argument.');
end

if ~isnumeric(so3mat) || ~isreal(so3mat)
    error('so3ToVec:InvalidType', 'Input so3mat must be a real numeric matrix.');
end

if ~isequal(size(so3mat), [3 3])
    error('so3ToVec:InvalidSize', 'Input must be a 3x3 matrix.');
end

if any(~isfinite(so3mat(:)))
    error('so3ToVec:NonFiniteInput', 'Input matrix contains NaN or Inf values.');
end

% ----- check skey-symmetric -----
tol = getTol();
if norm(so3mat + transpose(so3mat), 'fro') > tol
    error('so3ToVec:NotSkewSymmetric', 'Input matrix must be skew-symmetric within tolerance %.1e', tol);
end

    omg_1 = -so3mat(2,3);
    omg_2 = so3mat(1,3);
    omg_3 = -so3mat(1,2);
    omg = [omg_1; omg_2; omg_3];
end