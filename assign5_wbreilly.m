% Walter Reilly
% last update 10_25_16
% HW 5
% PSC 209


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
fprintf('\n # conditions: %d \n\n', n_con)

% print the unique subject numbers
fprintf(' Conditions \n') % header
fprintf('%d \n', u_con)

%% 3. The number of factors in the data set and a list of the unique...
%     factor IDs (2 pts)s

% unique factors
u_fac = unique(Factor);
% number factors 
n_fac = length(u_fac);

% print the number of factors
fprintf('\n # factors: %d \n\n', n_fac)

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

% tell em what's comin
fprintf('\n Number of Trials  \n\n')

% create header
h_line = create_hdrline(n_fac, n_con);
%print header
fprintf('Subject:\t%s', h_line)

for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
     % Print subject ID info
    cursub_id = sprintf('\nSub%02d\t', cur_sub);
    fprintf('%s', cursub_id);
    
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
            
            % print the trial number
            fprintf('\t%d', num_trials);
            
        end % end icon
    end % end ifac
end % end isub

%% 5. There are a number of subjects who are missing data for some...
%     combinations of factor and conditions. For each subject who is...
%     missing data, print their subject ID and the IDs of the...
%     factor/condition combinations in which they are missing data (4 pts)

% tell em what's comin
fprintf('\n\n Missing Data')

% copy of above
for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
     % Print subject ID info
    cursub_id = sprintf('\nSub%02d\t', cur_sub);
    % fprintf('%s', cursub_id);
    
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
            
            if num_trials == 0
                fprintf('\n %s is missing F%dC%d \n', cursub_id, ifac, icon)
            end
              
        end % end icon
    end % end ifac
end % end isub


%% 6. A tab-delimited table specifying the mean score for each subject...
%     in each Factor/Condition combination. For those subjects missing ...
%     data in a factor/condition combination, print the word NaN rather ...
%     than a number (4 pt)

% tell em what's comin
fprintf('\n Means \n\n')

% create header
h_line = create_hdrline(n_fac, n_con);
%print header
fprintf('Subject:\t%s', h_line)

% copy from above, doing means this time
for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
     % Print subject ID info
    cursub_id = sprintf('\nSub%02d\t', cur_sub);
    fprintf('%s', cursub_id);
    
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
            
            %get mean
            mn_score = mean(cur_score);
            
            if num_trials == 0
                fprintf('\tNaN')
            else
                % print the mean
                fprintf('\t%.3f', mn_score);
            end
            
        end % end icon
    end % end ifac
end % end isub


%% 7. The standard error of the mean (SEM) for each subject in each ...
%     Factor/Condition combination. To calculate the standard error, use...
%     std() to obtain the standard deviation, and divide this by the square...
%     root [sqrt()] of the number of trials in that Factor/Condition...
%     combination for that subject. (2 pts)


% tell em what's comin
fprintf('\n\n Standard Error of the Mean \n\n')

% create header
h_line = create_hdrline(n_fac, n_con);
%print header
fprintf('Subject:\t%s', h_line)

% copy from above, doing means this time
for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
     % Print subject ID info
    cursub_id = sprintf('\nSub%02d\t', cur_sub);
    fprintf('%s', cursub_id);
    
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
            
            %get SEM
            sem = std(cur_score)/sqrt(num_trials);
            
            if num_trials == 0
                fprintf('\tNaN')
            else
                % print the sem
                fprintf('\t%.3f', sem);
            end
            
        end % end icon
    end % end ifac
end % end isub



%% 8. The mean and SEM across subjects for each Factor/Condition ...
%     combination. Note that the mean here is the mean of individual...
%     subject means, and the SEM is the standard error of the individual ...
%     subject means, not the mean of the individual subject SEMs. (2 pts)

% printing into a matrix this time
tbl1 = [];

% tell em what's comin
fprintf('\n\n Summary Stats (SaNs NaNs) \n\n')

% copy from above, putting means into a matrix
for isub = 1:n_sub
    cur_sub = u_sub(isub);
    sub_mask = Subject == cur_sub;
    
     % Print subject ID info
    cursub_id = sprintf('\nSub%02d\t', cur_sub);
    
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
            
            %get mean
            mn_score = mean(cur_score);
            
            if num_trials == 0
                % update table
                tbl1 = [tbl1 NaN];
            else
                % update table
                tbl1 = [tbl1 mn_score];
                
            end % end if
        end % end icon
    end % end ifac
end % end isub

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
    sum_stats(2,itype) = nanstd(tbl1(:,itype))/sqrt(n_sub);
end % itype

%print the header
fprintf('\t%s', h_line)

% print the means
fprintf('\nMeans\t')
for itype = 1:n_ttypes
    fprintf('%.3f\t', sum_stats(1,itype));
end

% print the sems
fprintf('\nSEMs\t')
for itype = 1:n_ttypes
    fprintf('%.3f\t', sum_stats(2,itype));
end
































