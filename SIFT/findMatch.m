function [cd,num,list1,kp] =findMatch(cd,num,kp)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
path='.\training\words\';
%  [cd,num]=genCodewordsDictionary(path);
disp('Matching...');
im=imread('.\test\words\1.png');
% figure,imshow(im);
%  kp=callSIFT(im);
%  kp=combineList(kp);
disp(size(kp));
[r1,c1,t1]=size(kp);
[r2,c2,t2]=size(cd);
histo={};
v.x=0;
v.y=0;
v.cluster=0;
pointList={v};%,v,v,v,v,v,v,v,v,v,v,v,v,v,v};
imlist={im};%,im,im,im,im,im,im,im,im,im,im,im,im,im,im};
for i=1:num
    histo(i).count=0;
    histo(i).index=i;
%     pointsList{i}=zeros(10,1);
end
for i=1:c1
    disp(i);
    distances=[];
    for j=1:c2
        distances(j).dist = calcDist(kp(i).desc,cd(j).desc,kp(i).descdir,cd(j).descdir);
        distances(j).pt=j;
    end
    distances=nestedSortStruct(distances,'dist');
    if(distances(c2).dist>28.5)%distances(c2-1).dist)
        histo(cd(distances(c2).pt).number).count=histo(cd(distances(c2).pt).number).count+1;
%         disp(size(pointList{cd(distances(1).pt).number}));
        pL=pointList{cd(distances(c2).pt).number};
        disp([size(pL) cd(distances(c2).pt).number]);
        v.x=kp(i).x;
        v.y=kp(i).y;
        v.cluster=0;
        [xx yy]=size(pL);
        pointList{cd(distances(c2).pt).number}(yy+1)=v;
%         pL(size(pointList(cd(distances(1).pt).number))+1).y=kp(i).y;
        
    end
end
for i=1:num
%     [list1,tmp]=DBScan(pointList{i},80,5);
    list1=pointList{i};
    [j,k]=size(list1);
    histo(i).count=k;
    histo(i).index=i;
%     switch(i)
%         case 1
%             color='r';
%         case 2
%             color='g';
%         case 3
%             color='black';
%         case 4
%             color='y';
%         otherwise
%             color='blue';
%     end
    color='r';
    for j=1:k
        imlist{i}=insertShape(imlist{i}, 'circle', [(list1(j).y) (list1(j).x) 1], 'LineWidth', 10,'Color',color);
    end
end  
histo=nestedSortStruct(histo,'count');
list=dir(path);
figure,imshow(imlist{histo(num).index});title('Mapped');
% figure,imshow(imlist{7});title('Actual');
% if(histo(num).count>=25)
    figure,imshow(imread(strcat(path,list(histo(num).index+2).name)));title('Match Found');
% else
%     disp('Not Found!');
%     disp(strcat(path,list(histo(num).index+2).name));
% end
disp(histo(num).count);
end

