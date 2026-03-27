function AdT = Adjoint(T)
% Computes the 6x6 adjoint representation [AdT] of the homogeneous
% transformation matrix T.

[R, p] = TransToRp(T);  % also check the validity of T
AdT = [R zeros(3,3);
      VecToso3(p)*R  R];
end