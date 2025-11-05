function of = allfigures(task,list)
%% Call: of = allfigures(task,list);
% Evaluates task on the set of open figures in list. It stops when the first
% non-existing figure is called. The default task is 'foreground' and the
% default list is [1,...,12]. Another task may be 'clf'.
% The number 'of' of activated figures is returned.

%% Analyse input
switch nargin
case 0
   task = '';
   list = 1:12;
case 1
   list = 1:12;
case 2
otherwise
   error('*** Check input paramter ***');
end
of = 0;

%% Operate on existing figures
for fg=list
   try% Existing figures
      get(fg,'number');% Does figure 'fg' exit?
      figure(fg); eval(task); of = of+1;
   catch% Stop if it does not exist
      break
   end
end
%fprintf(' %d open figures found\n',of);
