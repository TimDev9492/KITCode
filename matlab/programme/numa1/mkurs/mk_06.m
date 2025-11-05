% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
openfigure(2,'init');% Oeffnet Fenster '1' und '2'
format compact% Kompakte Ausgabe

%% Ziel: Funktion auf regelmaessigem Gitter
% Erzeuge Punktmenge:
%   [ 1,1 2,1 3,1 ]
%   [ 1,2 2,2 3,2 ]
%   [ 1,3 2,3 3,3 ]
disp('Sektion 1:');
[x,y] = meshgrid(1:4);% Entspricht 'meshgrid(1:4,1:4)';
figure(1); clf
   plot(x,y,'ro');

%% Darstellung einer Funktion
disp('Sektion 2:');
[x,y] = meshgrid(-2:0.06:2,-2:0.06:2);
z = sin(2*pi*x).*sin(2*pi*y).*exp(-x.^2-y.^2);
figure(1); clf
   plot(z);% Nicht richtig! Plottet Kurven
figure(2); clf
   plot3(x,y,z,'k');% Flaeche via Linien

%% Verschiedene Darstellungsarten
%%
disp('Sektion 3:');
figure(1); clf
   waterfall(x,y,z);%
   pause% Press return to continue
   mesh(x,y,z);% Gitterflaeche
   pause
   meshz(x,y,z);% mit "Vorhang"
%%
disp('Sektion 4:');
figure(1); clf
   surf(x,y,z);% Flaechenelemente
   pause
   shading flat;% Flaechenwirkungen
   pause
   shading interp;
   pause
   shading faceted;
   pause
   surfl(x,y,z);% Mit Beleuchtung
%%
disp('Sektion 5:');
figure(2); clf
   contour(x,y,z);% Contourplot-Linien
   pause
   c = contour(x,y,z,[-0.25 0 0.25]); clabel(c);
   pause
   contour3(x,y,z);% Contour-Linien in 3d
   pause
   contourf(x,y,z);% Contourplot-Flaechen
   pause
   surfc(x,y,z);% Surf+Contour
   pause
   meshc(x,y,z);% Mesh+Contour
   pause
   imagesc(z);% Farbe nach Skalierung bzw. Graustufenbild
   pause
   pcolor(x,y,z);
   shading interp;

%% Mit Farbcodierung, zB. mittels mittlerer Kruemmung
disp('Sektion 6:');
figure(1); clf
   c = del2(z);% c enthaelt Farbwerte !
   mesh(x,y,z,c);
   pause
   colormap(gray);% Vordefinierte colormaps gibt es reichlich
   surf(x,y,z);
   colorbar;
   pause
   % Punkte auf einer Flaeche
   ind = 0.2<z & z<0.4; hold on;
   plot3(x(ind),y(ind),z(ind),'r.'); hold off;
   pause
   view(90,0);% Seitenblick
   pause
   view(0,90);% Aufsicht

%% Pfeile
disp('Sektion 7:');
dy = diff(x(1,1:2));
dx = diff(y(1:2,1));
[px,py] = gradient(z,dx,dy);
figure(2); clf; hold on
   quiver(x,y,px,py,1,'b');
   pause
   contour(x,y,z);
   surf(x,y,z);

%% Movie
%%--- File movietest.m ---
% clear all; clf;
% [x,y] = meshgrid(-2:0.06:2,-2:0.06:2);
% z = sin(2*pi*x).*sin(2*pi*y).*exp(-x.^2-y.^2);
% figure(1); clf; hold on
%    surfc(x,y,z); shading interp;
%    axis([-2 2 -2 2 -2 2]);
% %
% n = 20; dt = 0.1;
% M = moviein(n);% Initialisieren
% set(gca,'NextPlot','ReplaceChildren');% Achse fixieren
% wb = waitbar(0,' Achtung Aufnahme laeuft ...');% Waitbar
% for i=1:n
%    t  = i*dt;
%    zt = z*sin(pi*t);
%    surfc(x,y,zt); shading interp;
%    M(:,i) = getframe;% Bild abspeichern
%    waitbar(i/n,wb);% Fortschritt anzeigen
% end
% close(wb);% waitbar schliessen
% --- EOF ---
%% --- Workspace ---
disp('Sektion 8:');
figure(gcf); movietest;% Aufnahme
figure(gcf); movie(M,2);% Abspielen (2-mal)

%% Kurven im Raum
disp('Sektion 9:');
z = (0:0.001:1)';
x = exp(0.9*z).*sin(10*z);
y = exp(0.1*z).*sin(20*z);
figure(1); clf;
   plot3(x,y,z);
   pause
   comet3(x,y,z);% Animation. Code: type comet3
   pause

%% ENDE
