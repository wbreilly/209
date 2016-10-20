function hdrstr = create_hdrline(nfact, ncond)
% Generates headerlines

% Dynamically generate a header line for factors and conditions
%nfact = 4;
%ncond = 2;

DEMO_UNWANTED_RETURN = 0;

hdrstr = '';
for ifact = 1:nfact
  for icond = 1:ncond
    hdrstr = [hdrstr sprintf('F%dC%d', ifact, icond)];
    
    % Put in a unwanted return
    if DEMO_UNWANTED_RETURN
      if icond == 3
        return
      end
    end
    
    % Determine whether we want a tab character inserted
    if ~(ifact == nfact && icond == ncond)
      hdrstr = [hdrstr sprintf('\t')];
    end
  end
end

%return

end