function g = test6(a,wort)
b = a+1; i = 0; g = [b,i];
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
end
g = [b,i];
 
function y = test0(x)% Privat !
y = 1;