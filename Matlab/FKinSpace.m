function T = FKinSpace(M, Slist, thetalist)
% Computes the end-effector frame given the zero position of the end-effector M,
% the list of joint screws Slist expressed in the fixed-space frame, and the list of
% joint values thetalist.

% Inputs:
% M is a homogeneous transformation matrix 
% Slist is a list of 6-dim column vectors [S1, S2, ... ], Si=[x; x; ...]
% thetalist is a list of scalars [theta1, theta2, ...]

isTransMatrix(M);
if size(Slist,1) ~= 6
    error('FKinSpace:InvalidDimension', 'Each column of Slist must be 6-dim.');
end

if any(cellfun(@(x) any(~isfinite(x(:))), {Slist, thetalist}))
     error('FKinSpace:NonInfiniteInput', 'Slist and thetalist must be finite.');
end

if ~isvector(thetalist)
    error('FKinSpace:InvalidThetalist', 'Thetalist must be a vector.')
end

N = length(thetalist);

if size(Slist,2) ~= N
    error('FKinSpace:LengthMismatch', 'The Slist and thetalist have different length.');
end

T = M;
for i = N:-1:1
    T = MatrixExp6(VecTose3(Slist(:,i) * thetalist(i))) * T;
end

end
