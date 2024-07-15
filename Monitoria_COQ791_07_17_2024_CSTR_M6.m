% Código para Monitoria 17/07/2024 - Rodrigo Oliveira

clear; close all; clc;

% Parâmetros
q = 0.1;
v = 0.1;
k0 = 9703*3600;
deltaH_neg = 5960;
E = 11843;
Cp = 500;
hA = 15;
R = 1.987;
Tcf = 298.5;
Tf = 298.15;
Cf = 10;

% Resolução do Sistema de EDOs

par = [q v k0 deltaH_neg E Cp hA R Tcf Tf Cf];

tspan = [0 1];
y0 = [0 300];

[t,y] = ode45(@(t,y) CSTR(t,y,par), tspan, y0, par);

figure(1)
plot(t,y(:,1), 'r-', 'LineWidth', 2);
title('Evolução da Concentração', 'FontSize', 14);
xlabel('t [h]', 'FontSize', 12);
ylabel('C [kgmol/m^3]', 'FontSize', 12);

figure(2)
plot(t,y(:,2),'b', 'LineWidth', 2);
title('Evolução da Temperatura', 'FontSize', 14);
xlabel('t [h]', 'FontSize', 12);
ylabel('T [K]', 'FontSize', 12);

function dSdt = CSTR(t, y, par)
    
    C = y(1);
    T = y(2);
    
    dSdt = zeros(2,1);
    
    dSdt(1) = par(1) * par(11) / par(2) - C * (par(3) * exp(-par(5) / (par(8) * T)) + par(1) / par(2));
    dSdt(2) = par(1) * par(10) / par(2) + par(4) * par(3) * C * exp(-par(5) / (par(8) * T)) / par(6) + par(7) * par(9) / (par(2) * par(6)) - T * (par(1) / par(2) + par(7) / (par(2) * par(6)));

end

