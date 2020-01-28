function [units] = eforrlsa(units)
% EFORRLSA (Moeller, 2002)
% Interlocking of learning and orthonormalization in RRLSA
% Anlegen der lokalen Variablen
V = units.weight;
EFO_L2 = zeros(units.outdimension,1);
EFO_p = zeros(units.outdimension,1);
EFO_q = zeros(units.outdimension,units.outdimension);
EFO_r = zeros(units.outdimension,units.outdimension);
%Algorithmus Gleichungn 3-12
for i = 1:units.outdimension
    
    % Hilfsvariablen
    % alpha * Eigenwert
    % Anderes Alpha als im Hauptalgo. Dieses Alpha läuft gegen 1 während
    % das normale alpha gegen 0 läuft. Deshalb hier 1-alpha
    helperVariable1 = (1-units.alpha)*units.eigenvalue(i);
    % beta * Output
    % gleicher Verlauf wie Alpha aus Hauptalgo
    helperVariable2 = units.alpha * units.y(i);
    
    % Init und update von t und d nach Gleichung 5+6
    if i == 1
        EFO_t = 0;
        EFO_d = units.x_c'*units.x_c;
    else
        EFO_t = EFO_t + EFO_p(i-1)*EFO_p(i-1);
        EFO_d = EFO_d - units.y(i-1)*units.y(i-1);
        if EFO_d < 0
           EFO_d = 0; 
        end
    end
    %Gleichung 7
    EFO_s = (helperVariable1+units.alpha*EFO_d)*units.y(i);
    %Gleichung 8
    EFO_L2(i) = helperVariable1*helperVariable1 ...
        + helperVariable2 * (helperVariable1*units.y(i) + EFO_s);
    %Gleichung 9
    EFO_n2 = EFO_L2(i) - EFO_s*EFO_s*EFO_t;
    % ensure that EFO_n2 > 0
    if( EFO_n2 < 1e-100 )
        EFO_n2 = 1e-100;
    end
    EFO_n = sqrt( EFO_n2 );
    %Gleichung 12
    EFO_p(i) = (helperVariable2 - EFO_s*EFO_t) / EFO_n;
    % Berechnung vom 2 additiven Termen in Gleichung 4 ( siehe Index
    % Bezeichnung)
    units.weight(:,i) = EFO_p(i) * units.x_c;
    for i2 = 1:i
        %Gleichung 10+11
        if i2 < i 
            EFO_r(i,i2) = EFO_r(i-1,i2) + EFO_p(i-1)*EFO_q(i-1,i2);
            EFO_q(i,i2) = -(helperVariable2*units.y(i2)+EFO_s*EFO_r(i,i2)) / EFO_n;
        else
            EFO_r(i,i2) = 0;
            EFO_q(i,i2) = helperVariable1 / EFO_n;
        end
        % Gleichung 4
        units.weight(:,i) = units.weight(:,i) + EFO_q(i,i2) * V(:,i2);
    end
end
units.eigenvalue = sqrt(EFO_L2);
if ~isreal(units.eigenvalue)
        units.eigenvalue =  abs(units.eigenvalue);
end

end

