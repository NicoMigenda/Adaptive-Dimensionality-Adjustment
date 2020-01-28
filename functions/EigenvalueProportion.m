 function [p, units] = EigenvalueProportion(p,units,g,loop)

    % Add n Dimensions
    % Transform eigenvalues into log scale
    logEigenvalues = log(units.eigenvalue);
    x = (1:units.outdimension)';

    % Fit line through the log eigenvalues
    P = polyfit(x,logEigenvalues,1);
    %x = (1:p.columns)';
    x = (1:units.outdimension)';
    % Best Fit line to predict the initial values for new dimensions
    x1 = (max(x)+1:p.columns)';
    approximatedEigenvaluesLog = P(1)*x1+P(2);

    % Transform back into normal scale
    approximatedEigenvalues = exp(approximatedEigenvaluesLog);

    allEigenvalues = [units.eigenvalue;approximatedEigenvalues];
    newDim = sum(allEigenvalues > p.dimThreshold * units.totalVariance);
    
    if newDim > units.outdimension
        addedDim = newDim - units.outdimension;
        units.weight = [units.weight orth(rand(p.columns, addedDim)) ] ;
        units.eigenvalue = [units.eigenvalue; approximatedEigenvalues(1:addedDim)];
        units.outdimension = units.outdimension + addedDim;
        units.realDim = units.outdimension;
        units.y = zeros(units.outdimension, 1);
        units.mt = [units.mt;repmat(0,addedDim,1)];
        units.protect = 10;
        fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
    elseif newDim < units.outdimension
        if newDim < 2
            units.realDim = 1;
            newDim = 2;
        else
            units.realDim = newDim;
        end
        units.outdimension = newDim;
        units.weight(:,units.outdimension+1:end) = [];      
        units.eigenvalue(units.outdimension+1:end) = [];   
        units.y = repmat(units.y(1:units.outdimension), 1);
        units.mt = repmat(units.mt(1:units.outdimension), 1);
        units.protect = 10;
        fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
    end
    
    if units.realDim == 1
        units.suggestedOutdimension = 1;
    else
        units.suggestedOutdimension = units.outdimension;
    end
