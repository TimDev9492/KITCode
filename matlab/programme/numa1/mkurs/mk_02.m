% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
figure(1);% Oeffnet Fenster '1'
format compact% Kompakte Ausgabe

%% Funktionen auf Matrizen
% Komponentenweise vs. Matrixoperation
disp('Sektion 1:');
A = [0.5,1;0.7,1.5]*pi; sin(A)
A = [1,1;0,2]; A.^2, A^2
A = eye(3); exp(A), expm(A)

%% Einfache Funktionsplots
disp('Sektion 2:');
N = 10;
x = linspace(0,1,N)'*pi;
fx = sin(x)
plot(x,fx)
fx = exp(x)-1-x; plot(x,fx)
fx = 1./(1+x); plot(x,fx)

%% Elementare Vektor/Matrix-Funktionen, einfacher Plot
% Bestimme max{f(x):a<=x<=b} (max -- min)
disp('Sektion 3:');
a = 0; b = 1; N = 100;
x = linspace(a,b,N)'; fx = sin(4*pi*x); plot(x,fx);
[fm,im] = max(fx);% Analog 'min'
xm = x(im), fm
% Absolutbetrag (abs)
gx = abs(fx);
figure(1);
   plot(x,gx);

%% Diag
disp('Sektion 4:');
A = magic(4)% 'Magisches Quadrat'
D = diag(A)
v = (1:4)';
diag(v), diag(v,1), diag(v,-1)
D = diag(diag(A))

%% "Gleichrichter"  max -- find
disp('Sektion 5:');
gx = max(fx,0); plot(x,gx);% Alternative: max
gx = fx; gx(find(fx<0))= 0; plot(x,gx);% Alter Befehl: find
gx = fx; gx(fx<0)= 0; plot(x,gx);% Schnellere Alternative: 'logical indexing'

%% sum -- cumsum
% Integral ueber [0,1] von f (sum)
disp('Sektion 6:');
integ_f = sum(fx(2:end))/(N-1)
% Diskrete Stammfunktion (cumsum)
stamm_f = (1-cos(4*pi*x))/(4*pi);
stamm_fN = cumsum(fx)/(N-1); plot(x,stamm_fN,x,stamm_f);
fehler = max(abs(stamm_f-stamm_fN))/max(abs(stamm_f))
% Bemerkungen:
% - Berechnen Sie den Fehler fuer verschiedene N: fehler = O(1/N).
% - Recherchieren: trapz, integral

%% Ableitung -- diff
disp('Sektion 7:');
dfxN = diff(fx)*(N-1); dfxN = [dfxN(1);dfxN];
dfx = 4*pi*cos(4*pi*x); plot(x,dfxN,x,dfx);
fehler = max(abs(dfx-dfxN))/max(abs(dfx))

%% Berechnen des Fehlers der Approximation von f'(x0)
disp('Sektion 8:');
x0 = 0.47; N = 100;
dfx0 = 4*pi*cos(4*pi*x0);
f1 = sin(4*pi*x0); f2 = sin(4*pi*(x0+1/N));
fehler = max(abs(dfx0-(f2-f1)*N))
% Bemerkung: Fehler ist O(1/N) bis N=10^8, danach wachsend!

%% ENDE
