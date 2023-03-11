clear, clc, close all;
% Fundamentals of a PV cell, temperatures set.
% Sebastian Pinilla
G = 1000;                 % Irradiance intensity W/m^2
Iph = G*0.2;              % Photocurrent (A)
n = 1.1;                  % Ideality factor 
a = (8.617e-5)^-1;        % Value of q/K (K/V)
k = 8.617e-5;             % Constant  
I00 = 17.9/1000;          % Constant (A/K^3)
Eg = 1.114;               % Energy bandgap of silicon eV
T = 293.15:10:333.15;     % Temperature vector
U = 0:0.01:1.2;           % Voltage vector
P = zeros(5,length(U));   % Power matrix
I = zeros(5,length(U));   % Current matrix

for i=1:5      
    I0(i) = I00 * (T(i)^3) * exp(-Eg/(k * T(i)));
    for u=1:length(U)
      I(i,u) = Iph - (I0(i) * (exp((a * U(u)) / (n*T(i)) ) - 1));
      P(i,u) = U(u)*I(i,u);
    % P/I(i,u) takes the calculated values from the equations and 
    % collect it in the matrix
    end
    [Pmpp(i),Umpp(i),Impp(i),Eff(i),Isc(i),Voc(i),FF(i)] = IUanalizer(P(i,:),U,I(i,:),G,n,T(i),Iph,I0(i));
    
end
T = T - 273.15;          % Conversion of the temperatures to celcius grades °C
plot(U,I,'linewidth', 2) % Plot of the I(U)
axis([0 1.1 0 220])
xlabel('Voltage, U, Volts')
ylabel('Current, I, Ampere')
title('I(U) Characteristic curve for different temperatures')
legend('T=20°C','T=30°C','T=40°C','T=50°C','T=60°C','Location','best')
hold on
grid on
figure 
plot(T,Voc,'green','linewidth', 2) %Plot of Voc against T
axis([15 65 0.965 1.015])
xlabel('Temperature, T, °C')
ylabel('Open Circuit Voltage, Voc, Volts')
title('Open Circuit Voltage against Temperature')
grid on
figure 
plot(T,Isc,'magenta','linewidth', 2) %Plot of Isc against T
axis([15 65 199 201])
xlabel('Temperature, T, °C')
ylabel('Short Circuit Current, Isc, Ampere')
title('Short Circuit Current against Temperature')
grid on
figure
plot(T,Eff,'black','linewidth', 2) %Plot of Eff against T
axis([15 65 16.6 17.8])
xlabel('Temperature, T, °C')
ylabel('Efficiency, Eff, %')
title('Efficiency against Temperature')
grid on



