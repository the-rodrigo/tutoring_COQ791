close all; clear; clc;

D = 10;
L = 15;
c0 = 12;
cs = 5;

nodes = 200;
dx = L/nodes;

par = [D, dx, nodes, cs];

tspan = linspace(0,1,200);
y0 = ones(nodes,1)*c0;

[t,y] = ode45(@(t,y) Conc(t,y,par), tspan, y0);

figure(1)
plot(t, y(:,length(y)), 'r-', 'LineWidth', 2);
title('Evolução da Concentração', 'FontSize', 14);
xlabel('t [h]', 'FontSize', 12);
ylabel('C [kgmol/m^3]', 'FontSize', 12);

function dcdt = Conc(t, y, par)
    D = par(1);
    dx = par(2);
    nodes = par(3);
    cs = par(4);
    
    dcdt = zeros(nodes,1);
    dcdt(1) = (D/(dx^2))*((2/3)*y(2) - (2/3)*y(1) - (2/3)*cs*dx);
    for i = 2:nodes-1
        dcdt(i) = (D/(dx^2))*(y(i+1) - 2*y(i) + y(i-1));
    end
    dcdt(nodes) = (D/(dx^2))*(cs + y(nodes-1) - 2*y(nodes));
end
