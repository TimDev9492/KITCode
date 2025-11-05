% Musterlsung Programmierblatt 1, Aufgabe 1
%% Matlab vorbereiten
% Downloade "programme" von Ilias, unzipen
% ffne in matlab den Ordner "programme/numa1/aufgaben"
% Kopiere Ordner "BlattX_Vorlage" und benenne diesen "Blatt1"
% ffne und starte darin das file "openfileset.m" -> fenster ffnen sich
% Starte "startup.m" -> wichtige pfade sind gesetzt

%% Vorbereiten
clear all; % Loescht den Workspace
close all; % Schliesst alle Fenster
format compact % Kompakte Ausgabe
disp('Workspace cleared')
%% Aufgabe 1
% Konsole oben rechts "undocken" und folgendes in Konsole eingeben
1+3*2-1/2*4 % ENTER ergibt output 5
%% Aufgabe 2 
a = 5
b = 12
a*b
a/b
%% Aufgabe 3
x = [1;2;3]; % Spaltenvektor
y = [4;5;6];
x.*y % komponentenweise
x./y 
%% Aufgabe 4
B = ones(4,3)
%% Aufgabe 5
A = [-2,1,0;1,-2,1;0,1,-2];
b = ones(3,1);
x = A\b % =[-1.5;-2;-1.5]
%% Aufgabe 6
a = 0;
b = 1;
h = 0.1;
format short;
x1 = a:h:b
n = (b - a)/h + 1;   % Anzahl der Punkte
x2 = linspace(a, b, n)
% class(x1) % Ist keine Liste sondern Instanz der Klasse 'double' 
%% Aufgabe 7
% Darstellung von f(x) = x^2 und g(x) = sin(4*pi*x) auf [0, 2*pi]
x = linspace(0, 2*pi, 500);
f = x.^2;
g = sin(4*pi*x);

% Plot
figure
plot(x, f, 'b-', 'LineWidth', 1.5);
hold on
plot(x, g, 'r-', 'LineWidth', 1.5);
hold off
xlabel('x', 'FontSize', 12)
ylabel('Funktionswert', 'FontSize', 12)
title('f(x) = x^2 und g(x) = sin(4\pi x)', 'FontSize', 13)
legend('f(x) = x^2', 'g(x) = sin(4\pi x)', 'Location', 'northwest')
grid on
xlim([0 2*pi])
