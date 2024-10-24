function [seg,classes]=GrayscaleSSIHS(f,method)

histo=hist(f(:),max(f(:))+1);
boundaries=SSHS_GSS_BoundariesDetect(histo,method);
Show_Histo_Boundaries(histo,boundaries);
classes=zeros(size(histo));

classes(1:boundaries(1))=1;
for c=1:length(boundaries)-1
    classes(boundaries(c)+1:boundaries(c+1))=c+1;
end
classes(boundaries(end)+1:end)=length(boundaries)+1;

seg=zeros(size(f));
for i=1:size(f,1)
    for j=1:size(f,2)
        seg(i,j)=classes(f(i,j)+1);
    end
end

%to visualize in color
% hsv=ones(size(seg,1),size(seg,2),3);
% hsv(:,:,1)=mod(1-seg/max(seg(:))+0.5,1);
% hsv(:,:,2)=0.9*hsv(:,:,2);
% hsv(:,:,3)=0.9*hsv(:,:,3);
% rgb=hsv2rgb(hsv);
% for i=1:3
%     rgb(:,:,i)=255*((rgb(:,:,i)-min(min(rgb(:,:,i))))/(max(max(rgb(:,:,i))-min(min(rgb(:,:,i))))));
% end
% figure;imshow(uint8(rgb));
% imwrite(uint8(rgb),'cseg15b.png','png')
