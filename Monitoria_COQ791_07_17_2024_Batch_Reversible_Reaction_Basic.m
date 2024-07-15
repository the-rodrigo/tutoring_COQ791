% Código para Monitoria 17/07/2024 - Rodrigo Oliveira

clear; close all; clc;

% Parâmetros
k1 = 2.5;
k2 = 0.9;

% Resolução do Sistema de EDOs

par = [k1 k2];

tspan = [0 5];
y0 = [1 0]

[t,y] = ode45(@(t,y) Batch(t,y,par), tspan, y0, par);

figure(1)
plot(t,y(:,1), 'r-', 'LineWidth', 2);
hold on
plot(t,y(:,2), 'b-', 'LineWidth', 2);
hold off
title('Evolução da Concentração', 'FontSize', 14);
xlabel('t [s]', 'FontSize', 12);
ylabel('Concentração [mol/L]', 'FontSize', 12);
legend({'Ca', 'Cb'}, 'Location', 'Best');

function dSdt = Batch(t, y, par)
    
    Ca = y(1);
    Cb = y(2);
    
    k1 = par(1);
    k2 = par(2);
    
    dSdt = zeros(2,1);
    
    dSdt(1) = -k1*Ca + k2*Cb^2;
    dSdt(2) = k1*Ca - k2*Cb^2;
    
end

