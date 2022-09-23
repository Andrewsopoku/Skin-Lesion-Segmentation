clear all 
close all
imagefiles = dir('Attachments\dataset\org data\*.jpg');   
maskfiles = dir('Attachments\dataset\GT\*.png');
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename =append(imagefiles(ii).folder,'\',imagefiles(ii).name);
   masf=append(maskfiles(ii).folder,'\',maskfiles(ii).name);
   masim = imread(masf);
   currentimage = imread(currentfilename);
   skin_l=detect_skin(currentimage);
   subplot(2,2,1);
   imshow(currentimage)
   subplot(2,2,2);
   imshow(masim)
   subplot(2,2,3)
   imshow(skin_l)
   metric=sum(sum(uint8(skin_l).*uint8(masim)))./(sum(sum(uint8(skin_l)+uint8(masim))));
   title(append("eDice Similarity Score=",string(metric)))
   pause(1)
end