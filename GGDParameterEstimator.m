% [ alpha, sigma, mu] = GGDParameterEstimator ( X )
%
%  estimates the parameters for a generalized gaussian distribution
%
% x is a vector of samples
% alpha: shape parameter
% sigma: standard deviation
% mu: mean
%
% Copyright (C) 2011 afloren
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with Octave; see the file COPYING.  If not, see
% <http://www.gnu.org/licenses/>.
%
% GGDParameterEstimator
%
% Author: afloren <afloren@PC-AFLOREN>
% Created: 2011-12-16
% 
% Adapted to the GGD by Greg Freeman 4/9/2012
%
% N.-eddine Lasmar, Y. Stitou, and Y. Berthoumieu, 
% “Multiscale skewed heavy tailed model for texture analysis,” 
% Statistics, no. 1, pp. 2281-2284, 2009.

function [ alpha, sigma, mu] = GGDParameterEstimator ( X )


mu=mean(X);

x2=X-mu; % subtract mean

sigma = sqrt(sum(x2.^2)/(length(x2)-1));

r = (sum(abs(x2))/length(x2))^2/(sum(x2.^2)/length(x2));

alpha = GGDShapeEstimator(r);

end
