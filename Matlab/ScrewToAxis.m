function S = ScrewToAxis(q, s, h)
% Returns a normalized screw axis S of a screw described by a unit vector s
% in the direction of the screw axis, located at the point q, with pitch h.

if h < inf
    omghat = s;
    v = h*s - cross(s,q);
else
    omghat = zeros(3,1);
    v = s;
end

S = [omghat; v];

end