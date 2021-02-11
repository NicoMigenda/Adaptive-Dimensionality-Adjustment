clear variables
close all
addpath('helperFunctions','datasets','results');
    
%% Define "Hyper Parameter"
% Initial Dimensionality
m = 2;
% 
%threshold = 0.70;
reps = 100;

%% Load data set
dataset = 'waveDataNoNoise';
load (strcat(dataset,'.mat'))
x = data;
[N,n] = size(x); 

[~,~,totalVarianceS] = pca(x);
totalVariance = sum(totalVarianceS);

%% Memory allocation
p = Init(m,N,n,reps,x);
outDimTotal = zeros(reps,N);

%% Repetitions for Benchmark
for th = 1:4
    if th == 1
        threshold = 0.7;
    elseif th == 2
        threshold = 0.8;
    elseif th == 3
        threshold = 0.9;
    elseif th == 4
        threshold = 0.99; 
    end
    outDimTotal = zeros(reps,N);
for g = 1:reps
    rng(g);
    m = 2;
    p = Init(m,N,n,reps,x);
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
        dim(i) = m;
    end
    outDimTotal(g,:) = dim(:)';
        % Die Methode kann garkeinen Drift in den Daten abbilden, da der Einfluss
        % des Residual terms über die Anzahl der Datenpunkte abnimmt?    
end
y=num2str(threshold);
out=str2double(y(3:end));
path = strcat('results\',dataset,'_', num2str(out));
save(path ,'outDimTotal')
end
% if m > 2
%     figure
%     scatter(data(:,1), data(:,2),0.5,'filled')
%     hold on
%     scatter(center(1), center(2),'filled')
%     xlabel('X')
%     ylabel('Y')
%     plot_ellipse(weight(1:2,1:2), sqrt(abs(eigenvalue(1:2))), center(1:2));
% end
    
figure
plot(1:reps, outDimTotal(:,end),'*')
xlabel('repetitions','interpreter','latex','Fontname','Times new Roman')
ylabel('Dimension','interpreter','latex','Fontname','Times new Roman')

figure
plot(1:N, mean(outDimTotal))
xlabel('Training cycles','interpreter','latex','Fontname','Times new Roman')
ylabel('Dimension','interpreter','latex','Fontname','Times new Roman')
