% psc209a_f16_wk4
%

% 12Oct2016 Petr Janata

% Create a column vector with 100 random values
nval = 100;
data = rand(nval, 1);

% Find all of the indices that hold values equal to or greater than 0.6
crit = 0.6;

% Create two variables to hold information about locations that contain 
% values that match/exceed our criterion
crit_idxs = []; % only collect those indices that met our criterion
crit_idxs2 = [];
met_crit = zeros(size(data));  % same size as data - will contain zeros and ones

for ival = 1:nval
  if data(ival) >= crit
    % update our long vector
    met_crit(ival) = 1;
    
    % update our list
    % 2 methods one can use
    crit_idxs = [crit_idxs ival];
    
    crit_idxs2(end + 1) = ival;
    
  end
end

% Print how many values matched our criterion
fprintf('Found %d values that match our criterion\n', sum(met_crit))
fprintf('Found %d values\n', length(crit_idxs))

% Evaluate our condition "simultaneously" on all values
met_crit2 = data >= crit;

% Extract indices using find
idxs = find(data >= crit);

% Extract values at indices that met the criterion
matchedVals = data(idxs);

% Double check that indeed all these values exceed the criterion

if sum(matchedVals >= crit) == length(matchedVals)
  fprintf('Yay for logic!\n')
else
  fprintf('Something is really wrong!\n')
end

% using all()
if all(matchedVals >= crit)
  fprintf('All is good\n')
else
  fprintf('give up')
end

% Extract the data using the logical mask
matchedVals2 = data(met_crit2);

% Why logical masks are better

% Create a matrix with two columns (variables)
data2 = rand(40,2);

% Turn it into a table
tbl2 = table(data2(:,1),data2(:,2),'VariableNames',{'var1','var2'});

% For each variable, find the indices that meet our criterion
idxs_var1 = find(tbl2.var1 > crit);
idxs_var2 = find(tbl2.var2 > crit);

% Find those indices that are the same for both variables
matchedIdxs = [];

% Loop over first list
for iidx1 = 1:length(idxs_var1)
  % Extract the current value on list 1
  currVar1 = idxs_var1(iidx1);
  
  % Loop over second list
  for iidx2 = 1:length(idxs_var2)
    % Extract the current value on list 2
    currVar2 = idxs_var2(iidx2);
    
    % See whether they match
    if currVar1 == currVar2
      matchedIdxs = [matchedIdxs currVar1];
    end
  end
end

% Finding intersections of two sets
commonIdxs = intersect(idxs_var1, idxs_var2);

% Doing the same thing using logical masks

% Find where both variables meet the criterion
conjmask = (tbl2.var1 > crit) & (tbl2.var2 > crit);

% Find rows where either variables meets the criterion
ormask = (tbl2.var1 > crit) | (tbl2.var2 > crit);

% Another expedient way for finding rows on which each column matches
% the criterion
% Do this using a regular matrix beacuse tables are a bit complicated

conjmask2 = all(data2 > crit, 2); % ,2 to apply across columns

data3 = rand(40, 5);

if any(all(data3 > crit, 2))
  fprintf('Matched criterion on all columns for at least some rows!\n')
end

% Just look at a subset of columns
all(data3(:,[1 3 4]) > crit,2)

% Flipping true to false with the not operator (~)
~conjmask

