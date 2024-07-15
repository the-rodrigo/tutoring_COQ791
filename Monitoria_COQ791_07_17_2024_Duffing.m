% Código para Monitoria 17/07/2024 - Rodrigo Oliveira

clear; close all; clc;

% Resolução do Sistema de EDOs

tspan = linspace(0,-10,100);

y0 = [0.001 0];
[t,y] = ode45(@(t,y) Batch(t,y), tspan, y0);

figure(2)
plot(y(:,1), y(:,2), 'k--');

y0 = [-0.001 0];
[t,y] = ode45(@(t,y) Batch(t,y), tspan, y0);

hold on
plot(y(:,1), y(:,2), 'k--');

tspan = linspace(0,10,100);
y0 = [-6 -10];
[t,y] = ode45(@(t,y) Batch(t,y), tspan, y0);
plot(y(:,1), y(:,2), 'r-');

plot(0,0,'gx','LineWidth', 2);
plot(-1,0,'gx','LineWidth', 2);
plot(1,0,'gx','LineWidth', 2);
hold off
title('Oscilador de Duffing', 'FontSize', 14);
xlabel('x1', 'FontSize', 12);
ylabel('x2', 'FontSize', 12);

function dSdt = Batch(t, y)
    
    x1 = y(1);
    x2 = y(2);
    
    dSdt = zeros(2,1);
    
    dSdt(1) = x2;
    dSdt(2) = x1 - x2 - x1^3;
    
end

