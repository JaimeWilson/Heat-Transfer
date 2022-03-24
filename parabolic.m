%% Temperature example
%% Jaime Andrés Castañeda Barbosa
%% PUC-Rio.
%% The example used pdepe solves  m = 0 for cartesian; m = 1 for cylindrical; m = 2 for spherical.
%---------------------------------------------------------------------------------------------------

function parabolic

L = 0.1;    % comprimento da barra em m
k = 200;    % condutividade termica da barra em W/m-K
rho = 10000; % densidade em kg/m^3
cp = 500   % calor especefico J/kg-K
q = 1e6;   % irradiação W/m^2
T = 10     % tempo em s

% EDP  FUNCTION PARABOLIC 


m = 0;
x = linspace(0,L,100);
t = linspace(0,T,25);

options=odeset('RelTol',1e-4,'AbsTol',1e-4,'NormControl','off','InitialStep',1e-7)

u = pdepe(m,@temppde,@tempic,@tempbc,x,t,options, k, rho, cp, q);
temperatura = u(:,:,1);


plot (x,temperatura(end,:))
xlabel('Profundidade [L]');
ylabel('Temperatura [K]');





