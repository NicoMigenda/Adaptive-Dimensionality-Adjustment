function [Parameter,units] = Init

% Pick Data set
datasets = {'cameraman','circles','PHM','careercon','waveData','waveDataNoNoise'};
%{
    1. camerman
    2. circles
    3. PHM
    4. careercon
    5. waveData
    6. waveDataNoNoise
%}
% Choose dataset (1-6):
dataset = 4; 
%{
    1. Eigenvalue-Ooe
    2. Eigenvalue-average
    3. Percentage of total variance
    4. Cumulative percentage of total variance
    5. Kirsch et al. approach

%}
Parameter.criterion = 5;

filename = strcat(string(datasets(dataset)),'.mat');
load(filename);
Parameter.shape = data;


Parameter.tau = 0;
Parameter.sigmaMean = 0;
% Init Dimension
Parameter.StartDim = 2;
% dimThreshold
Parameter.dimThreshold = 0.90;
% Learningrate
Parameter.epsilon_init = 0.5;
Parameter.epsilon_final = 0.001;
% Neighborhood range
Parameter.rho_init = 2; % 
Parameter.rho_final = 0.01;
% initial variance
Parameter.lambda_init = 1000.0;
% number of data points and input dimension
[Parameter.rows, Parameter.columns] = size(Parameter.shape);
% Number of total iterationens
Parameter.T = Parameter.rows;

Parameter.helper = 0;
% Adaptive Lernratensteuerung fur Neural Gas Principal Component Analysis.
Parameter.mu = 0.005;
Parameter.xvalue = 0;
Parameter.logArgMinLimit = 1e-323;
Parameter.phi = 2.0;
Parameter.udmLogBase = 10.0;
Parameter.log_precomp = log( Parameter.udmLogBase );


%-------------------------------------------------------------------------%
% UNIT INITIALIZATION                                                     %
%-------------------------------------------------------------------------%
    
% Protecs a Unit for n Iterations after the Dimension changed
units.protect = 100;

%Unit specific Output Dimension
units.outdimension = Parameter.StartDim;
units.suggestedOutdimension = Parameter.StartDim;
units.realDim = Parameter.StartDim;
% init centers by choosing N data points at random 
units.center = Parameter.shape(ceil(Parameter.rows .* rand), :)';

% first m principal axes (weights)
% orhonormal (as needed by distance measure)        
units.weight = orth(rand(Parameter.columns, units.outdimension));
% first m eigenvalues                                
units.eigenvalue = repmat(Parameter.lambda_init, units.outdimension, 1);

% residual variance in the minor (d - m) eigendirections
units.sigma = Parameter.lambda_init;

% deviation between input and center
units.x_c = zeros(Parameter.columns, 1);

% unit output (activation) for input x_c
units.y = zeros(units.outdimension, 1);

% unit matching measure
units.mt = zeros(units.outdimension, 1);

% unit summarized matching measure
units.Dt = 1.0;

% Unit variance
units.variance = 0;

% Unit total variance
units.totalVariance = 0;

% global learning rate 
units.alpha = Parameter.epsilon_init;
      


