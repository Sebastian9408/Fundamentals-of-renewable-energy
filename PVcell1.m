clear, clc, close all
% Fundamentals of a PV cell, irradiance set.
% Sebastian Pinilla
T = 300;                  % Temperature 300K
n = 1.1;                  % Ideality factor 
a = (8.617e-5)^-1;        % Value of q/K (K/V)
k = 8.617e-5;             % Constant  
I00 = 17.9/1000;          % Constant (A/K^3)
Eg = 1.114;               % Energy bandgap of silicon eV
I0 = (I00)*(T^3)*(exp(-Eg/(k*T)));
j = 1;
for G = 200:200:1000      % Irradiance intensity W/m^2
    Iph(j)  = G*0.2;      % Current (A)
    j = j+1;       
end

for i = 1:5
    u = 0:0.01:1;        % Voltage (volts)
    I = (Iph(i))-(I0*((exp((a*u)/(n*T)))-1)); % Current (A)
    % Conditions of the graph 
    plot(u,I,'linewidth', 2)
    axis([0 1.2 0 220])
    xlabel('Voltage, U, Volts')
    ylabel('Current, I, Ampere')
    title('I(U) Characteristic curve')
    hold on
end

grid on
legend('200 W/m^2','400 W/m^2','600 W/m^2','800 W/m^2','1000 W/m^2')










