function [counts, bins]=myhistc( x, varargin )
%MYHISTC returns the histogram bin counts for multiple datasets
%[counts, bins]=myhist( x, opt )
%   x is a matrix 
%      columns represent datasets
%      a column vector will only plot the histogram of one dataset
%   opts: 
%      myhist( x, 'pdf') normalizes the count area to sum to appx 1 
%  returns:
%     counts  - the frequency or probability of each value in the dataset
%     (29xncols)
%     bins - the center value for each histogram bin (1x29)
%   
    n=30;
    m=max(max(x(:)),-min(x(:)));
    edges=linspace(-m, m,n);
    bins=edges(1:end-1)*.5+edges(2:end)*.5;
    counts=histc(x,edges);
    
    counts=counts(1:end-1,:); % last row is useless

    if(~isempty(varargin) && exist('opt','var') && strcmp(opt,'pdf'))
        dedge=diff(edges);
        dedge=dedge(1);
        counts=counts./size(x,1)./dedge;
    end

end

