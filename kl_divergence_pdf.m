function kld=kl_divergence_pdf(model, x)
[p,bins]=myhistc(x);
nrow=size(p,1);
ncol=size(p,2);
p=p./repmat(sum(p),nrow,1);
q=pdf(model,bins');
q=q./sum(q);
s=p.*log(p./repmat(q,1,ncol));
d=zeros(size(p));
d(p>0)=s(p>0);
kld=sum(d);

