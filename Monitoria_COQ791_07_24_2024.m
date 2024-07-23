clc; clear; close

x = zeros(1,3);

% Raíz Número 1
x0 = 0.1;
x(1) = fsolve(@func,x0);

% Raíz Número 2
x0 = -0.1;
x(2) = fsolve(@func,x0);

% Raíz Número 3
x0 = 1.1;
x(3) = fsolve(@func,x0);

x

function f = func(x)
    f = 10*x^3 - 11*x^2 - 2*x + 3;
end