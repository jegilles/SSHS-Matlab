%%Test_Example

%load example of an histogram
load('histotest.mat');

%compute the boundaries (th is the detected threshold)
%method must be one of the following options: otsu,halfnormal,empiricallaw,mean,kmeans
[boundaries,~,~,th]=SSHS_GSS_BoundariesDetect(ff,'otsu');

% plot the detected boundaries on the histogram
Show_Histo_Boundaries(ff,boundaries);
