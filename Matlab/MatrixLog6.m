function se3mat = MatrixLog6(T)
% Computes the matrix logarithm se3mat in se(3) of the homogeneous
% transformation matrix T in SE(3).
if T == eye(4)
    se3mat = zeros(6,1);
else
    [R, p] = TransToRp(T);
    if R == eye(3)
        omghat = zeros(3,1);
        v = p / norm(p);
    else
        so3mat = MatrixLog3(R);
        omg = so3ToVec(so3mat);
        [omghat, theta] = AxisAng3(omg);
        omghat_mat = VecToso3(omghat);
        
        G_inv = 1/theta * eye(3) - 1/2 * omghat_mat + ...
            (1/theta - 1/2*cot(theta/2)) * omghat_mat^2;
        v = G_inv * p;
    end
    S = [omghat; v];
    se3mat = VecTose3(S*theta);
end

end