function [ bwim ] = invert( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% figure,imshow(im);
[r,c,t]=size(im);
for i=1:r
    for j=1:c
        for k=1:t
            im(i,j,k)=255-im(i,j,k);
        end
    end
end
im=rgb2gray(im);
%  figure,imshow(im);
 %im=imdilate(im,strel('line',6,0));
%  im=imdilate(im,strel('line',5,90));
%  figure,imshow(im); 
bwim=im2bw(im);
%   figure,imshow(bwim);
%   bwim=imerode(bwim,strel('disk',1,0));
%  figure,imshow(bwim); 
end

