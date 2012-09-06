%kl_divergence_norm returns the kl divergence between histogrammed data and
% a normal gaussian distribution
% kld=kl_divergence_norm(model, x,...)
%   x is a vector 
%   model is an object with fields:
%       mu is the mean
%       std is the standard deviation
%
%  returns:
%     kl divervence - distance between the data distribution and the model
%   
% kld=kl_divergence_norm(model, x, 'n', 20)
%    sets n, the number of bins for the histogram
%

function kld=kl_divergence_norm(model, x,varargin)

    n=20;
    k=1;
    nargs=length(varargin);
    while(nargs>=k)
        if ischar(varargin{k})
            switch(varargin{k})
                case 'n'
                    if nargs>=k+1
                        n=varargin{k+1};
                        k=k+1;                        
                    else 
                        error('invalid argument with "n"')
                    end
                otherwise
                    error('invalid argument %d',varargin{k})
            end
        elseif isnumeric(varargin{k})
            error('invalid argument %d',varargin{k})
        else
            error('invalid argument %d',varargin{k})
        end
        k=k+1;
    end

[p,bins]=myhistc(x,n);
nrow=size(p,1);
ncol=size(p,2);
p=p./repmat(sum(p),nrow,1);
q=normpdf(bins',model.mu,model.sigma);
q=q./sum(q);
s=p.*log(p./repmat(q,1,ncol));
d=zeros(size(p));
d(p>0)=s(p>0);
kld=sum(d);

