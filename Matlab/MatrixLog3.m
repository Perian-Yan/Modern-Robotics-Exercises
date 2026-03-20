function so3mat = MatrixLog3(R)
% Computes the matrix logarithm of the rotation matrix R.
% so3mat = log(R)

if R == eye(3)
    so3mat = zeros(3,3);
elseif trace(R) == -1
    theta = pi;
    if R(1,1) + 1 ~= 0
        omghat = 1/sqrt(2*(R(1,1)+1)) * (R(:,1)+[1;0;0]);
    elseif R(2,2) + 1 ~= 0
        omghat = 1/sqrt(2*(R(2,2)+1)) * (R(:,2)+[0;1;0]);
    else
        omghat = 1/sqrt(2*(R(3,3)+1)) * (R(:,3)+[0;0;1]);
    end
    so3mat = VecToso3(omghat*theta);
else
    theta = acos((trace(R)-1)/2);
    omghat_mat = (R - transpose(R)) / (2*sin(theta));
    so3mat = omghat_mat * theta;
end


end