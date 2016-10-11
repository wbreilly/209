% wk3 notes

% Basic arithmetic

m1 = rand(2,3);

% Adding a scalar
m1 + 5

% generate a matrix that's the same size and fill it with 8
m2 = ones(size(m1)) * 8;

% Add the matrices together
m3 = m1 + m2;

% Subtraction also happens elementwise
m4 = m1 - m2;

% Multiplication - elementwise
dotmultmtx = m1 .* m2;

% Division - elementwise
dotdivmtx = m1 ./ m2;


%% Sums of squares using vector multiplication
firstVal = 1;
lastVal = 10;
vals = firstVal:lastVal;

% square the values 
valsSqr = vals .^ 2

% sum the squared values
sumSqr = sum(valsSqr);

sumSqr2 = vals * vals'

% Print the result
fprintf(['The sum of squares for a series of integers beginning with %d \n' ...
  'and ending with %d equals: %d\n'], firstVal, lastVal, sumSqr)

%% Iteration

% Print out the value of each element in a 1 X 10 vector of random numbers

% Generate the numbers
randVals = rand(1,10)

% Specify criterion of which lines to execute
USE_INDICES = 0;

if USE_INDICES == 1
  fprintf('Using index method\n')
  % Iterate over indices of randVals
  for ival = 1:length(randVals)
    currVal = randVals(ival);
    fprintf('Value %d is %.3f\n', ival, currVal)
  end  % for ival=
  
else
  fprintf('Using direct data access method\n')
  % Iterate over data. Requires counter
  ival = 0;  % set up counter
  for currVal2 = randVals
    ival = ival + 1;  % increment counter
    fprintf('Value %d is %.3f\n', ival, currVal2);
  end
  
end % if USE_INDICES


loopingMethod = 'counter';

% To compare strings, don't use == 
% use strcmp instead

if strcmp(loopingMethod, 'indexStyle')
  fprintf('Using index method\n')
  % Iterate over indices of randVals
  for ival = 1:length(randVals)
    currVal = randVals(ival);
    fprintf('Value %d is %.3f\n', ival, currVal)
  end  % for ival=
  
else
  fprintf('Using direct data access method\n')
  % Iterate over data. Requires counter
  ival = 0;  % set up counter
  for currVal2 = randVals
    ival = ival + 1;  % increment counter
    fprintf('Value %d is %.3f\n', ival, currVal2);
  end
  
end % if USE_INDICES


