function [match,dist ] = matchWords(X1,X2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%close all;
%[X1,map1]=imread('./test/words/t1.png');
%[X2,map2]=imread('./test/words/w1.png');
im1=removeHead(X1);
im2=removeHead(X2);
%pause();
%im1=bwareaopen(im1,100);
%im2=bwareaopen(im2,100);
stats1=regionprops(im1,'Centroid','BoundingBox');
stats2=regionprops(im2,'Centroid','BoundingBox');
im1=invert(X1);
im2=invert(X2);
[rr1,cc1]=size(im1);
[rr2,cc2]=size(im2);
[r1,c1]=size(stats1);
[r2,c2]=size(stats2);
tot=0;
mp=0;
count=0;
list1=breakIntoCharacters(im1);
list2=breakIntoCharacters(im2);
list1=uint32(list1);
list2=uint32(list2);
[~,l1]=size(list1);
[~,l2]=size(list2);
% pause();
for i=1:min(l1,l2)-1%0:60:min(cc1-60,cc2-60)    
%     if(i>cc1-60||i>cc2-60)
%         mp=0;
%     else
        im1i=imcrop(im1,[list1(i),0,list1(i+1)-list1(i),rr1]);
        im2i=imcrop(im2,[list2(i),0,list2(i+1)-list2(i),rr2]);
%         im1i=imcrop(im1,[stats1(i).BoundingBox(1),0,stats1(i).BoundingBox(3),rr1]);
%         im2i=imcrop(im2,[stats2(i).BoundingBox(1),0,stats2(i).BoundingBox(3),rr2]);
        [matchList,matches,kp1,kp2,mp,dist]=matchFeatures(im1i,im2i);
          figure,imshow(im1i);title(mp);
          figure,imshow(im2i);title(mp);
%          pause();
%     end
    tot=tot+mp;
    count=count+1;
end
disp(tot/count);
%if tot/max(r1,r2)>18
%    figure,imshow(X2);title('match');
%end
match=tot/count;
end

