clc; clear; close

T = zeros(1,3);

% Raíz Número 1
T0 = -30;
T(1) = fsolve(@func,T0);

% Raíz Número 2
T0 = 50;
T(2) = fsolve(@func,T0);

% Raíz Número 3
T0 = 1.1;
T(3) = fsolve(@func,T0);

T

function f = func(T)
    f = T^3 + 13*T^2 - 280*T + 500;
end