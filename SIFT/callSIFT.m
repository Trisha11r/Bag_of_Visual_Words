function [kp] = callSIFT(im)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
sigma=1.6;
k=1.414;
%im=imread('house5.jpg');
[r c t]=size(im);
if(t~=1)
    im=rgb2gray(im);
end
[kp]=sift1(im,k,sigma);
 kp={kp,kp};
% kp={kp};
% disp('First Octave');
% disp(c1);
% figure,imshow(f1);title('First Octave');
factor=1;
% imf=embedPoints(im,kp{1},factor);
% imshow(imf);
for co=2:3
    [r c t]=size(im);
    im2=imcrop(im,[0 0 r/2 c/2]);
    for i=2:2:r
        for j=2:2:c
            im2(i/2,j/2)=im(i,j);
        end
    end
    sigma=k*k*sigma;
    [kp{co}]=sift1(im2,k,sigma);
    factor=factor*2;
%     imf=embedPoints(imf,kp{co},factor);
%     imshow(imf);
%     disp(co);
%     disp(c2);
%     figure,imshow(f2);title(co);
    im=im2;
end
%  figure,imshow(imf);
end

