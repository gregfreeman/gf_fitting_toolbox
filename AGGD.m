% p=ggd(x,alpha,sigmal,sigmar)
%
%  computes the pdf of an asymmetrical generalized gaussian distribution
%  with zero mean
%
% x is a vector of samples
% alpha: shape parameter
% sigmal: left standard deviation 
% sigmar: right standard deviation 
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

% AGGD

% Author: afloren <afloren@PC-AFLOREN>
% Created: 2011-12-16

function [ y ] = AGGD (x,alpha,sigmal,sigmar)

betal = sigmal*sqrt(gamma(1/alpha)/gamma(3/alpha));
betar = sigmar*sqrt(gamma(1/alpha)/gamma(3/alpha));

%Multiscale Skewed Heavy Tailed Model for Texture Analysis
y = zeros(size(x));

y(x<0) = alpha/((betal+betar)*gamma(1/alpha))*exp(-(abs(x(x<0)/betal).^alpha));

y(x>=0) = alpha/((betal+betar)*gamma(1/alpha))*exp(-(abs(x(x>=0)/betar).^alpha));
	
end
