close all;
clear all;
clc; 

x = 0:1e-5:400e-3;

v = zeros(1,length(x));
% Function for VoIP
for j=1:length(x)
    if x(j) <= 5e-3
        v(j) = x(j);
    else
        v(j) = x(j)^2.9 - 5^2.9 + 5;
    end;
end;

figure;
plot(x,v,'k');
grid on;

% % Function for Streaming 
s = zeros(1,length(x));
for j=1:length(x)
    if x(j) <= 50e-3
        s(j) = x(j)^1.25;
    else
        s(j) = x(j) - 50 + 50^1.25;
    end;
end;

figure;
plot(x,s,'k');
grid on;

% % Function for Best-Effort
% % Becomes PF
% 
% be = zeros(1,length(x));
% for j=1:length(x)
%     if x(j) <= 100e-3
%         be(j) = x(j)^0.5;
%     else
%         be(j) = 100^0.5;
%     end;
% end;
% 
% figure;
% plot(x,be,'k');
% grid on;
% % be = x^0.5;
% % be1 = 100^0.5;
