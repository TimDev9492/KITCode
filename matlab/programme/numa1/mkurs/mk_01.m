% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

% Bei Befehlen mit ';' am Ende wird die Ausgabe unterdrueckt, ohne ';' oder
% mit ',' wird das Ergebnis ausgegeben.
% Bei Befehlen ohne explizite Zuweisung wird die Ausgabevariable 'ans'
% (fuer 'answer') mit dem Resultat belegt und ggf. ausgegeben. Die Variable
% kann auch im naechsten Rechenschritt benutzt werden, wird dann aber mit
% dem naechsten Resultat ueberschrieben.
% Bemerkung: Sie koennen auch ganze Befehl-Bloecke mit der Maus hinaus-
% kopieren und in das Matlab-Kommandofenster einfuegen. In Matlab werden
% '%%'-Bloecke zu "Sektionen" zusammengefasst. Sie sehen eine optische
% Unterteilung wenn der Mauskursor in einer Sektion ist. Mit dem Menue 'run
% section' (im Menue oben oder im Balken links) kann man den aktuellen
% Block ausfuehren. Fuehren Sie die Befehle aus und sehen Sie sich die
% Ausgaben an. Ueberlegen Sie was jeweils passiert.

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
format compact% Kompakte Ausgabe

%% Grundrechenarten
disp('Sektion 1:');
1+1
5*4
5/4
1+3*2-1/2*4

%% Variablenzuweisung
disp('Sektion 2:');
%c % FEHLER, c undefiniert
a = 5
b = 4
a*b
a/b
a = 5, b = 4
a*b, a/b

%% Editieren mit Cursor
% Pfeiltasten: hoch, runter, links, rechts.
% Smart arrow: zB 'a' eingeben und dann Pfeiltasten hoch.
% Curser an ZeilenAnfang bzw ZeilenEnde: <cntrl>a bzw. <cntrl>e .
% Mauscopy.
% Bsp
disp('Sektion 3:');
Temperatur_gestern = 20
%Temperatur gestern = 20 % FEHLER
mal2 = 2
%2mal = 2 % FEHLER
%if = 3 % FEHLER

%% Konstanten
disp('Sektion 4:');
pi, i, eps % 'i' ist apriori die imaginaere Einheit
i = 1
i
clear
i
1i % Die imaginaere Einheit sollte so verwendet werden

%% Format
disp('Sektion 5:');
pi
format loose; format short;
pi
format compact; format long e;
pi

%% Vektoren
disp('Sektion 6:');
format compact; format short;
a = [2,1]% Zeile
a = [2;1]% Spalte
b = [1;2]
a+b, a-b, 2*a
a', a'*b
a = 1:5, a = a'
a = (1:5)'
b = 0:0.25:1; b = b'

%% Spezielle Vektoren
disp('Sektion 7:');
c = linspace(0,1,5)'
c = zeros(1,5)% Zeile
c = zeros(5,1)% Spalte
c = ones(5,1)
length(a)
size(a), size(a,1), size(a,2)

%% Indizierung
disp('Sektion 8:');
a(3)
a(3:5)
a([1,3:5])
[1,3:5]
ind = [1;(3:5)']
a(ind)
a(end)
a(3:end-1)

%% Komponentenweise Operationen
disp('Sektion 9:');
a.*b
a./b
a.^b

%% Matrizen
disp('Sektion 10:');
A = [1,2,3;3,4,6]% 2x3-Matrix
B = [1,0,0;0,0,0]
size(A), size(A,1), size(A,2)
A+B, A-A, 2*A
A'
A'*B, B*A'
% Komponentenweise Operationen
A.*B, A.^2

%% Spezielle Matrizen
disp('Sektion 11:');
A = zeros(5,3)
B = ones(5,3)
C = [ones(2,1),zeros(2,1)]
C = [ones(1,2);zeros(1,2)]
D = [C,ones(2,1)]
E = eye(4)
F = []
R = rand(4,2)

%% Indizierung
disp('Sektion 12:');
A = [1,2,3;4,5,6;7,8,9]
A(2,3)
A(2:end,1:2)
A(:,3)
A(2,:)
A(:,:)
A(:)
A(A)

%% Zuweisungen
disp('Sektion 13:');
A = zeros(8,8)
A(2,:) = []
A(3,1) = 1
A(6:7,2:3) = 2*ones(2,2)
A(3:5,6:8) = 3*ones(3,3)

%% Matrizen umspeichern
disp('Sektion 14:');
a = [1;2;3;4]% Spalte
b = reshape(a,2,2)% 2x2
a = reshape(b,1,4)% Zeile

%% Invertierung und Geichungssysteme
disp('Sektion 15:');
A = [1,1/3;1/3,1/4]
B = inv(A)% Inverse Matrix
A*B, B*A
b = [1;1];
x = A\b, y = B*b% Loese Geichungssystem A*x=b

%% Bsp.: Hilbertmatrix
disp('Sektion 16:');
N = 50
x = ones(N,1);
A = hilb(N);
b = A*x;
y = A\b;
err = max(abs(y-x));

%% Komplexe Eintraege
disp('Sektion 17:');
A = [0,1i;0,0]
A', A.' % ACHTUNG !

%% Online Hilfen
% help <task>
disp('Sektion 18:');
help
help format
% lookfor <wort>
lookfor hilbert
% type <task>
type hilb
% Demonstrationen
demo

%% ENDE
