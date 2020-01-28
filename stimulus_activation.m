function [p,units] = stimulus_activation(p,units)
    
    % randomly select current input vector (stimulus)
    p.xvalue = ceil(p.rows .* rand);
    p.x = p.shape(p.xvalue, :)';

    % calculate neuron input and output (activation)
    units.x_c = p.x - units.center;
    units.y   = units.weight' * units.x_c;



