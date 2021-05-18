function [resultVec, resultMat] = outer_ellipse_sum(l, varargin)
    %OUTER_ELLIPSE_SUM
    if mod(nargin, 2) == 0
        error("Wrong arguments count")
    end
    ellipse_count = (nargin - 1) / 2;
    
    scalar_sum = 0;
    mat_sum    = zeros(2);
    resultVec  = zeros(2, 1);

    for i = 1:ellipse_count
        qVec = varargin{2*i - 1};
        qMat = varargin{2*i};
        
        resultVec = resultVec + qVec;
        scalar_sum = scalar_sum + (l.' * qMat * l);
        mat_sum    = mat_sum + (qMat) / (l.' * qMat * l);
    end
    resultMat = scalar_sum * mat_sum;
end