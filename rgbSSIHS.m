function seg=rgbSSIHS(f,method)

seg=zeros(size(f));
[seg(:,:,1),~]=GrayscaleSSIHS(f(:,:,1),method);
[seg(:,:,2),~]=GrayscaleSSIHS(f(:,:,2),method);
[seg(:,:,3),~]=GrayscaleSSIHS(f(:,:,3),method);