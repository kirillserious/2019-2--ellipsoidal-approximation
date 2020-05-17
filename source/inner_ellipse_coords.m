function [xs, ys] = inner_ellipse_coords(l, varargin)
%INNER_ELLIPSE_COORDS
    
    if mod(nargin, 2) == 0
        n             = varargin{end};
        ellipse_count = (nargin - 2) / 2;
    else
        n             = 0;
        ellipse_count = (nargin - 1) / 2;
    end
    
    qVec = varargin{1};
    qMat = varargin{2};
    
    div_part = sqrt(l.' * qMat * l);
    mul_part = sqrtm(qMat) * l;
    
    resultVec = qVec;
    resultMat = sqrtm(qMat);
    
    for i = 2:ellipse_count
        qVec = varargin{2*i-1};
        qMat = varargin{2*i};
        
        lambda = sqrt(l.' * qMat * l) / div_part;
        a = sqrtm(qMat) * l;
        b = lambda * mul_part;
        sMat = orthogonal_transform(a, b);
        
        resultVec = resultVec + qVec;
        resultMat = resultMat + sMat * sqrtm(qMat);
    end
    
    resultMat = resultMat.' * resultMat;
    
    if n == 0
        [xs, ys] = ellipse_coords(resultVec, resultMat);
    else
        [xs, ys] = ellipse_coords(resultVec, resultMat, n);
    end
    
    
    function resultMat = orthogonal_transform(aVec, bVec)
        [avMat, asMat, auMat] = svd(aVec, 'econ');
        [bvMat, bsMat, buMat] = svd(bVec, 'econ');
    
        resultMat = bvMat * avMat.' .* (bsMat .* buMat ./ asMat ./ auMat);
    end
end

