function myhist( x, opt )
%MYHIST plots a log histogram of multiple datasets
%myhist( x, opt )
%   x is a matrix 
%      columns represent datasets
%      a column vector will only plot the histogram of one dataset
%   opts: 
%      myhist( x, 'pdf') normalizes the count area to sum to appx 1 
%   


if(exist('opt','var') )
    [counts,bins]=myhistc(x, opt);
else
    [counts,bins]=myhistc(x);
end

semilogy(bins, counts,'*' )


end

