function b = test4(a)% Nach aussen sichtbare Funktion !
b = a+1;
if b<0
   return
else
   b = test0(a);
end

function y = test0(x)% Privat !
y = 1;