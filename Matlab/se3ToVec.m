function V = se3ToVec(se3mat)
% Returns the 6-vector twist corresponding to an se(3) matrix.

so3mat = se3mat(1:3, 1:3);
v = se3mat(1:3, 4);
omg = so3ToVec(so3mat);
V = [omg; v];

end