%% Pfadsetzungen fuer mkurs
% Ueberladen: Suchrichtung ist von unten nach oben.
% Steige ab zum Wurzelordner, hole basicpath und kehre zurueck
currentpath = pwd;% Diesen Pfad merken
cd ../../;% Absteigen
startup;% basicpath besetzen
eval(['cd ' currentpath]);% Zurueckkehren
% Pfade der benoetigten Bibliotheken setzen
disp('Run startup:');
disp(['   basicpath  : ' basicpath]);
disp(['   currentpath: ' currentpath]);
addpath([currentpath '/subs/']);% Diverse Unterprogramme
addpath([basicpath '/toolbox/']);% Allgemeine nuetzliche Programme
disp('   Pfade gesetzt: toolbox. Lokal: subs');
disp('Fertig');