function isTransMatrix(T)
if ~isnumeric(T) || ~isreal(T)
    error('TransToRp:InvalidType', 'Matrix T must be real and numeric.');
end

if ~isequal(size(T), [4 4])
    error('TransToRp:InvalidDimension', 'Matrix T must be a 4x4 matrix.');
end

if any(~isfinite(T))
    error('TransToRp:NonFiniteInput', 'Matrix T contains NaN or Inf.');
end

tol = getTol();
if norm(T(4,:) - [0 0 0 1]) > tol
    error('TransToRp:InvalidTransform', 'Last row of T should be [0 0 0 1].');
end
end