% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
figure(1);% Oeffnet Fenster '1'
format compact% Kompakte Ausgabe

%% Flaechen

%% Kugel
disp('Sektion 1:');
[x,y,z] = sphere(25);
figure(1); clf
   surf(x,y,z); axis equal;
   h = light('position',[0 2 2]);
   lighting phong; material shiny; shading interp;
%
%% Zylinderflaechen
disp('Sektion 2:');
r = [0;1+0.5*sin(2*pi*linspace(0,1,100)')];
[x,y,z] = cylinder(r);
figure(1); clf
   surf(x,y,z); axis equal;
   title('Schicke Vase');
%
%% "Klippen" mit 'nan' (nutzt Zylinderflaeche)
disp('Sektion 3:');
ind = find(x>0.5 & 0.2<z & z<0.5);
z(ind) = nan;
   surf(x,y,z);
   title('Schicke Vase kaputt');

%% 3D-Slices
disp('Sektion 4:');
[x,y,z] = meshgrid(-2:0.2:2, -2:0.2:2, -2:0.2:2);
u = x.*exp(-x.^2-y.^2-z.^2);
figure(1); clf
   slice(x,y,z,u,[-0.8, 0.8],[],-0.2);
   slice(x,y,z,u,[-0.8, 0.8],0,-0.2);
% Bem: mehr Dim's: ndgrid.
% Achtung: Unterschied in ersten beiden Variablen.

%% "Punktwolke"
disp('Sektion 5:');
clear;
load seamount;
xiv = linspace(min(x),max(x),70);
yiv = linspace(min(y),max(y),70);
[xq,yq] = meshgrid(xiv,yiv);
% Interpolation
[xi,yi,zi] = griddata(x,y,z,xq,yq);
figure(1); clf; hold on;
   plot3(x,y,z,'y.');
   axis tight;
   colormap(autumn);
   contour(xi,yi,zi);
   surf(xi,yi,zi);
   hold off;

%% Images
%
%% Clown
disp('Sektion 6:');
load clown
image(X)
colormap(map)
axis off
%
%% Imagefile erzeugen
disp('Sektion 7:');
clear all;
[x,y] = meshgrid(-2:0.06:2,-2:0.06:2);
z = sin(2*pi*x).*sin(2*pi*y).*exp(-x.^2-y.^2);
figure(1); clf;
   surfc(x,y,z); shading flat;
   view(-20,40);
   axis([-2 2 -2 2 -2 2]);
%
ghandle = gcf;
[Y,map] = getframe(ghandle);
figure(2); clf;
   colormap(map);
   image(Y); axis off;
print('-depsc2','bilder/bild');

%% Strukturen

%% Dynamisch:
disp('Sektion 8:');
tria.type = 'triangle' %                * (1,1)
tria.nodes = [1,2,3]   %              / |
tria.coord = [0,0; 1,0; 1,1] % (0,0) *--* (1,0)
tria, tria.coord
% Aequivalent:
tria = struct('type','triangle','nodes',[1,2,3],'coord',[0,0; 1,0; 1,1])

%% Felder von Strukturen
disp('Sektion 9:');
tria(2).type = 'rectangle' %           (1,1) *--* (2,1)
tria(2).nodes = [2,4,5,3]  %                 |  |
tria(2).coord = [1,0; 2,0; 2,1; 1,1] % (1,0) *--* (2,0)
% Bemerkung: tria(1) und tria(2) passen zusammen !
tria, tria(2), tria.coord

%% Fieldnames
disp('Sektion 10:');
ball.center = [0,0], ball.radius = 1,
fieldnames(ball)% cell-Feld der ball-Komponenten
ball = setfield(ball,'radius',2)% <=> ball.radius=2, but slower

%% isempty, isnan, is...
disp('Sektion 11:');
a = []; isempty(a)
a = [1,0]; isempty(a)
isnan([pi NaN Inf 1])
isinf([pi NaN -Inf 1])
isstruct(tria)

%% Cells (struct ohne identifier)
disp('Sektion 12:');
A = {'triangle',[1 2 3],4}
B = {A,5}
A{1}, B{1}
A{1}(2), A{2}(:), A{2}(2)
celldisp(B)

%% Strings
disp('Sektion 13:');
home
lower('AbC'), upper('AbC')
ischar('abc'), ischar(4)
chlist = {'maximum','max','umax'}
strncmp('max',chlist,3)% Was beginnt mit 'max'?
strcmp('max',chlist)% Was ist genau 'max'?
char(chlist)% cell-array nach char-array
% String-Vergleich. ACHTUNG, haeufiger Fehler!
s = 'a'; t = 'aa';
if strcmp(a,b), 's=t', end% Richtig
if s==t, 's=t', end% FEHLER (vergleichen Sie mit s = 'a'; t = 'ab'; !)

%% ENDE
