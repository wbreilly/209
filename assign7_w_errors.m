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
subinfo{:,2} = num2cell(ages');  

% Calculate the average age
mean_age = mean(subinfo{:,2});
fprintf('\nMean age: %d years\n', mean_age)

% Print the age for subject 6
fprintf('\nThe age of Subject 6: %d\n', subinfo(ismember(subinfo{:,1},'Subject_6'),2));

% Make a table with subject names and ages of those subjects 32 or younger
young_subs = ages <=32;
nyoung = length(young_subs);
young_idxs = find(young_subs);

fprintf('\nSubject\tAge\n');
for iy = 1:nyoung
  fprintf('%s\t%d\n', subinfo{young_idxs(iy),1}, subinfo{young_idxs(iy),2})
end
fprintf('\n')

% Now create a subinfo structure
subinfo(1).first = 'Fred';
subinfo(1).last = 'Smith';
subinfo(1).age = 25;

% Add more names to other elements in the subinfo structure array
more_names = {'Jake','Jack','Laura'};
[subinfo(2:4).first] = deal(more_names);

subinfo.first