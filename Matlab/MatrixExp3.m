function R = MatrixExp3(so3mat)
% Computes the rotation matrix R corresponding to the the matrix exponential.
% R = e^([w_hat]*theta)
% Using the Rodrigues' rotation formula.   

expc3 = so3ToVec(so3mat);
[omghat, theta] = AxisAng3(expc3);
if theta == 0  % very small angle theta is set as 0 in AxisAng3.
    R = eye(3);
else
    omghat_mat = VecToso3(omghat);
    R = eye(3) + sin(theta) * omghat_mat + (1-cos(theta))*omghat_mat^2;
end
