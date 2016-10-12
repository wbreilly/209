% Walter Reilly
% 9_29_16
% PSC 209
% Homework 1

%% Vectors %%

% 1. Create a row vector of numbers starting at 67 and ending at 84,...
%     incrementing by 1.
[67:84];

% 2.	Create a column vector starting at 0 and ending at -10.
[0:-1:-10]'

% 3.	Create a row vector starting with 15 and counting by 10s up to 155.
[15:10:155]

% 4.	Create a column vector starting at 3 and counting by 3s up to 45.
[3:3:45]'

% 5.	Create a row vector starting at 10 and counting backward by 2 until -10.
[10:-2:-10]

% 6.	Create a row vector that begins at -1 and ends at +1, incrementing by 0.05.
[-1:.05:1]

% 7.	Create a row vector that starts at -13.2 and increments by 3.3 all...
%     the way up to 33,000.
[-13.2:3.3:33000];

%% Matrices %%

% 1.	Create a variable containing a 4x7 matrix (4 rows, 7 columns) in which...
%     the 1st column is filled with 1, the 2nd column with 2, etc.
var1 = [1:7;1:7;1:7;1:7];

% 2.	Create a variable containing a 6x8 matrix in which the values in the...
%     first column start with 1 and increment by 1, the values in the 2nd...
%     column start with 2 and increment by 2, etc.
var2 = [1:8;2:2:16;3:3:24;4:4:32;5:5:40;6:6:48];

% 3.	Create a row vector in which the numbers are incrementing by two from...
%     0 to 98. Then figure out how to use the reshape() function (type "help...
%     reshape" for information on how to use the reshape function) on that...
%     vector to create a 5x10 matrix in which the numbers going down columns...
%     increment by two (shown here for the first 3 columns)...
%     :?0 10 20?2 12 22?4 14 24?6 16 26?8 18 28
var3 = [0:2:98];
var3 = reshape(var3,5,10);

% 4.	Create a row vector containing the numbers 1, 3, 4 and 8 and store...
%     the result in a variable that you have decided to call "column_indices."
column_indices = [1 3 4 8];

%% Indexing %%

% 1.	Extract the 3rd row.
var2(3,:);

% 2.	Extract the even-numbered columns.
var2(2:6,:);

% 3.	Extract the 1st, 3rd, 4th, and 8th columns using the column_indices...
%     variable that you created in the preceding section.
var2(:,column_indices);

% 4.	Extract the 2nd row of the 6th column
var2(2,6);

% 5.	Create a vector beginning with 1, skipping by 4 and ending at 45.
vec = [1:3, 5:45];

% 6.	Use this vector to index into your 6x8 matrix. What's the result?.
 test = var2(vec);
% Returned values from var(2) row by row, left to right.

%% Strings %%

% 1.	Place your first name in a variable
first_name = {'Walter'};

% 2.	Place your last name in another variable
last_name = {'Reilly, '};

% 3.	Using the two variables that you just made, create a third variable...
%     that has your last name, first name, e.g. "Janata, Petr"
full_name = strcat(last_name, first_name);

% 4.	Create a numeric vector with your birthday, i.e. the values...
%     correspond to the month, day, and year.
birthday = [5 30 1992];

% 5.	Using the strings and numeric vector you just created, create a...
%     string that has your name followed by a colon and then your birthdate,...
%     e.g. Janata, Petr: 9 2 67 (hint: you may want to find a function that...
%     converts a num to a str)

helper = {': '};
name_birth = strcat(full_name, helper, num2str(birthday));

%%
% 1.	Print your name and birthday to the command window using fprintf()....
%     Don't just use fprintf to print the string you created in Step 5. ...
% Rather, use fprintf with a format string that specifies the printing ...
%     of each individual variable.

% Couldn't figure out fprintf, but ...
disp(name_birth)









































