function [xs, ys] = sum_ellipse_coords(varargin)
%SUM_ELLIPSE_COORDS 
    if (mod(nargin, 2) ~= 0) || (nargin < 2)
        error('Wrong arguments count.');
    end
    
    xs = [];
    ys = [];
    
    for i = 1 : 2 : nargin
        qVec = varargin{i};
        qMat = varargin{i+1};
        
        [cur_xs, cur_ys] = ellipse_coords(qVec, qMat);
        
        if isempty(xs)
            xs = cur_xs;
            ys = cur_ys;
        else
            xs = xs + cur_xs;
            ys = ys + cur_ys;
        end
    end
    
end

