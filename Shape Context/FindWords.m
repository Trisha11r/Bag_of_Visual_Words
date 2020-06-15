function [ ] = FindWords(im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[X1,map1]=imread('./test/words/w2.png');
%[X2,map2]=imread('./test/words/2.png');
X2=im;
X11=invert(X1);
%X11=imerode(X11,strel('line',6,0));
kp1=getPoints(X11);
kp1=addFeatures(kp1);
X21=invert(X2);
%  imshow(X21);
%  pause;
[r,c]=size(X11);
[r1,c1]=size(X21);
count=0;
figure,imshow(X2);
%hold on;
matchedImIndex=[];
mmp=[];
for i=0:30:c1-c-1
    %if(stats(i).BoundingBox(3)*stats(i).BoundingBox(4)>2000)
        disp('Doing...');
        disp(i);
        im=imcrop(X21,[i,0,c,r1]);
        %im=imerode(im,strel('line',6,0));
        %imshow(im);
%         pause();
        [matchList,matches,kp1,kp2,matchPercentage,dl]=matchFeatures(X11,im,kp1);
        %disp(matchPercentage);        
        if(matchPercentage>4.5)            
            count=count+1;
            matchedImIndex(count)=i;
            mmp(count)=matchPercentage;
            
%             for j=1:matches
%                 scatter(stats(i).BoundingBox(1)+matchList(j).y2,stats(i).BoundingBox(2)+matchList(j).x2,30,[1,1,0],'filled');
%             end
        end
    %end
end
disp(count);
for i=1:count
    j=matchedImIndex(i);
    im=imcrop(X21,[j,0,c,r1]);
    %im=imerode(im,strel('line',6,0));
    figure,imshow(im);
    disp(mmp(i));
end
end

