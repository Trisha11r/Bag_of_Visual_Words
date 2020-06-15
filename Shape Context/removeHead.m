function [im] = removeHead(im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
im=invert(im);
im=bwareaopen(im,350);
[r,c]=size(im);
maxcount=0;
pos=1;
for i=1:r
    count=0;
    for j=1:c
        if(im(i,j)==1)
            count=count+1;
        end
    end
    if(count>=maxcount)
        maxcount=count;
        pos=i;
    end
end
%disp(pos);
im=imcrop(im,[1,pos+12,c,r-pos-12]);
% imshow(im);
% pause();
end

