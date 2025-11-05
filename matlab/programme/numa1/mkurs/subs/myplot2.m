function myplot2(x,func,ltyp)% void
%  CALL: myplot2(x,func,ltyp)
%  x: Vektor, func: Funktionszeiger, [ltyp: string]
if nargin<2
   error('Fehler: 2 Argumente noetig');
end
if nargin==2% Defaultwert
   ltyp = 'k-'; disp('Benutze default linestyle');
end
figure(gcf);% Current figure pops up
   plot(x,func(x),ltyp,'LineWidth',2);
fprintf('\a');