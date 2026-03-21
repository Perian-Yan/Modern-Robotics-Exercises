function invR = RotInv(R)
% Computes the inverse of the rotation matrix R.

isRotationMatrix(R);

invR = transpose(R);  % not conjugate transpose
end
