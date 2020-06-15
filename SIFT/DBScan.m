function [list1,list] = DBScan(list,epsilon,minPts)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r,c,t]=size(list);
% disp(c);
for i=1:c
    list(i).cluster=i;
end
for i=1:c
    list(i).cluster=i;
    count=0;
    minClus=i;
    listClus=[];
    for j=1:c
        if i==j
            continue;
        end
        v1=list(i).x-list(j).x;
        v2=list(i).y-list(j).y;
        if v1*v1+v2*v2<=epsilon*epsilon
            count=count+1;
            listClus(count)=list(j).cluster;
            if list(j).cluster<minClus
                minClus=list(j).cluster;
            end
        end
    end
    if count>=minPts
        [r1 c1]=size(listClus);
        for k=1:c1
            for l=1:c
                if list(l).cluster==listClus(k)||l==i
                    list(l).cluster=minClus;
                end
            end
        end
    end
end
list=nestedSortStruct(list,'cluster');
prev=list(1).cluster;
count=1;
maxcount=0;
prevMaxIndex=list(1).cluster;
maxIndex=list(1).cluster;
for i=2:c
    if list(i).cluster==prev
        count=count+1;        
    else
        if(count>maxcount)
            prevMaxIndex=maxIndex;
            maxIndex=prev;
            maxcount=count;
        end
        prev=list(i).cluster;
        count=1;
    end
end
% maxIndex
% prevMaxIndex
list1=[];
start=1;
for i=1:c
    if list(i).cluster==maxIndex%||list(i).cluster==prevMaxIndex
        list1(start).x=list(i).x;
        list1(start).y=list(i).y;
        start=start+1;
    end
end
end

