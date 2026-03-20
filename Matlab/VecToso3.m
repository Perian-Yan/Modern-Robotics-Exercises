function so3mat = VecToso3(omg)
% Computes 3x3 skew-symmetric matrix corresponding to omg.

so3mat = [0       -omg(3)  omg(2);
          omg(3)  0        -omg(1);
         -omg(2)  omg(1)   0];
end