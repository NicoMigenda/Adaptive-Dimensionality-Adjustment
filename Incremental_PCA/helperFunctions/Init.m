function p = Init(m,N,n,reps,x)
    p.center = x(ceil(N .* rand), :)';
    p.weight = orth(rand(n, m));
    p.weightPlus1 = zeros(n,m+1);
    p.eigenvalue = repmat(0.05, m, 1);
    p.eigenvaluePlus1 = zeros(m+1,1);
    p.residual = zeros(n,1);
    p.residualNorm = zeros(n,1);
    p.outDimTotal = zeros(reps,N);
    p.xvalue = 0;
    p.x_c = zeros(n,1);
    p.y  = zeros(m,1);
    p.gamma = 0;
    p.firstterm = zeros(m+1,m+1);
    p.secondterm = zeros(m+1,m+1);
    p.covarianceNew = zeros(m+1,m+1);
end

