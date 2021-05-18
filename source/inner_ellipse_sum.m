function [resultVec, resultMat] = inner_ellipse_sum(l, varargin)
%INNER_ELLIPSE_SUM
    if mod(nargin, 2) == 0
        error("Wrong arguments count")
    end
    
    ellipse_count = (nargin - 1) / 2;
    
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

    
    
    function resultMat = orthogonal_transform(aVec, bVec)
        [avMat, asMat, auMat] = svd(aVec, 'econ');
        [bvMat, bsMat, buMat] = svd(bVec, 'econ');
    
        resultMat = bvMat * avMat.' .* (bsMat .* buMat ./ asMat ./ auMat);
    end
end

