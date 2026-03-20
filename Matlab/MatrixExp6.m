function T = MatrixExp6(se3mat)
% Computes the homogeneous transformation matrix T in SE(3) corresponding
% the the matrix exponential of se3mat in se(3).
% T = e^([S]theta) 
S_theta = se3ToVec(se3mat);
omg = S_theta(1:3);
if norm(omg) ~= 0
    
    so3mat = VecToso3(omg);
    [omghat, theta] = AxisAng3(omg);
    v = S_theta(4:6) / theta;
    omghat_mat = VecToso3(omghat);
    G = theta*eye(3) + (1-cos(theta))*omghat_mat + (theta-sin(theta))*omghat_mat^2;
    T = RpToTrans(MatrixExp3(so3mat), G*v);
else
    theta = norm(S_theta(4:6));
    v = S_theta(4:6) / theta;
    T = RpToTrans(eye(3), v*theta);
end
end