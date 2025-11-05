function [L,U,p] = lutx(A)
%% CALL: [L,U,p] = lutx(A);
% Input:
%    A ... Quadratic input matrix.
% Output:
%    L/U ... Lower/upper triangular part of A.
%    p ... Permutation vector.
%LUTX  Triangular factorization, textbook version
%   [L,U,p] = lutx(A) produces a unit lower triangular matrix L,
%   an upper triangular matrix U, and a permutation vector p,
%   so that L*U = A(p,:).
% REMARK: A textbook version of an algorithm is intended to be very close
% to the formulas present in a lecture, it is not the most effective
% implementation.
% Taken from C. Molers NCM collection

%% Initialisations
[n,n] = size(A);
p = (1:n)';

% Decomposition
for k = 1:n-1

   % Find index of largest element below diagonal in k-th column
   [r,m] = max(abs(A(k:n,k)));
   m = m+k-1;

   % Skip elimination if column is zero
   if A(m,k) ~= 0
   
      % Swap pivot row
      if m ~= k
         A([k m],:) = A([m k],:);
         p([k m]) = p([m k]);
      end

      % Compute multipliers
      i = k+1:n;
      A(i,k) = A(i,k)/A(k,k);

      % Update the remainder of the matrix
      j = k+1:n;
      A(i,j) = A(i,j) - A(i,k)*A(k,j); 
   end
end

% Separate result
L = tril(A,-1) + eye(n,n);
U = triu(A);
