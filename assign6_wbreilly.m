% Walter Reilly
% 11_1_2016
% HW 6 - PSC209
% 
% load the data
fname = sprintf('txtdata_shuffled.txt');
tdfread(fname);

%% 1. Calculate the means and standard deviations across all subjects for ...
%     each Factor/Condition combination and print out the results in a...
%     formatted table as in last week's homework (1 pt).  

% print out subject, factor, and condition info

% get the subjects
u_sub = unique(Subject);
fprintf('Subject: %d\n', u_sub)
% number of subs
n_sub = length(u_sub);
fprintf('\n# of Subjects : %d\n\n', n_sub)

% get the Factors
u_fac = unique(Factor);
fprintf('Factors: %d\n', u_fac);
% number of factors
n_fac = length(u_fac);
fprintf('\n# of Factors: %d\n\n', n_fac)

% get the Conditions
u_con = unique(Condition);
fprintf('Condition: %d\n', u_con)
% number of conditions
n_con = length(u_con);
fprintf('\n# of Conditions: %d\n\n', n_con)

%% get the scores

% factor/con scores here 
tbl1 = [];

% loop d loops
for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
    for ifac = 1:n_fac
        cur_fac = u_fac(ifac);
        fac_mask = Factor == cur_fac;
        
        for icon = 1:n_con
            cur_con = u_con(icon);
            con_mask = Condition == cur_con;
            
            % create composite mask
            comp_mask = sub_mask & fac_mask & con_mask;
            
            % sum trials
            num_trials = sum(comp_mask);
            
            % get scores
            cur_score = Score(comp_mask);
            
            if num_trials == 0
                % update table
                tbl1 = [tbl1 NaN];
            else
                % update table
                tbl1 = [tbl1 cur_score];
            end
            
        end % end icon
    end % end ifac
end % end isub

% tell em what's coming
fprintf('\nSummary Table\n\n')


% number of factor condition combos
n_ttypes = n_fac * n_con;
% reshape table from column vector to subject by trial type matrix
tbl1 = reshape(tbl1, n_ttypes(1), n_sub(1))';

% where will you put across subject means and SEMS
sum_stats = zeros(2,n_ttypes); 

% calculate mean and sem across subjects
for itype = 1:n_ttypes
    % means after removing NaNs
    sum_stats(1,itype) = nanmean(tbl1(:,itype));
    % sem after removing NaNs
    sum_stats(2,itype) = nanstd(tbl1(:,itype));
end % itype

% create header
h_line = create_hdrline(n_fac, n_con);
%print the header
fprintf('\t%s', h_line)

% print the means
fprintf('\nMeans\t')
for itype = 1:n_ttypes
    fprintf('%.3f\t', sum_stats(1,itype));
end

% print the SDs
fprintf('\nSDs\t')
for itype = 1:n_ttypes
    fprintf('%.3f\t', sum_stats(2,itype));
end

%  
%% 2. Generate a bar graph using the bar() function. Add x-axis and y-axis...
%     labels and a legend using the xlabel(), ylabel(), and legend()...
%     functions. It should look something like the figure shown below ...
%     (don't worry if it doesn't appear to be the same height). (4  pts)
% 
%% 3. Now determine how many subjects there are whose data appear ...
%     on non-contiguous rows, and print both the total number of...
%     "non-contiguous" subjects (1 pt) and a list of those subject IDs..
% 
%% (1 pt).   Hint: As with the previous homework assignments, there are a ...
%     couple of different ways of solving this problem. One way is to loop ...
%     over every row and keep track of stuff based on what you find. The ...
%     other way is to use the masking/selector approach that I?ve been...
%     emphasizing. If you use the latter approach, the diff() and abs() ...
%     functions may come in very handy when making your contiguity ...
%     determination. I would also recommend plotting the Subject variable ...
%     using plot() to help you see the nature of the problem and think about ...
%     the solution.
%  
%% 4. You decide to exclude the subjects whose data was noncontiguous from...
%     the analysis.  Calculate the means and standard deviations across all...
%     remaining subjects for each Factor/Condition combination and print ...
%     out the results in a table that has the same factor and condition ...
%     headings as what we?ve been using. Generate a bar graph like the one...
%     shown above (but with your modified data, which will make the means...
%     look different). (2 pts)