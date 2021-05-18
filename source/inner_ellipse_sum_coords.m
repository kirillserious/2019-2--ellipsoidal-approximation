function [xs, ys] = inner_ellipse_sum_coords(l, varargin)
%INNER_ELLIPSE_COORDS
    
    if mod(nargin, 2) == 0
        n            = varargin{end};
        [qVec, qMat] = inner_ellipse_sum(l, varargin{1:end-1});
        [xs, ys]     = ellipse_coords(qVec, qMat, n);
    else
        [qVec, qMat] = inner_ellipse_sum(l, varargin{:});
        [xs, ys]     = ellipse_coords(qVec, qMat);
    end
end

