function [closeBW] =detect_skin(im)
imhsv1=rgb2hsv(im);
levelh = graythresh(imhsv1(:,:,2));
bwh=imhsv1(:,:,2)>levelh;
labebw=bwlabel(bwh);
vbw=reshape(labebw,1,[]);
nbins =max(vbw);
hist1=histogram(vbw,nbins);
hist1v=hist1.Values;

maxh=max(hist1.Values);
his1mask =(hist1v ~=maxh );
hist1v=his1mask.*hist1v;
maxh=max(hist1v);
indx= find(hist1v==maxh);

se = strel('disk',10);
closeBW = imclose(labebw==indx-1,se);
end