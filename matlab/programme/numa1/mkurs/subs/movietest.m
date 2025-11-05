clear all; clf;
[x,y] = meshgrid(-2:0.06:2,-2:0.06:2);
z = sin(2*pi*x).*sin(2*pi*y).*exp(-x.^2-y.^2);
figure(1); clf; hold on
   surfc(x,y,z); shading interp;
   axis([-2 2 -2 2 -2 2]);
%
n = 20; dt = 0.1;
M = moviein(n);% Initialisieren
set(gca,'NextPlot','ReplaceChildren');% Achse fixieren
wb = waitbar(0,' Achtung Aufnahme laeuft ...');% Waitbar
for i=1:n
   t  = i*dt;
   zt = z*sin(pi*t);
   surfc(x,y,zt); shading interp;
   M(:,i) = getframe;% Bild abspeichern
   waitbar(i/n,wb);% Fortschritt anzeigen
end
close(wb);% waitbar schliessen