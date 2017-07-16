% Designed to perform to detect malicious traffic running in network, this
% metric takes into account the source IPs Reference: Real-time DDoS attack 
% detection using FPGA,2017. Section 3 
function H = entropy1(Y)
Ylength = length(Y);
     for i = 1:Ylength
        count = find(Y == Y(i));
        c(i) = length(count);
        keyboard;
        prob = length(count)./Ylength;
        H(i) = - prob.*log2(prob);
     end
    keyboard
    

end
