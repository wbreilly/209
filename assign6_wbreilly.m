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