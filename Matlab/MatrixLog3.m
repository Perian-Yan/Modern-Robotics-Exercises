function so3mat = MatrixLog3(R)
% Computes the matrix logarithm of the rotation matrix R.
% so3mat = log(R)
if nargin ~= 1
    error('MatrixLog3:InvalidInputNumber', 'Function requires exactly one input argument.');
end

isRotationMatrix(R);

acosinput = (trace(R) - 1) / 2;
tol = getTol();

if acosinput >= 1
    so3mat = zeros(3,3);

elseif acosinput <= -1 
    theta = pi;
    if abs(R(1,1) + 1) > tol
        omghat = 1/sqrt(2*(R(1,1)+1)) * (R(:,1)+[1;0;0]);
    elseif abs(R(2,2) + 1) > tol
        omghat = 1/sqrt(2*(R(2,2)+1)) * (R(:,2)+[0;1;0]);
    else
        omghat = 1/sqrt(2*(R(3,3)+1)) * (R(:,3)+[0;0;1]);
    end
    so3mat = VecToso3(omghat*theta);
else
    theta = acos(acosinput);

    if abs(theta) < tol
        so3mat = zeros(3,3);
    else
    omghat_mat = (R - R.') / (2*sin(theta));
    so3mat = omghat_mat * theta;
    end

end


end