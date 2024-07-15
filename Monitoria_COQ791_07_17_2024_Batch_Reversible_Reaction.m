% Código para Monitoria 17/07/2024 - Rodrigo Oliveira

clear; close all; clc;

% Parâmetros
k1 = 2.5;
k2 = 0.9;

% Resolução do Sistema de EDOs

par = [k1 k2];

tspan = [0 5];
Ca0 = linspace(0,1,50);
Cb0 = linspace(0,1,50);

CaEE = [];
CbEE = [];
marker = [];

figure(1)
hold on

for i=1:length(Ca0)
    for j=1:length(Cb0)
        y0 = [Ca0(i) Cb0(j)];
        [t,y] = ode45(@(t,y) Batch(t,y,par), tspan, y0, par);

        CaEE(end+1) = Ca0(i);
        CbEE(end+1) = Cb0(i);
        
        if CbEE(end) >= 0.5
            plot(Ca0(i),Cb0(j),'ro')
        else
            plot(Ca0(i),Cb0(j),'bo')
        end
    end
end

hold off

% figure(1)
% plot(t,y(:,1), 'r-', 'LineWidth', 2);
% hold on
% plot(t,y(:,2), 'b-', 'LineWidth', 2);
% hold off
% title('Evolução da Concentração', 'FontSize', 14);
% xlabel('t [s]', 'FontSize', 12);
% ylabel('Concentração [mol/L]', 'FontSize', 12);
% legend({'Ca', 'Cb'}, 'Location', 'Best');

function dSdt = Batch(t, y, par)
    
    Ca = y(1);
    Cb = y(2);
    
    k1 = par(1);
    k2 = par(2);
    
    dSdt = zeros(2,1);
    
    dSdt(1) = -k1*Ca + k2*Cb;
    dSdt(2) = k1*Ca - k2*Cb;
    
end

