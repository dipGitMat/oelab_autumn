%% compute undamped response and compare with response for a given damping ratio and natural frequency %%
%% S De Chowdhury %%
%% OELAB IIT KGP OENA %%
%%%%

%%
% initial commit on 05.09.2022 %%
%%%%

%% clear everything from command window and workspace %%
clc;
clear all;

% define damping ratio 
zeta = 0.06;

% define natural frequency 
omega_n = 1.0;

% define number of data points along time scale
nDataTime = 100;

% compute phase 
psi = atan(sqrt(1-zeta^2)/zeta);

% compute time independent part of the amplitude 
hatX = 1/sqrt(1-zeta^2);

% compute damped natural frequency
omega_d = omega_n*sqrt(1-zeta^2);

% construct the time scale, first arguement is start point and the second
% arguemnet is the end point.

time = linspace(0,20,nDataTime);



% compute damped response 
dampedRes = (hatX*exp(-zeta*omega_n.*time).*sin(omega_d.*time + psi)).';

% compute undamped response 
natRes = sin(omega_n.*time).';

% non-dimensionalize time scale
time = omega_n*time;

% plot 

plot(time,dampedRes);
hold on;
plot(time, natRes,'--');


xlabel('$\omega_n t$','interpreter','latex')
ylabel('$x(t)/X_0$','interpreter','latex')
    
% position figure window
x0=400;
y0=450;
width=1000;
height=400;
set(gcf,'position',[x0,y0,width,height])





