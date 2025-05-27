clear;
clc;

% INGRESO DE DATOS
EX = input('ESFUERZO EN X: ');
EY = input('ESFUERZO EN Y: ');
ET = input('ESFUERZO CORTANTE: ');

% CÍRCULO PRINCIPAL
EP = (EX + EY) / 2;                 % Centro
EMAX = sqrt(((EX - EY)/2)^2 + ET^2); % Radio
EC = sqrt(((EX - EY)/2)^2 + ET^2);   % Radio también
TETA = 0.5 * atan(2 * ET / (EX - EY)); % Ángulo de rotación

fprintf('\nCIRCULO PRINCIPAL:\n');
fprintf('CENTRO: %.2f\n', EP);
fprintf('RADIO: %.2f\n', EMAX);
fprintf('ANGULO: %.2f grados\n', TETA * 180 / pi);

% ESFUERZOS PRINCIPALES
SIGMA1 = EP + EMAX;
SIGMA2 = EP - EMAX;
TAUMAX = EMAX;

fprintf('\nESFUERZOS PRINCIPALES:\n');
fprintf('ESFUERZO NORMAL MÁXIMO (σ1): %.2f\n', SIGMA1);
fprintf('ESFUERZO NORMAL MÍNIMO (σ2): %.2f\n', SIGMA2);
fprintf('ESFUERZO CORTANTE MÁXIMO: %.2f\n', TAUMAX);

% SEGUNDO CÍRCULO
ang2 = input('\nÁNGULO PARA SEGUNDA ROTACIÓN (en grados): ');
ang2 = deg2rad(2 * ang2);  % Ángulo doble y en radianes
EX2 = EP + EMAX * cos(ang2);
EY2 = EP - EMAX * cos(ang2);
EC2 = EMAX * sin(ang2);

fprintf('\nRESULTADOS PARA ANGULO %.2f°:\n', rad2deg(ang2)/2);
fprintf('ESFUERZO EN X: %.2f\n', EX2);
fprintf('ESFUERZO EN Y: %.2f\n', EY2);
fprintf('ESFUERZO CORTANTE: %.2f\n', EC2);

% TERCER CÍRCULO
ang3 = input('\nÁNGULO PARA TERCERA ROTACIÓN (en grados): ');
ang3 = deg2rad(2 * ang3);
EX3 = EP + EMAX * cos(ang3);
EY3 = EP - EMAX * cos(ang3);
EC3 = EMAX * sin(ang3);

fprintf('\nRESULTADOS PARA ANGULO %.2f°:\n', rad2deg(ang3)/2);
fprintf('ESFUERZO EN X: %.2f\n', EX3);
fprintf('ESFUERZO EN Y: %.2f\n', EY3);
fprintf('ESFUERZO CORTANTE: %.2f\n', EC3);

% CUARTO CÍRCULO
ang4 = input('\nÁNGULO PARA CUARTA ROTACIÓN (en grados): ');
ang4 = deg2rad(2 * ang4);
EX4 = EP + EMAX * cos(ang4);
EY4 = EP - EMAX * cos(ang4);
EC4 = EMAX * sin(ang4);

fprintf('\nRESULTADOS PARA ANGULO %.2f°:\n', rad2deg(ang4)/2);
fprintf('ESFUERZO EN X: %.2f\n', EX4);
fprintf('ESFUERZO EN Y: %.2f\n', EY4);
fprintf('ESFUERZO CORTANTE: %.2f\n', EC4);

% ===== GRAFICAR CÍRCULO DE MOHR Y ESTADOS TRANSFORMADOS =====
figure;
theta = linspace(0, 2*pi, 360);
x_circle = EP + EMAX * cos(theta);
y_circle = EMAX * sin(theta);

plot(x_circle, y_circle, 'b-', 'LineWidth', 2); hold on;
axis equal;
grid on;
xlabel('Esfuerzo Normal \sigma');
ylabel('Esfuerzo Cortante \tau');
title('Círculo de Mohr con Transformaciones');

% Centro
plot(EP, 0, 'ko', 'MarkerFaceColor', 'k');

% Estado inicial
plot([EX EY], [-ET ET], 'ro-', 'LineWidth', 1.5);
text(EX, -ET, ' Punto X1', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
text(EY, ET, ' Punto Y1', 'VerticalAlignment','top', 'HorizontalAlignment','right');

% Segundo estado
plot([EX2 EY2], [-EC2 EC2], 'go-', 'LineWidth', 1.5);
text(EX2, -EC2, ' Punto X2', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
text(EY2, EC2, ' Punto Y2', 'VerticalAlignment','top', 'HorizontalAlignment','right');

% Tercer estado
plot([EX3 EY3], [-EC3 EC3], 'mo-', 'LineWidth', 1.5);
text(EX3, -EC3, ' Punto X3', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
text(EY3, EC3, ' Punto Y3', 'VerticalAlignment','top', 'HorizontalAlignment','right');

% Cuarto estado
plot([EX4 EY4], [-EC4 EC4], 'co-', 'LineWidth', 1.5);
text(EX4, -EC4, ' Punto X4', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
text(EY4, EC4, ' Punto Y4', 'VerticalAlignment','top', 'HorizontalAlignment','right');
