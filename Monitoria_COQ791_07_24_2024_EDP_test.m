close all; clear; clc;

D = 10;
L = 15;
c0 = 12;
cs = 5;

nodes = 10;
dx = L/nodes;

par = [D, dx, nodes, cs];

tspan = linspace(0,1,50);
y0 = ones(10,1)*c0;

[t,y] = ode45(@(t,y) SMB(t,y,par), tspan, y0, par);

figure(1)
plot(t,y(:,1), 'r-', 'LineWidth', 2);
title('Evolução da Concentração', 'FontSize', 14);
xlabel('t [h]', 'FontSize', 12);
ylabel('C [kgmol/m^3]', 'FontSize', 12);

function dcdt = SMB(t, y, par)
    D = par(1);
    dx = par(2);
    nodes = par(3);
    cs = par(4);
    
    dcdt(1) = (D/(dx^2))*((2/3)*y(2) - (2/3)*y(1) - (2/3)*cs*dx);
    for i=2:9:1
        dcdt(i) = (D/(dx^2))*(y(i+1) - 2*y(i) + y(i-1));
    end
    dcdt(10) = (D/(dx^2))*(cs + y(7) - 2*y(8));
    dcdt = dcdt';
end
