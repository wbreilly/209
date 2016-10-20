% psc209a_f16_hmwk4.m
%
%

% 19Oct2016 Petr Janata

%% Masking
% This part of the assignment is an exercise in using logical masks and
% substituting values.
% 

% Load the data from Assignment 3 (txtdata_subnum.txt)
% 

fstub = 'txtdata_subnum.txt';
fdir = '~/datafiles/';

fname = fullfile(fdir, fstub);
tdfread(fname);

% Create a logical mask that indicates which of the rows correspond to
% subjects whose IDs are 12 or higher (1 pt)
submask = Subject >= 12;

% Use the mask you created to index into the Subject variable and extract
% the corresponding subject IDs (1 pt). Get the unique IDs.
subids = unique(Subject(submask));

% Create a for-loop that is going to loop over each subject in this subset
% of subjects, i.e. those whose IDs are 12 or higher.
for isub = 1:length(subids)
  
  % On each iteration of the for-loop over this subset of IDs, generate a new
  % logical mask (that spans all the rows of the original data) that
  % corresponds only to the subject that you are currently on, i.e. which of
  % the rows in the original Subject vector correspond to the current
  % subject. (1 pt)
  currSubID = subids(isub);
  currSubMask = Subject == currSubID;

  % Use the current-subject mask that you just created to index into
  % (extract the corresponding data from) the Score variable.   (1 pt)
  currscore = Score(currSubMask);
  
  % Print the subject ID and their average score   (1 pt)
  fprintf('Subject %d: %.3f\n', currSubID, mean(currscore));
  
end % for isub

% Create a variable called NewScore with the following properties. This
% variable should be identical to the original Score variable, except that
% each score has been replaced by the product of the original score and the
% trial number (contained in the Trial variable) on which that score was
% obtained. You only want to do this for the even-numbered subjects though.
% The scores for the odd-numbered subjects remain the same. (2 pt)

% Initialize my NewScore variable
NewScore = nan(size(Score));  % generally a good way to initialize

NewScore = Score; % better way to initialize given our current task

% We can solve this problem in two different ways.
% Use a loop over all subjectIDs

uniqueSubs = unique(Subject);
for isub = 1:length(uniqueSubs)
  currSub = uniqueSubs(isub);
  
  % Determine whether the subject ID is even or odd
  % if rem(currSubID,2) == 0
  if ~rem(currSub,2)
    submask = Subject == currSub;
    NewScore(submask) = Score(submask) .* Trial(submask);
  end
end

% Solve it in one fell swoop by identifying all even subjects
NewScore2 = Score;
evenmask = ~rem(Subject,2);
NewScore2(evenmask) = Score(evenmask) .* Trial(evenmask);

% Sanity check whether NewScore and NewScore2 are the same
if ~all(NewScore == NewScore2)
  error('NewScore and NewScore2 do not match!!')
end

% 
% Hints: There are couple of ways that one can determine whether a number
% is odd or even - you could use the function fix() or you could use the
% function rem() and do an equality test on the result.
% 

%% Basic Data Analysis
% Load the data in the file, "txtdata_subnum_v2.txt' that resides in the
% "datafiles" subdirectory of the Resources section of this website. It is
% also attached to this assignment

fstub = 'txtdata_subnum_v2.txt';
fname = fullfile(fdir, fstub);
tdfread(fname)

% The headerless version is called "txtdata_subnum_nohd_v2.txt" which you
% should use if you do not have access to the tdfread() function or don't
% want to use the readtable() function.

% Your code should print the following information to the Matlab command
% window:

% The number of subjects in the dataset (1 pt)
uniqueSubs = unique(Subject);
nsubs = length(uniqueSubs);
fprintf('Found data for %d subjects\n', nsubs);

% The number of conditions in the data set (1 pt)
conds = unique(Condition);
ncond = length(conds);
fprintf('Found data for %d conditions\n', ncond);

% The number of factors in the data set (1 pt)
factors = unique(Factor);
nfact = length(factors);
fprintf('Found data for %d factors\n', nfact);

% A tab-delimited table specifying the number of trials for each subject in
% each Factor/Condition combination (see example output below). (3 pts)

% Also generate a string that will correspond to our table of means
tbl2 = '';

fprintf('Trial counts\n\n');

% Create our headerline
hdrline = sprintf('Subject\tF1C1\tF1C2\tF2C1\tF2C2\n');

% Print our hdrline
fprintf('%s', hdrline)
%disp(hdrline)

% Update our table 2 string
tbl2 = [tbl2 hdrline];

% Write our loops so as to be able to print out both our tables

for isub = 1:nsubs
  currSub = uniqueSubs(isub);
  submask = Subject == currSub;
  
  % Print subject ID info
  subidStr = sprintf('Sub%02d', currSub);
  fprintf('%s', subidStr);
  
  % update tbl2
  tbl2 = [tbl2 subidStr];
  
  for ifact = 1:nfact
    currFact = factors(ifact);
    factmask = Factor == currFact;
    
    for icond = 1:ncond
      currCond = conds(icond);
      condmask = Condition == currCond;
      
      % Create a composite mask
      compmask = submask & factmask & condmask;
      
      % Trials are unique rows, so just sum up the composite mask
      numTrials = sum(compmask);
      
      % Pull out the scores for this combo of subject, factor, condition
      % and take the average
      meanStr = sprintf('\t%.2f', mean(Score(compmask)));
      tbl2 = [tbl2 meanStr];
      
      % Print the number of trials
      fprintf('\t%d', numTrials);
      
    end % for icond
  end % for ifact
  
  % Put in the newline character
  fprintf('\n');
  tbl2 = [tbl2 sprintf('\n')];
end % for isub

% Here are some hints for constructing the formatting string that you give
% to fprintf().

% Use \t in your fprintf statement to generate a tab character.

% When generating your subject ID, you have to append the subject ID number
% to the word Sub. Note that for subjects, 5, 6, 8 and 9, the output is
% Sub05, Sub06, etc. Use the fprintf() help to figure out how to use an
% arbitrary number of digits when printing an integer, e.g. 01, 001, or
% 0001, etc.

% A tab-delimited table specifying the mean score for each subject in each
% Factor/Condition combination. (1 pt)

% We generated this table above
fprintf('\n\nMean Scores\n');

fprintf('%s', tbl2);

