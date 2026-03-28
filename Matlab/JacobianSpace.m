function Js = JacobianSpace(Slist, thetalist)
% Computes the space Jacobian Js (6xn) given a list of joint screws Si expressed in the space-fixed
% frame and a list of joint angles.
% Input:
% Slist: size of 6xn
% thetalist: size of 1xn

if size(Slist,1) ~= 6
    error('JacobianSpace:InvalidDimension', 'Each column of Slist must be 6-dim.');
end

if any(cellfun(@(x) any(~isfinite(x(:))), {Slist, thetalist}))
     error('JacobianSpace:NonInfiniteInput', 'Slist and thetalist must be finite.');
end

if ~isvector(thetalist)
    error('JacobianSpace:InvalidThetalist', 'Thetalist must be a vector.')
end

n = length(thetalist);

if size(Slist,2) ~= n
    error('JacobianSpace:LengthMismatch', 'The Slist and thetalist must have the same length.');
end

Js = zeros(6, n);
Tadj = eye(4);

for i = 1:n
 Js(:, i) = Adjoint(Tadj) * Slist(:, i);
 Tadj = Tadj * MatrixExp6(VecTose3(Slist(:, i) * thetalist(i)));
end

end