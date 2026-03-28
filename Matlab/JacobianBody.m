function Jb = JacobianBody(Blist, thetalist)
% Computes the body Jacobian Jb (6xn) given a list of joint screws Bi expressed in the body
% frame and a list of joint angles.
% Input:
% Blist: size of 6xn
% thetalist: size of 1xn

if size(Blist,1) ~= 6
    error('JacobianBody:InvalidDimension', 'Each column of Blist must be 6-dim.');
end

if any(cellfun(@(x) any(~isfinite(x(:))), {Blist, thetalist}))
     error('JacobianBody:NonInfiniteInput', 'Blist and thetalist must be finite.');
end

if ~isvector(thetalist)
    error('JacobianBody:InvalidThetalist', 'Thetalist must be a vector.')
end

n = length(thetalist);

if size(Blist,2) ~= n
    error('JacobianBody:LengthMismatch', 'The Blist and thetalist must have the same length.');
end

Jb = zeros(6, n);
Tadj = eye(4);

for i = n:-1:1
 Jb(:, i) = Adjoint(Tadj) * Blist(:, i);
 Tadj = Tadj * MatrixExp6(-VecTose3(Blist(:, i) * thetalist(i)));
end

end