function myhist2d( x ,y,varargin )
%MYHIST2D plots a joint/conditional log histograms between x and y as an image
%myhist2d myhist2d( x ,y, ... )
%   x is a vector and shown on the horizontal axis
%   y is a vector and shown on the vertical axis
%   myhist2d(x ,y ) show the joint probability: p(x and y) 
%   myhist2d(x ,y, 'normalize')  normalizes each row to sum to 1 or conditional probability p(x|y) 
%   myhist2d(x ,y, 'normalize2') normalizes each col to sum to 1 or conditional probability p(y|x)
%   myhist2d(... ,'log') plots the log probability
%   

    do_normalize=0;
    do_log=0;

    k=1;
    n=20;
    while(length(varargin)>=k)
        if ischar(varargin{k})
            switch(varargin{k})
                case 'normalize'
                    do_normalize=1;
                case 'normalize2'
                    do_normalize=2;
                case 'log'
                    do_log=1;
                 case 'n'
                    n=varargin{k+1};
                    k=k+1;

                otherwise
            end
        elseif isnumeric(varargin{k})
        else
            error('invalid argument %d',k)
        end
        k=k+1;
    end


if numel(x)~=numel(y)
    error('matricies different sizes')
end


maxx=max(max(x),-min(x));
maxy=max(max(y),-min(y));
edgesx=linspace(-maxx, maxx,n);
edgesy=linspace(-maxy, maxy,n);
edgecx=edgesx(1:end-1)*.5+edgesx(2:end)*.5;
edgecy=edgesy(1:end-1)*.5+edgesy(2:end)*.5;
dx=diff(edgesx(1:2));
dy=diff(edgesy(1:2));
counts=zeros(n,n);
js=floor((x+maxx)/dx)+1;
is=floor((y+maxy)/dy)+1;

for k=1:numel(x)
%    is=floor((x(i)+maxx)/dx)+1;
%    j=floor((y(i)+maxy)/dy)+1;
%    counts(i,j)=counts(i,j)+1;
    counts(is(k),js(k))=counts(is(k),js(k))+1;
end

if(do_log)
    f= @(counts) log(counts);
else
    f= @(counts) counts;   
end

if(do_normalize==1)
    normalize=sum(counts,1);
    normalize=max(normalize,ones(size(normalize)));
    counts=counts./(ones(n,1)*normalize);
    imagesc(edgecx,edgecy,f(counts))
elseif(do_normalize==2)
    normalize=sum(counts,2);
    normalize=max(normalize,ones(size(normalize)));
    counts=counts./(normalize*ones(1,n));
    imagesc(edgecx,edgecy,f(counts))
else
    imagesc(edgecx,edgecy,f(counts))
end

colormap gray

end

