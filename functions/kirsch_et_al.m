 function [p, units] = kirsch_et_al(p,units,g,loop)

if units.variance < units.totalVariance * p.dimThreshold
    addedDim = 1;
    units.weight = [units.weight orth(rand(p.columns, addedDim)) ] ;
    units.eigenvalue = [units.eigenvalue; p.lambda_init];
    units.outdimension = units.outdimension + addedDim;
    units.y = zeros(units.outdimension, 1);
    units.mt = [units.mt;repmat(0,addedDim,1)];
    fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
else
    % Remove 1 Dimension
    if units.outdimension > 2
        units.outdimension = units.outdimension - 1;
        units.weight(:,units.outdimension+1:end) = [];      
        units.eigenvalue(units.outdimension+1:end) = [];   
        units.y = repmat(units.y(1:units.outdimension), 1);
        units.mt = repmat(units.mt(1:units.outdimension), 1);
       fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
    end
end
