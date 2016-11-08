% Walter Reilly
% 11_8_16
% assign7.m
%
% Debug this file.  There are 9 bugs.

clear 

nsub = 10; 

% Let's create a variable called subinfo in which we keep information about subjects
for isub = 1:nsub
  subinfo{isub,1} = sprintf('Subject_%02d', isub*2);  % add subject names
end

ages = [33 25 31 28 33 30 32 29 28 26]; % ages of subjects

% Add the vector of ages
subinfo(:,2) = num2cell(ages); % bug 1, curly braces; bug 2 extra '

% Calculate the average age
mean_age = mean([subinfo{:,2}]); % bug 3, add square brackets
fprintf('\nMean age: %.1f years\n', mean_age) % bug 4, use .1f for correct decimal

% Print the age for subject 6
fprintf('\nThe age of Subject 6: %d\n', subinfo{ismember({subinfo{:,1}},'Subject_06'),2})
% bug 5, add 0 for 06; bug 6, curly braces to index into subinfo 

% Make a table with subject names and ages of those subjects 32 or younger
young_subs = ages <=32;
nyoung = sum(young_subs); % bug 7, change length to sum
young_idxs = find(young_subs);

fprintf('\nSubject\tAge\n');
for iy = 1:nyoung
  fprintf('%s %d\n', subinfo{young_idxs(iy),1}, subinfo{young_idxs(iy),2})
%   bug 8, remove \t
end
fprintf('\n')

% Now create a subinfo structure
subinfo = cell2struct(subinfo, {'Sub', 'age'}, 2); % bug 9, convert to struct
subinfo(1).first = 'Fred';
subinfo(1).last = 'Smith';
subinfo(1).age = 25;

% Add more names to other elements in the subinfo structure array
more_names = {'Jake','Jack','Laura'};
[subinfo(2:4).first] = deal(more_names{:}); % bug 10, add index to more_names

subinfo(1:4).first % bug 11, add index
