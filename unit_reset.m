function [p, units] = unit_reset(p,units,minIndex,loop)
%-------------------------------------------------------------------------%
% FOURTH PART OF MAIN LOOP: UNIT RESET                                    %
%-------------------------------------------------------------------------%

    units{minIndex}.center = p.x;
    units{minIndex}.outdimension = p.StartDim;
    units{minIndex}.weight = orth(rand(p.columns, units{minIndex}.outdimension));
    units{minIndex}.eigenvalue = repmat(p.lambdaSum / p.N, units{minIndex}.outdimension, 1);
    units{minIndex}.sigma = p.sigmaSum / p.N;
    units{minIndex}.mt = zeros(units{minIndex}.outdimension, 1);
    units{minIndex}.y = zeros(units{minIndex}.outdimension, 1);
    units{minIndex}.gy = zeros(units{minIndex}.outdimension,1);
    units{minIndex}.mp = 0;
    units{minIndex}.Dt = 0;
    units{minIndex}.eFunctionDimension = 1;
    units{minIndex}.protect = 100;
    p.allAges(minIndex) = p.ageMax;
    units{minIndex}.t = 0;
    fprintf( 'Resetting unit %i in loop %i \n', minIndex,loop );






