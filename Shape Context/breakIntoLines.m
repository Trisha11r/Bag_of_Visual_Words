function [dist] = breakIntoLines()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[X1,map2]=imread('./test/words/w2.png');
[X2,map2]=imread('./test/words/1_2.jpg');
im=invert(X2);
[r,c,~]=size(X2);
[r1,c1,~]=size(X1);
for i=1:r
    count=0;
    for j=1:c
        if im(i,j)==1
            count=count+1;
        end
    end
    if(count>150)
        v(i)=count;
    else
        v(i)=0;
    end
end
k=1;
list=[];
i=1;
while i<=r
    while i<=r&&v(i)>0
        i=i+1;
    end
    count=0;
    start=i;
    while i<=r&&v(i)==0
        i=i+1;
        count=count+1;
    end
    ending=i;
    if count>10
        list(k)=int32((start+ending)/2);
        k=k+1;
    end
end
%figure,imshow(X2);
[~,maxLines]=size(list);
for i=1:maxLines-1
    im1=imcrop(X2,[0,list(i),c,list(i+1)-list(i)]);
    %figure,imshow(im1);
    %pause;
    for j=0:40:c-c1-1
        disp('doing');
        disp(j);
        im11=imcrop(im1,[j,0,c1,list(i+1)-list(i)]);
        tic;
        [match,dist]=matchWords(X1,im11);
        if(match>25)
            rectangle('Position',[j,list(i),c1,list(i+1)-list(i)],'EdgeColor','y','LineWidth',5);
        end
        disp(toc);
    end
end
%[list]=breakLineIntoWords(X2);

% if(c1>=2)
%     disp('doing');
%     im1=imcrop(X2,[0,0,list(1),r]);    
%     %imshow(im1);
%     %pause();
%     matchWords(X1,im1);


end

