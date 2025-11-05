% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
openfigure(2,'init');% Oeffnet Fenster '1' und '2'
format compact% Kompakte Ausgabe

%% Ausgabe auf die Konsole
% format: Siehe help format
% Text im Kommando-Fenster
disp('Sektion 1:');
disp('Das ist Pi:'); disp(pi);
fprintf('Das ist Pi: %7.4e\n',pi);% Fuer formatierte Ausgabe: C-Syntax
fprintf('Vektor:\n'); fprintf('%7.4e\n',[2;1;3]);% Vektorbeispiel
fprintf('\a\n');% Ton
%error('Programmabbruch wegen ...');% Fehlermeldung mit Abbruch

%% Input von der Konsole
disp('Sektion 2:');
x = input(' Was ist ''x'' ? ');% Zahleingabe, etwa 3.14
fprintf('x ist %d\n',x);

%% Plot mit Infos
disp('Sektion 3:');
a = 0; b = 1; N = 100; x = linspace(a,b,N)'; fx = sin(8*pi*x);
stamm_f  = (1-cos(8*pi*x))/(8*pi);
stamm_fN = cumsum(fx)/(N-1);
figure(1);
   plot(x,stamm_f,'k-','LineWidth',1); hold on;
   plot(x,stamm_fN,'r:+','LineWidth',2,'MarkerSize',6); hold off;
   title('Exakte und diskrete Stammfunktion von f','FontSize',16);
   xlabel('x/4\pi','FontSize',14); ylabel('\int_0^x f(s) ds','FontSize',14);% Kann TeX
   legend('Exakt','Numerisch','location','SE');% Positionierung auch ueber Maus moeglich
   axis tight;
drawnow
% Siehe
% 'plot' wegen Linientypen, Farben und Marker
% 'axis' wegen Konfiguration der Achsen
% Figures auch ueber Menue editierbar
% Merke: Bilder mindestens mit 'LineWidth'=2 und label mit 'FontSize'=14

%% Subplots: mxn-Schema von Unterfenstern, hier 1x2
disp('Sektion 4:');
figure(2);
subplot(1,2,1);
   plot(x,stamm_f,'k-','LineWidth',1);
   title('Exakte Stammfunktion von f','FontSize',16);
   xlabel('x/4\pi','FontSize',14);
   ylabel('\int_0^x f(s) ds','FontSize',14);
   axis tight;
subplot(1,2,2);
   plot(x,stamm_fN,'r:+','LineWidth',2);
   title('Diskrete Stammfunktion von f','FontSize',16);
   xlabel('x/4\pi','FontSize',14);
   ylabel('\Sigma_i f(x_i) h','FontSize',14);
   axis tight;
drawnow

%% Speichern als fig-file: Menue "File-save as"
disp('Sektion 5:');
% Kommando dafuer
figure(1); saveas(gcf,'bilder/bsp','fig');% gcf='getcurrentfigure'
% Wiederoeffnen mit
openfig('bilder/bsp.fig');
% Speichern als jpg,eps,...-file: Menue "File-export"
% Kommando dafuer
print -djpeg bilder/bsp.jpg;    % Aktuelles Fenster als jpg
print -f1 -depsc bilder/bsp.eps;% Fenster 1 als eps in Farbe
fprintf('Gespeichert: bsp.fig, bsp.jpg, bsp. eps im Ordner ''bilder''\n')
% Analog: eps, pdf, png

%% ENDE
