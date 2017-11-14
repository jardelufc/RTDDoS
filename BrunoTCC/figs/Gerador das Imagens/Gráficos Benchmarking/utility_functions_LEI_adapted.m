close all;
clear all;
clc;

req_rt = 20e-3; % Requirement for RT = 50ms
x_rt = 0:1e-5:2*req_rt;
sigma_rt = 450;
% req_rt = 50e-3; % Requirement for RT = 50ms
% x_rt = 0:1e-5:2*req_rt;
% sigma_rt = 1.5;

req_nrt = 200e-3; % Requirement for RT = 50ms
x_nrt = 0:1e-5:2*req_nrt;
alpha_nrt = 5;
c_nrt = 0.5;
% req_nrt = 150e-3; % Requirement for RT = 50ms
% x_nrt = 0:1e-5:2*req_nrt;
% alpha_nrt = 0.1;
% c_nrt = 0.5;


%% Utility Function RT
figure;
utility_rt = 1-(1./(1+exp((-1)*sigma_rt*(x_nrt-req_rt))));
plot(x_nrt,utility_rt,'k');
grid on;    
% xlabel('Normalized Metric');
% ylabel('Utility-Based Service Weight');
axis([0 max(x_nrt) 0 1]);

%% Utility Function NRT
hold on;
utility_nrt = 1-(c_nrt.*exp(alpha_nrt*(x_nrt-req_nrt)));
plot(x_nrt,utility_nrt,'b');
grid on; 
% xlabel('Normalized Metric');
% ylabel('Utility-Based Service Weight');
axis([0 max(x_nrt) 0 1]);

%% Marginal Utility Function RT
figure;
marginal_rt = (0.375/112.5)*sigma_rt*(exp(-sigma_rt*(x_nrt - req_rt)))./((1 + exp(-sigma_rt*(x_nrt - req_rt))).^2);
plot(x_nrt,marginal_rt,'b');
grid on;
% ylabel('Marginal Utily Function');
% xlabel('Normalized QoS Metric');
% 
%% Marginal Utility Function NRT
hold on;
%marginal_nrt = (c_nrt*exp(alpha_nrt*(x_nrt-req_nrt)));
marginal_nrt = (0.03033/1.016)*(alpha_nrt*c_nrt*exp(alpha_nrt*(x_nrt-req_nrt)));
plot(x_nrt,marginal_nrt,'k');
grid on;
% ylabel('Marginal Utily Function');
% xlabel('Normalized QoS Metric');