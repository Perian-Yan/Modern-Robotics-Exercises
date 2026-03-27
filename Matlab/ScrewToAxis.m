function S = ScrewToAxis(q, s, h)
% Returns a normalized screw axis S of a screw described by a unit vector s
% in the direction of the screw axis, located at the point q, with pitch h.

if ~all(cellfun(@(x) isnumeric(x) && isreal(x), {s, q, h}))
     error('ScrewToAxis:InvalidType', 'q, s, or h must be real and numeric.');
end

if ~all(cellfun(@(x) numel(x)==3, {s, q}))
     error('ScrewToAxis:InvalidDimension', 'q, s must be 3-dimensitional.');
end

if any(cellfun(@(x) any(~isfinite(x)), {s, q}))
     error('ScrewToAxis:NonInfiniteInput', 'q, s must be finite.');
end

if ~isscalar(h)
    error('ScrewToAxis:NonScalarPitch', 'Pitch h must be a scalar.');
end

tol = getTol();
if abs(norm(s)-1) > tol
    error('ScrewToAxis:NonUnitVector', 'Screw axis s must be a unit vector with the tolerance %.1e.', tol);
end 


if h < inf
    omghat = s;
    v = h*s - cross(s,q);
else
    omghat = zeros(3,1);
    v = s;
end

S = [omghat; v];

end