% Código para Monitoria 17/07/2024 - Rodrigo Oliveira

clear; close all; clc;

% Resolução do Sistema de EDOs

tspan = linspace(0,20,100);
x10 = linspace(-3,3,200);
x20 = linspace(-3,3,200);

figure(1)
hold on

for i=1:length(x10)
    for j=1:length(x20)
        y0 = [x10(i) x20(j)];
        [t,y] = ode45(@(t,y) Duffing(t,y), tspan, y0);
        
        if y(end,1) > 0
            plot(x10(i),x20(j),'ro')
        else
            plot(x10(i),x20(j),'bo')
        end
    end
end

plot(0, 0,'wo')
plot(-1, 0,'wo')
plot(1, 0,'wo')

hold off

function dSdt = Duffing(t, y)
    
    x1 = y(1);
    x2 = y(2);
    
    dSdt = zeros(2,1);
    
    dSdt(1) = x2;
    dSdt(2) = x1 - x2 - x1^3;
    
end

