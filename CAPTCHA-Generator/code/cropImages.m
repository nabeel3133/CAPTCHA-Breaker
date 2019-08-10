% This code generates individual images of letters from the internet image
close all
clc
clear

% get image
imdir = '..\Images';
imgname = 'allAlphabets.jpg';
im = imcomplement(double(imread(fullfile(imdir,imgname))));
[imrows, imcols, imdims]=size(im);

% display image
figure;
imshow(im);


for i=1:27
    
    xy = ginput(4);
    
    minX = max(1,round(min(xy(:,2))));
    maxX = min(imrows,round(max(xy(:,2))));
    minY = max(1,round(min(xy(:,1))));
    maxY = min(imcols,round(max(xy(:,1))));
    
    smallim = im(minX:maxX, minY:maxY, :);
    samllim = imresize(smallim,[100 NaN]);
   
    savename = [imdir '\' sprintf('%02d.jpg',i)];
    
    imwrite(smallim,savename,'jpg');
    fprintf('Enter to continue \n');
    pause;
    
end


% % resize images
for i=1:27
    
    imgname = [imdir '\' sprintf('%02d.jpg',i)];
    smallim = imread(imgname);
    samllim = imresize(smallim,[100 100]);
    savename = [imdir '\' sprintf('%02d.jpg',i)];
    
    imwrite(smallim,savename,'jpg');
%     fprintf('Enter to continue \n');
%     pause;
    
end



