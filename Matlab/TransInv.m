function invT = TransInv(T)
% Compute the inverse of a homogeneous transformation matrix T.

isTransMatrix(T);
[R, p] = TransToRp(T);
invR = RotInv(R);
p_new = -invR * p;
invT = RpToTrans(invR, p_new);

end