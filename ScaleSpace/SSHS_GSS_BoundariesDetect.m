function [bounds,plane,L,th]=SSHS_GSS_BoundariesDetect(f,type)

% =========================================================================
% function [bounds,plane,L]=SSHS_GSS_BoundariesDetect(f,type)
%
% This function performs the Gaussian Scale-Space Boundaries detection.
%
% Inputs:
%   -f: original function/histogram
%   -type: type of wanted threshold detection method (otsu,halfnormal,
%          empiricallaw,mean,kmeans)
%
% Outputs:
%   -bounds: detected boundaries
%   -plane: the built scale-space plane
%   -L: set of minima curve lengths
%   -th: detected scale-lifespan threshold 
%
% Author: Jerome Gilles
% Institution: UCLA - Department of Mathematics
% Year: 2013
% Version: 1.0
% =========================================================================

% build the Gaussian Scale-Space representation
plane=SSHS_PlanGaussianScaleSpace(f);

% find the meaningful boundaries
[bounds,L,th]=SSHS_MeaningfulScaleSpace(f,plane,type);
