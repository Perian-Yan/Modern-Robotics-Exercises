function [R, p] = TransToRp(T)
% Extracts the rotation matrix R and position vector p from a homogeneous
% transformation matrix T.

R = T(1:3, 1:3);
p = T(1:3, 4);

end