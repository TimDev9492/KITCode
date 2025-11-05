% W. Doerfler: Einfuehrung in Matlab und numerische Algorithmen
% Karlsruher Institut fuer Technologie, Fakultaet fuer Mathematik

%% Vorbereiten
clear all;% Loescht den Workspace
close all;% Schliesst alle Fenster
openfigure(2,'init');% Oeffnet Fenster '1' und '2'
format compact% Kompakte Ausgabe

%% if-Anweisung
disp('Sektion 1:');
a = 1; b = 1;
if a==b, disp(' a gleich b'); end
a = 1; b = 2;
if a~=b, disp(' a ungleich b'); end
if a<=b, disp(' a kleiner gleich b'); end
% Vektoriell
a = [1;2;3]; b = [2;1;0]; a < b
all(a<b), any(a<b)
if a<b, disp('a kleiner b'); end% Implizites 'all(a<b)'
% if ..., ... elseif ... elseif ... else ... end

%% switch ist wie in 'C', aber mit implizitem 'break'
% switch i, case 1, case {2,3}, ... otherwise, end
disp('Sektion 2:');
i = 2;
switch i% Auf der Konsole mit Uebung der Rueckholtaste
case 1, i
case 2, i+1
otherwise, error(' Wrong input');
end

%% Schleifen
% for
disp('Sektion 3:');
n = 5; for i=1:n, i, end
n = 5; for i=1:2:n, i, end
% while
n = 5; i = 1; while i<=n, i, i = i+1; end
% Statt do ... while benutze
n = 5; i = 1; while 1, i, i = i + 1; if i>n, break; end; end

%% Skript
%--- File test1.m ---
%b = a+1;
%--- EOF ---
%% Workspace:
disp('Sektion 4:');
a = 1; test1; b% OK: b bekannt

%% Funktion
%--- File test2.m ---
%function b = test2(a)
%b = a+1;
%--- EOF ---
%% Workspace:
disp('Sektion 5:');
clear;
a= 1; test2(a); b% FEHLER: b nicht bekannt !

%% Funktion
%--- File test3.m ---
%function b = test3(a)
%b = a+1;
%if b<0
%   return
%else
%   b = 1;
%end
%--- EOF ---
%% Workspace:
disp('Sektion 6:');
clear;
a =  2; test3(a)
a = -2; test3(a)

%% Private Funktion
%--- File test4.m ---
%function b = test4(a)% Nach aussen sichtbare Funktion !
%b = a+1;
%if b<0
%   return
%else
%   b = test0(a);
%end
%
%function y = test0(x)% Privat !
%y = 1;
%--- EOF ---
%% Workspace:
disp('Sektion 7:');
clear;
a =  2; test4(a)
a = -2; test4(a)
a = -2; test0(a)% FEHLER: test0 ist unbekannt !

%% Mehrere Ein- und Ausgabeparameter
%--- File test5.m ---
%function [b,i] = test5(a,wort)
%b = a+1; i = 0;
%if b<0
%   return
%else
%   b = test0(a);
%end
%switch wort
%case 'Fall1'
%   i = 1;
%case 'Fall2'
%   i = 2;
%otherwise
%   disp(['*** Warnung in ',mfilename,'.m *** Kein solcher Fall']);
%end
%
%function y = test0(x)% Privat !
%y = 1;
%--- EOF ---
%% Workspace:
disp('Sektion 8:');
clear;
a = 2; test5(a,'Fall1')% Ausgabe: nur 'b'
a = 2; [b,i] = test5(a,'Fall2')% Ausgabe: b,i
a = 2; test5(a,'Fall0')% Warnung
a = 2; test5(a)% FEHLER: 2. Argument ist nicht definiert

%% Mehrere Ein- aund Ausgabeparameter
% Alternative
%--- File test6.m ---
%function g = test6(a,word)
% b = a+1; i = 0; g = [b,i];
% if b<0
%    return
% else
%    b = test0(a);
% end
% switch word
% case 'Fall1'
%    i = 1;
% case 'Fall2'
%    i = 2;
% end
% g = [b,i];
%
%function y = test0(x)% Privat !
%y = 1;
%--- EOF ---
%% Workspace:
disp('Sektion 9:');
a = 2; test6(a,'Fall1')% Output: 1 1
a = 2; g = test6(a,'Fall1');% Besetzt g mit 1 1
a = 2; [b,i] = test6(a,'Fall1');% FEHLER: Falsche Rückgabe!

%% ENDE
