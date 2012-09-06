% p=ggd(x,alpha,mu,sigma)
%
%  computes the pdf of a generalized gaussian distribution
%
% x is a vector of samples
% alpha: shape parameter
% mu: mean
% sigma: standard deviation
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

% GGD

% Author: afloren <afloren@PC-AFLOREN>
% Created: 2011-12-16
% revised by Greg Freeman for GGD (symmetric) case

function [ y ] = GGD (x,alpha,mu,sigma)

beta = sigma*sqrt(gamma(1/alpha)/gamma(3/alpha));

%Multiscale Skewed Heavy Tailed Model for Texture Analysis
%y = zeros(size(x));

y = alpha/(2*beta*gamma(1/alpha))*exp(-abs(((x-mu)/beta).^alpha));

	
end
