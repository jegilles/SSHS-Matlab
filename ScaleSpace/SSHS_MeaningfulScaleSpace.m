function [bounds,L,th]=SSHS_MeaningfulScaleSpace(f,plane,type)

% =========================================================================
% function [bounds,L]=SSHS_MeaningfulScaleSpace(f,plane,type)
%
% This function calls the different methods to detect the meaningful scale
% threshold from the set of initial minima curve lengths and then find the
% meaningful boundaries (it manages the merging in the scale-space plane)
%
% Inputs:
%   f: input function
%   plane: the scale-space representation of f
%   type: the wanted detection method (otsu,halfnormal,empiricallaw,mean,
%         kmeans)
%
% Outputs:
%   bounds: the detected meaningful boundaries
%   L: set of minima curve lengths
%
% Author: Jerome Gilles
% Institution: UCLA - Department of Mathematics
% Year: 2013
% Version: 1.0
% =========================================================================

[L,ind]=SSHS_LengthScaleCurve(plane);
%PlotStats(L);

switch lower(type)
    case 'otsu'
        [bounds,th]=SSHS_OtsuMethod(L,ind);
    case 'halfnormal'
        [bounds,th]=SSHS_HalfNormalLaw(L,ind,size(plane,2));
    case 'empiricallaw'
        [bounds,th]=SSHS_EmpiricalLaw(L,ind);
    case 'mean'
        [bounds,th]=SSHS_MeanTh(L,ind);
    case 'kmeans'
        [bounds,th]=SSHS_kmeansDetect(L,ind);
end
bounds=SSHS_RemoveMerge(f,plane,bounds,th);
