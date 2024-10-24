function Show_Histo_Boundaries(magf,boundaries)

%===============================================================================
% function Show_Histo_Boundaries(magf,boundaries)
% 
% This function plot the boundaries by superposition on the graph 
% of the magnitude of the Fourier spectrum on the frequency interval 
% [0,pi]. If the sampling rate is provided, then the horizontal axis
% will correspond to the real frequencies. If provided, the plot will
% superimposed a set of initial boundaries (in black). The input presig 
% will be superimposed on the original plot (useful to visualize regularized 
% version of magf)
%
% Input:
%   - magf: histogram
%   - boundaries: list of all boundaries
%
% Author: Jerome Gilles
% Institution: UCLA - Department of Mathematics
% Year: 2013
% Version: 2.0
%===============================================================================

figure;
plot(magf);
hold on
NbBound=length(boundaries);
 
for i=1:NbBound
     line([boundaries(i)+1 boundaries(i)+1],[0 max(magf)],'LineWidth',2,'LineStyle','--','Color',[1 0 0]);
end
