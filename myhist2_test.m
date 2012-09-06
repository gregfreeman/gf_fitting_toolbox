function test_myhist2

% data=FoveatedImageData('Cameraman');%,'resize',[256 256]);
% x=data.image;

x=imresize(double(imread('Albert_Einstein_Head.jpg'))./255,[1024 1024]);
% x=imresize(rgb2gray(double(imread('mountains.jpg'))./255),[1024 1024]);
imagesc(x)
colormap gray
[n1,n2] = size(x);

mat = @(x) reshape(x,n1,n2);
vec = @(x) x(:);


W_op=opWavelet(n1,n2,'Daubechies',[],6);
w= W_op*vec(x);

fine_map=true(n1,n2);
fine_map(1:32,1:32)=false;
vfine_map=vec(fine_map);

s=w(vfine_map);
w0=w(~vfine_map);
figure(1),myhist(s);


figure(1),adjacent_wavelet_correlation(mat(w),5)
figure(2),adjacent_wavelet_correlation(mat(w),6)
figure(3),adjacent_wavelet_correlation(mat(w),7)
figure(4),adjacent_wavelet_correlation(mat(w),8)


figure(5),inter_scale_wavelet_correlation2(mat(w),5)
figure(6),inter_scale_wavelet_correlation2(mat(w),6)
figure(7),inter_scale_wavelet_correlation2(mat(w),7)
figure(8),inter_scale_wavelet_correlation2(mat(w),8)


figure(9),adjacent_wavelet_correlation(mat(w),4)
figure(10),inter_scale_wavelet_correlation2(mat(w),4)




