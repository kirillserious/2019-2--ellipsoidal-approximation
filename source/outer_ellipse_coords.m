function [xs, ys] = outer_ellipse_coords(l, varargin)
    %INNER_ELLIPSE_COORDS
 
    scalar_sum = 0;
    mat_sum    = zeros(2);
    resultVec  = zeros(2, 1);
    resultMat  = zeros(2);
    
    if mod(nargin, 2) == 0
        n             = varargin{end};
        ellipse_count = (nargin - 2) / 2;
    else
        n             = 0;
        ellipse_count = (nargin - 1) / 2;
    end
    
    for i = 1:ellipse_count
        qVec = varargin{2*i - 1};
        qMat = varargin{2*i};
        
        resultVec = resultVec + qVec;
        scalar_sum = scalar_sum + (l.' * qMat * l);
        mat_sum    = mat_sum + (qMat) / (l.' * qMat * l);
    end
    
    resultMat = scalar_sum * mat_sum;
    
    if n == 0
        [xs, ys] = ellipse_coords(resultVec, resultMat);
    else
        [xs, ys] = ellipse_coords(resultVec, resultMat);
    end
end

