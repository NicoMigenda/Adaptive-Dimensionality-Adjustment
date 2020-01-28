 function [p, units] = UnitSpecificDimensionLineFitting(p,units,g,loop)

if units.variance < units.totalVariance * p.dimThreshold
    % Add n Dimensions
    % Transform eigenvalues into log scale
    logEigenvalues = log(units.eigenvalue);
    x = (1:units.outdimension)';
    %x = log((1:units.outdimension)');

    % Fit line through the log eigenvalues
    P = polyfit(x,logEigenvalues,1);
    %x = (1:p.columns)';
    %x = (1:units.outdimension)';
    % Best Fit line to predict the initial values for new dimensions
    x1 = (max(x)+1:p.columns)';
    %x1 = log((max(x)+1:p.columns)');
    approximatedEigenvaluesLog = P(1)*x1+P(2);

    % Transform back into normal scale
    approximatedEigenvalues = exp(approximatedEigenvaluesLog);

    addedDim = find(cumsum(abs(approximatedEigenvalues)) + units.variance > units.totalVariance * p.dimThreshold,1);
    if units.variance + sum(abs(approximatedEigenvalues)) < units.totalVariance * p.dimThreshold
        addedDim = 1;
    end     
    if addedDim + units.outdimension > p.columns
        addedDim = p.columns - units.outdimension;
    end

    units.weight = [units.weight orth(rand(p.columns, addedDim)) ] ;
    units.eigenvalue = [units.eigenvalue; approximatedEigenvalues(1:addedDim)];
    units.outdimension = units.outdimension + addedDim;
    units.realDim = units.outdimension;
    units.y = zeros(units.outdimension, 1);
    units.mt = [units.mt;repmat(0,addedDim,1)];
    units.gy = zeros(units.outdimension, 1);
    units.protect = 10;
    %fprintf( '%i,%i: Unit %i Dimension Increased by: %i\n', g,loop,k,addedDim );
    fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
else
    if sum(units.eigenvalue(1:end-1)) > (units.totalVariance * p.dimThreshold)
        % Remove 1 Dimension
        if units.outdimension > 2
            units.outdimension = units.outdimension - 1;
            units.weight(:,units.outdimension+1:end) = [];      
            units.eigenvalue(units.outdimension+1:end) = [];   
            units.y = repmat(units.y(1:units.outdimension), 1);
            units.mt = repmat(units.mt(1:units.outdimension), 1);
            units.gy = repmat(units.gy(1:units.outdimension), 1);
            units.protect = 10;
           % fprintf( '%i,%i: Unit %i Dimension Reduced by: 1 \n', g,loop,k);
           fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
        end
    else
        %% Do Nothing 
        % In thise case the recent amount of Dimensions is above the Threshold 
        % but removing the last Dimension would cause a drop below the Threshold again!  
    end
    
%     newDim = find(cumsum(units.eigenvalue) > (units.totalVariance * p.dimThreshold),1);
%     if newDim < 2
%         units.realDim = 1;
%         newDim = 2;
%     else
%         units.realDim = newDim;
%     end
%     if isempty(newDim)
%        units.realDim = 1;
%        newDim = 2; 
%     end
%     units.outdimension = newDim;
%     units.weight(:,units.outdimension+1:end) = [];      
%     units.eigenvalue(units.outdimension+1:end) = [];   
%     units.y = repmat(units.y(1:units.outdimension), 1);
%     units.mt = repmat(units.mt(1:units.outdimension), 1);
%     units.gy = repmat(units.gy(1:units.outdimension), 1);
%     units.protect = 10;
%     fprintf( '%i,%i: Dimension: %i \n', g,loop,units.outdimension);
    
end
if units.realDim == 1
    units.suggestedOutdimension = 1;
else
    units.suggestedOutdimension = units.outdimension;
end