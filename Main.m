%{

Nico Migenda <nico.migenda(AT)fh-bielefeld.de>

    Copyright (C) 2019
    Center for Applied Data Science
    Faculty of Engineering and Mathematics
    University of Applied Data Sciences Bielefeld
    www.fh-bielefeld.de

A PCA extension to adaptivly determine the number of meaningful principal
components on a data stream

https://github.com/NicoMigenda/Adaptive-Dimensionality-Adjustment

Source online PCA:
    Moeller, R.: Interlocking of learning and orthonormalization in RRLSA. 
    Neurocomputing 49(1-4), 429-433 (2002)

Versions:
    1.0 / 10.2019        Initial version by Nico Migenda
    1.1 / 11.2019        Cleaned up and added comments
    1.2 / 01.2020        Final adjustments for github upload
%}

close all
clear variables

% Parallel tool
delete(gcp('nocreate'))
% Number of parallel workers
worker = 2;
parpool(worker);
%% 1: PREALLOCATION AND INITIALIZATION
repetitions = 100;
[Parameter,units] = Init;
outDimTotal = zeros(repetitions,Parameter.rows);
%% MAIN LOOP
parfor g = 1:repetitions
    % For reproducibility
    rng(g)
    % Init Parameter and PCA
    [Parameter,units] = Init;
    outDim = zeros(Parameter.T,1);
    for loop = 1:Parameter.T    
         %% 2: Unit STIMULUS AND ACTIVATION
         [Parameter, units] = stimulus_activation(Parameter,units);
         %% 3: UNIT ADAPTATION
         [Parameter, units] = unit_adaptation(Parameter,units);
         %% 4: ADJUSTING UNIT SPECIFIC DIMENSION     
         if units.protect == 0 
            if Parameter.criterion == 4
                [Parameter, units] = UnitSpecificDimensionLineFitting(Parameter,units,g,loop);  
            elseif Parameter.criterion == 2
                [Parameter, units] = EigenvalueAboveAverage(Parameter,units,g,loop);
            elseif Parameter.criterion == 1
                [Parameter, units] = EigenvalueAboveOne(Parameter,units,g,loop);
            elseif Parameter.criterion == 3
                [Parameter, units] = EigenvalueProportion(Parameter,units,g,loop);
            end
         else
            units.protect = units.protect - 1;
         end
         if Parameter.criterion == 5
            [Parameter, units] = kirsch_et_al(Parameter,units,g,loop);
         end
         %% 5: Benchmark
         %outDim(loop) = units{k}.suggestedOutdimension;
         outDim(loop) = units.outdimension;
    end 
    outDimTotal(g,:) = outDim(:)';
end

%% 6: Plot
figure
plot(1:repetitions, outDimTotal(:,end),'*')
xlabel('Repetitions','interpreter','latex','Fontname','Times new Roman')
ylabel('Dimension','interpreter','latex','Fontname','Times new Roman')
title('Final dimensionality for each repetition','interpreter','latex','Fontname','Times new Roman')

delete(gcp('nocreate'))
%% SAVE NETWORK for Benchmarking
%saveNet(Parameter,units);