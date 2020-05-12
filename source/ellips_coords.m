function [xs, ys] = ellips_coords(qVec, qMat, n)
%ELLIPS_COORDS 
%   
    default_n = 100;

    if nargin < 2
        error('Too few arguments.');
    else
        if nargin == 2
            n = default_n;
        else
            if nargin > 3
                error('Too many arguments.');
            end
        end
    end
    
    if ~isequal(size(qVec), [2, 1])
        error('qVec size must be [2, 1].');
    end
    
    if ~isequal(size(qMat), [2, 2])
        error('qMat size must be [2, 2].');
    end
    
    if ~isequal(qMat, qMat.')
        error('qMat must be symmetric.');
    end
    
    if det(qMat) <= 0
        error('qMat must be positive definite.');
    end
    
    phi = linspace(0, 2*pi, n);
    xs = zeros(n, 1);
    ys = zeros(n, 1);
    for i = 1:n
        lVec = [sin(phi(i)); cos(phi(i))];
        coordVec = support_coord(lVec);
        xs(i) = coordVec(1);
        ys(i) = coordVec(2);
    end
     
    function coordVec = support_coord(lVec)
        coordVec = qVec + qMat * lVec ./ sqrt(lVec.' * qMat * lVec);
    end
end

