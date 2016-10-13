% Walter Reilly
% 10_12_16
% HW 3 - PSC_209
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


% 2. Use the mask you created to index into the Subject variable and extract...
% the corresponding subject IDs (1 pt)


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

%%
% 4. Create a variable called NewScore with the following properties. This ...
% variable should be identical to the original Score variable, except...
% that  each score has been replaced by the product of the original...
% score and the trial number (contained in the Trial variable) on which...
% that score was obtained. You only want to do this for the even-numbered...
% subjects though. The scores for the odd-numbered subjects remain the...
% same. (2 pt)
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
% Your code should print the following information to the Matlab command...
% window:
% 1. The number of subjects in the dataset (1 pt)


% 2. The number of conditions in the data set (1 pt)


% 3. The number of factors in the data set (1 pt)


% 4. A tab-delimited table specifying the number of trials for each subject...
% in each Factor/Condition combination (see example output below). (3 pts)
%   1. Here are some hints for constructing the formatting string that you give...
%   to fprintf().
%       1. Use \t in your fprintf statement to generate a tab character.
%       2. When generating your subject ID, you have to append the subject ID...
%       number to the word Sub. Note that for subjects, 5, 6, 8 and 9, the...
%       output is Sub05, Sub06, etc. Use the fprintf() help to figure out how...
%       to use an arbitrary number of digits when printing an integer, e.g. 01,...
%       001, or 0001, etc.


% 5. A tab-delimited table specifying the mean score for each subject in ...
%   each Factor/Condition combination. (1 pt)




















