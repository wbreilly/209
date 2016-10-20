% psc209a_f16_wk5.m

% Dynamically generate a header line for factors and conditions
nfact = 3;
ncond = 2;

hdrstr = '';
for ifact = 1:nfact
  for icond = 1:ncond
    hdrstr = [hdrstr sprintf('F%dC%d', ifact, icond)];
    
    % Determine whether we want a tab character inserted
    if ~(ifact == nfact && icond == ncond)
      hdrstr = [hdrstr sprintf('\t')];
    end
  end
end

fprintf('%s\n', hdrstr);

% Use our new function to generate a headerline
hdrline = sprintf('Subject\t%s\n', create_hdrline(nfact,ncond));

fprintf('\nOur spiffy flexible headerline:\n%s', hdrline);