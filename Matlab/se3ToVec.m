function V = se3ToVec(se3mat)
% Returns the 6-vector twist corresponding to an se(3) matrix.

% check that se3mat is 4x4 and the last row is all zero.
% so3ToVec takes care of the check of skew-symmetry of so3mat.
if ~isnumeric(se3mat) || ~isreal(se3mat)
    error('se3ToVec:InvalidType', 'Input se3mat must be a real numeric matrix.');
end

if ~isequal(size(se3mat), [4 4])
    error('se3ToVec:InvalidSize', 'Input must be a 4x4 matrix.');
end

if any(~isfinite(se3mat(:)))
    error('se3ToVec:NonFiniteInput', 'Input matrix contains NaN or Inf values.');
end

tol = getTol();
if norm(se3mat(4,:)-zeros(1,4), 'fro') > tol
    error('se3ToVec:Invalidse3', 'The last row of se3 matrix must be [0 0 0 0] within tolerance %.1e.', tol);
end


so3mat = se3mat(1:3, 1:3);
v = se3mat(1:3, 4);
omg = so3ToVec(so3mat);
V = [omg; v];

end