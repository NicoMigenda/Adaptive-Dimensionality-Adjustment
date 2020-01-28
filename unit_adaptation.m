function [p,units] = unit_adaptation(p,units)

  units.alpha = (p.epsilon_init - p.epsilon_final) * units.Dt^p.phi ...
                      + p.epsilon_final;

  % Update the center of a unit, Eq. (3.8) Schenck dissertation (Neural Gas Step)
  units.center = units.center + units.alpha .* units.x_c;

  units = eforrlsa(units); 

  % sort eigenvalues 
  units.eigenvalue = sort(units.eigenvalue,'descend');
     
  units.variance = sum(units.eigenvalue);

  if(p.columns ~= units.outdimension)
      units.sigma = units.sigma + units.alpha * (units.x_c' * units.x_c - units.y' * units.y - units.sigma);
      if units.sigma < 0
         units.sigma = p.logArgMinLimit;
      end
      units.totalVariance = units.variance + units.sigma;
  else
      units.totalVariance = units.variance;
  end

  % update internal unit state for adaptive learning rate control
  units.Dt = 0.0;
  a_lowpass = p.mu;
  for i = 1:units.outdimension
    units.mt(i) = units.mt(i)*(1-a_lowpass) ...
                   + units.y(i)*units.y(i)/units.eigenvalue(i)*a_lowpass;
    if units.mt(i) > p.logArgMinLimit
      units.Dt = units.Dt ...
                  + min( abs(log(units.mt(i))/p.log_precomp), 1.0 );
    else
      units.Dt = units.Dt + 1.0;
    end
  end
  units.Dt = units.Dt / units.outdimension;



