function test_myhist

% data=FoveatedImageData('Cameraman');%,'resize',[256 256]);
% x=data.image;

x=imresize(rgb2gray(double(imread('mountains.jpg'))./255),[1024 1024]);
figure(1),imagesc(x)
colormap gray
[n1,n2] = size(x);

mat = @(x) reshape(x,n1,n2);
vec = @(x) x(:);


W_op=opWavelet(n1,n2,'Daubechies',[],5);
w= W_op*vec(x);

fine_map=true(n1,n2);
fine_map(1:32,1:32)=false;
vfine_map=vec(fine_map);

s=w(vfine_map);
w0=w(~vfine_map);
figure(1),myhist(s);


figure(2),inter_scale_wavelet_correlation(mat(w),4,'normalize','p(Fine Scale|Course Scale) at scale 4')
figure(3),inter_scale_wavelet_correlation(mat(w),5,'normalize','p(Fine Scale|Course Scale) at scale 5')
figure(4),inter_scale_wavelet_correlation(mat(w),6,'normalize','p(Fine Scale|Course Scale) at scale 6')
figure(5),inter_scale_wavelet_correlation(mat(w),7,'normalize','p(Fine Scale|Course Scale) at scale 7')


function inter_scale_wavelet_correlation(w,level,opt,name)
[n1,n2] = size(w);
vec = @(x) x(:);
map=false(n1,n2);
map(2^level+1:2^(level+1),2^level+1:2^(level+1))=true;

[i,j]=find(map);
m1=false(n1,n2);
m2=m1;
m3=m1;
m4=m1;
m1(sub2ind([n1 n2],j*2,i*2))=true;
m2(i*2-1,j*2)=true;
m3(i*2,j*2-1)=true;
m4(i*2-1,j*2-1)=true;


x1=repmat(vec(w(map)),4,1);
x2=[vec(w(m1));vec(w(m2));vec(w(m3));vec(w(m4))];
myhist2d(x1,x2,opt)
xlabel('Course Scale')
ylabel('Fine Scale')
title(name)
colorbar 
colormap jet









