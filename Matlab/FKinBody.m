function T = FKinBody(M, Blist, thetalist)
% Computes the end-effector frame given the zero position of the end-effector M,
% the list of joint screws Blist expressed in the end-effector frame, and the list of
% joint values thetalist.

% Inputs:
% M is a homogeneous transformation matrix 
% Blist has size of 6xN
% thetalist has size of 1xN

isTransMatrix(M);
if size(Blist,1) ~= 6
    error('FKinBody:InvalidDimension', 'Each column of Blist must be 6-dim.');
end

if any(cellfun(@(x) any(~isfinite(x(:))), {Blist, thetalist}))
     error('FKinBody:NonInfiniteInput', 'Blist and thetalist must be finite.');
end

if ~isvector(thetalist)
    error('FKinBody:InvalidThetalist', 'Thetalist must be a vector.')
end

N = length(thetalist);

if size(Blist,2) ~= N
    error('FKinBody:LengthMismatch', 'The Blist and thetalist must have the same length.');
end

 
T = M;
for i = 1:N
    T = T * MatrixExp6(VecTose3(Blist(i) * thetalist(i)));
end

end