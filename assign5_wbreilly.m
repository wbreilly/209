% Walter Reilly
% last update 10_20_!6
% HW 5
% PSC 209

% Instructions
% Basic Data Analysis
% This assignment is essentially the same as Assignment 4, but with a ...
%     couple of wrinkles.
% The file for this assignment is named, "txtdata_IDsNotIndices_MissingData.txt' ...
%     and resides in the "datafiles" subdirectory of the Resources section ...
%     of this website.
%  

% read in data
fname = sprintf('txtdata_IDsNotIndices_MissingData.txt');
tdfread(fname);


% Your code should print the following information to the MATLAB command window:
%% 1. The number of subjects in the dataset and a list of the unique ...
%     subject IDs (2 pts)

% unique subjects
u_sub = unique(Subject);
% number of subjects
n_sub = length(u_sub);

% print the number of subjects
fprintf('\n # subjects: %d \n\n', n_sub)

% print the unique subject numbers
fprintf(' Subjects \n') % header
fprintf(' %d \n', u_sub)

%% 2. The number of conditions in the data set and a list of the unique...
%     condition IDs (2 pts)

% uniquie conditions
u_con = unique(Condition);
% number of conditions
n_con = length(u_con);

% print the number of conditions
fprintf('# conditions: %d \n\n', n_con)

% print the unique subject numbers
fprintf(' Conditions \n') % header
fprintf('%d \n', u_con)

%% 3. The number of factors in the data set and a list of the unique...
%     factor IDs (2 pts)

% unique factors
u_fac = unique(Factor);
% number factors 
n_fac = length(u_fac);

% print the number of factors
fprintf('# factors: %d \n\n', n_fac)

% print the unique subject numbers
fprintf(' Factors \n') % header
fprintf('%d \n', u_fac)

%% 4. A tab-delimited table specifying the number of trials for each...
%     subject in each Factor/Condition combination (as in Assignment 4). (2 pts)
%     1. Here are some hints for constructing the formatting string ...
%         that you give to fprintf().
%         1. Use \t in your fprintf statement to generate a tab character.
%         2. When generating your subject ID, you have to append the ...
%             subject ID number to the word Sub. Note that for subjects...
%             , 5, 6, 8 and 9, the output is Sub05, Sub06, etc. Use the...
%             fprintf() help to figure out how to use an arbitrary number...
%             of digits when printing an integer, e.g. 01, 001, or 0001, etc.

for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
    for ifac = 1:n_fac
        cur_fac = u_fac(ifac);
        fac_mask = Factor == cur_fac;
        
        for icon = 1:n_con
            cur_con = u_con(icon);
            con_mask = Condition == cur_con;
            
        end % end icon
    end % end ifac
end % end isub

% 5. There are a number of subjects who are missing data for some...
%     combinations of factor and conditions. For each subject who is...
%     missing data, print their subject ID and the IDs of the...
%     factor/condition combinations in which they are missing data (4 pts)
% 6. A tab-delimited table specifying the mean score for each subject...
%     in each Factor/Condition combination. For those subjects missing ...
%     data in a factor/condition combination, print the word NaN rather ...
%     than a number (4 pt)
% 7. The standard error of the mean (SEM) for each subject in each ...
%     Factor/Condition combination. To calculate the standard error, use...
%     std() to obtain the standard deviation, and divide this by the square...
%     root [sqrt()] of the number of trials in that Factor/Condition...
%     combination for that subject. (2 pts)
% 8. The mean and SEM across subjects for each Factor/Condition ...
%     combination. Note that the mean here is the mean of individual...
%     subject means, and the SEM is the standard error of the individual ...
%     subject means, not the mean of the individual subject SEMs. (2 pts)
%  
% 
% For this assignment, create a Matlab script called assign5_<userid>.m ...
%     and make sure it runs.
% Grading
% 
% 
% In addition to the points listed above for accomplishing each of the ...
%     steps, additional points will be given for:
% 1. The code executes without crashing (2 pts). I won't penalize for the ...
%    datafile not loading properly.
% 2. The code is generalizable (3 pts). I must be able to take your code,...
%     run it on a new dataset that has the same basic structure but ...
%     different numbers of subjects and trials, and get the correct ...
%     result. See Generalization criteria below.
% 3. Legibility of code (2pts). I should be able to read through and ...
%     understand your code without much trouble. Please don't pack all...
%     your lines of code together. Pack lines together that conceptually...
%     belong to each other, e.g. for-loops. Use comments to indicate ...
%     the purpose of lines or groups of related lines, and use brief ...
%     but meaningful variable names.
% NOTE: If you did not succeed in getting your code to run cleanly ...
%     through all the steps of the assignment, but you clearly invested ...
%     effort in trying to find a solution, credit will be given for ...
%     creative ways of trying to solve the problem.
% Generalization criteria
% Generalizability of your code means that it should run and produce the...
%     correct output dynamically, i.e. without any intervention on your ...
%     part, when certain properties of the input dataset change.  In this ...
%     assignment, your code should accommodate:
% 
% 1. Different numbers of subjects.
% 2. Different numbers of trials per condition for each subject.
% 3. Different numbers of conditions.
% 
































