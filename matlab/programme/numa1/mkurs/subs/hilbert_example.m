%--- File hilbert_example.m ---
% Beispiel: Loese Gleichungssysteme mit der Hilbertmatrix
%           und betrachte den Fehler
NN = 25;
err = zeros(NN,1); kond1 = zeros(NN,1); kond2 = zeros(NN,1);
for N=1:NN
   x = ones(N,1);
   A = hilb(N);% Die volle Hilbertmatrix
   b = A*x;
   y = A\b;
   err(N)   = max(abs(y-x));
   kond1(N) = condest(A);% Siehe help-Menue
   kond2(N) = cond(A);   % Siehe help-Menue
end
figure(1); clf
   plot(1:N,err,'LineWidth',2);
   title('N vs Fehler');
   xlabel('N','FontSize',14); ylabel('err_N','FontSize',14);
figure(2); clf; hold on
   plot(1:N,log10(kond1),'k-','LineWidth',2);
   plot(1:N,log10(kond2),'b-','LineWidth',2);
   title('N vs Kondition');
   xlabel('N','FontSize',14); ylabel('Kondition_N','FontSize',14);
   legend('l1-Kondition','l2-Kondition','Location','SouthEast');
   hold off
