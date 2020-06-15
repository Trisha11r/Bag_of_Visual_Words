function [list ] = breakLineIntoWords(im)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
im1=invert(im);
[r,c]=size(im1);
gaps=[];
for i=1:c
    count=0;
    for j=int32(r/3):int32(2*r/3)
        if(im1(j,i)==1)
            count=count+1;
        end
    end
    if(count>=3)
        gaps(i)=count;
    else
        gaps(i)=0;
    end
end
k=1;
list=[];
i=1;
while i<=c
    while i<=c&&gaps(i)>0
        i=i+1;
    end
    count=0;
    start=i;
    while i<=c&&gaps(i)==0
        i=i+1;
        count=count+1;
    end
    ending=i;
    if count>10
        list(k)=int32((start+ending)/2);
        k=k+1;
    end
end

