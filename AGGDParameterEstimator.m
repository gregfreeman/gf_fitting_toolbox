% [ alpha, sigmal, sigmar ]  = AGGDParameterEstimator ( X )
%
%  estimates the parameters for an asymmetrical generalized gaussian distribution
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

% AGGDParameterEstimator

% Author: afloren <afloren@PC-AFLOREN>
% Created: 2011-12-16
% N.-eddine Lasmar, Y. Stitou, and Y. Berthoumieu, 
% “Multiscale skewed heavy tailed model for texture analysis,” 
% Statistics, no. 1, pp. 2281-2284, 2009.

function [ alpha, sigmal, sigmar ] = AGGDParameterEstimator ( X )

xl = X(X<0);
xr = X(X>=0);

sigmal = sqrt(sum(xl.^2)/(length(xl)-1));
sigmar = sqrt(sum(xr.^2)/(length(xr)-1));

g = sigmal/sigmar;

r = (sum(abs(X))/length(X))^2/(sum(X.^2)/length(X));

R = r*(g^3+1)*(g+1)/(g^2+1)^2;

alpha = GGDShapeEstimator(R);

end
