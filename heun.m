% UC: 21048 - Física Geral 
% Ano 2022/23 - EFOLIO B - Gráfico Pêndulo Gravítico - UAb
%  Aluno: 2100927 - Ivo Baptista 

% Constantes
m = 2.6*0.001;  % Massa em Kg
L = 1.0;  % Comprimento do fio em memtros
R = 30*0.01; % Raio 30 cm convertido para metros
p = 1.28 % densidade do ar em kg/m^3
g = 9.81; % Aceleração da gravidade em m/s^2

A = pi * R^2;
% Calcula o coeficiente de arrasto aerodinâmico
b = 1/2 * p * cd *A;

% Valores iniciais
theta0 = 0.05;  % Ângulo inicial em rad
w0 = 0.0;       % Velocidade angular inicial em rad/s
t0 = 0.0;       % Tempo inicial em s
h = 0.1;        % Passo de tempo em s

% Vetores para armazenar os resultados
t = t0;
theta = theta0;
w = w0;

% Loop de tempo
while (t0 < 100.0)
  % Cálculo dos valores intermediários
  k1x = w0;
  k1v = (-sign(w0) * (b*L)/m * (w0)^2 - (g / L) * theta0);
  k2x = w0 + k1v*h;  
  k2v = -sign(w0 + k1v*h) * (((b*L)/m) * (w0 + k1v*h)**2) - (g/L) * (theta0 + k1x*h); 
  
  % Atualização dos valores de θ e w
  theta0 = theta0 + ((k1x + k2x) / 2.0)*h;
  w0 = w0 + ((k1v + k2v) / 2.0)*h;

  % Atualização do tempo
  t0 = t0 + h;
  
  % Adiciona os resultados aos vetores
  t = [t t0];
  theta = [theta theta0];
  w = [w w0];
end

% Cria o gráfico
plot(t, theta, 'r', t, w, 'b')

% Adiciona legenda
legend('Theta', 'w')
% Adiciona títulos aos eixos
xlabel('tempo (s)');
ylabel('Theta (rad), w (rad/s)');
% Exibe o gráfico
hold off;
