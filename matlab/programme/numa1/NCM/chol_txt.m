function L = chol_txt(A)
%% CALL: L = chol_txt(A);
% Input:
%    A ... Symmetric positive input matrix.
% Output:
%    L ... Lower triangular part.
% CHOL_TXT  Textbookversion of the Cholesky decomposition A = L*L^t.
% Matrices must be spd and may be full or sparse.
% REMARK: A textbook version of an algorithm is intended to be very close
% to the formulas present in a lecture, it is not the most effective
% implementation.

% Numerische Mathematik 1, Sommersemester 2008.
% Institut fuer Angewandte und Numerische Mathematik, Karlsruhe.
% Willy Doerfler, Andreas Rieder

%% Analyse input
m = size(A,1); n = size(A,2);
if m~=n, error('*** ERROR *** Quadratic matrices only'); end
if ~isequal(A,A'), error('*** ERROR *** Symmetric matrices only'); end

% Define L using the structure of the lower triangular part of A.
L = sparse(tril(A));

% Cholesky decomposition
for k=1:n
   ind = 1:k-1;
   L(k,k) = A(k,k)-sum(L(k,ind).^2);
   if L(k,k)<eps% Stop if the diagonal element is practically nonpositive
      error('*** ERROR *** Cholesky decomposition doesn''t exist');
   end
   L(k,k) = sqrt(L(k,k));
   for i=k+1:n
      L(i,k) = (A(i,k)-sum(L(i,ind).*L(k,ind)))/L(k,k);
   end
end

return
