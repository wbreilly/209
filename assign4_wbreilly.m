% Walter Reilly
% Last update: 10_18_16
% HW 4 - PSC_209
%
%
%
% Instructions
% Masking
% This part of the assignment is an exercise in using logical masks and...
% substituting values. 
% 
% Load the data from Assignment 3 (txtdata_subnum.txt)
fname = sprintf('Users/wbr/walter/209_matlab/txtdata_subnum.txt');
tdfread(fname);
%%
% 1. Create a logical mask that indicates which of the rows correspond to...
% subjects whose IDs are 12 or higher (1 pt)

% set crit
crit = 12;

% create mask
met_crit = Subject >= crit;

% 2. Use the mask you created to index into the Subject variable and extract...
% the corresponding subject IDs (1 pt)

crit_subs = unique(Subject(met_crit));

% 3. Create a for-loop that is going to loop over each subject in this...
% subset of subjects, i.e. those whose IDs are 12 or higher.



%   1. On each iteration of the for-loop over this subset of IDs, generate...
%   a new logical mask (that spans all the rows of the original data)...
%   that corresponds only to the subject that you are currently on, i.e....
%   which of the rows in the original Subject vector correspond to the...
%   current subject. (1 pt)
%   2. Use the current-subject mask that you just created to index into...
%   (extract the corresponding data from) the Score variable.   (1 pt)
%   3. Print the subject ID and their average score   (1 pt)

% set n loops
nrows = size(crit_subs,1);

for ival = 1:nrows
    % create the current subjects mask  
    cur_mask = Subject == crit_subs(ival);
    % use the mask to index into the score, and take the mean of same
    cur_mean = mean(Score(cur_mask));
    % print the subject and mean
    fprintf('Subject:%d   Mean:%.3f \n\n', crit_subs(ival), cur_mean)   
end

%%
% 4. Create a variable called NewScore with the following properties. This ...
% variable should be identical to the original Score variable, except...
% that  each score has been replaced by the product of the original...
% score and the trial number (contained in the Trial variable) on which...
% that score was obtained. You only want to do this for the even-numbered...
% subjects though. The scores for the odd-numbered subjects remain the...
% same. (2 pt)

% get unique subs
u_subs = unique(Subject);
% create mask of even subjects where 1 means even
even_mask = ~rem(u_subs,2);
% get even subject numbers
even_subs = u_subs(even_mask);

% set even subject mask (length of 1800)
even_sub_mask = zeros(size(Subject,1),1);

% for every even numbered subject 
for isub = 1:size(even_subs,1)
    % create a mask for that subject number
     curr_sub_mask = Subject == even_subs(isub);
     % add the current subject 
     even_sub_mask = curr_sub_mask + even_sub_mask; 
end

% set n loops
nloops = size(Score,1);
% put yer data here
NewScore = Score;

%
% since i made the mask, didnt need the below forloop...
% even_sub_mask = logical(even_sub_mask);
% NewScore2 = NewScore;
% 
% NewScore2(even_sub_mask) = NewScore(even_sub_mask) .* Trial(even_sub_mask);

% loop through all scores
for iscore = 1:nloops
    % if same row in mask is true, multiple by trial
    if even_sub_mask(iscore) == 1
        NewScore(iscore) = NewScore(iscore) * Trial(iscore);
    end
end

% 
% Hints: There are couple of ways that one can determine whether a ...
% number is odd or even - you could use the function fix() or you ...
% could use the function rem() and do an equality test on the result. 


%
%%
% Basic Data Analysis
% Load the data in the file, "txtdata_subnum_v2.txt' that resides in...
% the "datafiles" subdirectory of the Resources section of this website....
% It is also attached to this assignment
% The headerless version is called "txtdata_subnum_nohd_v2.txt" which ...
% you should use if you do not have access to the tdfread() function or...
% don't want to use the readtable() function.

fname = sprintf('Users/wbr/walter/209_matlab/txtdata_subnum_v2.txt');
tdfread(fname);

% Your code should print the following information to the Matlab command...
% window:
% 1. The number of subjects in the dataset (1 pt)
fprintf('# of subjects: %d \n', size(unique(Subject),1))

% 2. The number of conditions in the data set (1 pt)
fprintf('# of conditions: %d \n', size(unique(Condition),1))

% 3. The number of factors in the data set (1 pt)
fprintf('# of factors: %d \n \n', size(unique(Factor),1))

% 4. A tab-delimited table specifying the number of trials for each subject...
% in each Factor/Condition combination (see example output below). (3 pts)
%   1. Here are some hints for constructing the formatting string that you give...
%   to fprintf().
%       1. Use \t in your fprintf statement to generate a tab character.
%       2. When generating your subject ID, you have to append the subject ID...
%       number to the word Sub. Note that for subjects, 5, 6, 8 and 9, the...
%       output is Sub05, Sub06, etc. Use the fprintf() help to figure out how...
%       to use an arbitrary number of ;digits when printing an integer, e.g. 01,...
%       001, or 0001, etc.

%create a table
exp = table(Subject, Condition, Factor,Score, 'VariableNames',...
    {'Sub','Con','Fac','Sco'});

% count instances of every cond-factor pair
summary = grpstats(exp, [1 3 2]);

% unique subjects
u_subs = unique(Subject);

%number subjects
n_subs = size(u_subs,1);

%get just the counts, convert to array, and shape in a matrix such that...
% each row represents a unique subject's data
counts = reshape(table2array(summary(:,4)),4,n_subs(1))';

% add subject #s to summary matrix
exp_counts = [u_subs counts];

% tell em what's comin
fprintf('Trial Counts \n\n')

% print table labels
fprintf('  Subject \tF1C1 \tF1C2 \tF2C1 \tF2C2 \n')
%loop through exp_sum and print the pertinent values
for isum = 1:n_subs
    fprintf('Subject ID: %02d \t%d\t%d\t%d\t%d \n', ...
        exp_counts(isum,1),exp_counts(isum,2),exp_counts(isum,3),exp_counts(isum,4),...
        exp_counts(isum,5))
end



% 5. A tab-delimited table specifying the mean score for each subject in ...
%   each Factor/Condition combination. (1 pt)

% get the means with same method as for counts
means = reshape(table2array(summary(:,5)),4,n_subs(1))';

% add subject #s to summary matrix
exp_means = [u_subs means];

% tell em what's comin
fprintf('\nCondition-Factor Means \n\n')

% print table labels
fprintf('  Subject \tF1C1 \tF1C2 \tF2C1 \tF2C2 \n')
%loop through exp_sum and print the pertinent values
for isum = 1:n_subs
    fprintf('Subject ID: %02d \t%.2f\t%.2f\t%.2f\t%.2f \n', ...
        exp_means(isum,1),exp_means(isum,2),exp_means(isum,3),...
        exp_means(isum,4), exp_means(isum,5))
end




































