function [seg,classes]=hsvSSIHS(f,method)

hsv=rgb2hsv(f);
[vseg,classes]=GrayscaleSSIHS(255*double(hsv(:,:,3)),method);
hsv(:,:,3)=vseg/255;
seg=hsv2rgb(hsv);

for i=1:3
rgb(:,:,i)=255*((seg(:,:,i)-min(min(seg(:,:,i))))/(max(max(seg(:,:,i))-min(min(seg(:,:,i))))));
end
figure;imshow(uint8(rgb));