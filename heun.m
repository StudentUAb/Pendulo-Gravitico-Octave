% UC: 21048 - Física Geral
% Ano 2022/23 - EFOLIO B - Gráfico Pêndulo Gravítico - UAb
%        Aluno: 2100927 - Ivo Baptista

clc         % limpa a tela do terminal
close all   % Fecha os graficos que estão abertos
clear all   % limpa o valor das variaveis em memoria

% Constantes
m = 2.6*0.001;  % Massa em Kg
L = 1.0;  % Comprimento em m
r = 30*0.01; % Raio em m
g = 9.81; % Aceleração da gravidade em m/s^2
rho = 1.2; % Massa específica do ar em kg/m^3
cd = 0.1;  % Coeficiente de arrasto
A = pi * r^2; % Área transversal da esfera

% Calcula o coeficiente de arrasto aerodinâmico
b = 1/2 * rho * cd * A;

% Valores iniciais
theta0 = 0.05;  % Ângulo inicial em rad
w0 = 0.0;       % Velocidade angular inicial em rad/s
t0 = 0.0;       % Tempo inicial em s
h = 0.1;        % Passo de tempo em s
t = 0.0;        % Valor inicial do tempo
tend = 100.0;   % Valor final do tempo

% Numero de ciclos
ciclos = (tend - t)/h   

% Listas para armazenar os resultados
t = t0;
theta = theta0;
w = w0;

% Valores declarados como no enunciado
   k1x = w(end);
   k1v = -sign(w(end)) * (((b*L)/m) * w(end)^2) - (g / L) * theta(end);
   k2x = w(end) + k1v * h;
   k2v = -sign(w(end) + k1v *h) * (((b*L)/m )* (w(end) + k1v *h)^2) - (g / L) * (theta(end)+k1x(end)*h);

% Apresentação de Titulo
hold on;  % Faz com que todos os plots fiquem visíveis, pq se fizer 2 plots sem hold on, só aparece o último plot no gráfico
grid;     % Desenha a grelha no gráfico
title('EfolioB - Fisica - Pendulo Gravitico');   % Titulo do grafico 
axis ([t, tend, -0.15, 0.15]);     % Define os valores máximo e mínimo dos eixos X e Y tal como [Xmin, Xmax, Ymin, Ymax]

% cabeçalho da tabela de resultados
printf("  t(s) | Theta(rad/s) |  w(rad/s)    |      k1x     |      k1v     |      k2x     |      k2v    \n");
printf("-------|--------------|--------------|--------------|--------------|--------------|-------------\n");
printf("%4d    |%8d     |%8d     |%8d        |%8d      |%8d      |%8d  \n",t,theta,w,k1x,k1v,k2x,k2v);
% Loop de tempo
while t(end) < ciclos
    % Cálculo dos valores intermediários
    k1x = w(end);
    k1v = -sign(w(end)) * (((b*L)/m) * w(end)^2) - (g / L) * theta(end);
    k2x = w(end) + k1v * h;
    k2v = -sign(w(end) + k1v *h) * (((b*L)/m )* (w(end) + k1v *h)^2) - (g / L) * (theta(end)+k1x(end)*h);

    % Atualização dos valores de Theta e w
    theta = [theta, theta(end) + ((k1x + k2x) / 2.0)*h];
    w = [w, w(end) + ((k1v + k2v) / 2.0)*h];

    % Atualização do tempo
    t = [t, t(end) + h];

   printf("%4d   |%8d      |%8d     |%8d    |%8d      |%8d     |%8d\n",t(end),theta(end),w(end),k1x,k1v,k2x,k2v);
end

% fica o plot visivel
hold on;  
% Adiciona uma linha par a Theta com linha vermelha e para w com a linha azul
plot(t, theta, 'r',t, w, 'b');
% Adiciona uma legenda
legend('Theta', 'w');
% Adiciona títulos aos eixos
xlabel('tempo (s)');
ylabel('Theta (rad), w (rad/s)');
grid on;  % liga a grelha
% Exibe o gráfico
hold off;

