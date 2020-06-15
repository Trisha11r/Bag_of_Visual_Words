function [im,val] = sub(im1,im2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r1,c1,t1]=size(im1);
[r2,c2,t2]=size(im2);
im=zeros(r1,c1);
if r1==r2&&c1==c2&&t1==t2
    val=1;
    for i=1:r1
        for j=1:c1
            if im1(i,j)>=im2(i,j)
                im(i,j)=im1(i,j)-im2(i,j);
            else
                im(i,j)=double(im2(i,j)-im1(i,j))*(-1);
            end
        end
    end
else
    val=0;
end
    
end

