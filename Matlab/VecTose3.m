function se3mat = VecTose3(V)
% Returns the se(3) matrix corresponding to a 6-vector twist V.
% se3mat = [[omg] v
%           0     0]
omg = V(1:3);
v = V(4:6);
se3mat = [[VecToso3(omg) v]; zeros(1,4)];
end
