clc;
clear all;

zeta = 0.06;
omega_n = 1.0;
nDataTime = 100;


psi = atan(sqrt(1-zeta^2)/zeta);
hatX = 1/sqrt(1-zeta^2);


omega_d = omega_n*sqrt(1-zeta^2);


time = linspace(0,20,nDataTime);




dampedRes = (hatX*exp(-zeta*omega_n.*time).*sin(omega_d.*time + psi)).';
natRes = sin(omega_n.*time).';


time = omega_n*time;

plot(time,dampedRes);
hold on;
plot(time, natRes,'--');


xlabel('$\omega_n t$','interpreter','latex')
ylabel('$x(t)/X_0$','interpreter','latex')
    
x0=400;
y0=450;
width=1000;
height=400;
set(gcf,'position',[x0,y0,width,height])





