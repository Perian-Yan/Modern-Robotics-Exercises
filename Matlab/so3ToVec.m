function omg = so3ToVec(so3mat)
% Computes 3-vector corresponding to the 3x3 skew-symmetric matrix.
    omg_1 = -so3mat(2,3);
    omg_2 = so3mat(1,3);
    omg_3 = -so3mat(1,2);
    omg = [omg_1; omg_2; omg_3];
end