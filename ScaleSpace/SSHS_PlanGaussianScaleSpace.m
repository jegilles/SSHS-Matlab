function plane=SSHS_PlanGaussianScaleSpace(f)

%==========================================================================
% This function builds a scale-space representation of f via successive
% convolutions with a discrete Gaussian Kernel.
%
% Input:
%   -f: the input function
%
% Output:
%   -plane: the scale-space representation of f (the horizontal axis 
%           corresponds to the scales). The values are Logicals.
%
% Authors: Jerome Gilles & George Istambouli
% Institution: SDSU - Department of Mathematics
% Year: 2016
% Version: 2.0
% =========================================================================
n=4;
t=1.6;%initial scale
Niter=ceil(length(f)/n);
ker=besseli(-n:n,t,1); %discrete Gauusian kernel
plane=sparse(false(length(f),Niter+1));%scale space
bounds=SSHS_LocalMaxMin2(f,-1);
plane(bounds)=true;
N=zeros(1,Niter+1);
N(1)=length(bounds);
for i=1:Niter
    f=conv(f,ker,'same');%filter
    bounds=SSHS_LocalMaxMin2(f,-1);
    plane(bounds,i+1)=true;
    N(i+1)=length(bounds);
    if N(i+1)==1
        break
    end
end
