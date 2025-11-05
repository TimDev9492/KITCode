function [A,U] = lu_txt(A)
%% CALL: A = lu_txt(A);
%        [L,U] = lu_txt(A);
% Input:
%    A ... Quadratric input matrix.
% Output:
%    nargout = 1:
%    A ... Lower/Upper triangular part stored on A. Note that diag(L)=eye.
%    nargout = 2:
%    L/U ... Lower/upper triangular part.
% LU_TXT  Textbookversion of the LU decomposition without pivoting,
%    A = L*U. Matrices must be spd and may be full or sparse.
% REMARK: A textbook version of an algorithm is intended to be very close
% to the formulas present in a lecture, it is not the most effective
% implementation.

% Numerische Mathematik 1, Sommersemester 2008.
% Institut fuer Angewandte und Numerische Mathematik, Karlsruhe.
% Willy Doerfler, Andreas Rieder

%% Analyse input
m = size(A,1); n = size(A,2);
if m~=n, error('*** ERROR *** Quadratic matrices only'); end;

% LR-decomposition
for k=1:n-1
   if abs(A(k,k))<eps% Stop if the diagonal element is practically zero
      error('*** ERROR *** LU decomposition doesn''t exist');
   end;
   for i=k+1:n
      A(i,k) = A(i,k)/A(k,k);% This is L(i,k)
   end
   for j=k+1:n% Run columnwise
      for i=k+1:n
         A(i,j) = A(i,j)-A(i,k)*A(k,j);% Elimination step
      end
   end
end
% Now L,U is stored in A, up to the '1's on the diagonal of L.

% Organise output
switch nargout
case 1,% Single output is L,U stored on A
case 2,% Separate L,U with built-in Matlab routines
   U = triu(A);
   A = tril(A,-1)+speye(n);
end

return
