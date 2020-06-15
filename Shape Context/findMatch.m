function [cd,num] =findMatch(cd,num)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
path='.\training\logo\';
% [cd,num]=genCodewordsDictionary(path);
disp('Matching...');
im=imread('.\test\2.png');
figure,imshow(im);
bwim=invert(im);
% imshow(bwim);
kp=getPoints(bwim);
disp(size(kp));
kp=addFeatures(kp);
[r1,c1,t1]=size(kp);
[r2,c2,t2]=size(cd);
histo=[];
for i=1:num
    histo(i).count=0;
    histo(i).index=i;
end
for i=1:c1
    disp(i);
    distances=[];
    for j=1:c2
        distances(j).dist = calcDist(kp(i).desc,cd(j).desc);
        distances(j).pt=j;
    end
    distances=nestedSortStruct(distances,'dist');
    if(distances(2).dist*0.9>distances(1).dist)
        histo(cd(distances(1).pt).number).count=histo(cd(distances(1).pt).number).count+1;
        switch(cd(distances(1).pt).number)
            case 1
                color='r';
            case 2
                color='g';
            case 3
                color='black';
            case 4
                color='y';
            otherwise
                color='blue';
        end
        im=insertShape(im, 'circle', [(kp(i).y) (kp(i).x) 1], 'LineWidth', 2,'Color',color);
    end
end
histo=nestedSortStruct(histo,'count');
list=dir(path);
figure,imshow(im);
figure,imshow(imread(strcat(path,list(histo(num).index+2).name)));title('Match Found');
disp(histo(num).count);
end

