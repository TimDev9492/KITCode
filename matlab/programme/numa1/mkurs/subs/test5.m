function [b,i] = test5(a,wort)
b = a+1;
i = 0;
if b<0
   return
else
   b = test0(a);
end
switch wort
case 'Fall1'
   i = 1;
case 'Fall2'
   i = 2;
otherwise
   disp(['*** Warnung in ',mfilename,'.m *** Kein solcher Fall']);
end

function y = test0(x)% Privat !
y = 1;