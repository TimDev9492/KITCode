function myplot1(x,func)% void
% CALL:  myplot1(x,func)
% x: Vektor, func: Funktionszeiger
figure(gcf);% Current figure pops up
   %plot(x,feval(func,x),'k-','LineWidth',2);% Alt
   plot(x,func(x),'k-','LineWidth',2);% Neu
fprintf('\a\n');% Alarmton