function T = RpToTrans(R, p)
% Builds the homogeneous transformation matrix T corresponding to a
% rotation matrix R and a position vector p.

T = [[R  p]; [0 0 0 1]];

end