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






































