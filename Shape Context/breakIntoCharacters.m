function [list ] =breakIntoCharacters(im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(im);
 v=[];
for i=1:c
    count=0;
    for j=1:r
        if im(j,i)==1
            count=count+1;
        end
    end
    if(count>13)
        v(i)=count;
    else
        v(i)=0;
    end
end
%figure,stem(v);
start=1;
f=0;
for i=1:c
    if v(i)>0&&f==0
        count=1;
        start=i;
        f=1;
    end
    if v(i)>0&&f==1
        count=count+1;
    end
    if v(i)==0
        if count<10
            for j=start:i
                v(j)=0;
            end
        end
        f=0;
    end        
end
f=0;
start=1;
for i=1:c
    if v(i)==0&&f==0
        count=1;
        start=i;
        f=1;
    end
    if v(i)==0&&f==1
        count=count+1;
    end
    if v(i)>0
        if count<3
            for j=start:i
                v(j)=50;
            end
        end
        f=0;
    end        
end
% figure,stem(v);
k=1;
list=[];
i=1;
start=1;
count=0;
while i<=c
    while i<=c&&v(i)>0
        i=i+1;
    end
    start=i;
    while i<=c&&v(i)==0
        i=i+1;
        count=count+1;
    end
    ending=i;
    list(k)=int32((start+ending)/2);
    k=k+1;
end

end

