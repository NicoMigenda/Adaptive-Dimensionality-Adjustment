%{
    Original algorithm "Incremental Eigenanalysis for Classification" by Peter M. Hall, David Marshall, and Ralph R. Martin
    
    Code by: Nico Migenda 2021

%}
clear variables
close all
addpath('helperFunctions','datasets','results');

%% Define "Hyper Parameter"
% Initial Dimensionality
m = 2;
% Threshold for cumulative energy stopping rule (e.g 0.7 = 70% of total variance)
threshold = 0.70;

%% Load data set
dataset = 'waveData';
load (strcat(dataset,'.mat'))
x = data;
[N,n] = size(x); 

[~,~,totalVarianceS] = pca(x);
totalVariance = sum(totalVarianceS);

%% Memory allocation
p = Init(m,N,n,1,x);

%% Main Loop
for i = 1:N
    % Sample data point (randomly or in sequence)
    p.xvalue = i;%ceil(N .* rand);
    % Distance between center and data point
    p.x_c = x(p.xvalue,:)' - p.center;
    % Projection into eigenspace eq. 2
    p.y = p.weight' * p.x_c;
    % residuals eq. 3
    p.residual = p.x_c - p.weight * p.y;
    % Update center according to eq. 5
    p.center = (1 / (i+1)) * (i * p.center + x(p.xvalue,:)');
    % Normalized residual vector eq 7
    if norm(p.residual) ~= 0
        p.residualNorm = p.residual / norm(p.residual);
    else
        % If data point lies exactly within the current eigenspace
        p.residualNorm = zeros(n,1);
    end
    % Helper variable defined below eq. 11
    p.gamma = p.residualNorm' * p.x_c;
    % First term of the covariance matrix eq. 12
    p.firstterm = (i / (i+1)) * [diag(p.eigenvalue), zeros(m,1); zeros(1,m), 0];
    % Second term of the covariance matrix eq. 12
    p.secondterm = (i / (i+1)^2) * [p.y*p.y' , p.gamma*p.y; p.gamma*p.y' , p.gamma^2];
    % Updated covariance matrix eq. 12 with size of m+1
    p.covarianceNew = p.firstterm + p.secondterm;
    % Solve eigenproblem with size of m+1
    [p.V,p.D] = eig(p.covarianceNew);
    % Right side eigenvalues are directly obtained and fliped to match notation in paper
    p.eigenvaluePlus1 = flip(diag(p.D));
    % Estimate new eigenvalues with m+1 based on eq. 8
    p.weightPlus1 = [p.weight, p.residualNorm] * p.V;
    % Flip to match notation in paper
    p.weightPlus1 = flip(p.weightPlus1,2);
    % Apply cumulative energy stopping rule and either maintain dimensionality, add one, or discard any number
    if sum(p.eigenvaluePlus1(1:m)) <= threshold * totalVariance
        if m < n
            p.eigenvalue = p.eigenvaluePlus1;
            p.weight = p.weightPlus1;
            m = m+1;
        else
            p.eigenvalue = p.eigenvaluePlus1(1:m);
            p.weight = p.weightPlus1(:,1:m);
        end
    else %if sum(eigenvaluePlus1(1:m)) > threshold * totalVariance
        if m > 1
            m = find(cumsum(p.eigenvaluePlus1) > threshold * totalVariance,1);
            p.eigenvalue = p.eigenvaluePlus1(1:m);
            p.weight = p.weightPlus1(:, 1:m);
        else
            p.eigenvalue = p.eigenvaluePlus1(1:m);
            p.weight = p.weightPlus1(:, 1:m);
        end
    end
end 

if m > 2
    figure
    scatter(data(:,1), data(:,2),0.5,'filled')
    hold on
    scatter(p.center(1), p.center(2),'filled')
    xlabel('X')
    ylabel('Y')
    plot_ellipse(p.weight(1:2,1:2), sqrt(abs(p.eigenvalue(1:2))), p.center(1:2));
end
