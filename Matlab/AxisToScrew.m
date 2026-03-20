function [q, s, h] = AxisToScrew(S)
% Take normalized screw axis S and return unit axis s, its location q, and pitch h.
omghat = S(1:3);
v = S(4:6);

s = omghat;
q = cross(s, v);
h = dot(s, v);

end
