function se3mat = VecTose3(V)
% Returns the se(3) matrix corresponding to a 6-vector twist V.
% se3mat = [[omg] v
%           0     0]

if ~isreal(V) || ~isnumeric(V)
    error('VecTose3:InvalidType', 'Twist must be real and numeric.')
end

if numel(V) ~= 6
    error('VecTose3:InvalidDimension', 'Twist must be a 6-dim vector.')
end

if any(~isfinite(V)) 
    error('VecTose3:NonInfiniteInput', 'Input twist contains NaN or inf values.')
end

omg = V(1:3);
v = V(4:6);
se3mat = [[VecToso3(omg) v]; zeros(1,4)];
end
