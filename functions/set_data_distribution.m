function [p,units] =set_data_distribution(p,units,loop)
%-------------------------------------------------------------------------%
% FIRST PART OF MAIN LOOP: SET AND PLOT DATA DISTRIBUTION                 %
%-------------------------------------------------------------------------%
% exchange data distribution
    
    % plot data and show initial title
    hold off;
    plot(p.shape(:,1), p.shape(:,2), 'c.');
    hold on;
    p.ht = title( sprintf('t = %i', loop) );
    xlabel('X');
    ylabel('Y');
    axis equal;
    axis manual;
    for k = 1:p.N
        units{k}.mt = zeros(units{k}.outdimension, 1);  
        %Ellipsoid graphic handle
        units{k}.H = plot_ellipse(units{k}.weight(1:2,1:2), sqrt(abs(units{k}.eigenvalue(1:2))), units{k}.center(1:2));
        %Text inside the each ellipsoid
        units{k}.HT = text('Position', units{k}.center(1:2),     ...
                           'String', sprintf('%u', k),      ...
                           'Color', 'r',                    ...
                           'Visible', 'on');
    end
    % draw plot and initial ellipses
    drawnow;


