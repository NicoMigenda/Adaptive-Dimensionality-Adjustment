%normalized mahalanobis distance
function [p] = vconstpot(p,units,k,g)
% calculate determinant of eigenvalue matrix
p.det_L = prod(units{k}.eigenvalue);
% Wenn n = m ist
% n Dimension des Datensetzes, 
if( p.columns == units{k}.outdimension )
    p.r(k, :) = [k, units{k}.y' * (units{k}.y ./ units{k}.eigenvalue) * sqrt(p.det_L)];
else
    %2. Formel Schenck Diss Seite 93 - Lambda Stern (Restvarianz)
    p.lambda_rest = units{k}.sigma ./ (p.columns - units{k}.outdimension);
    if( p.lambda_rest <= 0.0 )
        p.lambda_rest_vol = p.logArgMinLimit;
        fprintf( '%i: Lambda_rest: %e\n', g,p.lambda_rest );
    else
        p.lambda_rest_vol = p.lambda_rest;
    end  
    % Volumenunabhängige Mahalnobisdistanz
    p.r(k, :) = [k, ...
        (units{k}.y' * (units{k}.y ./ units{k}.eigenvalue)                                      ...
        + (1 ./ p.lambda_rest_vol) * (units{k}.x_c' * units{k}.x_c - units{k}.y' * units{k}.y))     ...
        * p.det_L^(1/p.columns) * p.lambda_rest_vol^((p.columns-units{k}.outdimension)/p.columns)];
end


