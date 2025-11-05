% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
openfigure(2,'init');% Oeffnet Fenster '1' und '2'
format compact% Kompakte Ausgabe

%% Funktionszeiger, Funktionenuebergabe
%--- File f.m ---
%function fx = fun_f(x)
%fx = sin(4*pi*x);
%--- EOF ---
%--- File myplot.m ---
%function myplot(x,func)% void
% CALL: myplot(x,func)
% x: Vektor, func: Funktionszeiger
%figure(gcf);% Current figure pops up
   %plot(x,feval(func,x),'k-','LineWidth',2);% Alt
%   plot(x,func(x),'k-','LineWidth',2);% Neu
%fprintf('\a\n');% Alarmton
%--- EOF ---
%% Workspace:
disp('Sektion 1:');
help myplot1
x = linspace(0,1,100)'; myplot1(x,@fun_f);
xlabel('x'); ylabel('f(x)');

%% Zahl der Eingabe- und Ausgabe-Argumente - nargin/nargout
%--- File myfplot.m ---
%function myfplot(x,func,ltyp)% void % Im File entkommentieren
% CALL: myfplot(x,func,ltyp)
% x: Vektor, func: Funktionszeiger, [ltyp: string]
% if nargin<2
%    error('Error: need two arguments');
% end
% if nargin==2% Defaultwert
%    ltyp = 'k-'; disp('Use default linestyle');
% end
% figure(gcf);% Pops up
% plot(x,feval(func,x),ltyp,'LineWidth',2);
% fprintf('\a');
%--- EOF ---
%% Workspace:
disp('Sektion 2:');
myplot2(x,@fun_f,'b--');
myplot2(x,@fun_f);% Nimmt Default-Wert
myplot2(x)% FEHLER: 2 Argumente noetig
% Bemerkung: Analog zu 'nargin' existiert 'nargout'
% Aufruf: [s,i,j] = prog(k) setzt nargout=3 in 'prog'
% aber:   s = prog(a)       setzt nargout=1 in 'prog'.

%% Rekursive Funktionen
%--- File fibo.m ---
%function fn = fibo(n)
%n: Natuerliche Zahl (nicht zu gross!)
%Berechnet Fibonacci-Zahlen rekursiv
%if n<=2, fn = 1;
%else     fn = fibo(n-1) + fibo(n-2);
%end
%--- EOF ---
%% Workspace:
disp('Sektion 3:');
fibo(7)% Argument nicht so gross waehlen !

%% Rechenzeitmessung
% cputime
disp('Sektion 4:');
tic; fibo(30), toc
t = cputime; fibo(30), t = cputime-t% Misst dazwischenliegende CPU Zeit
% tic - toc
t = tic; fibo(30), toc(t)% Misst dazwischenliegende CPU Zeit

%% Felder werden dynamisch angelegt !
disp('Sektion 5:');
clear;
for i=1:10, a(i) = i, end% Erzeugt Feld y ohne Deklaration. TEUER !
% Mit Zeitmessung
clear; N = 1000;% a undefiniert
tic; for i=1:N, a(i) = i; end; toc;
clear; N = 1000; a = zeros(N,1);% a deklariert !
tic; for i=1:N, a(i) = i; end; toc;

%% inline functions
disp('Sektion 6:');
clear
ff = @(x) sin(4*pi*x);% f(x) := sin(4pi x)
ff(1)
figure(1)
   fplot(@(x)sin(4*pi*x),[0,1]);% Uebergabe einer inline function
h = @(x,y) 4*x*y;% Zwei Argumente: h(x,y) := 4xy
h(1,2)
figure(2)
   fplot(ff,[0,1]);% Uebergabe einer inline function

%% Input -- eval
disp('Sektion 7:');
x = 0.1;
f = input(' Was ist ''f'' ? ','s');% Zeichen, etwa sin
fprintf('Die Funktion ist %s\n',f);
fx = [f '(x)'];% Zeichenketten zusammensetzen
fprintf(' %s = %7.4f\n',fx,eval(fx));% sin(x) = 0.0998

%% ENDE
