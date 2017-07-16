% Designed for network anomaly detection, this correlation measure takes
% into account two objects X and Y. Reference: Real-time DDoS attack 
% detection using FPGA,2017. Section 3 
function correlation = NaHid(X,Y)
nx = length(X);
ny = length(Y);
correlation = zeros(1,nx);
% Check whether dimensions agree
    if nx == ny
% Calculates the correlation between the corresponding vector elements
        for i = 1:nx
            if(i == 3)
                keyboard
            end
            
            correlation(i) = (1 - 1/nx) * ((abs(X(i) - Y(i)))/... 
            (abs(abs(mean(X) - std(X)) - X(i)) + abs(abs(mean(Y) - std(Y)) - Y(i)))); 
        end
%Mean of all correlations         
        correlation = mean(correlation);
    else
        disp('Object dimensions must agree');
    end
end
% TODO: check bugs and formulation