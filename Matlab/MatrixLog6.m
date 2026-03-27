function se3mat = MatrixLog6(T)
% Computes the matrix logarithm se3mat in se(3) of the homogeneous
% transformation matrix T in se(3).
% T = [R p;   --->  se3mat = [S]*theta = [[omg]*theta  v*theta;
%      0 1]                                     0         0   ] 
tol = getTol();

if norm(T - eye(4), 'fro') < tol
    se3mat = zeros(6,1);
else
    [R, p] = TransToRp(T);
    if norm(R - eye(3), 'fro') < tol
        se3mat = [zeros(3,3) p;
                  0 0 0 0];
    else
        so3mat = MatrixLog3(R);
        theta = acos( (trace(R)-1) / 2 );
        omghat_mat = so3mat / theta;
        
        G_inv = 1/theta * eye(3) - 1/2 * omghat_mat + ...
            (1/theta - 1/2*cot(theta/2)) * omghat_mat^2;
        v = G_inv * p;
        se3mat = [so3mat v*theta;
                  0 0 0 0];
    end
end

end