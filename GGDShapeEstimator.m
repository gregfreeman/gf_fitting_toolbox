function [ alpha ] = GGDShapeEstimator( R )
%A practical procedure to estimate the shape parameter in the generalized Gaussian distribution
a1 = -0.535707356;
a2 = 1.168939911;
a3 = -0.1516189217;
b1 = 0.9694429;
b2 = 0.8727534;
b3 = 0.07350824;
c1 = 0.3655157;
c2 = 0.6723532;
c3 = 0.033834;

alpha = -ones(size(R));

m1 = (R > 0) & (R < 0.131246);
m2 = (R >= 0.131246) & (R < 0.448994);
m3 = (R >= 0.448994) & (R < 0.671256);
m4 = (R >= 0.671256) & (R < 0.7371);%originally 0.75 but the function doesn't actually asymptotalically approach that number

alpha(m1) = 2*log(27/16)./log(3./(4*R(m1).^2));
alpha(m2) = (-a2+sqrt(a2^2-4*a1*a3+4*a1*R(m2)))/(2*a1);
alpha(m3) = (b1-b2*R(m3)-sqrt((b1-b2*R(m3)).^2-4*b3*R(m3).^2))./(2*b3*R(m3));
alpha(m4) = (c2-sqrt(c2^2+4*c3*log((3-4*R(m4))/(4*c1))))/(2*c3);

end

