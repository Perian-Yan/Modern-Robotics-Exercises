function isRotationMatrix(R)

if ~isnumeric(R) || ~isreal(R)
    error('isRotationMatrix:InvalidType', 'Matrix R must be a real numeric matrix.');
end

if ~isequal(size(R), [3 3])
    error('isRotationMatrix:InvalidDimension', 'Matrix R must be a 3x3 matrix.');
end

if any(~isfinite(R))
    error('isRotationMatrix:NonFiniteInput', 'Matrix R contains NaN or Inf values.');
end

tol = getTol();
if norm(R*R.' - eye(3), 'fro') > tol || det(R) - 1 > tol
    error('isRotationMatrix:InvalidRotationMatrix', 'Matrix R is not a rotation matrix within tolerance %.1e.', tol)
end

end