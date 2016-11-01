% psc209_f16_hmwk5

% 26Oct2016 Petr Janata
% 

% The file for this assignment is named,
% "txtdata_IDsNotIndices_MissingData.txt' and resides in the "datafiles"
% subdirectory of the Resources section of this website.
%  

% Load in the datafile
fstub = 'txtdata_IDsNotIndices_MissingData.txt';
fdir = '~/datafiles';
fname = fullfile(fdir, fstub);

tdfread(fname)

% Your code should print the following information to the MATLAB command
% window:

% The number of subjects in the dataset and a list of the unique subject
% IDs (2 pts)
subids = unique(Subject);
nsub = length(subids);

fprintf('Found data for %d subjects\n', nsub);
for isub = 1:nsub
  fprintf('Subject %d/%d: %d\n', isub, nsub, subids(isub));
end

% The number of conditions in the data set and a list of the unique
% condition IDs (2 pts)
conds = unique(Condition);
ncond = length(conds);

fprintf('\nFound data in %d conditions\n', ncond);
for icond = 1:ncond
  fprintf('Condition %d/%d: %d\n', icond, ncond, conds(icond));
end

% The number of factors in the data set and a list of the unique factor IDs
% (2 pts)
facts = unique(Factor);
nfact = length(facts);

fprintf('\nFound data in %d conditions\n', nfact);
for ifact = 1:nfact
  fprintf('Factor %d/%d: %d\n', ifact, nfact, facts(ifact));
end

% A tab-delimited table specifying the number of trials for each subject in
% each Factor/Condition combination (as in Assignment 4). (2 pts)

% Initialize a reporting string for missing data
missingDataReport = sprintf('\n\nMissing data report\n\n');

% Initialize a reporting string for mean data
meanDataReport = sprintf('\n\nMean scores\n\n');

% Initialize a reporting string for sem data
semDataReport = sprintf('\n\nSEM\n\n');

% Initialize a variable to collect all of our mean Score data
allMeans = nan(nsub, nfact, ncond);
allMeans2 = nan(nfact, ncond, nsub);

% Print our headerline
fprintf('Subject\t%s\n', create_hdrline(nfact,ncond));

for isub = 1:nsub
  % Extract the current subject ID
  currSubID = subids(isub);
  
  % Find all rows corresponding to this subject
  submask = Subject == currSubID;
  
  % Print our subject ID
  fprintf('Sub%02d', currSubID);
  
  % Print our subject ID to the mean score string
  meanDataReport = [meanDataReport sprintf('Sub%02d', currSubID)];
  
  for ifact = 1:nfact
    % Get our current factor ID
    currFactID = facts(ifact);
    
    % Find all rows for current factor
    factmask = Factor == currFactID;
    
    for icond = 1:ncond
      % Extract current condition
      currCondID = conds(icond);
      
      % Find all rows for current condition
      condmask = Condition == currCondID;
      
      % Generate a composite mask
      compmask = submask & factmask & condmask;
      
      % Number of trials should be equal to the sum of our composite mask
      numTrials = sum(compmask);
      
      % Calculate the mean score
      meanScore = mean(Score(compmask));
      
      % Store my mean score in the big matrix
      allMeans(isub, ifact, icond) = meanScore;
      allMeans2(ifact, icond, isub) = meanScore;
      
      % Std deviation
      stdScore = std(Score(compmask));
      
      % SEM
      semScore = stdScore / sqrt(numTrials);
      
      % Check whether we have data for this factor/condition combination
      % and subject
      % Could use ~numTrials
      if numTrials == 0
        missingDataReport = [missingDataReport ...
          sprintf('Sub%02d: F%dC%d\n', currSubID, currFactID, currCondID)];
        
        % update meanDataReport with a NaN
        meanDataReport = [meanDataReport sprintf('\tNaN')];
      else
        meanDataReport = [meanDataReport sprintf('\t%.2f', meanScore)];
      end
        
      % Update our mean data report directly (without bothering with the
      % if/then/else logic
      % meanDataReport = [meanDataReport sprintf('\t%.2f', meanScore)];
      semDataReport = [semDataReport sprintf('\t%.2f', semScore)];
     
      fprintf('\t%d', numTrials);
      
    end % for icond
  end % for ifact
  
  % Make sure to add the newline character
  fprintf('\n');
  
  meanDataReport = [meanDataReport sprintf('\n')];
  semDataReport = [semDataReport sprintf('\n')];
 
end % for isub

% Here are some hints for constructing the formatting string that you give
% to fprintf().
% Use \t in your fprintf statement to generate a tab character.

% When generating your subject ID, you have to append the subject ID number
% to the word Sub. Note that for subjects, 5, 6, 8 and 9, the output is
% Sub05, Sub06, etc. Use the fprintf() help to figure out how to use an
% arbitrary number of digits when printing an integer, e.g. 01, 001, or
% 0001, etc.

% There are a number of subjects who are missing data for some combinations
% of factor and conditions. For each subject who is missing data, print
% their subject ID and the IDs of the factor/condition combinations in
% which they are missing data (4 pts)

fprintf('%s', missingDataReport);

% A tab-delimited table specifying the mean score for each subject in each
% Factor/Condition combination. For those subjects missing data in a
% factor/condition combination, print the word NaN rather than a number (4
% pt)

fprintf('%s', meanDataReport)

% The standard error of the mean (SEM) for each subject in each
% Factor/Condition combination. To calculate the standard error, use std()
% to obtain the standard deviation, and divide this by the square root
% [sqrt()] of the number of trials in that Factor/Condition combination for
% that subject. (2 pts)
fprintf('%s', semDataReport)

% The mean and SEM across subjects for each Factor/Condition combination.
% Note that the mean here is the mean of individual subject means, and the
% SEM is the standard error of the individual subject means, not the mean
% of the individual subject SEMs. (2 pts)

% If we have access to Stats toolbox, use nanmean
means1 = nanmean(allMeans);

% Just write the friggin loop already
fprintf('\n\nMeans and std errors across subjects\n')
fprintf('%s\n',create_hdrline(nfact,ncond));
for ifact = 1:nfact
  for icond = 1:ncond
    % Figure out where we have data for this combo
    goodmask = ~isnan(allMeans(:, ifact, icond));
    
    means2(ifact,icond) = mean(allMeans(goodmask, ifact, icond));
    std2(ifact,icond) = std(allMeans(goodmask, ifact, icond));
    nobs(ifact,icond) = sum(goodmask);
    sem2(ifact,icond) = std2(ifact,icond)/sqrt(nobs(ifact,icond));
    
    fprintf('%.2f (%.2f)', means2(ifact,icond), sem2(ifact,icond));
    if ~(ifact == nfact && icond == ncond)
      fprintf('\t');
    end
  end
end
fprintf('\n');

% Get the SEMs using the matrices
sem3 = std2 ./ sqrt(nobs);

% Squeeze out the singleton dimension of matrix 1
squeeze(means1)

