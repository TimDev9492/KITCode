function fn = fibo(n)
%  CALL: fn = fibo(n)
%  n: Natuerliche Zahl (nicht zu gross!)
%  Berechnet Fibonacci-Zahl fn rekursiv
if n>40
   disp('Bitte Argument kleiner gleich 40!');
   return
end
if n<=2, fn = 1;
else     fn = fibo(n-1) + fibo(n-2);
end